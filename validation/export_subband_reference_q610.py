from __future__ import annotations

import argparse
import math
from pathlib import Path
import sys


REPO_ROOT = Path(__file__).resolve().parents[1]
if str(REPO_ROOT) not in sys.path:
    sys.path.insert(0, str(REPO_ROOT))

import numpy as np
import torch

from infer import DEFAULT_CHECKPOINT, DEFAULT_CONFIG, load_audio, load_checkpoint, load_toml_config
from audiozen.models.spiking_fullsubnet.modeling_spiking_fullsubnet import SpikingFullSubNet


Q_FRAC = 10
Q_SCALE = 1 << Q_FRAC
Q_ZERO = np.int16(0)
Q_ONE = np.int16(Q_SCALE)
HIDDEN_SIZE = 224
DEFAULT_INPUT_PATH = REPO_ROOT / "JH_test" / "test1.wav"
DEFAULT_OUTPUT_DIR = REPO_ROOT / "subband_q610_hls_dump"
DEFAULT_CONFIG_PATH = REPO_ROOT / DEFAULT_CONFIG
DEFAULT_CHECKPOINT_PATH = REPO_ROOT / DEFAULT_CHECKPOINT

SIGMOID_PWL_KNOTS_Q610 = np.asarray(
    [0, 256, 512, 768, 1024, 1280, 1536, 1792, 2048, 2560, 3072, 3584, 4096, 5120, 6144, 7168, 8192],
    dtype=np.int16,
)
SIGMOID_PWL_VALUES_Q610 = np.asarray(
    [512, 576, 637, 695, 749, 796, 837, 872, 902, 946, 975, 994, 1006, 1017, 1021, 1023, 1024],
    dtype=np.int16,
)


def saturate_int16(values: np.ndarray) -> np.ndarray:
    return np.clip(values, -32768, 32767).astype(np.int16)


def round_shift_right(values: np.ndarray, shift_bits: int) -> np.ndarray:
    if shift_bits <= 0:
        return values.astype(np.int64, copy=False)

    values = values.astype(np.int64, copy=False)
    half = np.int64(1 << (shift_bits - 1))
    positive = values >= 0
    output = np.empty_like(values, dtype=np.int64)
    output[positive] = (values[positive] + half) >> shift_bits
    output[~positive] = -(((-values[~positive]) + half) >> shift_bits)
    return output


def float_to_q610(values: np.ndarray) -> np.ndarray:
    values = np.asarray(values, dtype=np.float32)
    scaled = values * np.float32(Q_SCALE)
    adjusted = np.where(
        scaled >= np.float32(0.0),
        scaled + np.float32(0.5),
        scaled - np.float32(0.5),
    )
    return saturate_int16(adjusted.astype(np.int64))


def q610_to_float(values: np.ndarray) -> np.ndarray:
    return values.astype(np.float32) / np.float32(Q_SCALE)


def q610_to_float_scalar(value: np.int16 | int) -> float:
    return float(np.float32(value) / np.float32(Q_SCALE))


def float_to_q610_scalar(value: float) -> np.int16:
    scaled = np.float32(value) * np.float32(Q_SCALE)
    adjusted = scaled + np.float32(0.5) if scaled >= np.float32(0.0) else scaled - np.float32(0.5)
    clipped = min(max(int(adjusted), -32768), 32767)
    return np.int16(clipped)


def mul_q610(lhs: np.ndarray, rhs: np.ndarray) -> np.ndarray:
    product_q20 = lhs.astype(np.int64) * rhs.astype(np.int64)
    return saturate_int16(round_shift_right(product_q20, Q_FRAC))


def add_q610(lhs: np.ndarray, rhs: np.ndarray) -> np.ndarray:
    return saturate_int16(lhs.astype(np.int64) + rhs.astype(np.int64))


def sub_q610(lhs: np.ndarray, rhs: np.ndarray) -> np.ndarray:
    return saturate_int16(lhs.astype(np.int64) - rhs.astype(np.int64))


def step_activation_q610(values: np.ndarray) -> np.ndarray:
    return np.where(values >= 0, Q_ONE, Q_ZERO).astype(np.int16)


