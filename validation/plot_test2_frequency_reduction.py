from __future__ import annotations

import argparse
from pathlib import Path
import sys


REPO_ROOT = Path(__file__).resolve().parents[1]
if str(REPO_ROOT) not in sys.path:
    sys.path.insert(0, str(REPO_ROOT))

import matplotlib
import numpy as np
import soundfile as sf
import soxr
import torch

from infer import load_toml_config


matplotlib.use("Agg")
import matplotlib.pyplot as plt


DEFAULT_INPUT = REPO_ROOT / "JH_test" / "test2.wav"
DEFAULT_ENHANCED = REPO_ROOT / "JH_test" / "enhanced_test2.wav"
DEFAULT_QAT = REPO_ROOT / "JH_test" / "test2_qat_rerun.wav"
DEFAULT_CONFIG = REPO_ROOT / "recipes" / "intel_ndns" / "spiking_fullsubnet" / "baseline_m_qat.toml"
DEFAULT_OUTPUT = REPO_ROOT / "JH_test" / "test2_frequency_reduction_plot.png"


def load_waveform(path: Path, target_sr: int) -> tuple[np.ndarray, int]:
    waveform, sample_rate = sf.read(path)
    waveform = np.asarray(waveform, dtype=np.float32)

    if waveform.ndim > 1:
        waveform = waveform.mean(axis=1, dtype=np.float32)

    if sample_rate != target_sr:
        waveform = soxr.resample(waveform, sample_rate, target_sr, quality="HQ").astype(np.float32)

    return waveform, target_sr


def magnitude_spectrum(
    waveform: np.ndarray,
    sample_rate: int,
    n_fft: int,
    hop_length: int,
    win_length: int,
) -> tuple[np.ndarray, np.ndarray]:
    tensor = torch.from_numpy(waveform).float()
    window = torch.hann_window(win_length, dtype=tensor.dtype)
    stft = torch.stft(
        tensor,
        n_fft=n_fft,
        hop_length=hop_length,
        win_length=win_length,
        window=window,
        return_complex=True,
        center=True,
    )
    magnitude = stft.abs().mean(dim=-1).cpu().numpy()
    freqs = np.fft.rfftfreq(n_fft, d=1.0 / sample_rate).astype(np.float32)
    return freqs, magnitude.astype(np.float32)


def to_db(values: np.ndarray, floor: float = 1.0e-12) -> np.ndarray:
    return 20.0 * np.log10(np.maximum(values, floor))


def band_mean(freqs: np.ndarray, values: np.ndarray, low_hz: float, high_hz: float) -> float:
    if high_hz <= low_hz:
        return float("nan")
    mask = (freqs >= low_hz) & (freqs < high_hz)
    if not np.any(mask):
        return float("nan")
    return float(np.mean(values[mask]))


