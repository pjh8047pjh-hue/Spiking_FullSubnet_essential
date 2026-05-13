from __future__ import annotations

import argparse
import importlib
import json
import math
import os
import sys
import time
import types
from datetime import datetime
from pathlib import Path
from typing import Any

import numpy as np
import soundfile as sf
import torch


REPO_ROOT = Path(__file__).resolve().parents[1]
if str(REPO_ROOT) not in sys.path:
    sys.path.insert(0, str(REPO_ROOT))

from energy_measure.measure_energy import (  # noqa: E402
    Q610FullInferenceRunner,
    load_snn_infer_py_model,
    load_toml,
    save_wav,
)


DEFAULT_CONFIG = REPO_ROOT / "recipes/intel_ndns/spiking_fullsubnet/baseline_m.toml"
DEFAULT_CHECKPOINT = (
    REPO_ROOT / "model_zoo/intel_ndns/spike_fsb/baseline_m/checkpoints/best/pytorch_model.bin"
)
DEFAULT_CLEAN = REPO_ROOT / "JH_test/wav/JH_Clean_voice.wav"
DEFAULT_NOISY = REPO_ROOT / "JH_test/wav/JH_ditry_voice.wav"
DEFAULT_NOISE = REPO_ROOT / "JH_test/wav/JH_Car_noise.wav"
DEFAULT_Q610_LIB = REPO_ROOT / "energy_measure/native/libq610_full_infer.dll"
DEFAULT_RESULT_DIR = REPO_ROOT / "energy_measure/speech_metrics_result"
DEFAULT_MINGW_DLL_DIR = Path("C:/msys64/ucrt64/bin")
DEFAULT_ANN_ROOT = REPO_ROOT.parent / "FullSubNet"
DEFAULT_ANN_CONFIG = DEFAULT_ANN_ROOT / "recipes/dns_interspeech_2020/fullsubnet/inference.toml"
DEFAULT_ANN_CHECKPOINT = DEFAULT_ANN_ROOT / "fullsubnet_best_model_58epochs.tar"


def import_metric_packages():
    missing = []
    try:
        from pesq import pesq
    except ModuleNotFoundError:
        pesq = None
        missing.append("pesq")
    try:
        from pystoi import stoi
    except ModuleNotFoundError:
        stoi = None
        missing.append("pystoi")
    if missing:
        raise ModuleNotFoundError(
            "Missing metric package(s): "
            + ", ".join(missing)
            + ". Install with: pip install pesq pystoi"
        )
    return pesq, stoi


def audio_info(path: Path) -> dict[str, Any]:
    info = sf.info(path.as_posix())
    return {
        "path": str(path),
        "sample_rate": int(info.samplerate),
        "channels": int(info.channels),
        "frames": int(info.frames),
        "duration": float(info.duration),
        "format": info.format,
        "subtype": info.subtype,
    }


def load_audio_array(path: Path, sample_rate: int) -> np.ndarray:
    waveform, source_sr = sf.read(path.as_posix(), dtype="float32", always_2d=False)
    waveform = np.asarray(waveform, dtype=np.float32)
    if waveform.ndim > 1:
        waveform = waveform.mean(axis=1, dtype=np.float32)
    if int(source_sr) != sample_rate:
        import soxr

        waveform = soxr.resample(waveform, int(source_sr), sample_rate, quality="HQ").astype(np.float32)
    return np.ascontiguousarray(waveform, dtype=np.float32)


def truncate_pair(reference: np.ndarray, estimated: np.ndarray) -> tuple[np.ndarray, np.ndarray]:
    length = min(int(reference.size), int(estimated.size))
    return reference[:length], estimated[:length]


def ensure_finite(name: str, values: np.ndarray) -> None:
    if not np.isfinite(values).all():
        raise ValueError(f"{name} contains non-finite values.")