def sigmoid_pwl_q610(values_q610: np.ndarray) -> np.ndarray:
    output = np.empty_like(values_q610, dtype=np.int16)
    flat_input = values_q610.reshape(-1)
    flat_output = output.reshape(-1)
    for index, value_q610 in enumerate(flat_input):
        value_int = int(value_q610)
        if value_int >= int(SIGMOID_PWL_KNOTS_Q610[-1]):
            flat_output[index] = Q_ONE
            continue
        if value_int <= -int(SIGMOID_PWL_KNOTS_Q610[-1]):
            flat_output[index] = Q_ZERO
            continue

        is_negative = value_int < 0
        abs_input = -value_int if is_negative else value_int

        segment_index = 0
        while abs_input > int(SIGMOID_PWL_KNOTS_Q610[segment_index + 1]):
            segment_index += 1

        x0 = int(SIGMOID_PWL_KNOTS_Q610[segment_index])
        x1 = int(SIGMOID_PWL_KNOTS_Q610[segment_index + 1])
        y0 = int(SIGMOID_PWL_VALUES_Q610[segment_index])
        y1 = int(SIGMOID_PWL_VALUES_Q610[segment_index + 1])
        delta_x = x1 - x0
        delta_y = y1 - y0
        interpolated = y0 + ((abs_input - x0) * delta_y + (delta_x // 2)) // delta_x
        positive_value = np.int16(max(min(interpolated, 32767), -32768))
        flat_output[index] = np.int16(int(Q_ONE) - int(positive_value)) if is_negative else positive_value
    return output


def batchnorm_fold_q610(running_mean: np.ndarray, running_var: np.ndarray, gamma: np.ndarray, beta: np.ndarray) -> tuple[np.ndarray, np.ndarray]:
    running_mean_f32 = running_mean.astype(np.float32)
    running_var_f32 = running_var.astype(np.float32)
    gamma_f32 = gamma.astype(np.float32)
    beta_f32 = beta.astype(np.float32)
    bn_mul = gamma_f32 / np.sqrt(running_var_f32 + np.float32(1.0e-5))
    bn_add = beta_f32 - (running_mean_f32 * bn_mul)
    return float_to_q610(bn_mul), float_to_q610(bn_add)


def batchnorm_folded_q610(values_q610: np.ndarray, weights: dict[str, np.ndarray]) -> np.ndarray:
    if weights["bn_mul"].size == 0:
        return values_q610.astype(np.int16, copy=False)
    scaled_q610 = mul_q610(values_q610, weights["bn_mul"][None, :])
    return add_q610(scaled_q610, weights["bn_add"][None, :])


def reflect_frequency_index(freq_index: int, num_freqs: int) -> int:
    if num_freqs <= 1:
        return 0

    while freq_index < 0 or freq_index >= num_freqs:
        if freq_index < 0:
            freq_index = -freq_index
        else:
            freq_index = (2 * num_freqs) - freq_index - 2
    return freq_index


def freq_unfold_q610(
    input_q610: np.ndarray,
    lower_cutoff_freq: int,
    upper_cutoff_freq: int,
    ctr_freq: int,
    nbr_freq: int,
) -> np.ndarray:
    batch_size, num_channels, num_freqs, num_frames = input_q610.shape
    assert num_channels == 1
    num_subbands = (upper_cutoff_freq - lower_cutoff_freq) // ctr_freq
    freq_size = ctr_freq + (2 * nbr_freq)
    output = np.empty((batch_size, num_subbands, 1, freq_size, num_frames), dtype=np.int16)

    for batch_index in range(batch_size):
      for subband_index in range(num_subbands):
          center_start = lower_cutoff_freq + subband_index * ctr_freq
          for sb_freq_index in range(freq_size):
              source_freq = reflect_frequency_index(center_start + sb_freq_index - nbr_freq, num_freqs)
              output[batch_index, subband_index, 0, sb_freq_index, :] = input_q610[batch_index, 0, source_freq, :]
    return output


def packed_to_sequence_q610(packed_input_q610: np.ndarray) -> np.ndarray:
    return np.transpose(packed_input_q610, (2, 0, 1)).copy()


def run_gsu_layer_q610(sequence_input_q610: np.ndarray, weights: dict[str, np.ndarray]) -> np.ndarray:
    num_frames, batch_subbands, input_size = sequence_input_q610.shape
    hx_q610 = np.zeros((batch_subbands, HIDDEN_SIZE), dtype=np.int16)
    cx_q610 = np.zeros((batch_subbands, HIDDEN_SIZE), dtype=np.int16)
    output_q610 = np.empty((num_frames, batch_subbands, HIDDEN_SIZE), dtype=np.int16)

    weight_ih_t = weights["weight_ih"].astype(np.int64, copy=False)
    weight_hh_t = weights["weight_hh"].astype(np.int64, copy=False)
    bias_ih = weights["bias_ih"].astype(np.int64, copy=False)

    for frame_index in range(num_frames):
        input_q64 = sequence_input_q610[frame_index].astype(np.int64, copy=False)
        hx_q64 = hx_q610.astype(np.int64, copy=False)
        common_q20 = input_q64 @ weight_ih_t.T
        common_q20 += hx_q64 @ weight_hh_t.T

        forget_q20 = common_q20 + (bias_ih[:HIDDEN_SIZE][None, :] << Q_FRAC)
        cell_q20 = common_q20 + (bias_ih[HIDDEN_SIZE:][None, :] << Q_FRAC)

        forget_preact_q610 = saturate_int16(round_shift_right(forget_q20, Q_FRAC))
        cell_preact_q610 = saturate_int16(round_shift_right(cell_q20, Q_FRAC))

        forget_gate_q610 = sigmoid_pwl_q610(forget_preact_q610)
        one_minus_forget_q610 = sub_q610(np.full_like(forget_gate_q610, Q_ONE), forget_gate_q610)

        retained_q610 = mul_q610(forget_gate_q610, cx_q610)
        injected_q610 = mul_q610(one_minus_forget_q610, cell_preact_q610)
        cy_q610 = add_q610(retained_q610, injected_q610)
        cy_q610 = batchnorm_folded_q610(cy_q610, weights)
        hy_q610 = step_activation_q610(cy_q610)

        cx_q610 = cy_q610
        hx_q610 = hy_q610
        output_q610[frame_index] = hy_q610

    return output_q610


def run_projection_q610(sequence_input_q610: np.ndarray, weights: dict[str, np.ndarray]) -> np.ndarray:
    num_frames, batch_subbands, _ = sequence_input_q610.shape
    proj_size = weights["weight"].shape[0]
    output_q610 = np.empty((num_frames, batch_subbands, proj_size), dtype=np.int16)

    weight_t = weights["weight"].astype(np.int64, copy=False)
    bias = weights["bias"].astype(np.int64, copy=False)

    for frame_index in range(num_frames):
        input_q64 = sequence_input_q610[frame_index].astype(np.int64, copy=False)
        sum_q20 = input_q64 @ weight_t.T
        sum_q20 += (bias[None, :] << Q_FRAC)
        output_q610[frame_index] = saturate_int16(round_shift_right(sum_q20, Q_FRAC))

    return output_q610


def project_to_dfcoef_q610(projected_output_q610: np.ndarray, batch_size: int, spec: dict[str, int]) -> np.ndarray:
    num_frames, batch_subbands, _ = projected_output_q610.shape
    assert batch_subbands == batch_size * spec["num_subbands"]
    total_freqs = spec["num_subbands"] * spec["ctr_freq"]
    output_q610 = np.zeros((batch_size, spec["df_order"], 1, total_freqs, num_frames, 2), dtype=np.int16)

    for batch_index in range(batch_size):
        for subband_index in range(spec["num_subbands"]):
            sample_index = batch_index * spec["num_subbands"] + subband_index
            for complex_index in range(2):
                for ctr_index in range(spec["ctr_freq"]):
                    for df_index in range(spec["df_order"]):
                        feature_index = ((complex_index * spec["ctr_freq"] + ctr_index) * spec["df_order"]) + df_index
                        merged_freq_index = subband_index * spec["ctr_freq"] + ctr_index
                        output_q610[batch_index, df_index, 0, merged_freq_index, :, complex_index] = projected_output_q610[
                            :, sample_index, feature_index
                        ]

    return output_q610


def save_int16(path: Path, array: np.ndarray) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    np.asarray(array, dtype="<i2").tofile(path)


def save_shape(path: Path, shape: tuple[int, ...] | list[int]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(" ".join(str(dim) for dim in shape) + "\n", encoding="utf-8")


def export_band_weights_q610(stage, output_dir: Path) -> None:
    output_dir.mkdir(parents=True, exist_ok=True)

    for layer_index, gsu_layer in enumerate(stage.sequence_model.layers):
        cell = gsu_layer.cell
        prefix = output_dir / f"layer{layer_index}_"

        tensors = {
            "weight_ih": cell.weight_ih,
            "weight_hh": cell.weight_hh,
            "bias_ih": cell.bias_ih,
        }

        for name, tensor in tensors.items():
            save_int16(prefix.with_name(prefix.name + f"{name}.bin"), float_to_q610(tensor.detach().cpu().numpy()))

        bn_mul_q610, bn_add_q610 = batchnorm_fold_q610(
            cell.batchnorm.running_mean.detach().cpu().numpy(),
            cell.batchnorm.running_var.detach().cpu().numpy(),
            cell.batchnorm.weight.detach().cpu().numpy(),
            cell.batchnorm.bias.detach().cpu().numpy(),
        )
        save_int16(prefix.with_name(prefix.name + "bn_mul.bin"), bn_mul_q610)
        save_int16(prefix.with_name(prefix.name + "bn_add.bin"), bn_add_q610)

    save_int16(output_dir / "proj_weight.bin", float_to_q610(stage.proj.weight.detach().cpu().numpy()))
    save_int16(output_dir / "proj_bias.bin", float_to_q610(stage.proj.bias.detach().cpu().numpy()))


def build_band_spec(sb_model, band_index: int) -> dict[str, int]:
    lower = int(sb_model.freq_cutoffs[band_index])
    upper = int(sb_model.freq_cutoffs[band_index + 1])
    ctr = int(sb_model.center_freq_sizes[band_index])
    nbr = int(sb_model.neighbor_freq_sizes[band_index])
    df_order = int(sb_model.df_orders[band_index])
    num_subbands = (upper - lower) // ctr
    return {
        "band_index": band_index,
        "lower": lower,
        "upper": upper,
        "ctr_freq": ctr,
        "nbr_freq": nbr,
        "df_order": df_order,
        "num_subbands": num_subbands,
        "noisy_freq_size": ctr + (2 * nbr),
        "fb_freq_size": ctr,
        "packed_input_size": ctr + (2 * nbr) + ctr,
        "proj_size": 2 * ctr * df_order,
    }


def collect_layer_weights_q610(stage) -> list[dict[str, np.ndarray]]:
    output = []
    for gsu_layer in stage.sequence_model.layers:
        cell = gsu_layer.cell
        bn_mul_q610, bn_add_q610 = batchnorm_fold_q610(
            cell.batchnorm.running_mean.detach().cpu().numpy(),
            cell.batchnorm.running_var.detach().cpu().numpy(),
            cell.batchnorm.weight.detach().cpu().numpy(),
            cell.batchnorm.bias.detach().cpu().numpy(),
        )
        output.append(
            {
                "weight_ih": float_to_q610(cell.weight_ih.detach().cpu().numpy()),
                "weight_hh": float_to_q610(cell.weight_hh.detach().cpu().numpy()),
                "bias_ih": float_to_q610(cell.bias_ih.detach().cpu().numpy()),
                "bn_mul": bn_mul_q610,
                "bn_add": bn_add_q610,
            }
        )
    return output


def collect_proj_weights_q610(stage) -> dict[str, np.ndarray]:
    return {
        "weight": float_to_q610(stage.proj.weight.detach().cpu().numpy()),
        "bias": float_to_q610(stage.proj.bias.detach().cpu().numpy()),
    }


def export_band_reference_q610(
    sb_model,
    stage,
    noisy_input_q610: np.ndarray,
    fb_output_q610: np.ndarray,
    output_dir: Path,
    band_index: int,
) -> None:
    spec = build_band_spec(sb_model, band_index)
    batch_size, _, _, num_frames = noisy_input_q610.shape

    noisy_subbands_q610 = freq_unfold_q610(
        noisy_input_q610,
        spec["lower"],
        spec["upper"],
        spec["ctr_freq"],
        spec["nbr_freq"],
    )
    fb_subbands_q610 = freq_unfold_q610(
        fb_output_q610,
        spec["lower"],
        spec["upper"],
        spec["ctr_freq"],
        0,
    )
    sb_input_q610 = np.concatenate([noisy_subbands_q610, fb_subbands_q610], axis=-2)
    packed_input_q610 = sb_input_q610.reshape(
        batch_size * spec["num_subbands"],
        spec["packed_input_size"],
        num_frames,
    )
    sequence_input_q610 = packed_to_sequence_q610(packed_input_q610)

    layer_weights = collect_layer_weights_q610(stage)
    layer0_output_q610 = run_gsu_layer_q610(sequence_input_q610, layer_weights[0])
    layer1_output_q610 = run_gsu_layer_q610(layer0_output_q610, layer_weights[1])
    projected_output_q610 = run_projection_q610(layer1_output_q610, collect_proj_weights_q610(stage))
    df_coef_q610 = project_to_dfcoef_q610(projected_output_q610, batch_size, spec)

    python_dir = output_dir / "python_q610"
    python_dir.mkdir(parents=True, exist_ok=True)

    tensors = {
        "noisy_subbands": noisy_subbands_q610,
        "fb_subbands": fb_subbands_q610,
        "sb_input": sb_input_q610,
        "packed_input": packed_input_q610,
        "sequence_input": sequence_input_q610,
        "layer0_output": layer0_output_q610,
        "layer1_output": layer1_output_q610,
        "projected_output": projected_output_q610,
        "df_coef": df_coef_q610,
    }

    for name, tensor in tensors.items():
        save_int16(python_dir / f"{name}.bin", tensor)
        save_shape(python_dir / f"{name}_shape.txt", tensor.shape)

    export_band_weights_q610(stage, output_dir / "weights_q610")


def main() -> None:
    parser = argparse.ArgumentParser(description="Export Q6.10 subband reference buffers and weights.")
    parser.add_argument("-i", "--input", default=str(DEFAULT_INPUT_PATH), help="Input WAV path.")
    parser.add_argument("-c", "--config", default=str(DEFAULT_CONFIG_PATH), help="Model config path.")
    parser.add_argument("-k", "--checkpoint", default=str(DEFAULT_CHECKPOINT_PATH), help="Checkpoint path.")
    parser.add_argument("-o", "--output-dir", default=str(DEFAULT_OUTPUT_DIR), help="Output directory.")
    args = parser.parse_args()

    config_path = Path(args.config).expanduser().resolve()
    checkpoint_path = Path(args.checkpoint).expanduser().resolve()
    input_path = Path(args.input).expanduser().resolve()
    output_dir = Path(args.output_dir).expanduser().resolve()

    config = load_toml_config(config_path)
    model_args = config["model"]["args"]
    sample_rate = int(config["acoustics"]["sr"])

    model = SpikingFullSubNet(**model_args)
    model.load_state_dict(load_checkpoint(checkpoint_path), strict=True)
    model.eval()

    noisy_tensor = load_audio(input_path, sample_rate)

    with torch.no_grad():
        noisy_mag, _, _, _ = model.stft(noisy_tensor)
        noisy_mag = noisy_mag.unsqueeze(1)
        noisy_mag = noisy_mag**model.fdrc
        noisy_mag = noisy_mag[..., :-1, :]
        fb_output, _ = model.fb_model(noisy_mag)

    noisy_input_q610 = float_to_q610(noisy_mag.detach().cpu().numpy())
    fb_output_q610 = float_to_q610(fb_output.detach().cpu().numpy())

    save_int16(output_dir / "noisy_input_q610.bin", noisy_input_q610)
    save_int16(output_dir / "fb_output_q610.bin", fb_output_q610)
    (output_dir / "metadata.txt").write_text(
        f"batch_size={noisy_input_q610.shape[0]}\n"
        f"num_freqs={noisy_input_q610.shape[2]}\n"
        f"num_frames={noisy_input_q610.shape[3]}\n",
        encoding="utf-8",
    )

    for band_index, stage in enumerate(model.sb_model.sb_models):
        export_band_reference_q610(
            sb_model=model.sb_model,
            stage=stage,
            noisy_input_q610=noisy_input_q610,
            fb_output_q610=fb_output_q610,
            output_dir=output_dir / f"band{band_index}",
            band_index=band_index,
        )


if __name__ == "__main__":
    main()
