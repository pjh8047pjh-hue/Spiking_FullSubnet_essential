from __future__ import annotations

import argparse
from pathlib import Path

import numpy as np
import soundfile as sf
import torch

from audiozen.models.spiking_fullsubnet.modeling_spiking_fullsubnet import SpikingFullSubNet


DEFAULT_CONFIG = Path("recipes/intel_ndns/spiking_fullsubnet/baseline_m_qat.toml")
DEFAULT_CHECKPOINT = Path("best_model_qat.pt")


def load_toml_config(config_path: Path) -> dict:
    try:
        import tomllib

        with config_path.open("rb") as handle:
            return tomllib.load(handle)
    except ModuleNotFoundError:
        try:
            import toml
        except ModuleNotFoundError as exc:
            raise ModuleNotFoundError(
                "Loading TOML config requires Python 3.11+ or the 'toml' package."
            ) from exc

        return toml.load(config_path)


def load_checkpoint(checkpoint_path: Path) -> dict:
    try:
        checkpoint = torch.load(checkpoint_path, map_location="cpu", weights_only=False)
    except TypeError:
        checkpoint = torch.load(checkpoint_path, map_location="cpu")

    if not isinstance(checkpoint, dict):
        raise TypeError(f"Unsupported checkpoint type: {type(checkpoint)}")

    # Support both inference-ready state_dict files and training checkpoints.
    for key in ("model_state_dict", "state_dict", "module"):
        nested_state = checkpoint.get(key)
        if isinstance(nested_state, dict):
            checkpoint = nested_state
            break

    if not isinstance(checkpoint, dict):
        raise TypeError(f"Unsupported checkpoint contents in: {checkpoint_path}")
    return checkpoint


def load_audio(wav_path: Path, expected_sr: int, max_seconds: float | None = None) -> torch.Tensor:
    waveform, sample_rate = sf.read(wav_path)
    waveform = np.asarray(waveform, dtype=np.float32)

    if waveform.ndim > 1:
        # Match the legacy inference path more closely by collapsing stereo to mono
        # with channel averaging instead of taking only the first channel.
        waveform = waveform.mean(axis=1, dtype=np.float32)

    if sample_rate != expected_sr:
        try:
            import soxr
        except ModuleNotFoundError as exc:
            raise ModuleNotFoundError(
                "Resampling requires the 'soxr' package when the input sample rate differs from the model sample rate."
            ) from exc

        waveform = soxr.resample(waveform, sample_rate, expected_sr, quality="HQ").astype(np.float32)

    if max_seconds is not None:
        max_samples = max(1, int(expected_sr * max_seconds))
        waveform = waveform[:max_samples]

    return torch.from_numpy(waveform).float().unsqueeze(0)


def default_output_path(input_path: Path) -> Path:
    return input_path.with_name(f"{input_path.stem}_enhanced.wav")


def main() -> None:
    parser = argparse.ArgumentParser(description="Minimal Spiking-FullSubNet inference.")
    parser.add_argument("-i", "--input", required=True, help="Path to the input WAV file.")
    parser.add_argument("-o", "--output", help="Path to save the enhanced WAV file.")
    parser.add_argument("--max-seconds", type=float, help="Optional duration cap for quick smoke tests.")
    parser.add_argument("-c", "--config", default=str(DEFAULT_CONFIG), help="Path to the model config TOML file.")
    parser.add_argument(
        "-k",
        "--checkpoint",
        default=str(DEFAULT_CHECKPOINT),
        help="Path to the model checkpoint file.",
    )
    args = parser.parse_args()

    input_path = Path(args.input).expanduser().resolve()
    output_path = Path(args.output).expanduser().resolve() if args.output else default_output_path(input_path)
    config_path = Path(args.config).expanduser().resolve()
    checkpoint_path = Path(args.checkpoint).expanduser().resolve()

    config = load_toml_config(config_path)
    model_args = config["model"]["args"]
    sample_rate = int(config["acoustics"]["sr"])

    model = SpikingFullSubNet(**model_args)
    state_dict = load_checkpoint(checkpoint_path)
    model.load_state_dict(state_dict, strict=True)
    model.eval()

    noisy_tensor = load_audio(input_path, sample_rate, max_seconds=args.max_seconds)

    with torch.no_grad():
        enhanced_tensor = model(noisy_tensor)[0]

    output_path.parent.mkdir(parents=True, exist_ok=True)
    sf.write(output_path, enhanced_tensor.squeeze(0).cpu().numpy(), sample_rate)

    print(f"Input: {input_path}")
    print(f"Output: {output_path}")


if __name__ == "__main__":
    main()
