from __future__ import annotations

import argparse
import json
import math
import statistics
import time
from datetime import datetime
from pathlib import Path
from typing import Any, Callable

import numpy as np
import torch
from einops import rearrange

from measure_energy import (
    DEFAULT_Q610_FAST_CPP_SUBBAND_LIB,
    Q610FastFullSubbandRunner,
    Q610FullSubbandRunner,
    finite_or_zero,
    float_to_q610,
    load_snn_infer_py_model,
    load_toml,
    resolve_path,
    setup_pyrapl,
    summarize,
)


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Profile PyTorch vs C++ Q6.10 subband inference.")
    parser.add_argument("--snn-root", required=True)
    parser.add_argument("--config", required=True)
    parser.add_argument("--checkpoint", required=True)
    parser.add_argument("--cpp-subband-lib", required=True)
    parser.add_argument("--cpp-fast-subband-lib", default=str(DEFAULT_Q610_FAST_CPP_SUBBAND_LIB))
    parser.add_argument("--input", required=True)
    parser.add_argument("--result-dir", required=True)
    parser.add_argument("--runs", type=int, default=100)
    parser.add_argument("--warmup", type=int, default=10)
    parser.add_argument("--threads", type=int, default=1)
    parser.add_argument("--max-seconds", type=float)
    return parser.parse_args()


def metric_summary(values: list[float]) -> dict[str, float]:
    return {
        "mean": float(statistics.fmean(values)),
        "std": float(statistics.stdev(values)) if len(values) >= 2 else 0.0,
        "min": float(min(values)),
        "max": float(max(values)),
    }


def measure_callable(
    label: str,
    fn: Callable[[], Any],
    runs: int,
    warmup: int,
    pyrapl,
    has_dram: bool,
) -> list[dict[str, Any]]:
    print(f"\nProfiling {label}: warmup={warmup}, runs={runs}")
    with torch.no_grad():
        for _ in range(warmup):
            fn()

    rows: list[dict[str, Any]] = []
    for run_index in range(runs):
        meter = pyrapl.Measurement(f"{label}_{run_index}")
        wall_start = time.perf_counter()
        meter.begin()
        with torch.no_grad():
            fn()
        meter.end()
        wall_elapsed_s = time.perf_counter() - wall_start

        pkg_uj = finite_or_zero(meter.result.pkg)
        dram_uj = finite_or_zero(meter.result.dram) if has_dram else 0
        duration_us = int(meter.result.duration)
        total_uj = pkg_uj + dram_uj
        power_mw = (total_uj / duration_us * 1000.0) if duration_us > 0 else float("nan")
        row = {
            "profile": label,
            "run": run_index,
            "pkg_uj": pkg_uj,
            "dram_uj": dram_uj,
            "total_uj": total_uj,
            "duration_us": duration_us,
            "power_mw": power_mw,
            "wall_elapsed_s": wall_elapsed_s,
        }
        rows.append(row)
        print(
            f"{label} run={run_index:03d} pkg_uj={pkg_uj} dram_uj={dram_uj} "
            f"duration_us={duration_us} power_mw={power_mw:.3f}"
        )
    return rows


def summarize_rows(rows: list[dict[str, Any]], num_frames: int) -> dict[str, dict[str, float]]:
    output: dict[str, dict[str, float]] = {}
    for key in ("pkg_uj", "dram_uj", "total_uj", "duration_us", "power_mw", "wall_elapsed_s"):
        output[key] = summarize([float(row[key]) for row in rows if math.isfinite(float(row[key]))])
    output["per_frame_pkg_uj"] = metric_summary([float(row["pkg_uj"]) / num_frames for row in rows])
    output["per_frame_duration_us"] = metric_summary([float(row["duration_us"]) / num_frames for row in rows])
    return output


