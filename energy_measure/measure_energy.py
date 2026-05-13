from __future__ import annotations

import argparse
import ctypes
import importlib
import json
import math
import statistics
import sys
import time
import types
import wave
from datetime import datetime
from pathlib import Path
from typing import Any

import numpy as np
import torch


FULLSUBNET_ROOT = Path(__file__).resolve().parents[1]
DEFAULT_CHECKPOINT = Path("fullsubnet_best_model_58epochs.tar")
DEFAULT_CONFIG = Path("recipes/dns_interspeech_2020/fullsubnet/inference.toml")
DEFAULT_INPUT = Path("../JH_test/test2.wav")
DEFAULT_RESULT_DIR = Path("energy_measure/result")
DEFAULT_SNN_ROOT = Path("../Spiking_FullSubnet_essential")
DEFAULT_SNN_CHECKPOINT = Path(
    "../Spiking_FullSubnet_essential/model_zoo/intel_ndns/spike_fsb/baseline_m/checkpoints/best/pytorch_model.bin"
)
DEFAULT_SNN_CONFIG = Path("../Spiking_FullSubnet_essential/recipes/intel_ndns/spiking_fullsubnet/baseline_m.toml")
DEFAULT_SNN_RESULT_DIR = Path("energy_measure/result_snn_infer_default")
DEFAULT_SNN_INFER_PY_RESULT_DIR = Path("energy_measure/result_snn_infer_py")
DEFAULT_QAT_ROOT = Path("../Spiking_FullSubnet_C++")
DEFAULT_QAT_CHECKPOINT = Path("../Spiking_FullSubnet_C++/best_model_qat.pt")
DEFAULT_QAT_CONFIG = Path("energy_measure/configs/baseline_m_qat.toml")
DEFAULT_QAT_PYTORCH_RESULT_DIR = Path("energy_measure/result_snn_qat_pytorch")
DEFAULT_QAT_Q610_RESULT_DIR = Path("energy_measure/result_snn_qat_q610")
DEFAULT_QAT_CPP_SUBBAND_LIB = Path("energy_measure/native/libsubband_q610_qat.so")
DEFAULT_Q610_ROOT = Path("../Spiking_FullSubnet_C++")
DEFAULT_Q610_CHECKPOINT = Path(
    "../Spiking_FullSubnet_C++/model_zoo/intel_ndns/spike_fsb/baseline_m/checkpoints/best/pytorch_model.bin"
)
DEFAULT_Q610_CONFIG = Path("../Spiking_FullSubnet_C++/recipes/intel_ndns/spiking_fullsubnet/baseline_m.toml")
DEFAULT_Q610_RESULT_DIR = Path("energy_measure/result_snn_q610_full")
DEFAULT_Q610_CPP_SUBBAND_LIB = Path("energy_measure/native/libsubband_q610_full.so")
DEFAULT_Q610_FAST_RESULT_DIR = Path("energy_measure/result_snn_q610_fast")
DEFAULT_Q610_FAST_CPP_SUBBAND_LIB = Path("energy_measure/native/libsubband_q610_fast.so")
DEFAULT_Q610_FULL_INFER_RESULT_DIR = Path("energy_measure/result_snn_q610_full_infer")
DEFAULT_Q610_FULL_INFER_CPP_LIB = Path("energy_measure/native/libq610_full_infer.so")
Q610_FRAC_BITS = 10
Q610_SCALE = 1 << Q610_FRAC_BITS


def resolve_path(path: str | Path, base: Path = FULLSUBNET_ROOT) -> Path:
    candidate = Path(path).expanduser()
    if candidate.is_absolute():
        return candidate.resolve()

    cwd_candidate = (Path.cwd() / candidate).resolve()
    if cwd_candidate.exists():
        return cwd_candidate
    return (base / candidate).resolve()


def add_import_paths(config_path: Path) -> None:
    recipe_root = FULLSUBNET_ROOT / "recipes" / "dns_interspeech_2020"
    for path in (config_path.parent, recipe_root, FULLSUBNET_ROOT):
        path_text = str(path)
        if path_text not in sys.path:
            sys.path.insert(0, path_text)


def add_snn_import_paths(snn_root: Path) -> None:
    path_text = str(snn_root)
    if path_text not in sys.path:
        sys.path.insert(0, path_text)


def install_lightweight_feature_module() -> None:
    """Avoid importing FullSubNet's librosa-heavy feature module for measurement."""

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


def load_toml(path: Path) -> dict[str, Any]:
    try:
        import tomllib

        with path.open("rb") as handle:
            return tomllib.load(handle)
    except ModuleNotFoundError:
        try:
            import toml
        except ModuleNotFoundError as exc:
            raise ModuleNotFoundError(
                "Python < 3.11 requires the 'toml' package. Install requirements.txt first."
            ) from exc
        return toml.load(path.as_posix())


def initialize_module(path: str, args: dict[str, Any] | None = None):
    module_path = ".".join(path.split(".")[:-1])
    class_or_function_name = path.split(".")[-1]
    module = importlib.import_module(module_path)
    class_or_function = getattr(module, class_or_function_name)
    return class_or_function(**args) if args else class_or_function()


