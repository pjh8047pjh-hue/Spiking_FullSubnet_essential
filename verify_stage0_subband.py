from __future__ import annotations

import argparse
from pathlib import Path

import torch

from infer import DEFAULT_CHECKPOINT, DEFAULT_CONFIG, load_audio, load_checkpoint, load_toml_config
from audiozen.models.spiking_fullsubnet.modeling_spiking_fullsubnet import SpikingFullSubNet
from subband_stage0_ref import BAND_SPECS, build_band_ref


def compare_tensors(name, lhs, rhs):
    exact_equal = torch.equal(lhs, rhs)
    max_abs_diff = float((lhs - rhs).abs().max().item()) if lhs.numel() else 0.0
    return {
        "name": name,
        "exact_equal": exact_equal,
        "max_abs_diff": max_abs_diff,
        "shape_equal": tuple(lhs.shape) == tuple(rhs.shape),
    }


def build_packed_subband_input(sb_model, noisy_input, fb_output, band_spec):
    noisy_subbands = sb_model._freq_unfold(
        input=noisy_input,
        lower_cutoff_freq=band_spec.lower_cutoff_freq,
        upper_cutoff_freq=band_spec.upper_cutoff_freq,
        ctr_freq=band_spec.ctr_freq,
        nbr_freq=band_spec.nbr_freq,
    )
    fb_subbands = sb_model._freq_unfold(
        input=fb_output,
        lower_cutoff_freq=band_spec.lower_cutoff_freq,
        upper_cutoff_freq=band_spec.upper_cutoff_freq,
        ctr_freq=band_spec.ctr_freq,
        nbr_freq=0,
    )
    return torch.cat([noisy_subbands, fb_subbands], dim=-2)


def main():
    parser = argparse.ArgumentParser(description="Verify packed-input subband reference against the current model stage.")
    parser.add_argument("-i", "--input", default="JH_test/test1.wav", help="Input WAV path for verification.")
    parser.add_argument("-c", "--config", default=str(DEFAULT_CONFIG), help="Model config path.")
    parser.add_argument("-k", "--checkpoint", default=str(DEFAULT_CHECKPOINT), help="Checkpoint path.")
    args = parser.parse_args()

    config_path = Path(args.config).expanduser().resolve()
    checkpoint_path = Path(args.checkpoint).expanduser().resolve()
    input_path = Path(args.input).expanduser().resolve()

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

        overall_pass = True
        for band_spec in BAND_SPECS:
            packed_input = build_packed_subband_input(
                sb_model=model.sb_model,
                noisy_input=noisy_mag,
                fb_output=fb_output,
                band_spec=band_spec,
            )

            current_stage = model.sb_model.sb_models[band_spec.band_index]
            current_df_coef, current_layers = current_stage(packed_input)

            ref_model = build_band_ref(band_spec.band_index)
            ref_model.load_state_dict(current_stage.state_dict(), strict=True)
            ref_model.eval()
            ref_df_coef, ref_layers = ref_model(packed_input, return_all_layer_outputs=True)

            output_check = compare_tensors(f"band{band_spec.band_index}_df_coef", current_df_coef, ref_df_coef)
            overall_pass = overall_pass and output_check["exact_equal"] and output_check["shape_equal"]
            print(
                f"{output_check['name']}: "
                f"exact_equal={output_check['exact_equal']} "
                f"shape_equal={output_check['shape_equal']} "
                f"max_abs_diff={output_check['max_abs_diff']}"
            )

            if len(current_layers) != len(ref_layers):
                overall_pass = False
                print(
                    f"band{band_spec.band_index}_layers: "
                    f"exact_equal=False shape_equal=False max_abs_diff=inf"
                )
                continue

            for layer_index, (current_layer, ref_layer) in enumerate(zip(current_layers, ref_layers)):
                layer_check = compare_tensors(
                    f"band{band_spec.band_index}_layer{layer_index}",
                    current_layer,
                    ref_layer,
                )
                overall_pass = overall_pass and layer_check["exact_equal"] and layer_check["shape_equal"]
                print(
                    f"{layer_check['name']}: "
                    f"exact_equal={layer_check['exact_equal']} "
                    f"shape_equal={layer_check['shape_equal']} "
                    f"max_abs_diff={layer_check['max_abs_diff']}"
                )

        print(f"overall_pass={overall_pass}")


if __name__ == "__main__":
    main()