def main() -> None:
    args = parse_args()
    if args.runs <= 0:
        raise ValueError("--runs must be positive.")
    if args.warmup < 0:
        raise ValueError("--warmup must be non-negative.")

    torch.set_num_threads(args.threads)
    snn_root = resolve_path(args.snn_root)
    config_path = resolve_path(args.config)
    checkpoint_path = resolve_path(args.checkpoint)
    input_path = resolve_path(args.input)
    result_dir = resolve_path(args.result_dir)
    cpp_lib_path = resolve_path(args.cpp_subband_lib)
    cpp_fast_lib_path = resolve_path(args.cpp_fast_subband_lib)

    config = load_toml(config_path)
    sample_rate = int(config["acoustics"]["sr"])
    model, checkpoint_info, infer_module = load_snn_infer_py_model(config, checkpoint_path, snn_root)
    runner = Q610FullSubbandRunner(cpp_lib_path, model)
    fast_runner = Q610FastFullSubbandRunner(cpp_fast_lib_path, model)
    noisy = infer_module.load_audio(input_path, sample_rate, args.max_seconds)

    with torch.no_grad():
        noisy_mag, _, _, _ = model.stft(noisy)
        noisy_mag = rearrange(noisy_mag, "b f t -> b 1 f t")
        noisy_mag = noisy_mag**model.fdrc
        noisy_mag = noisy_mag[..., :-1, :]
        fb_output, _ = model.fb_model(noisy_mag)

    batch_size = int(noisy_mag.shape[0])
    num_frames = int(noisy_mag.shape[-1])
    noisy_input_q610 = float_to_q610(noisy_mag.detach().cpu().numpy()).reshape(-1)
    fb_output_q610 = float_to_q610(fb_output.detach().cpu().numpy()).reshape(-1)
    core_output_buffers = []
    fast_core_output_buffers = []
    for band_index, _stage in enumerate(model.sb_model.sb_models):
        spec = runner.band_spec(model.sb_model, band_index, int(model.num_spks))
        df_coef_shape = (
            batch_size,
            spec["df_order"],
            int(model.num_spks),
            spec["num_subbands"] * spec["ctr_freq"],
            num_frames,
            2,
        )
        core_output_buffers.append(np.empty(df_coef_shape, dtype=np.int16))
        fast_core_output_buffers.append(np.empty(df_coef_shape, dtype=np.int16))

    def pytorch_subband_only():
        return model.sb_model(noisy_mag, fb_output)[0]

    def q610_reference_core_only():
        for band_index, df_coef_q610 in enumerate(core_output_buffers):
            weights = runner.band_weights[band_index]
            layer0, layer1 = weights["layers"]
            return_code = runner.run_full_band(
                band_index,
                batch_size,
                num_frames,
                runner.ptr(noisy_input_q610),
                runner.ptr(fb_output_q610),
                runner.ptr(layer0["weight_ih"]),
                runner.ptr(layer0["weight_hh"]),
                runner.ptr(layer0["bias_ih"]),
                runner.ptr(layer0["bn_running_mean"]),
                runner.ptr(layer0["bn_running_var"]),
                runner.ptr(layer0["bn_weight"]),
                runner.ptr(layer0["bn_bias"]),
                runner.ptr(layer1["weight_ih"]),
                runner.ptr(layer1["weight_hh"]),
                runner.ptr(layer1["bias_ih"]),
                runner.ptr(layer1["bn_running_mean"]),
                runner.ptr(layer1["bn_running_var"]),
                runner.ptr(layer1["bn_weight"]),
                runner.ptr(layer1["bn_bias"]),
                runner.ptr(weights["proj_weight"]),
                runner.ptr(weights["proj_bias"]),
                runner.ptr(df_coef_q610),
            )
            if return_code != 0:
                raise RuntimeError(f"run_full_band_q610 failed for band {band_index}: rc={return_code}")
        return core_output_buffers

    def q610_fast_core_only():
        for band_index, df_coef_q610 in enumerate(fast_core_output_buffers):
            fast_runner.run_band_core(
                band_index,
                batch_size,
                num_frames,
                noisy_input_q610,
                fb_output_q610,
                df_coef_q610,
            )
        return fast_core_output_buffers

    def q610_fast_full_bridge():
        return fast_runner.run(model, noisy_mag, fb_output)

    q610_reference_core_only()
    q610_fast_core_only()
    fast_reference_checks = []
    for band_index, (reference_output, fast_output) in enumerate(zip(core_output_buffers, fast_core_output_buffers)):
        diff = fast_output.astype(np.int32) - reference_output.astype(np.int32)
        fast_reference_checks.append(
            {
                "band_index": band_index,
                "shape_equal": tuple(reference_output.shape) == tuple(fast_output.shape),
                "bitwise_equal": bool(np.array_equal(reference_output, fast_output)),
                "num_diff": int(np.count_nonzero(diff)),
                "max_abs_diff": int(np.max(np.abs(diff))) if diff.size else 0,
            }
        )

    pyrapl, has_dram = setup_pyrapl()
    profiles = {
        "pytorch_subband_only": pytorch_subband_only,
        "q610_reference_core_only": q610_reference_core_only,
        "q610_fast_core_only": q610_fast_core_only,
        "q610_fast_full_bridge": q610_fast_full_bridge,
    }
    all_rows: list[dict[str, Any]] = []
    summary: dict[str, Any] = {}
    for label, fn in profiles.items():
        rows = measure_callable(label, fn, args.runs, args.warmup, pyrapl, has_dram)
        all_rows.extend(rows)
        summary[label] = summarize_rows(rows, num_frames)

    result_dir.mkdir(parents=True, exist_ok=True)
    import pandas as pd

    csv_path = result_dir / "subband_profile.csv"
    pd.DataFrame(all_rows).to_csv(csv_path, index=False)

    metadata = {
        "input": str(input_path),
        "input_samples_after_resample": int(noisy.shape[-1]),
        "sample_rate": sample_rate,
        "num_frames": num_frames,
        "checkpoint": str(checkpoint_path),
        "checkpoint_epoch": checkpoint_info.get("epoch"),
        "config": str(config_path),
        "snn_root": str(snn_root),
        "cpp_subband_lib": str(cpp_lib_path),
        "cpp_fast_subband_lib": str(cpp_fast_lib_path),
        "fast_reference_checks": fast_reference_checks,
        "runs": args.runs,
        "warmup": args.warmup,
        "torch_threads": torch.get_num_threads(),
        "rapl_domains": ["PKG"] + (["DRAM"] if has_dram else []),
        "measured_at": datetime.now().astimezone().isoformat(timespec="seconds"),
    }
    output = {"metadata": metadata, "profiles": summary, "csv_path": str(csv_path)}
    (result_dir / "subband_profile_summary.json").write_text(json.dumps(output, indent=2), encoding="utf-8")

    lines = [
        "# Subband Q6.10 Profile",
        "",
        f"- Input: `{metadata['input']}`",
        f"- Num frames: {num_frames}",
        f"- Runs: {args.runs}",
        f"- Warmup: {args.warmup}",
        f"- Fast reference bitwise equal: {all(check['bitwise_equal'] for check in fast_reference_checks)}",
        "",
        "| Profile | pkg_uj mean | duration_us mean | per_frame_pkg_uj | per_frame_duration_us | power_mw mean |",
        "| --- | ---: | ---: | ---: | ---: | ---: |",
    ]
    for label, stats in summary.items():
        lines.append(
            f"| `{label}` | {stats['pkg_uj']['mean']:.6f} | {stats['duration_us']['mean']:.6f} | "
            f"{stats['per_frame_pkg_uj']['mean']:.6f} | {stats['per_frame_duration_us']['mean']:.6f} | "
            f"{stats['power_mw']['mean']:.6f} |"
        )
    (result_dir / "subband_profile_summary.md").write_text("\n".join(lines) + "\n", encoding="utf-8")
    print((result_dir / "subband_profile_summary.md").read_text(encoding="utf-8"))


if __name__ == "__main__":
    main()