def load_infer_py_module(snn_root: Path):
    add_snn_import_paths(snn_root)
    infer_path = snn_root / "infer.py"
    spec = importlib.util.spec_from_file_location("spiking_fullsubnet_infer_py", infer_path)
    if spec is None or spec.loader is None:
        raise ImportError(f"Cannot import infer.py from {infer_path}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


def load_checkpoint(checkpoint_path: Path) -> Any:
    try:
        return torch.load(checkpoint_path, map_location="cpu", weights_only=False)
    except TypeError:
        return torch.load(checkpoint_path, map_location="cpu")


def scalar_metadata(value: Any, cast_type: type[int] | type[float]) -> int | float | None:
    if value is None:
        return None
    if torch.is_tensor(value):
        value = value.detach().cpu().item()
    try:
        return cast_type(value)
    except (TypeError, ValueError):
        return None


def checkpoint_metadata(checkpoint: Any) -> dict[str, int | float | None]:
    if not isinstance(checkpoint, dict):
        return {"epoch": None, "best_val_si_sdr": None, "avg_loss": None}
    return {
        "epoch": scalar_metadata(checkpoint.get("epoch"), int),
        "best_val_si_sdr": scalar_metadata(checkpoint.get("best_val_si_sdr"), float),
        "avg_loss": scalar_metadata(checkpoint.get("avg_loss"), float),
    }


def is_plain_state_dict(value: Any) -> bool:
    return isinstance(value, dict) and bool(value) and all(torch.is_tensor(item) for item in value.values())


def extract_state_dict(checkpoint: Any, *, model_key_priority: tuple[str, ...]) -> dict[str, torch.Tensor]:
    if isinstance(checkpoint, dict):
        for key in model_key_priority:
            candidate = checkpoint.get(key)
            if is_plain_state_dict(candidate):
                return candidate
        if is_plain_state_dict(checkpoint):
            return checkpoint
    raise TypeError(f"Unsupported checkpoint contents: {type(checkpoint)}")


def load_ann_model(config: dict[str, Any], checkpoint_path: Path) -> tuple[torch.nn.Module, dict[str, Any]]:
    install_lightweight_feature_module()
    model = initialize_module(config["model"]["path"], args=config["model"]["args"])
    checkpoint = load_checkpoint(checkpoint_path)
    metadata = checkpoint_metadata(checkpoint)
    state_dict = extract_state_dict(checkpoint, model_key_priority=("model", "model_state_dict", "state_dict", "module"))
    state_dict = {key.replace("module.", ""): value for key, value in state_dict.items()}
    model.load_state_dict(state_dict, strict=True)
    model.eval()
    return model, metadata


def load_snn_model(config: dict[str, Any], checkpoint_path: Path, snn_root: Path) -> tuple[torch.nn.Module, dict[str, Any]]:
    add_snn_import_paths(snn_root)
    model = initialize_module(config["model"]["path"], args=config["model"]["args"])
    checkpoint = load_checkpoint(checkpoint_path)
    metadata = checkpoint_metadata(checkpoint)
    state_dict = extract_state_dict(checkpoint, model_key_priority=("model_state_dict", "module", "state_dict", "model"))
    state_dict = {key.replace("module.", ""): value for key, value in state_dict.items()}
    model.load_state_dict(state_dict, strict=True)
    model.eval()
    return model, metadata


def load_snn_infer_py_model(
    config: dict[str, Any],
    checkpoint_path: Path,
    snn_root: Path,
) -> tuple[torch.nn.Module, dict[str, Any], Any]:
    infer_module = load_infer_py_module(snn_root)
    model = infer_module.SpikingFullSubNet(**config["model"]["args"])
    checkpoint = load_checkpoint(checkpoint_path)
    metadata = checkpoint_metadata(checkpoint)
    state_dict = infer_module.load_checkpoint(checkpoint_path)
    state_dict = {key.replace("module.", ""): value for key, value in state_dict.items()}
    model.load_state_dict(state_dict, strict=True)
    model.eval()
    return model, metadata, infer_module


def pcm_bytes_to_float32(raw: bytes, sample_width: int, channels: int) -> np.ndarray:
    if sample_width == 1:
        data = np.frombuffer(raw, dtype=np.uint8).astype(np.float32)
        data = (data - 128.0) / 128.0
    elif sample_width == 2:
        data = np.frombuffer(raw, dtype="<i2").astype(np.float32) / 32768.0
    elif sample_width == 3:
        bytes_in = np.frombuffer(raw, dtype=np.uint8).reshape(-1, 3)
        sign = (bytes_in[:, 2] & 0x80) != 0
        padded = np.zeros((bytes_in.shape[0], 4), dtype=np.uint8)
        padded[:, :3] = bytes_in
        padded[sign, 3] = 0xFF
        data = padded.view("<i4").reshape(-1).astype(np.float32) / 8388608.0
    elif sample_width == 4:
        data = np.frombuffer(raw, dtype="<i4").astype(np.float32) / 2147483648.0
    else:
        raise ValueError(f"Unsupported PCM sample width: {sample_width} bytes")

    return data.reshape(-1, channels)


def load_audio(path: Path, sample_rate: int, max_seconds: float | None = None) -> torch.Tensor:
    with wave.open(path.as_posix(), "rb") as handle:
        channels = handle.getnchannels()
        source_sr = handle.getframerate()
        sample_width = handle.getsampwidth()
        frames = handle.readframes(handle.getnframes())

    waveform = pcm_bytes_to_float32(frames, sample_width=sample_width, channels=channels)
    if waveform.ndim > 1:
        waveform = waveform.mean(axis=1, dtype=np.float32)

    if source_sr != sample_rate:
        if source_sr % sample_rate != 0:
            raise ValueError(f"Only integer downsampling is supported. Got {source_sr=} and {sample_rate=}.")
        factor = source_sr // sample_rate
        usable = (waveform.shape[0] // factor) * factor
        waveform = waveform[:usable].reshape(-1, factor).mean(axis=1, dtype=np.float32)

    if max_seconds is not None:
        waveform = waveform[: max(1, int(sample_rate * max_seconds))]

    return torch.from_numpy(waveform).float().unsqueeze(0)


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
def run_ann_inference(model: torch.nn.Module, noisy: torch.Tensor, config: dict[str, Any]) -> torch.Tensor:
    acoustics = config["acoustics"]
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


@torch.no_grad()
def run_snn_inference(model: torch.nn.Module, noisy: torch.Tensor, config: dict[str, Any]) -> torch.Tensor:
    output = model(noisy)
    if isinstance(output, (tuple, list)):
        return output[0]
    return output


def float_to_q610(values: np.ndarray) -> np.ndarray:
    values = np.asarray(values, dtype=np.float32)
    scaled = values * np.float32(Q610_SCALE)
    adjusted = np.where(
        scaled >= np.float32(0.0),
        scaled + np.float32(0.5),
        scaled - np.float32(0.5),
    )
    clipped = np.clip(adjusted.astype(np.int64), -32768, 32767).astype(np.int16)
    return np.ascontiguousarray(clipped)


def q610_to_float(values: np.ndarray) -> np.ndarray:
    return np.asarray(values, dtype=np.int16).astype(np.float32) / np.float32(Q610_SCALE)


def q610_ones(size: int) -> np.ndarray:
    return np.full(size, Q610_SCALE, dtype=np.int16)


def q610_zeros(size: int) -> np.ndarray:
    return np.zeros(size, dtype=np.int16)


class Q610SubbandRunner:
    def __init__(self, lib_path: Path, model: torch.nn.Module):
        self.lib_path = lib_path
        self.int16_ptr = ctypes.POINTER(ctypes.c_int16)
        self.library = ctypes.CDLL(lib_path.as_posix())
        self.run_sequence = self.library.run_qat_subband_sequence_q610
        self.run_sequence.argtypes = [ctypes.c_int] * 8 + [self.int16_ptr] * 18
        self.run_sequence.restype = ctypes.c_int
        self.band_weights = [self.collect_stage_weights(stage) for stage in model.sb_model.sb_models]
        self.last_df_coef_shapes: list[tuple[int, ...]] = []
        self.last_stage_timings: dict[str, float] = {}

    def ptr(self, values: np.ndarray):
        if values.dtype != np.int16 or not values.flags.c_contiguous:
            raise ValueError("Q6.10 C++ bridge expects contiguous int16 NumPy buffers.")
        return values.ctypes.data_as(self.int16_ptr)

    def tensor_to_q610(self, tensor: torch.Tensor) -> np.ndarray:
        return float_to_q610(tensor.detach().cpu().numpy()).reshape(-1)

    def collect_layer_weights(self, gsu_layer) -> dict[str, np.ndarray]:
        cell = gsu_layer.cell
        if not hasattr(cell, "batchnorm"):
            raise ValueError("Q6.10 subband runner requires batchnorm-enabled GSU cells.")
        return {
            "weight_ih": self.tensor_to_q610(cell.weight_ih),
            "weight_hh": self.tensor_to_q610(cell.weight_hh),
            "bias_ih": self.tensor_to_q610(cell.bias_ih),
            "bn_running_mean": self.tensor_to_q610(cell.batchnorm.running_mean),
            "bn_running_var": self.tensor_to_q610(cell.batchnorm.running_var),
            "bn_weight": self.tensor_to_q610(cell.batchnorm.weight),
            "bn_bias": self.tensor_to_q610(cell.batchnorm.bias),
        }

    def collect_stage_weights(self, stage) -> dict[str, Any]:
        return {
            "layers": [self.collect_layer_weights(layer) for layer in stage.sequence_model.layers],
            "proj_weight": self.tensor_to_q610(stage.proj.weight),
            "proj_bias": self.tensor_to_q610(stage.proj.bias),
        }

    @staticmethod
    def band_spec(sb_model, band_index: int, num_spks: int) -> dict[str, int]:
        lower = int(sb_model.freq_cutoffs[band_index])
        upper = int(sb_model.freq_cutoffs[band_index + 1])
        ctr = int(sb_model.center_freq_sizes[band_index])
        nbr = int(sb_model.neighbor_freq_sizes[band_index])
        df_order = int(sb_model.df_orders[band_index])
        if (upper - lower) % ctr != 0:
            raise ValueError(f"Invalid band spec: {lower=}, {upper=}, {ctr=}")
        return {
            "lower": lower,
            "upper": upper,
            "ctr_freq": ctr,
            "nbr_freq": nbr,
            "df_order": df_order,
            "num_subbands": (upper - lower) // ctr,
            "input_size": (ctr + 2 * nbr) + ctr,
            "proj_size": 2 * ctr * df_order * num_spks,
        }

    def run(self, model: torch.nn.Module, noisy_mag: torch.Tensor, fb_output: torch.Tensor) -> list[torch.Tensor]:
        if int(model.num_spks) != 1:
            raise ValueError("Q6.10 C++ subband runner currently supports num_spks=1 only.")

        batch_size = int(noisy_mag.shape[0])
        num_frames = int(noisy_mag.shape[-1])
        outputs: list[torch.Tensor] = []
        self.last_df_coef_shapes = []

        for band_index, stage in enumerate(model.sb_model.sb_models):
            spec = self.band_spec(model.sb_model, band_index, int(model.num_spks))
            noisy_subbands = model.sb_model._freq_unfold(
                input=noisy_mag,
                lower_cutoff_freq=spec["lower"],
                upper_cutoff_freq=spec["upper"],
                ctr_freq=spec["ctr_freq"],
                nbr_freq=spec["nbr_freq"],
            )
            fb_subbands = model.sb_model._freq_unfold(
                input=fb_output,
                lower_cutoff_freq=spec["lower"],
                upper_cutoff_freq=spec["upper"],
                ctr_freq=spec["ctr_freq"],
                nbr_freq=0,
            )
            sb_input = torch.cat([noisy_subbands, fb_subbands], dim=-2)
            packed_input = sb_input.reshape(
                batch_size * spec["num_subbands"],
                spec["input_size"],
                num_frames,
            )
            sequence_input = packed_input.permute(2, 0, 1).contiguous()
            if getattr(stage, "use_pre_layer_norm", False):
                sequence_input = stage.pre_layer_norm(sequence_input)

            sequence_input_q610 = float_to_q610(sequence_input.detach().cpu().numpy()).reshape(-1)
            df_coef_shape = (
                batch_size,
                spec["df_order"],
                int(model.num_spks),
                spec["num_subbands"] * spec["ctr_freq"],
                num_frames,
                2,
            )
            df_coef_q610 = np.empty(df_coef_shape, dtype=np.int16)
            weights = self.band_weights[band_index]
            layer0, layer1 = weights["layers"]

            return_code = self.run_sequence(
                band_index,
                batch_size,
                num_frames,
                spec["num_subbands"],
                spec["ctr_freq"],
                spec["df_order"],
                spec["input_size"],
                spec["proj_size"],
                self.ptr(sequence_input_q610),
                self.ptr(layer0["weight_ih"]),
                self.ptr(layer0["weight_hh"]),
                self.ptr(layer0["bias_ih"]),
                self.ptr(layer0["bn_running_mean"]),
                self.ptr(layer0["bn_running_var"]),
                self.ptr(layer0["bn_weight"]),
                self.ptr(layer0["bn_bias"]),
                self.ptr(layer1["weight_ih"]),
                self.ptr(layer1["weight_hh"]),
                self.ptr(layer1["bias_ih"]),
                self.ptr(layer1["bn_running_mean"]),
                self.ptr(layer1["bn_running_var"]),
                self.ptr(layer1["bn_weight"]),
                self.ptr(layer1["bn_bias"]),
                self.ptr(weights["proj_weight"]),
                self.ptr(weights["proj_bias"]),
                self.ptr(df_coef_q610),
            )
            if return_code != 0:
                raise RuntimeError(f"run_qat_subband_sequence_q610 failed for band {band_index}: rc={return_code}")

            self.last_df_coef_shapes.append(tuple(int(dim) for dim in df_coef_q610.shape))
            outputs.append(
                torch.from_numpy(q610_to_float(df_coef_q610)).to(device=noisy_mag.device, dtype=noisy_mag.dtype)
            )

        return outputs


class Q610FullSubbandRunner(Q610SubbandRunner):
    def __init__(self, lib_path: Path, model: torch.nn.Module):
        self.lib_path = lib_path
        self.int16_ptr = ctypes.POINTER(ctypes.c_int16)
        self.library = ctypes.CDLL(lib_path.as_posix())
        self.run_full_band = self.library.run_full_band_q610
        self.run_full_band.argtypes = [ctypes.c_int] * 3 + [self.int16_ptr] * 19
        self.run_full_band.restype = ctypes.c_int
        self.band_weights = [self.collect_stage_weights(stage) for stage in model.sb_model.sb_models]
        self.last_df_coef_shapes: list[tuple[int, ...]] = []
        self.last_stage_timings: dict[str, float] = {}

    def run(self, model: torch.nn.Module, noisy_mag: torch.Tensor, fb_output: torch.Tensor) -> list[torch.Tensor]:
        if int(model.num_spks) != 1:
            raise ValueError("Q6.10 C++ subband runner currently supports num_spks=1 only.")

        batch_size = int(noisy_mag.shape[0])
        num_frames = int(noisy_mag.shape[-1])
        conversion_start = time.perf_counter()
        noisy_input_q610 = float_to_q610(noisy_mag.detach().cpu().numpy()).reshape(-1)
        fb_output_q610 = float_to_q610(fb_output.detach().cpu().numpy()).reshape(-1)
        conversion_time = time.perf_counter() - conversion_start
        outputs: list[torch.Tensor] = []
        self.last_df_coef_shapes = []
        cpp_time = 0.0
        df_coef_to_torch_time = 0.0

        for band_index, _stage in enumerate(model.sb_model.sb_models):
            spec = self.band_spec(model.sb_model, band_index, int(model.num_spks))
            df_coef_shape = (
                batch_size,
                spec["df_order"],
                int(model.num_spks),
                spec["num_subbands"] * spec["ctr_freq"],
                num_frames,
                2,
            )
            df_coef_q610 = np.empty(df_coef_shape, dtype=np.int16)
            weights = self.band_weights[band_index]
            layer0, layer1 = weights["layers"]

            cpp_start = time.perf_counter()
            return_code = self.run_full_band(
                band_index,
                batch_size,
                num_frames,
                self.ptr(noisy_input_q610),
                self.ptr(fb_output_q610),
                self.ptr(layer0["weight_ih"]),
                self.ptr(layer0["weight_hh"]),
                self.ptr(layer0["bias_ih"]),
                self.ptr(layer0["bn_running_mean"]),
                self.ptr(layer0["bn_running_var"]),
                self.ptr(layer0["bn_weight"]),
                self.ptr(layer0["bn_bias"]),
                self.ptr(layer1["weight_ih"]),
                self.ptr(layer1["weight_hh"]),
                self.ptr(layer1["bias_ih"]),
                self.ptr(layer1["bn_running_mean"]),
                self.ptr(layer1["bn_running_var"]),
                self.ptr(layer1["bn_weight"]),
                self.ptr(layer1["bn_bias"]),
                self.ptr(weights["proj_weight"]),
                self.ptr(weights["proj_bias"]),
                self.ptr(df_coef_q610),
            )
            cpp_time += time.perf_counter() - cpp_start
            if return_code != 0:
                raise RuntimeError(f"run_full_band_q610 failed for band {band_index}: rc={return_code}")

            self.last_df_coef_shapes.append(tuple(int(dim) for dim in df_coef_q610.shape))
            torch_start = time.perf_counter()
            outputs.append(
                torch.from_numpy(q610_to_float(df_coef_q610)).to(device=noisy_mag.device, dtype=noisy_mag.dtype)
            )
            df_coef_to_torch_time += time.perf_counter() - torch_start

        self.last_stage_timings = {
            "q610_conversion": conversion_time,
            "cpp_subband": cpp_time,
            "df_coef_to_torch": df_coef_to_torch_time,
        }
        return outputs


class Q610FastFullSubbandRunner(Q610SubbandRunner):
    def __init__(self, lib_path: Path, model: torch.nn.Module):
        self.lib_path = lib_path
        self.int16_ptr = ctypes.POINTER(ctypes.c_int16)
        self.library = ctypes.CDLL(lib_path.as_posix())
        self.create_context = self.library.create_q610_context
        self.create_context.argtypes = [ctypes.c_int, ctypes.c_int]
        self.create_context.restype = ctypes.c_void_p
        self.destroy_context = self.library.destroy_q610_context
        self.destroy_context.argtypes = [ctypes.c_void_p]
        self.destroy_context.restype = None
        self.run_fast = self.library.run_q610_fast
        self.run_fast.argtypes = [ctypes.c_void_p] + [ctypes.c_int] * 3 + [self.int16_ptr] * 19
        self.run_fast.restype = ctypes.c_int
        self.band_weights = [self.collect_stage_weights(stage) for stage in model.sb_model.sb_models]
        self.last_df_coef_shapes: list[tuple[int, ...]] = []
        self.last_stage_timings: dict[str, float] = {}
        self.context: int | None = None
        self.context_shape: tuple[int, int] | None = None
        self.output_buffers: dict[tuple[int, tuple[int, ...]], np.ndarray] = {}

    def close(self) -> None:
        if self.context is not None:
            self.destroy_context(self.context)
            self.context = None
            self.context_shape = None

    def __del__(self):
        try:
            self.close()
        except Exception:
            pass

    def ensure_context(self, batch_size: int, num_frames: int) -> int:
        shape = (batch_size, num_frames)
        if self.context is not None and self.context_shape == shape:
            return self.context
        self.close()
        context = self.create_context(batch_size, num_frames)
        if context is None:
            raise RuntimeError(f"create_q610_context failed for batch_size={batch_size}, num_frames={num_frames}")
        self.context = int(context)
        self.context_shape = shape
        return self.context

    def get_output_buffer(self, band_index: int, shape: tuple[int, ...]) -> np.ndarray:
        key = (band_index, shape)
        buffer = self.output_buffers.get(key)
        if buffer is None:
            buffer = np.empty(shape, dtype=np.int16)
            self.output_buffers[key] = buffer
        return buffer

    def run_band_core(
        self,
        band_index: int,
        batch_size: int,
        num_frames: int,
        noisy_input_q610: np.ndarray,
        fb_output_q610: np.ndarray,
        df_coef_q610: np.ndarray,
    ) -> None:
        context = self.ensure_context(batch_size, num_frames)
        weights = self.band_weights[band_index]
        layer0, layer1 = weights["layers"]
        return_code = self.run_fast(
            context,
            band_index,
            batch_size,
            num_frames,
            self.ptr(noisy_input_q610),
            self.ptr(fb_output_q610),
            self.ptr(layer0["weight_ih"]),
            self.ptr(layer0["weight_hh"]),
            self.ptr(layer0["bias_ih"]),
            self.ptr(layer0["bn_running_mean"]),
            self.ptr(layer0["bn_running_var"]),
            self.ptr(layer0["bn_weight"]),
            self.ptr(layer0["bn_bias"]),
            self.ptr(layer1["weight_ih"]),
            self.ptr(layer1["weight_hh"]),
            self.ptr(layer1["bias_ih"]),
            self.ptr(layer1["bn_running_mean"]),
            self.ptr(layer1["bn_running_var"]),
            self.ptr(layer1["bn_weight"]),
            self.ptr(layer1["bn_bias"]),
            self.ptr(weights["proj_weight"]),
            self.ptr(weights["proj_bias"]),
            self.ptr(df_coef_q610),
        )
        if return_code != 0:
            raise RuntimeError(f"run_q610_fast failed for band {band_index}: rc={return_code}")

    def run(self, model: torch.nn.Module, noisy_mag: torch.Tensor, fb_output: torch.Tensor) -> list[torch.Tensor]:
        if int(model.num_spks) != 1:
            raise ValueError("Q6.10 C++ subband runner currently supports num_spks=1 only.")

        batch_size = int(noisy_mag.shape[0])
        num_frames = int(noisy_mag.shape[-1])
        conversion_start = time.perf_counter()
        noisy_input_q610 = float_to_q610(noisy_mag.detach().cpu().numpy()).reshape(-1)
        fb_output_q610 = float_to_q610(fb_output.detach().cpu().numpy()).reshape(-1)
        conversion_time = time.perf_counter() - conversion_start
        outputs: list[torch.Tensor] = []
        self.last_df_coef_shapes = []
        cpp_time = 0.0
        df_coef_to_torch_time = 0.0

        for band_index, _stage in enumerate(model.sb_model.sb_models):
            spec = self.band_spec(model.sb_model, band_index, int(model.num_spks))
            df_coef_shape = (
                batch_size,
                spec["df_order"],
                int(model.num_spks),
                spec["num_subbands"] * spec["ctr_freq"],
                num_frames,
                2,
            )
            df_coef_q610 = self.get_output_buffer(band_index, df_coef_shape)
            cpp_start = time.perf_counter()
            self.run_band_core(band_index, batch_size, num_frames, noisy_input_q610, fb_output_q610, df_coef_q610)
            cpp_time += time.perf_counter() - cpp_start
            self.last_df_coef_shapes.append(tuple(int(dim) for dim in df_coef_q610.shape))
            torch_start = time.perf_counter()
            outputs.append(
                torch.from_numpy(q610_to_float(df_coef_q610)).to(device=noisy_mag.device, dtype=noisy_mag.dtype)
            )
            df_coef_to_torch_time += time.perf_counter() - torch_start

        self.last_stage_timings = {
            "q610_conversion": conversion_time,
            "cpp_subband": cpp_time,
            "df_coef_to_torch": df_coef_to_torch_time,
        }
        return outputs


class Q610FullInferenceRunner(Q610SubbandRunner):
    def __init__(self, lib_path: Path, model: torch.nn.Module):
        self.lib_path = lib_path
        self.int16_ptr = ctypes.POINTER(ctypes.c_int16)
        self.int16_ptr_ptr = ctypes.POINTER(self.int16_ptr)
        self.int_ptr = ctypes.POINTER(ctypes.c_int)
        self.float_ptr = ctypes.POINTER(ctypes.c_float)
        self.library = ctypes.CDLL(lib_path.as_posix())
        self.create_context = self.library.create_q610_infer_context
        self.create_context.argtypes = [self.int_ptr, ctypes.c_int, ctypes.c_int, self.int16_ptr_ptr]
        self.create_context.restype = ctypes.c_void_p
        self.destroy_context = self.library.destroy_q610_infer_context
        self.destroy_context.argtypes = [ctypes.c_void_p]
        self.destroy_context.restype = None
        self.run_infer = self.library.run_q610_infer
        self.run_infer.argtypes = [ctypes.c_void_p, self.float_ptr, ctypes.c_int, self.float_ptr]
        self.run_infer.restype = ctypes.c_int
        self.last_df_coef_shapes: list[tuple[int, ...]] = []
        self.last_stage_timings: dict[str, float] = {}
        self.context: int | None = None

        self.validate_supported_model(model)
        self.band_specs = self.collect_band_specs(model)
        self.weight_buffers = self.collect_infer_weights(model)
        pointer_array_type = self.int16_ptr * len(self.weight_buffers)
        self.weight_ptrs = pointer_array_type(*(self.ptr(buffer) for buffer in self.weight_buffers))
        use_pre_layer_norm_fb = int(bool(getattr(model.fb_model, "use_pre_layer_norm", False)))
        sb_layer_norm_flags = [
            bool(getattr(stage, "use_pre_layer_norm", False)) for stage in model.sb_model.sb_models
        ]
        if len(set(sb_layer_norm_flags)) != 1:
            raise ValueError("Q6.10 full inference runner requires all subband stages to share layer-norm usage.")
        use_pre_layer_norm_sb = int(sb_layer_norm_flags[0])
        context = self.create_context(
            self.band_specs.ctypes.data_as(self.int_ptr),
            use_pre_layer_norm_fb,
            use_pre_layer_norm_sb,
            self.weight_ptrs,
        )
        if context is None:
            raise RuntimeError("create_q610_infer_context failed.")
        self.context = int(context)

    def close(self) -> None:
        if self.context is not None:
            self.destroy_context(self.context)
            self.context = None

    def __del__(self):
        try:
            self.close()
        except Exception:
            pass

    def ptr(self, values: np.ndarray):
        if values.dtype != np.int16 or not values.flags.c_contiguous:
            raise ValueError("Q6.10 C++ bridge expects contiguous int16 NumPy buffers.")
        return values.ctypes.data_as(self.int16_ptr)

    def float_ptr_from_array(self, values: np.ndarray):
        if values.dtype != np.float32 or not values.flags.c_contiguous:
            raise ValueError("Q6.10 full inference runner expects contiguous float32 NumPy buffers.")
        return values.ctypes.data_as(self.float_ptr)

    def validate_supported_model(self, model: torch.nn.Module) -> None:
        if int(model.num_spks) != 1:
            raise ValueError("Q6.10 full inference runner currently supports num_spks=1 only.")
        if int(model.n_fft) != 512 or int(model.hop_length) != 128 or int(model.win_length) != 512:
            raise ValueError("Q6.10 full inference runner currently supports n_fft=512, hop=128, win=512 only.")
        if int(model.fb_model.input_size) != 64:
            raise ValueError("Q6.10 full inference runner currently supports fb_input_size=64 only.")
        if int(model.fb_model.hidden_size) != 320 or int(model.fb_model.num_layers) != 2:
            raise ValueError("Q6.10 full inference runner currently supports fullband hidden=320, layers=2 only.")
        if len(model.sb_model.sb_models) != 3:
            raise ValueError("Q6.10 full inference runner currently supports exactly three subband stages.")
        for layer in model.fb_model.sequence_model.layers:
            cell = layer.cell
            if not bool(getattr(cell, "shared_weights", False)) or not hasattr(cell, "batchnorm"):
                raise ValueError("Q6.10 full inference runner requires shared-weight, batchnorm-enabled GSU cells.")
        for stage in model.sb_model.sb_models:
            if int(stage.hidden_size) != 224 or int(stage.num_layers) != 2:
                raise ValueError("Q6.10 full inference runner currently supports subband hidden=224, layers=2 only.")
            for layer in stage.sequence_model.layers:
                cell = layer.cell
                if not bool(getattr(cell, "shared_weights", False)) or not hasattr(cell, "batchnorm"):
                    raise ValueError("Q6.10 full inference runner requires shared-weight, batchnorm-enabled GSU cells.")

    def collect_band_specs(self, model: torch.nn.Module) -> np.ndarray:
        specs: list[int] = []
        for band_index in range(len(model.sb_model.sb_models)):
            spec = self.band_spec(model.sb_model, band_index, int(model.num_spks))
            specs.extend(
                [
                    spec["lower"],
                    spec["upper"],
                    spec["ctr_freq"],
                    spec["nbr_freq"],
                    spec["df_order"],
                ]
            )
        return np.ascontiguousarray(np.asarray(specs, dtype=np.int32))

    def collect_layer_norm(self, module: torch.nn.Module, feature_size: int) -> tuple[np.ndarray, np.ndarray]:
        if getattr(module, "use_pre_layer_norm", False):
            return self.tensor_to_q610(module.pre_layer_norm.weight), self.tensor_to_q610(module.pre_layer_norm.bias)
        return q610_ones(feature_size), q610_zeros(feature_size)

    def add_layer_weights(self, buffers: list[np.ndarray], gsu_layer) -> None:
        weights = self.collect_layer_weights(gsu_layer)
        buffers.extend(
            [
                weights["weight_ih"],
                weights["weight_hh"],
                weights["bias_ih"],
                weights["bn_running_mean"],
                weights["bn_running_var"],
                weights["bn_weight"],
                weights["bn_bias"],
            ]
        )

    def collect_infer_weights(self, model: torch.nn.Module) -> list[np.ndarray]:
        buffers: list[np.ndarray] = []
        full_ln_weight, full_ln_bias = self.collect_layer_norm(model.fb_model, int(model.fb_model.input_size))
        buffers.extend([full_ln_weight, full_ln_bias])
        for layer in model.fb_model.sequence_model.layers:
            self.add_layer_weights(buffers, layer)
        buffers.extend([self.tensor_to_q610(model.fb_model.proj.weight), self.tensor_to_q610(model.fb_model.proj.bias)])

        for band_index, stage in enumerate(model.sb_model.sb_models):
            spec = self.band_spec(model.sb_model, band_index, int(model.num_spks))
            sb_ln_weight, sb_ln_bias = self.collect_layer_norm(stage, spec["input_size"])
            buffers.extend([sb_ln_weight, sb_ln_bias])
            for layer in stage.sequence_model.layers:
                self.add_layer_weights(buffers, layer)
            buffers.extend([self.tensor_to_q610(stage.proj.weight), self.tensor_to_q610(stage.proj.bias)])

        return [np.ascontiguousarray(buffer, dtype=np.int16) for buffer in buffers]

    def run(self, noisy: torch.Tensor) -> torch.Tensor:
        if self.context is None:
            raise RuntimeError("Q6.10 full inference context has been closed.")
        if noisy.ndim != 2 or int(noisy.shape[0]) != 1:
            raise ValueError("Q6.10 full inference runner expects mono input shaped [1, num_samples].")

        input_np = np.ascontiguousarray(noisy.detach().cpu().numpy().reshape(-1).astype(np.float32))
        output_np = np.empty_like(input_np)
        native_start = time.perf_counter()
        return_code = self.run_infer(
            self.context,
            self.float_ptr_from_array(input_np),
            int(input_np.shape[0]),
            self.float_ptr_from_array(output_np),
        )
        native_time = time.perf_counter() - native_start
        if return_code != 0:
            raise RuntimeError(f"run_q610_infer failed: rc={return_code}")
        self.last_stage_timings = {"native_full_infer": native_time}
        return torch.from_numpy(output_np.reshape(1, -1)).to(device=noisy.device, dtype=noisy.dtype)


@torch.no_grad()
def run_snn_qat_q610_inference(
    model: torch.nn.Module,
    noisy: torch.Tensor,
    config: dict[str, Any],
    q610_runner: Q610SubbandRunner,
) -> torch.Tensor:
    from einops import rearrange, repeat
    from audiozen.models.spiking_fullsubnet.deepfiltering import deepfiltering

    _, sequence_length = noisy.shape
    timings: dict[str, float] = {}
    stage_start = time.perf_counter()
    noisy_mag, _, noisy_real, noisy_imag = model.stft(noisy)
    noisy_cmp = torch.complex(real=noisy_real, imag=noisy_imag)
    noisy_cmp = rearrange(noisy_cmp, "b f t -> b 1 f t")

    noisy_mag = rearrange(noisy_mag, "b f t -> b 1 f t")
    noisy_mag = noisy_mag**model.fdrc
    noisy_mag = noisy_mag[..., :-1, :]
    timings["stft_fdrc"] = time.perf_counter() - stage_start

    stage_start = time.perf_counter()
    fb_output, _ = model.fb_model(noisy_mag)
    timings["fullband_pytorch"] = time.perf_counter() - stage_start

    stage_start = time.perf_counter()
    df_coef_list = q610_runner.run(model, noisy_mag, fb_output)
    timings["subband_runner_total"] = time.perf_counter() - stage_start
    timings.update(getattr(q610_runner, "last_stage_timings", {}))

    num_filtered_freqs = 0
    enh_freqs_list = []
    stage_start = time.perf_counter()
    for df_coef, df_order in zip(df_coef_list, model.df_orders):
        num_freqs = df_coef.shape[3]
        comp_stft_in = noisy_cmp[..., num_filtered_freqs : num_filtered_freqs + num_freqs, :]
        enh_freqs = deepfiltering(comp_stft_in, df_coef, int(df_order), int(model.num_spks))
        enh_freqs_list.append(enh_freqs)
        num_filtered_freqs += num_freqs
    timings["deepfiltering"] = time.perf_counter() - stage_start

    stage_start = time.perf_counter()
    enh_freqs = torch.cat(enh_freqs_list, dim=-2)
    enh_stft = repeat(noisy_cmp, "b 1 f t -> b 1 s f t", s=int(model.num_spks)).clone()
    enh_stft[..., :-1, :] = enh_freqs
    enh_stft = enh_stft.squeeze(1).squeeze(1)
    output = model.istft(enh_stft, length=sequence_length)
    timings["istft"] = time.perf_counter() - stage_start
    q610_runner.last_stage_timings = timings
    return output


def save_wav(path: Path, waveform: torch.Tensor, sample_rate: int) -> None:
    data = waveform.squeeze(0).detach().cpu().numpy().astype(np.float32)
    try:
        import soundfile as sf

        sf.write(path.as_posix(), data, sample_rate)
    except ModuleNotFoundError:
        max_abs = float(np.max(np.abs(data))) if data.size else 0.0
        if max_abs > 1.0:
            data = data / max_abs
        data = np.clip(data, -1.0, 1.0)
        pcm = (data * 32767.0).astype("<i2")
        with wave.open(path.as_posix(), "wb") as handle:
            handle.setnchannels(1)
            handle.setsampwidth(2)
            handle.setframerate(sample_rate)
            handle.writeframes(pcm.tobytes())


def read_audio_for_compare(path: Path) -> tuple[np.ndarray, np.ndarray, int, dict[str, Any]]:
    import soundfile as sf

    info = sf.info(path.as_posix())
    int_audio = sf.read(path.as_posix(), dtype="int16", always_2d=False)[0]
    float_audio = sf.read(path.as_posix(), dtype="float32", always_2d=False)[0]
    int_audio = np.asarray(int_audio)
    float_audio = np.asarray(float_audio, dtype=np.float32)
    metadata = {
        "path": str(path),
        "sample_rate": int(info.samplerate),
        "channels": int(info.channels),
        "frames": int(info.frames),
        "duration": float(info.duration),
        "subtype": info.subtype,
    }
    return int_audio, float_audio, int(info.samplerate), metadata


def compare_audio_files(output_path: Path, reference_path: Path) -> dict[str, Any]:
    output_int, output_float, output_sr, output_meta = read_audio_for_compare(output_path)
    reference_int, reference_float, reference_sr, reference_meta = read_audio_for_compare(reference_path)

    shape_equal = output_int.shape == reference_int.shape
    sample_rate_equal = output_sr == reference_sr
    compare_length = min(output_float.size, reference_float.size)
    output_flat = output_float.reshape(-1)[:compare_length]
    reference_flat = reference_float.reshape(-1)[:compare_length]
    diff = output_flat - reference_flat
    finite = bool(np.isfinite(output_flat).all() and np.isfinite(reference_flat).all())
    diff_finite = bool(np.isfinite(diff).all())
    num_diff_samples = None
    sample_exact_equal = False
    if shape_equal:
        sample_exact_equal = bool(np.array_equal(output_int, reference_int))
        num_diff_samples = int(np.count_nonzero(output_int.reshape(-1) != reference_int.reshape(-1)))

    if compare_length == 0:
        max_abs_diff = mean_abs_diff = rmse = snr_db = float("nan")
    else:
        abs_diff = np.abs(diff)
        max_abs_diff = float(np.max(abs_diff))
        mean_abs_diff = float(np.mean(abs_diff))
        rmse = float(np.sqrt(np.mean(diff.astype(np.float64) ** 2)))
        signal_power = float(np.mean(reference_flat.astype(np.float64) ** 2))
        noise_power = float(np.mean(diff.astype(np.float64) ** 2))
        snr_db = float("inf") if noise_power == 0.0 else float(10.0 * math.log10(signal_power / noise_power))

    return {
        "output": output_meta,
        "reference": reference_meta,
        "sample_rate_equal": sample_rate_equal,
        "shape_equal": shape_equal,
        "output_shape": list(output_int.shape),
        "reference_shape": list(reference_int.shape),
        "finite": finite,
        "diff_finite": diff_finite,
        "sample_exact_equal": sample_exact_equal,
        "compare_num_samples": int(compare_length),
        "num_diff_samples": num_diff_samples,
        "max_abs_diff": max_abs_diff,
        "mean_abs_diff": mean_abs_diff,
        "rmse": rmse,
        "snr_db": snr_db,
    }


def write_audio_compare(result_dir: Path, compare: dict[str, Any]) -> None:
    json_path = result_dir / "audio_compare.json"
    md_path = result_dir / "audio_compare.md"
    json_path.write_text(json.dumps(compare, indent=2), encoding="utf-8")

    lines = [
        "# Audio Compare",
        "",
        f"- Output: `{compare['output']['path']}`",
        f"- Reference: `{compare['reference']['path']}`",
        f"- Sample rate equal: {compare['sample_rate_equal']}",
        f"- Shape equal: {compare['shape_equal']}",
        f"- Sample exact equal: {compare['sample_exact_equal']}",
        f"- Finite: {compare['finite']}",
        "",
        "| Metric | Value |",
        "| --- | ---: |",
        f"| `compare_num_samples` | {compare['compare_num_samples']} |",
        f"| `num_diff_samples` | {compare['num_diff_samples']} |",
        f"| `max_abs_diff` | {compare['max_abs_diff']:.10f} |",
        f"| `mean_abs_diff` | {compare['mean_abs_diff']:.10f} |",
        f"| `rmse` | {compare['rmse']:.10f} |",
        f"| `snr_db` | {compare['snr_db']:.6f} |",
    ]
    md_path.write_text("\n".join(lines) + "\n", encoding="utf-8")
    print(md_path.read_text(encoding="utf-8"))


def setup_pyrapl():
    import pyRAPL

    try:
        pyRAPL.setup(devices=[pyRAPL.Device.PKG, pyRAPL.Device.DRAM])
        return pyRAPL, True
    except Exception as dram_error:
        try:
            pyRAPL.setup(devices=[pyRAPL.Device.PKG])
            print(f"DRAM RAPL is unavailable; measuring PKG only. DRAM setup error: {dram_error}")
            return pyRAPL, False
        except Exception as pkg_error:
            raise RuntimeError(
                "pyRAPL setup failed. Check /sys/class/powercap/intel-rapl permissions and CPU support."
            ) from pkg_error


def finite_or_zero(values: list[int] | None) -> int:
    return int(values[0]) if values else 0


def summarize(values: list[float]) -> dict[str, float]:
    if not values:
        return {"mean": float("nan"), "std": float("nan"), "min": float("nan"), "max": float("nan")}
    return {
        "mean": float(statistics.fmean(values)),
        "std": float(statistics.stdev(values)) if len(values) >= 2 else 0.0,
        "min": float(min(values)),
        "max": float(max(values)),
    }


def write_outputs(result_dir: Path, rows: list[dict[str, Any]], metadata: dict[str, Any]) -> None:
    import pandas as pd

    result_dir.mkdir(parents=True, exist_ok=True)
    df = pd.DataFrame(rows)
    csv_path = result_dir / "energy_result.csv"
    df.to_csv(csv_path, index=False)

    metric_summary = {
        key: summarize([float(row[key]) for row in rows if math.isfinite(float(row[key]))])
        for key in ("pkg_uj", "dram_uj", "total_uj", "duration_us", "power_mw")
    }
    stage_keys = sorted({key for row in rows for key in row if key.startswith("stage_")})
    stage_summary = {
        key: summarize([float(row[key]) for row in rows if key in row and math.isfinite(float(row[key]))])
        for key in stage_keys
    }
    summary = {
        "metadata": metadata,
        "metrics": metric_summary,
        "stage_metrics_us": stage_summary,
        "csv_path": str(csv_path),
    }
    (result_dir / "energy_summary.json").write_text(json.dumps(summary, indent=2), encoding="utf-8")

    lines = [
        f"# {metadata['model']} Energy Summary",
        "",
        f"- Model: `{metadata['model']}`",
        f"- Model type: `{metadata['model_type']}`",
        f"- Checkpoint: `{metadata['checkpoint']}`",
        f"- Checkpoint epoch: {metadata['checkpoint_epoch']}",
    ]
    if metadata.get("checkpoint_best_val_si_sdr") is not None:
        lines.append(f"- Checkpoint best val SI-SDR: {metadata['checkpoint_best_val_si_sdr']}")
    if metadata.get("checkpoint_avg_loss") is not None:
        lines.append(f"- Checkpoint avg loss: {metadata['checkpoint_avg_loss']}")
    if metadata.get("infer_py") is not None:
        lines.append(f"- infer.py: `{metadata['infer_py']}`")
    if metadata.get("audio_loader") is not None:
        lines.append(f"- Audio loader: `{metadata['audio_loader']}`")
    if metadata.get("cpp_subband_lib") is not None:
        lines.append(f"- C++ subband lib: `{metadata['cpp_subband_lib']}`")
    if metadata.get("q610_df_coef_shapes"):
        lines.append(f"- Q6.10 df_coef shapes: `{metadata['q610_df_coef_shapes']}`")
    if metadata.get("reference_wav") is not None:
        lines.append(f"- Reference WAV: `{metadata['reference_wav']}`")
    if metadata.get("output_wav") is not None:
        lines.append(f"- Output WAV: `{metadata['output_wav']}`")
    if metadata.get("audio_compare") is not None:
        lines.append(f"- Sample exact equal: {metadata['audio_compare']['sample_exact_equal']}")
        lines.append(f"- Compare RMSE: {metadata['audio_compare']['rmse']}")
    lines.extend(
        [
            f"- Input: `{metadata['input']}`",
            f"- Runs: {metadata['runs']}",
            f"- Warmup: {metadata['warmup']}",
            f"- Torch threads: {metadata['torch_threads']}",
            f"- RAPL domains: {', '.join(metadata['rapl_domains'])}",
            "",
            "| Metric | Mean | Std | Min | Max |",
            "| --- | ---: | ---: | ---: | ---: |",
        ]
    )
    for key, stats in metric_summary.items():
        lines.append(
            f"| `{key}` | {stats['mean']:.6f} | {stats['std']:.6f} | {stats['min']:.6f} | {stats['max']:.6f} |"
        )
    if stage_summary:
        lines.extend(
            [
                "",
                "| Stage timing (us) | Mean | Std | Min | Max |",
                "| --- | ---: | ---: | ---: | ---: |",
            ]
        )
        for key, stats in stage_summary.items():
            lines.append(
                f"| `{key}` | {stats['mean']:.6f} | {stats['std']:.6f} | {stats['min']:.6f} | {stats['max']:.6f} |"
            )
    (result_dir / "energy_summary.md").write_text("\n".join(lines) + "\n", encoding="utf-8")

    print(f"\nSaved CSV: {csv_path}")
    print((result_dir / "energy_summary.md").read_text(encoding="utf-8"))


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Measure FullSubNet inference energy with Intel RAPL/pyRAPL.")
    parser.add_argument(
        "--model-type",
        choices=(
            "ann",
            "snn",
            "snn_infer_py",
            "snn_q610_full",
            "snn_q610_fast",
            "snn_q610_full_infer",
            "snn_qat_pytorch",
            "snn_qat_q610",
        ),
        default="ann",
    )
    parser.add_argument("--snn-root", default=str(DEFAULT_SNN_ROOT))
    parser.add_argument("--checkpoint", default=str(DEFAULT_CHECKPOINT))
    parser.add_argument("--config", default=str(DEFAULT_CONFIG))
    parser.add_argument("--cpp-subband-lib", default=str(DEFAULT_QAT_CPP_SUBBAND_LIB))
    parser.add_argument("--input", default=str(DEFAULT_INPUT))
    parser.add_argument("--result-dir", default=str(DEFAULT_RESULT_DIR))
    parser.add_argument("--runs", type=int, default=100)
    parser.add_argument("--warmup", type=int, default=10)
    parser.add_argument("--threads", type=int, default=1)
    parser.add_argument("--max-seconds", type=float)
    parser.add_argument("--save-output-wav", action="store_true")
    parser.add_argument("--reference-wav")
    return parser.parse_args()


def resolve_measurement_paths(args: argparse.Namespace) -> tuple[Path, Path, Path, Path, Path | None]:
    if args.model_type in ("snn", "snn_infer_py"):
        checkpoint = str(DEFAULT_SNN_CHECKPOINT) if args.checkpoint == str(DEFAULT_CHECKPOINT) else args.checkpoint
        config = str(DEFAULT_SNN_CONFIG) if args.config == str(DEFAULT_CONFIG) else args.config
        default_result = DEFAULT_SNN_INFER_PY_RESULT_DIR if args.model_type == "snn_infer_py" else DEFAULT_SNN_RESULT_DIR
        result_dir = str(default_result) if args.result_dir == str(DEFAULT_RESULT_DIR) else args.result_dir
        return (
            resolve_path(checkpoint),
            resolve_path(config),
            resolve_path(args.input),
            resolve_path(result_dir),
            resolve_path(args.snn_root),
        )

    if args.model_type in ("snn_qat_pytorch", "snn_qat_q610"):
        checkpoint = str(DEFAULT_QAT_CHECKPOINT) if args.checkpoint == str(DEFAULT_CHECKPOINT) else args.checkpoint
        config = str(DEFAULT_QAT_CONFIG) if args.config == str(DEFAULT_CONFIG) else args.config
        default_result = DEFAULT_QAT_Q610_RESULT_DIR if args.model_type == "snn_qat_q610" else DEFAULT_QAT_PYTORCH_RESULT_DIR
        result_dir = str(default_result) if args.result_dir == str(DEFAULT_RESULT_DIR) else args.result_dir
        snn_root = str(DEFAULT_QAT_ROOT) if args.snn_root == str(DEFAULT_SNN_ROOT) else args.snn_root
        return (
            resolve_path(checkpoint),
            resolve_path(config),
            resolve_path(args.input),
            resolve_path(result_dir),
            resolve_path(snn_root),
        )

    if args.model_type in ("snn_q610_full", "snn_q610_fast", "snn_q610_full_infer"):
        checkpoint = str(DEFAULT_Q610_CHECKPOINT) if args.checkpoint == str(DEFAULT_CHECKPOINT) else args.checkpoint
        config = str(DEFAULT_Q610_CONFIG) if args.config == str(DEFAULT_CONFIG) else args.config
        if args.model_type == "snn_q610_fast":
            default_result = DEFAULT_Q610_FAST_RESULT_DIR
        elif args.model_type == "snn_q610_full_infer":
            default_result = DEFAULT_Q610_FULL_INFER_RESULT_DIR
        else:
            default_result = DEFAULT_Q610_RESULT_DIR
        result_dir = str(default_result) if args.result_dir == str(DEFAULT_RESULT_DIR) else args.result_dir
        snn_root = str(DEFAULT_Q610_ROOT) if args.snn_root == str(DEFAULT_SNN_ROOT) else args.snn_root
        return (
            resolve_path(checkpoint),
            resolve_path(config),
            resolve_path(args.input),
            resolve_path(result_dir),
            resolve_path(snn_root),
        )

    return (
        resolve_path(args.checkpoint),
        resolve_path(args.config),
        resolve_path(args.input),
        resolve_path(args.result_dir),
        None,
    )


def main() -> None:
    args = parse_args()
    checkpoint_path, config_path, input_path, result_dir, snn_root = resolve_measurement_paths(args)
    cpp_subband_lib_path: Path | None = None
    infer_py_path: Path | None = None
    reference_wav_path = resolve_path(args.reference_wav) if args.reference_wav else None

    if args.runs <= 0:
        raise ValueError("--runs must be positive.")
    if args.warmup < 0:
        raise ValueError("--warmup must be non-negative.")

    torch.set_num_threads(args.threads)
    if args.model_type == "ann":
        add_import_paths(config_path)
    elif snn_root is not None:
        add_snn_import_paths(snn_root)

    config = load_toml(config_path)
    sample_rate = int(config["acoustics"]["sr"])
    q610_runner: Q610SubbandRunner | None = None
    audio_loader = load_audio
    audio_loader_name = "measure_energy.load_audio"

    if args.model_type == "ann":
        model_name = "FullSubNet_ANN"
        inference_fn = run_ann_inference
        print("Loading FullSubNet ANN model and test input...")
        model, checkpoint_info = load_ann_model(config, checkpoint_path)
    elif args.model_type == "snn":
        if snn_root is None:
            raise ValueError("--snn-root is required for --model-type snn.")
        model_name = "SpikingFullSubNet_SNN"
        inference_fn = run_snn_inference
        print("Loading SpikingFullSubNet SNN model and test input...")
        model, checkpoint_info = load_snn_model(config, checkpoint_path, snn_root)
    elif args.model_type == "snn_infer_py":
        if snn_root is None:
            raise ValueError("--snn-root is required for --model-type snn_infer_py.")
        model_name = "SpikingFullSubNet_SNN_InferPy"
        inference_fn = run_snn_inference
        print("Loading SpikingFullSubNet through infer.py and test input...")
        model, checkpoint_info, infer_module = load_snn_infer_py_model(config, checkpoint_path, snn_root)
        infer_py_path = snn_root / "infer.py"
        audio_loader = infer_module.load_audio
        audio_loader_name = "infer.py::load_audio"
    elif args.model_type == "snn_q610_full_infer":
        if snn_root is None:
            raise ValueError("--snn-root is required for --model-type snn_q610_full_infer.")
        model_name = "SpikingFullSubNet_SNN_Q610_FULL_INFER_CPP"
        print("Loading SpikingFullSubNet through infer.py and full C++ Q6.10 inference engine...")
        model, checkpoint_info, infer_module = load_snn_infer_py_model(config, checkpoint_path, snn_root)
        infer_py_path = snn_root / "infer.py"
        audio_loader = infer_module.load_audio
        audio_loader_name = "infer.py::load_audio"
        cpp_lib_arg = args.cpp_subband_lib
        if cpp_lib_arg == str(DEFAULT_QAT_CPP_SUBBAND_LIB):
            cpp_lib_arg = str(DEFAULT_Q610_FULL_INFER_CPP_LIB)
        cpp_subband_lib_path = resolve_path(cpp_lib_arg)
        q610_runner = Q610FullInferenceRunner(cpp_subband_lib_path, model)

        def inference_fn(
            inference_model: torch.nn.Module,
            inference_noisy: torch.Tensor,
            inference_config: dict[str, Any],
        ) -> torch.Tensor:
            if q610_runner is None:
                raise RuntimeError("Q6.10 full inference runner was not initialized.")
            return q610_runner.run(inference_noisy)

    elif args.model_type in ("snn_q610_full", "snn_q610_fast"):
        if snn_root is None:
            raise ValueError(f"--snn-root is required for --model-type {args.model_type}.")
        is_fast_q610 = args.model_type == "snn_q610_fast"
        model_name = "SpikingFullSubNet_SNN_Q610_FAST_CPP" if is_fast_q610 else "SpikingFullSubNet_SNN_Q610_CPP"
        print(
            "Loading SpikingFullSubNet through infer.py, "
            f"{'fast ' if is_fast_q610 else ''}full C++ Q6.10 subband bridge, and test input..."
        )
        model, checkpoint_info, infer_module = load_snn_infer_py_model(config, checkpoint_path, snn_root)
        infer_py_path = snn_root / "infer.py"
        audio_loader = infer_module.load_audio
        audio_loader_name = "infer.py::load_audio"
        cpp_lib_arg = args.cpp_subband_lib
        if cpp_lib_arg == str(DEFAULT_QAT_CPP_SUBBAND_LIB):
            cpp_lib_arg = str(DEFAULT_Q610_FAST_CPP_SUBBAND_LIB if is_fast_q610 else DEFAULT_Q610_CPP_SUBBAND_LIB)
        cpp_subband_lib_path = resolve_path(cpp_lib_arg)
        runner_cls = Q610FastFullSubbandRunner if is_fast_q610 else Q610FullSubbandRunner
        q610_runner = runner_cls(cpp_subband_lib_path, model)

        def inference_fn(
            inference_model: torch.nn.Module,
            inference_noisy: torch.Tensor,
            inference_config: dict[str, Any],
        ) -> torch.Tensor:
            if q610_runner is None:
                raise RuntimeError("Q6.10 runner was not initialized.")
            return run_snn_qat_q610_inference(inference_model, inference_noisy, inference_config, q610_runner)

    elif args.model_type == "snn_qat_pytorch":
        if snn_root is None:
            raise ValueError("--snn-root is required for --model-type snn_qat_pytorch.")
        model_name = "SpikingFullSubNet_QAT_PyTorch"
        inference_fn = run_snn_inference
        print("Loading QAT SpikingFullSubNet PyTorch model and test input...")
        model, checkpoint_info = load_snn_model(config, checkpoint_path, snn_root)
    elif args.model_type == "snn_qat_q610":
        if snn_root is None:
            raise ValueError("--snn-root is required for --model-type snn_qat_q610.")
        model_name = "SpikingFullSubNet_QAT_Q610_CPP"
        print("Loading QAT SpikingFullSubNet model, C++ Q6.10 bridge, and test input...")
        model, checkpoint_info = load_snn_model(config, checkpoint_path, snn_root)
        cpp_subband_lib_path = resolve_path(args.cpp_subband_lib)
        q610_runner = Q610SubbandRunner(cpp_subband_lib_path, model)

        def inference_fn(
            inference_model: torch.nn.Module,
            inference_noisy: torch.Tensor,
            inference_config: dict[str, Any],
        ) -> torch.Tensor:
            if q610_runner is None:
                raise RuntimeError("Q6.10 runner was not initialized.")
            return run_snn_qat_q610_inference(inference_model, inference_noisy, inference_config, q610_runner)

    else:
        raise ValueError(f"Unsupported model type: {args.model_type}")

    noisy = audio_loader(input_path, sample_rate, args.max_seconds)

    print(f"Warmup: {args.warmup} runs")
    last_output = None
    with torch.no_grad():
        for _ in range(args.warmup):
            last_output = inference_fn(model, noisy, config)

    pyrapl, has_dram = setup_pyrapl()
    rapl_domains = ["PKG"] + (["DRAM"] if has_dram else [])

    rows = []
    print(f"Measuring {model_name} inference: {args.runs} runs")
    for run_index in range(args.runs):
        meter = pyrapl.Measurement(f"{model_name}_run_{run_index}")
        wall_start = time.perf_counter()
        meter.begin()
        with torch.no_grad():
            last_output = inference_fn(model, noisy, config)
        meter.end()
        wall_elapsed_s = time.perf_counter() - wall_start

        pkg_uj = finite_or_zero(meter.result.pkg)
        dram_uj = finite_or_zero(meter.result.dram) if has_dram else 0
        duration_us = int(meter.result.duration)
        total_uj = pkg_uj + dram_uj
        power_mw = (total_uj / duration_us * 1000.0) if duration_us > 0 else float("nan")
        row = {
            "model": model_name,
            "run": run_index,
            "pkg_uj": pkg_uj,
            "dram_uj": dram_uj,
            "total_uj": total_uj,
            "duration_us": duration_us,
            "power_mw": power_mw,
            "wall_elapsed_s": wall_elapsed_s,
        }
        if q610_runner is not None:
            for stage_name, elapsed_s in getattr(q610_runner, "last_stage_timings", {}).items():
                row[f"stage_{stage_name}_us"] = float(elapsed_s) * 1_000_000.0
        rows.append(row)
        print(
            f"run={run_index:03d} pkg_uj={pkg_uj} dram_uj={dram_uj} "
            f"duration_us={duration_us} power_mw={power_mw:.3f}"
        )

    output_wav_path = None
    audio_compare = None
    if (args.save_output_wav or reference_wav_path is not None) and last_output is not None:
        result_dir.mkdir(parents=True, exist_ok=True)
        output_wav_path = result_dir / "enhanced_last.wav"
        save_wav(output_wav_path, last_output, sample_rate=sample_rate)
        if reference_wav_path is not None:
            audio_compare = compare_audio_files(output_wav_path, reference_wav_path)
            write_audio_compare(result_dir, audio_compare)

    metadata = {
        "model": model_name,
        "model_type": args.model_type,
        "checkpoint": str(checkpoint_path),
        "checkpoint_epoch": checkpoint_info.get("epoch"),
        "checkpoint_best_val_si_sdr": checkpoint_info.get("best_val_si_sdr"),
        "checkpoint_avg_loss": checkpoint_info.get("avg_loss"),
        "config": str(config_path),
        "snn_root": str(snn_root) if snn_root is not None else None,
        "infer_py": str(infer_py_path) if infer_py_path is not None else None,
        "audio_loader": audio_loader_name,
        "cpp_subband_lib": str(cpp_subband_lib_path) if cpp_subband_lib_path is not None else None,
        "q610_df_coef_shapes": getattr(q610_runner, "last_df_coef_shapes", None) if q610_runner is not None else None,
        "input": str(input_path),
        "reference_wav": str(reference_wav_path) if reference_wav_path is not None else None,
        "output_wav": str(output_wav_path) if output_wav_path is not None else None,
        "audio_compare": audio_compare,
        "input_samples_after_resample": int(noisy.shape[-1]),
        "sample_rate": sample_rate,
        "runs": args.runs,
        "warmup": args.warmup,
        "torch_threads": torch.get_num_threads(),
        "torch_version": torch.__version__,
        "rapl_domains": rapl_domains,
        "measured_at": datetime.now().astimezone().isoformat(timespec="seconds"),
    }
    write_outputs(result_dir, rows, metadata)


if __name__ == "__main__":
    main()