def si_sdr(reference: np.ndarray, estimated: np.ndarray, eps: float = 1e-8) -> float:
    reference, estimated = truncate_pair(reference, estimated)
    reference = reference.astype(np.float64) - float(np.mean(reference))
    estimated = estimated.astype(np.float64) - float(np.mean(estimated))
    alpha = float(np.dot(estimated, reference) / (np.dot(reference, reference) + eps))
    projection = alpha * reference
    noise = estimated - projection
    return float(
        10.0
        * np.log10((np.sum(projection**2) + eps) / (np.sum(noise**2) + eps))
    )


def snr_db(reference: np.ndarray, estimated: np.ndarray, eps: float = 1e-12) -> float:
    reference, estimated = truncate_pair(reference, estimated)
    noise = estimated.astype(np.float64) - reference.astype(np.float64)
    signal_power = float(np.mean(reference.astype(np.float64) ** 2))
    noise_power = float(np.mean(noise**2))
    if noise_power <= eps:
        return float("inf")
    return float(10.0 * math.log10((signal_power + eps) / noise_power))


def rmse(reference: np.ndarray, estimated: np.ndarray) -> float:
    reference, estimated = truncate_pair(reference, estimated)
    diff = estimated.astype(np.float64) - reference.astype(np.float64)
    return float(np.sqrt(np.mean(diff**2)))


def evaluate_metrics(
    clean: np.ndarray,
    estimated: np.ndarray,
    sample_rate: int,
    pesq_fn,
    stoi_fn,
) -> dict[str, float]:
    clean_eval, estimated_eval = truncate_pair(clean, estimated)
    ensure_finite("clean", clean_eval)
    ensure_finite("estimated", estimated_eval)
    return {
        "WB-PESQ": float(pesq_fn(sample_rate, clean_eval, estimated_eval, mode="wb")),
        "STOI": float(stoi_fn(clean_eval, estimated_eval, sample_rate, extended=False)),
        "SI-SDR (dB)": si_sdr(clean_eval, estimated_eval),
    }


def torch_to_numpy(waveform: torch.Tensor) -> np.ndarray:
    return np.ascontiguousarray(waveform.squeeze(0).detach().cpu().numpy().astype(np.float32))


def install_fullsubnet_lightweight_feature_module() -> None:
    def drop_band(input_tensor: torch.Tensor, num_groups: int = 2) -> torch.Tensor:
        batch_size, _, num_freqs, _ = input_tensor.shape
        assert batch_size > num_groups
        if num_groups <= 1:
            return input_tensor
        if num_freqs % num_groups != 0:
            input_tensor = input_tensor[..., : (num_freqs - (num_freqs % num_groups)), :]
            num_freqs = input_tensor.shape[2]

        output = []
        for group_idx in range(num_groups):
            sample_indices = torch.arange(group_idx, batch_size, num_groups, device=input_tensor.device)
            freq_indices = torch.arange(group_idx, num_freqs, num_groups, device=input_tensor.device)
            selected_samples = torch.index_select(input_tensor, dim=0, index=sample_indices)
            output.append(torch.index_select(selected_samples, dim=2, index=freq_indices))
        return torch.cat(output, dim=0)

    feature_module = types.ModuleType("audio_zen.acoustics.feature")
    feature_module.drop_band = drop_band
    sys.modules["audio_zen.acoustics.feature"] = feature_module


def initialize_module(path: str, args: dict[str, Any] | None = None):
    module_path = ".".join(path.split(".")[:-1])
    class_or_function_name = path.split(".")[-1]
    module = importlib.import_module(module_path)
    class_or_function = getattr(module, class_or_function_name)
    return class_or_function(**args) if args else class_or_function()


def load_checkpoint(checkpoint_path: Path) -> Any:
    try:
        return torch.load(checkpoint_path, map_location="cpu", weights_only=False)
    except TypeError:
        return torch.load(checkpoint_path, map_location="cpu")


