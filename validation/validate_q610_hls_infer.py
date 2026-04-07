from __future__ import annotations

import argparse
from pathlib import Path
import sys


REPO_ROOT = Path(__file__).resolve().parents[1]
if str(REPO_ROOT) not in sys.path:
    sys.path.insert(0, str(REPO_ROOT))

import numpy as np
import soundfile as sf
import torch
from einops import rearrange, repeat

from infer import DEFAULT_CHECKPOINT, DEFAULT_CONFIG, load_audio, load_checkpoint, load_toml_config
from audiozen.models.spiking_fullsubnet.deepfiltering import deepfiltering
from audiozen.models.spiking_fullsubnet.modeling_spiking_fullsubnet import SpikingFullSubNet
from validation.export_subband_reference_q610 import (
    build_band_spec,
    collect_layer_weights_q610,
    collect_proj_weights_q610,
    float_to_q610,
    freq_unfold_q610,
    packed_to_sequence_q610,
    project_to_dfcoef_q610,
    q610_to_float,
    run_gsu_layer_q610,
    run_projection_q610,
)


DEFAULT_INPUTS = [
    REPO_ROOT / "JH_test" / "test1.wav",
    REPO_ROOT / "JH_test" / "test2.wav",
]
DEFAULT_REFERENCE_WAVS = {
    "test1.wav": REPO_ROOT / "JH_test" / "test1_refactor_check.wav",
    "test2.wav": REPO_ROOT / "JH_test" / "test2_refactor_check.wav",
}
DEFAULT_OUTPUT_DIR = REPO_ROOT / "JH_test" / "q610_hls_validation"
DEFAULT_CONFIG_PATH = REPO_ROOT / DEFAULT_CONFIG
DEFAULT_CHECKPOINT_PATH = REPO_ROOT / DEFAULT_CHECKPOINT


def run_subband_hls_q610(model: SpikingFullSubNet, noisy_mag: torch.Tensor, fb_output: torch.Tensor):
    noisy_input_q610 = float_to_q610(noisy_mag.detach().cpu().numpy())
    fb_output_q610 = float_to_q610(fb_output.detach().cpu().numpy())

    df_coef_q610_list = []
    df_coef_float_list = []

    for band_index, stage in enumerate(model.sb_model.sb_models):
        spec = build_band_spec(model.sb_model, band_index)

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
            noisy_input_q610.shape[0] * spec["num_subbands"],
            spec["packed_input_size"],
            noisy_input_q610.shape[-1],
        )
        sequence_input_q610 = packed_to_sequence_q610(packed_input_q610)

        layer_weights = collect_layer_weights_q610(stage)
        layer0_output_q610 = run_gsu_layer_q610(sequence_input_q610, layer_weights[0])
        layer1_output_q610 = run_gsu_layer_q610(layer0_output_q610, layer_weights[1])
        projected_output_q610 = run_projection_q610(layer1_output_q610, collect_proj_weights_q610(stage))
        df_coef_q610 = project_to_dfcoef_q610(projected_output_q610, noisy_input_q610.shape[0], spec)

        df_coef_q610_list.append(df_coef_q610)
        df_coef_float_list.append(torch.from_numpy(q610_to_float(df_coef_q610)).to(dtype=noisy_mag.dtype))

    return df_coef_q610_list, df_coef_float_list


def run_hls_emulated_inference(model: SpikingFullSubNet, noisy_tensor: torch.Tensor):
    with torch.no_grad():
        noisy_mag, _, noisy_real, noisy_imag = model.stft(noisy_tensor)
        noisy_cmp = torch.complex(real=noisy_real, imag=noisy_imag)
        noisy_cmp = rearrange(noisy_cmp, "b f t -> b 1 f t")

        noisy_mag = rearrange(noisy_mag, "b f t -> b 1 f t")
        noisy_mag = noisy_mag**model.fdrc
        noisy_mag = noisy_mag[..., :-1, :]

        fb_output, _ = model.fb_model(noisy_mag)
        df_coef_q610_list, df_coef_float_list = run_subband_hls_q610(model, noisy_mag, fb_output)

        num_filtered_freqs = 0
        enh_freqs_list = []
        for df_coef, df_order in zip(df_coef_float_list, model.df_orders):
            num_freqs = df_coef.shape[3]
            comp_stft_in = noisy_cmp[..., num_filtered_freqs : num_filtered_freqs + num_freqs, :]
            enh_freqs = deepfiltering(comp_stft_in, df_coef, df_order, model.num_spks)
            enh_freqs_list.append(enh_freqs)
            num_filtered_freqs += num_freqs

        enh_freqs = torch.cat(enh_freqs_list, dim=-2)
        enh_stft = repeat(noisy_cmp, "b 1 f t -> b 1 s f t", s=model.num_spks).clone()

        if model.num_spks > 1:
            raise NotImplementedError("This validation script expects num_spks=1.")

        enh_stft[..., :-1, :] = enh_freqs
        enh_stft = rearrange(enh_stft, "b 1 1 f t -> b f t")
        enh_y = model.istft(enh_stft, length=noisy_tensor.shape[1])
        return enh_y, df_coef_q610_list


