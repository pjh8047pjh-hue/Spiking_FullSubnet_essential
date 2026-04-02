from __future__ import annotations

import argparse
from pathlib import Path

import torch

from infer import DEFAULT_CHECKPOINT, DEFAULT_CONFIG, load_audio, load_checkpoint, load_toml_config
from audiozen.models.spiking_fullsubnet.modeling_spiking_fullsubnet import SpikingFullSubNet


def save_tensor(path: Path, tensor: torch.Tensor) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    tensor = tensor.detach().cpu().contiguous().to(torch.float32)
    tensor.numpy().astype("<f4", copy=False).tofile(path)


def save_shape(path: Path, tensor: torch.Tensor) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(" ".join(str(dim) for dim in tensor.shape) + "\n", encoding="utf-8")


def save_scalar(path: Path, value: float) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(f"{value:.9g}\n", encoding="utf-8")


def export_band_weights(stage, output_dir: Path) -> None:
    if stage.use_pre_layer_norm:
        raise ValueError("The C++ reference only supports use_pre_layer_norm_sb = false.")

    if not hasattr(stage.proj, "weight") or not hasattr(stage.proj, "bias"):
        raise ValueError("The C++ reference expects a linear projection layer.")

    output_dir.mkdir(parents=True, exist_ok=True)

    for layer_index, gsu_layer in enumerate(stage.sequence_model.layers):
        cell = gsu_layer.cell
        if not cell.shared_weights:
            raise ValueError("The C++ reference only supports shared_weights = true.")
        if not cell.use_bn:
            raise ValueError("The C++ reference only supports bn = true.")

        prefix = output_dir / f"layer{layer_index}_"
        save_tensor(prefix.with_name(prefix.name + "weight_ih.bin"), cell.weight_ih)
        save_tensor(prefix.with_name(prefix.name + "weight_hh.bin"), cell.weight_hh)
        save_tensor(prefix.with_name(prefix.name + "bias_ih.bin"), cell.bias_ih)
        save_tensor(prefix.with_name(prefix.name + "bn_running_mean.bin"), cell.batchnorm.running_mean)
        save_tensor(prefix.with_name(prefix.name + "bn_running_var.bin"), cell.batchnorm.running_var)
        save_tensor(prefix.with_name(prefix.name + "bn_weight.bin"), cell.batchnorm.weight)
        save_tensor(prefix.with_name(prefix.name + "bn_bias.bin"), cell.batchnorm.bias)
        save_scalar(prefix.with_name(prefix.name + "bn_eps.txt"), float(cell.batchnorm.eps))

    save_tensor(output_dir / "proj_weight.bin", stage.proj.weight)
    save_tensor(output_dir / "proj_bias.bin", stage.proj.bias)


def build_band_input(sb_model, noisy_input: torch.Tensor, fb_output: torch.Tensor, band_index: int):
    lower = sb_model.freq_cutoffs[band_index]
    upper = sb_model.freq_cutoffs[band_index + 1]
    ctr = sb_model.center_freq_sizes[band_index]
    nbr = sb_model.neighbor_freq_sizes[band_index]

    noisy_subbands = sb_model._freq_unfold(
        input=noisy_input,
        lower_cutoff_freq=lower,
        upper_cutoff_freq=upper,
        ctr_freq=ctr,
        nbr_freq=nbr,
    )
    fb_subbands = sb_model._freq_unfold(
        input=fb_output,
        lower_cutoff_freq=lower,
        upper_cutoff_freq=upper,
        ctr_freq=ctr,
        nbr_freq=0,
    )
    sb_input = torch.cat([noisy_subbands, fb_subbands], dim=-2)
    batch_size, num_subbands, num_channels, sb_freq_size, sequence_length = sb_input.shape
    packed_input = sb_input.reshape(batch_size * num_subbands, num_channels * sb_freq_size, sequence_length)
    return noisy_subbands, fb_subbands, sb_input, packed_input


def export_band_reference(sb_model, stage, noisy_input: torch.Tensor, fb_output: torch.Tensor, output_dir: Path, band_index: int) -> None:
    noisy_subbands, fb_subbands, sb_input, packed_input = build_band_input(sb_model, noisy_input, fb_output, band_index)
    df_coef, layer_outputs = stage(sb_input)

    python_dir = output_dir / "python"
    python_dir.mkdir(parents=True, exist_ok=True)

    tensors = {
        "noisy_subbands": noisy_subbands,
        "fb_subbands": fb_subbands,
        "sb_input": sb_input,
        "packed_input": packed_input,
        "df_coef": df_coef,
    }

    for name, tensor in tensors.items():
        save_tensor(python_dir / f"{name}.bin", tensor)
        save_shape(python_dir / f"{name}_shape.txt", tensor)

    layer_names = ["layer0_input", "layer1_output", "layer2_output", "proj_output"]
    if len(layer_outputs) != len(layer_names):
        raise ValueError(f"Unexpected number of layer outputs for band {band_index}: {len(layer_outputs)}")

    for name, tensor in zip(layer_names, layer_outputs):
        save_tensor(python_dir / f"{name}.bin", tensor)
        save_shape(python_dir / f"{name}_shape.txt", tensor)

    export_band_weights(stage, output_dir / "weights")


def main() -> None:
    parser = argparse.ArgumentParser(description="Export baseline subband tensors and weights for the C++ reference.")
    parser.add_argument("-i", "--input", default="JH_test/test1.wav", help="Input WAV path.")
    parser.add_argument("-c", "--config", default=str(DEFAULT_CONFIG), help="Model config path.")
    parser.add_argument("-k", "--checkpoint", default=str(DEFAULT_CHECKPOINT), help="Checkpoint path.")
    parser.add_argument("-o", "--output-dir", default="subband_cpp_dump", help="Output directory.")
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

        save_tensor(output_dir / "noisy_input.bin", noisy_mag)
        save_tensor(output_dir / "fb_output.bin", fb_output)
        (output_dir / "metadata.txt").write_text(
            f"batch_size={noisy_mag.shape[0]}\n"
            f"num_freqs={noisy_mag.shape[2]}\n"
            f"num_frames={noisy_mag.shape[3]}\n",
            encoding="utf-8",
        )

        for band_index, stage in enumerate(model.sb_model.sb_models):
            export_band_reference(
                sb_model=model.sb_model,
                stage=stage,
                noisy_input=noisy_mag,
                fb_output=fb_output,
                output_dir=output_dir / f"band{band_index}",
                band_index=band_index,
            )


if __name__ == "__main__":
    main()