def load_ann_fullsubnet_model(
    config: dict[str, Any],
    checkpoint_path: Path,
    ann_root: Path,
    ann_config_path: Path,
) -> tuple[torch.nn.Module, dict[str, Any]]:
    install_fullsubnet_lightweight_feature_module()
    recipe_root = ann_root / "recipes/dns_interspeech_2020"
    for path in (ann_config_path.parent, recipe_root, ann_root):
        path_text = str(path)
        if path_text not in sys.path:
            sys.path.insert(0, path_text)

    model = initialize_module(config["model"]["path"], args=config["model"]["args"])
    checkpoint = load_checkpoint(checkpoint_path)
    metadata = {
        "epoch": checkpoint.get("epoch") if isinstance(checkpoint, dict) else None,
        "best_val_si_sdr": checkpoint.get("best_val_si_sdr") if isinstance(checkpoint, dict) else None,
        "avg_loss": checkpoint.get("avg_loss") if isinstance(checkpoint, dict) else None,
    }

    if isinstance(checkpoint, dict) and isinstance(checkpoint.get("model"), dict):
        state_dict = checkpoint["model"]
    elif isinstance(checkpoint, dict) and isinstance(checkpoint.get("model_state_dict"), dict):
        state_dict = checkpoint["model_state_dict"]
    elif isinstance(checkpoint, dict) and isinstance(checkpoint.get("state_dict"), dict):
        state_dict = checkpoint["state_dict"]
    elif isinstance(checkpoint, dict):
        state_dict = checkpoint
    else:
        raise TypeError(f"Unsupported ANN checkpoint contents: {type(checkpoint)}")

    state_dict = {key.replace("module.", ""): value for key, value in state_dict.items()}
    model.load_state_dict(state_dict, strict=True)
    model.eval()
    return model, metadata


def stft(y: torch.Tensor, n_fft: int, hop_length: int, win_length: int):
    complex_stft = torch.stft(
        y,
        n_fft,
        hop_length,
        win_length,
        window=torch.hann_window(n_fft, device=y.device),
        return_complex=True,
    )
    return torch.abs(complex_stft), torch.angle(complex_stft), complex_stft.real, complex_stft.imag


def istft(features: tuple[torch.Tensor, torch.Tensor], n_fft: int, hop_length: int, win_length: int, length: int):
    real, imag = features
    return torch.istft(
        torch.complex(real, imag),
        n_fft,
        hop_length,
        win_length,
        window=torch.hann_window(n_fft, device=real.device),
        length=length,
    )


def decompress_cirm(mask: torch.Tensor, k: int = 10, limit: float = 9.9) -> torch.Tensor:
    mask = limit * (mask >= limit) - limit * (mask <= -limit) + mask * (torch.abs(mask) < limit)
    return -k * torch.log((k - mask) / (k + mask))


@torch.no_grad()
def run_ann_fullsubnet_inference(
    model: torch.nn.Module,
    noisy: torch.Tensor,
    acoustics: dict[str, Any],
) -> torch.Tensor:
    noisy_mag, _, noisy_real, noisy_imag = stft(
        noisy,
        n_fft=int(acoustics["n_fft"]),
        hop_length=int(acoustics["hop_length"]),
        win_length=int(acoustics["win_length"]),
    )
    pred_cirm = model(noisy_mag.unsqueeze(1)).permute(0, 2, 3, 1)
    pred_cirm = decompress_cirm(pred_cirm)
    enhanced_real = pred_cirm[..., 0] * noisy_real - pred_cirm[..., 1] * noisy_imag
    enhanced_imag = pred_cirm[..., 1] * noisy_real + pred_cirm[..., 0] * noisy_imag
    return istft(
        (enhanced_real, enhanced_imag),
        n_fft=int(acoustics["n_fft"]),
        hop_length=int(acoustics["hop_length"]),
        win_length=int(acoustics["win_length"]),
        length=noisy.shape[-1],
    )