def compare_arrays(lhs: np.ndarray, rhs: np.ndarray) -> dict[str, float | int | bool]:
    lhs = np.asarray(lhs, dtype=np.float32)
    rhs = np.asarray(rhs, dtype=np.float32)
    diff = lhs - rhs
    mse = float(np.mean(np.square(diff))) if diff.size else 0.0
    rmse = float(np.sqrt(mse))
    mae = float(np.mean(np.abs(diff))) if diff.size else 0.0
    max_abs_diff = float(np.max(np.abs(diff))) if diff.size else 0.0
    diff_energy = float(np.sum(np.square(diff)))
    ref_energy = float(np.sum(np.square(rhs)))
    snr_db = float("inf") if diff_energy == 0.0 else float(10.0 * np.log10(max(ref_energy, 1.0e-12) / diff_energy))
    return {
        "shape_equal": lhs.shape == rhs.shape,
        "exact_equal": np.array_equal(lhs, rhs),
        "mse": mse,
        "rmse": rmse,
        "mae": mae,
        "max_abs_diff": max_abs_diff,
        "num_diff_samples": int(np.count_nonzero(diff)),
        "snr_db": snr_db,
    }


def compare_dfcoef_lists(hls_dfcoef_q610_list: list[np.ndarray], float_dfcoef_list: list[torch.Tensor]):
    results = []
    for band_index, (hls_dfcoef_q610, float_dfcoef) in enumerate(zip(hls_dfcoef_q610_list, float_dfcoef_list)):
        hls_dfcoef_float = q610_to_float(hls_dfcoef_q610)
        float_dfcoef_np = float_dfcoef.detach().cpu().numpy().astype(np.float32)
        results.append((band_index, compare_arrays(hls_dfcoef_float, float_dfcoef_np)))
    return results


def main() -> None:
    parser = argparse.ArgumentParser(description="Validate HLS-style Q6.10 subband inference against float inference.")
    parser.add_argument("-c", "--config", default=str(DEFAULT_CONFIG_PATH), help="Model config path.")
    parser.add_argument("-k", "--checkpoint", default=str(DEFAULT_CHECKPOINT_PATH), help="Checkpoint path.")
    parser.add_argument("-o", "--output-dir", default=str(DEFAULT_OUTPUT_DIR), help="Directory to save HLS wav outputs.")
    parser.add_argument("inputs", nargs="*", help="Input WAV paths. Defaults to test1/test2.")
    args = parser.parse_args()

    input_paths = [Path(path).expanduser().resolve() for path in args.inputs] if args.inputs else DEFAULT_INPUTS
    output_dir = Path(args.output_dir).expanduser().resolve()
    output_dir.mkdir(parents=True, exist_ok=True)

    config = load_toml_config(Path(args.config).expanduser().resolve())
    sample_rate = int(config["acoustics"]["sr"])
    model = SpikingFullSubNet(**config["model"]["args"])
    model.load_state_dict(load_checkpoint(Path(args.checkpoint).expanduser().resolve()), strict=True)
    model.eval()

    for input_path in input_paths:
        noisy_tensor = load_audio(input_path, sample_rate)

        with torch.no_grad():
            float_enhanced, _, _, _ = model(noisy_tensor)
            noisy_mag, _, _, _ = model.stft(noisy_tensor)
            noisy_mag = rearrange(noisy_mag, "b f t -> b 1 f t")
            noisy_mag = noisy_mag**model.fdrc
            noisy_mag = noisy_mag[..., :-1, :]
            fb_output, _ = model.fb_model(noisy_mag)
            float_dfcoef_list, _ = model.sb_model(noisy_mag, fb_output)

        hls_enhanced, hls_dfcoef_q610_list = run_hls_emulated_inference(model, noisy_tensor)

        float_np = float_enhanced.squeeze(0).detach().cpu().numpy()
        hls_np = hls_enhanced.squeeze(0).detach().cpu().numpy()
        float_vs_hls = compare_arrays(hls_np, float_np)

        print(f"input={input_path.name}")
        print(
            "float_vs_hls "
            f"shape_equal={float_vs_hls['shape_equal']} "
            f"exact_equal={float_vs_hls['exact_equal']} "
            f"max_abs_diff={float_vs_hls['max_abs_diff']:.8f} "
            f"mae={float_vs_hls['mae']:.8f} "
            f"rmse={float_vs_hls['rmse']:.8f} "
            f"snr_db={float_vs_hls['snr_db']:.4f} "
            f"num_diff_samples={float_vs_hls['num_diff_samples']}"
        )

        for band_index, metrics in compare_dfcoef_lists(hls_dfcoef_q610_list, float_dfcoef_list):
            print(
                f"band{band_index}_dfcoef "
                f"shape_equal={metrics['shape_equal']} "
                f"exact_equal={metrics['exact_equal']} "
                f"max_abs_diff={metrics['max_abs_diff']:.8f} "
                f"mae={metrics['mae']:.8f} "
                f"rmse={metrics['rmse']:.8f} "
                f"snr_db={metrics['snr_db']:.4f} "
                f"num_diff_samples={metrics['num_diff_samples']}"
            )

        reference_path = DEFAULT_REFERENCE_WAVS.get(input_path.name)
        if reference_path is not None and reference_path.exists():
            reference_wave, reference_sr = sf.read(reference_path)
            print(f"reference_sr_equal={reference_sr == sample_rate}")
            ref_vs_hls = compare_arrays(hls_np, reference_wave)
            print(
                "reference_vs_hls "
                f"shape_equal={ref_vs_hls['shape_equal']} "
                f"exact_equal={ref_vs_hls['exact_equal']} "
                f"max_abs_diff={ref_vs_hls['max_abs_diff']:.8f} "
                f"mae={ref_vs_hls['mae']:.8f} "
                f"rmse={ref_vs_hls['rmse']:.8f} "
                f"snr_db={ref_vs_hls['snr_db']:.4f} "
                f"num_diff_samples={ref_vs_hls['num_diff_samples']}"
            )

        output_path = output_dir / f"{input_path.stem}_q610_hls.wav"
        sf.write(output_path, hls_np, sample_rate)
        print(f"hls_output={output_path}")
        print()


if __name__ == "__main__":
    main()