def main() -> None:
    parser = argparse.ArgumentParser(description="Plot frequency-wise attenuation against test2.wav.")
    parser.add_argument("--input", default=str(DEFAULT_INPUT), help="Input noisy wav path.")
    parser.add_argument("--enhanced", default=str(DEFAULT_ENHANCED), help="Reference enhanced wav path.")
    parser.add_argument("--qat", default=str(DEFAULT_QAT), help="QAT rerun wav path.")
    parser.add_argument("--config", default=str(DEFAULT_CONFIG), help="Config used to get STFT parameters.")
    parser.add_argument("--output", default=str(DEFAULT_OUTPUT), help="Output PNG path.")
    args = parser.parse_args()

    config = load_toml_config(Path(args.config).expanduser().resolve())
    acoustics = config["acoustics"]
    sample_rate = int(acoustics["sr"])
    n_fft = int(acoustics["n_fft"])
    hop_length = int(acoustics["hop_length"])
    win_length = int(acoustics["win_length"])

    input_wave, _ = load_waveform(Path(args.input).expanduser().resolve(), sample_rate)
    enhanced_wave, _ = load_waveform(Path(args.enhanced).expanduser().resolve(), sample_rate)
    qat_wave, _ = load_waveform(Path(args.qat).expanduser().resolve(), sample_rate)

    min_len = min(len(input_wave), len(enhanced_wave), len(qat_wave))
    input_wave = input_wave[:min_len]
    enhanced_wave = enhanced_wave[:min_len]
    qat_wave = qat_wave[:min_len]

    freqs, input_mag = magnitude_spectrum(input_wave, sample_rate, n_fft, hop_length, win_length)
    _, enhanced_mag = magnitude_spectrum(enhanced_wave, sample_rate, n_fft, hop_length, win_length)
    _, qat_mag = magnitude_spectrum(qat_wave, sample_rate, n_fft, hop_length, win_length)

    input_mag_db = to_db(input_mag)
    enhanced_mag_db = to_db(enhanced_mag)
    qat_mag_db = to_db(qat_mag)

    enhanced_atten_db = input_mag_db - enhanced_mag_db
    qat_atten_db = input_mag_db - qat_mag_db

    band_edges_hz = [0.0, 250.0, 500.0, 1000.0, 2000.0, 4000.0, 8000.0]
    band_labels = []
    enhanced_band = []
    qat_band = []
    for low_hz, high_hz in zip(band_edges_hz[:-1], band_edges_hz[1:]):
        band_labels.append(f"{int(low_hz)}-{int(high_hz)}")
        enhanced_band.append(band_mean(freqs, enhanced_atten_db, low_hz, high_hz))
        qat_band.append(band_mean(freqs, qat_atten_db, low_hz, high_hz))

    output_path = Path(args.output).expanduser().resolve()
    output_path.parent.mkdir(parents=True, exist_ok=True)

    plt.style.use("seaborn-v0_8-whitegrid")
    fig, axes = plt.subplots(2, 1, figsize=(12, 9), constrained_layout=True)

    axes[0].plot(freqs, input_mag_db, label="test2.wav", color="#222222", linewidth=1.5)
    axes[0].plot(freqs, enhanced_mag_db, label="enhanced_test2.wav", color="#0a9396", linewidth=1.5)
    axes[0].plot(freqs, qat_mag_db, label="test2_qat_rerun.wav", color="#bb3e03", linewidth=1.5)
    axes[0].set_title("Average Magnitude Spectrum")
    axes[0].set_xlabel("Frequency (Hz)")
    axes[0].set_ylabel("Magnitude (dB)")
    axes[0].set_xlim(0.0, sample_rate / 2.0)
    axes[0].legend()

    axes[1].plot(freqs, enhanced_atten_db, label="Input - enhanced_test2.wav", color="#0a9396", linewidth=1.5)
    axes[1].plot(freqs, qat_atten_db, label="Input - test2_qat_rerun.wav", color="#bb3e03", linewidth=1.5)

    band_centers = []
    for low_hz, high_hz, enh_value, qat_value in zip(band_edges_hz[:-1], band_edges_hz[1:], enhanced_band, qat_band):
        center = 0.5 * (low_hz + high_hz)
        band_centers.append(center)
        axes[1].scatter(center, enh_value, color="#0a9396", s=40, zorder=3)
        axes[1].scatter(center, qat_value, color="#bb3e03", s=40, zorder=3)

    axes[1].set_title("Frequency-wise Attenuation Relative to test2.wav")
    axes[1].set_xlabel("Frequency (Hz)")
    axes[1].set_ylabel("Attenuation (dB)")
    axes[1].set_xlim(0.0, sample_rate / 2.0)
    axes[1].axhline(0.0, color="#666666", linewidth=1.0, linestyle="--")
    axes[1].legend()

    fig.suptitle("test2.wav Frequency Comparison", fontsize=14)
    fig.savefig(output_path, dpi=180)
    plt.close(fig)

    print(f"plot={output_path}")
    print("band_mean_attenuation_db")
    for label, enh_value, qat_value in zip(band_labels, enhanced_band, qat_band):
        print(f"{label} enhanced={enh_value:.4f} qat={qat_value:.4f}")


if __name__ == "__main__":
    main()