def format_markdown_table(rows: list[dict[str, Any]]) -> str:
    headers = [
        "Model",
        "WB-PESQ",
        "STOI",
        "SI-SDR (dB)",
        "Delta WB-PESQ vs Noisy",
        "Delta STOI vs Noisy",
        "Delta SI-SDR vs Noisy",
    ]
    lines = [
        "| " + " | ".join(headers) + " |",
        "|:---|---:|---:|---:|---:|---:|---:|",
    ]
    for row in rows:
        lines.append(
            "| {Model} | {WB-PESQ:.3f} | {STOI:.3f} | {SI-SDR (dB):.2f} | "
            "{Delta WB-PESQ vs Noisy:+.3f} | {Delta STOI vs Noisy:+.3f} | "
            "{Delta SI-SDR vs Noisy:+.2f} |".format(**row)
        )
    return "\n".join(lines)


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Evaluate ANN, SNN, and Q6.10 SNN speech metrics.")
    parser.add_argument("--clean", default=str(DEFAULT_CLEAN))
    parser.add_argument("--noisy", default=str(DEFAULT_NOISY))
    parser.add_argument("--noise", default=str(DEFAULT_NOISE))
    parser.add_argument("--config", default=str(DEFAULT_CONFIG))
    parser.add_argument("--checkpoint", default=str(DEFAULT_CHECKPOINT))
    parser.add_argument("--ann-root", default=str(DEFAULT_ANN_ROOT))
    parser.add_argument("--ann-config", default=str(DEFAULT_ANN_CONFIG))
    parser.add_argument("--ann-checkpoint", default=str(DEFAULT_ANN_CHECKPOINT))
    parser.add_argument("--q610-lib", default=str(DEFAULT_Q610_LIB))
    parser.add_argument("--result-dir", default=str(DEFAULT_RESULT_DIR))
    parser.add_argument("--mingw-dll-dir", default=str(DEFAULT_MINGW_DLL_DIR))
    parser.add_argument("--threads", type=int, default=1)
    return parser.parse_args()


def main() -> None:
    args = parse_args()
    clean_path = Path(args.clean).expanduser().resolve()
    noisy_path = Path(args.noisy).expanduser().resolve()
    noise_path = Path(args.noise).expanduser().resolve() if args.noise else None
    config_path = Path(args.config).expanduser().resolve()
    checkpoint_path = Path(args.checkpoint).expanduser().resolve()
    ann_root = Path(args.ann_root).expanduser().resolve()
    ann_config_path = Path(args.ann_config).expanduser().resolve()
    ann_checkpoint_path = Path(args.ann_checkpoint).expanduser().resolve()
    q610_lib_path = Path(args.q610_lib).expanduser().resolve()
    result_dir = Path(args.result_dir).expanduser().resolve()
    mingw_dll_dir = Path(args.mingw_dll_dir).expanduser().resolve()

    pesq_fn, stoi_fn = import_metric_packages()
    if hasattr(os, "add_dll_directory") and mingw_dll_dir.exists():
        os.add_dll_directory(str(mingw_dll_dir))

    torch.set_num_threads(args.threads)
    config = load_toml(config_path)
    ann_config = load_toml(ann_config_path)
    sample_rate = int(config["acoustics"]["sr"])
    ann_sample_rate = int(ann_config["acoustics"]["sr"])
    if ann_sample_rate != sample_rate:
        raise ValueError(f"ANN and SNN sample rates differ: {ann_sample_rate=} {sample_rate=}")

    print("Input audio metadata")
    metadata_audio = {
        "clean": audio_info(clean_path),
        "noisy": audio_info(noisy_path),
        "noise": audio_info(noise_path) if noise_path is not None and noise_path.exists() else None,
    }
    for key, value in metadata_audio.items():
        if value is not None:
            print(f"- {key}: sr={value['sample_rate']} channels={value['channels']} duration={value['duration']:.3f}s")

    clean = load_audio_array(clean_path, sample_rate)
    noisy = load_audio_array(noisy_path, sample_rate)
    ensure_finite("clean", clean)
    ensure_finite("noisy", noisy)
    noisy_tensor = torch.from_numpy(noisy).float().unsqueeze(0)

    print("Loading ANN FullSubNet model...")
    ann_model, ann_checkpoint_info = load_ann_fullsubnet_model(
        ann_config,
        ann_checkpoint_path,
        ann_root,
        ann_config_path,
    )
    with torch.no_grad():
        start = time.perf_counter()
        ann_output = run_ann_fullsubnet_inference(ann_model, noisy_tensor, ann_config["acoustics"])
        ann_seconds = time.perf_counter() - start

    print("Loading SNN model...")
    model, checkpoint_info, _infer_module = load_snn_infer_py_model(config, checkpoint_path, REPO_ROOT)

    with torch.no_grad():
        start = time.perf_counter()
        snn_output = model(noisy_tensor)
        snn_seconds = time.perf_counter() - start
        if isinstance(snn_output, (tuple, list)):
            snn_output = snn_output[0]

    print("Running Q6.10 full inference...")
    q610_runner = Q610FullInferenceRunner(q610_lib_path, model)
    try:
        with torch.no_grad():
            start = time.perf_counter()
            q610_output = q610_runner.run(noisy_tensor)
            q610_seconds = time.perf_counter() - start
    finally:
        q610_runner.close()

    if tuple(ann_output.shape) != tuple(noisy_tensor.shape):
        raise ValueError(f"ANN output shape mismatch: {tuple(ann_output.shape)} vs {tuple(noisy_tensor.shape)}")
    if tuple(snn_output.shape) != tuple(noisy_tensor.shape):
        raise ValueError(f"SNN output shape mismatch: {tuple(snn_output.shape)} vs {tuple(noisy_tensor.shape)}")
    if tuple(q610_output.shape) != tuple(noisy_tensor.shape):
        raise ValueError(f"Q6.10 output shape mismatch: {tuple(q610_output.shape)} vs {tuple(noisy_tensor.shape)}")

    ann = torch_to_numpy(ann_output)
    snn = torch_to_numpy(snn_output)
    q610 = torch_to_numpy(q610_output)
    ensure_finite("ann", ann)
    ensure_finite("snn", snn)
    ensure_finite("q610", q610)

    result_dir.mkdir(parents=True, exist_ok=True)
    save_wav(result_dir / "ann_fullsubnet_enhanced.wav", ann_output, sample_rate)
    save_wav(result_dir / "snn_enhanced.wav", snn_output, sample_rate)
    save_wav(result_dir / "q610_full_infer_enhanced.wav", q610_output, sample_rate)

    metric_by_model = {
        "Noisy": evaluate_metrics(clean, noisy, sample_rate, pesq_fn, stoi_fn),
        "ANN FullSubNet": evaluate_metrics(clean, ann, sample_rate, pesq_fn, stoi_fn),
        "SNN": evaluate_metrics(clean, snn, sample_rate, pesq_fn, stoi_fn),
        "SNN Q6.10": evaluate_metrics(clean, q610, sample_rate, pesq_fn, stoi_fn),
    }
    noisy_metrics = metric_by_model["Noisy"]
    rows: list[dict[str, Any]] = []
    for model_name, metrics in metric_by_model.items():
        row = {"Model": model_name, **metrics}
        row["Delta WB-PESQ vs Noisy"] = metrics["WB-PESQ"] - noisy_metrics["WB-PESQ"]
        row["Delta STOI vs Noisy"] = metrics["STOI"] - noisy_metrics["STOI"]
        row["Delta SI-SDR vs Noisy"] = metrics["SI-SDR (dB)"] - noisy_metrics["SI-SDR (dB)"]
        rows.append(row)

    noise_snr = None
    if noise_path is not None and noise_path.exists():
        noise = load_audio_array(noise_path, sample_rate)
        noise_ref, clean_ref = truncate_pair(noise, clean)
        noise_power = float(np.mean(noise_ref.astype(np.float64) ** 2))
        clean_power = float(np.mean(clean_ref.astype(np.float64) ** 2))
        noise_snr = float("inf") if noise_power == 0.0 else float(10.0 * math.log10(clean_power / noise_power))

    sanity = {
        "q610_vs_snn_rmse": rmse(snn, q610),
        "q610_vs_snn_snr_db": snr_db(snn, q610),
        "noisy_snr_vs_clean_db": snr_db(clean, noisy),
        "clean_vs_car_noise_power_snr_db": noise_snr,
        "ann_vs_snn_rmse": rmse(snn, ann),
        "ann_vs_snn_snr_db": snr_db(snn, ann),
        "ann_inference_seconds": ann_seconds,
        "snn_inference_seconds": snn_seconds,
        "q610_inference_seconds": q610_seconds,
    }

    summary = {
        "metrics": rows,
        "sanity": sanity,
        "audio": metadata_audio,
        "paths": {
            "ann_config": str(ann_config_path),
            "ann_checkpoint": str(ann_checkpoint_path),
            "config": str(config_path),
            "checkpoint": str(checkpoint_path),
            "q610_lib": str(q610_lib_path),
            "ann_output": str(result_dir / "ann_fullsubnet_enhanced.wav"),
            "snn_output": str(result_dir / "snn_enhanced.wav"),
            "q610_output": str(result_dir / "q610_full_infer_enhanced.wav"),
        },
        "sample_rate": sample_rate,
        "torch_threads": torch.get_num_threads(),
        "checkpoint_epoch": checkpoint_info.get("epoch"),
        "checkpoint_best_val_si_sdr": checkpoint_info.get("best_val_si_sdr"),
        "ann_checkpoint_epoch": ann_checkpoint_info.get("epoch"),
        "measured_at": datetime.now().astimezone().isoformat(timespec="seconds"),
    }

    (result_dir / "metrics_summary.json").write_text(json.dumps(summary, indent=2), encoding="utf-8")

    table = format_markdown_table(rows)
    md_lines = [
        "# ANN vs SNN vs Q6.10 SNN Speech Metrics",
        "",
        table,
        "",
        "## Sanity Checks",
        "",
        f"- ANN vs SNN RMSE: `{sanity['ann_vs_snn_rmse']:.8f}`",
        f"- ANN vs SNN SNR: `{sanity['ann_vs_snn_snr_db']:.3f} dB`",
        f"- Q6.10 vs SNN RMSE: `{sanity['q610_vs_snn_rmse']:.8f}`",
        f"- Q6.10 vs SNN SNR: `{sanity['q610_vs_snn_snr_db']:.3f} dB`",
        f"- Noisy SNR vs clean: `{sanity['noisy_snr_vs_clean_db']:.3f} dB`",
        f"- ANN inference time: `{ann_seconds:.6f} s`",
        f"- SNN inference time: `{snn_seconds:.6f} s`",
        f"- Q6.10 inference time: `{q610_seconds:.6f} s`",
        "",
        "## Outputs",
        "",
        f"- ANN enhanced wav: `{result_dir / 'ann_fullsubnet_enhanced.wav'}`",
        f"- SNN enhanced wav: `{result_dir / 'snn_enhanced.wav'}`",
        f"- Q6.10 enhanced wav: `{result_dir / 'q610_full_infer_enhanced.wav'}`",
    ]
    if noise_snr is not None:
        md_lines.insert(13, f"- Clean vs car-noise power SNR: `{noise_snr:.3f} dB`")
    (result_dir / "metrics_summary.md").write_text("\n".join(md_lines) + "\n", encoding="utf-8")

    print()
    print(table)
    print()
    print(f"Saved summary: {result_dir / 'metrics_summary.md'}")


if __name__ == "__main__":
    main()
