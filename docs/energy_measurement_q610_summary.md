# SNN / Q6.10 Subband Energy Measurement Summary

This note summarizes the CPU-side energy and inference-time measurements performed for the Spiking FullSubNet SNN models and the C++ Q6.10 subband replacement path.

## Measurement Setup

- Machine metric: Intel RAPL `PKG` domain.
- DRAM RAPL was unavailable, so DRAM energy is not included.
- Main input files:
  - Short input: `JH_test/test2.wav`
  - Long input: `JH_test/2m_test.wav`
  - Reference enhanced output for short input: `JH_test/enhanced_test2.wav`
- Common inference settings:
  - `threads=1`
  - short full-inference verification often used `runs=1`
  - stable comparisons used `runs=5` or `runs=100` depending on audio length
- Python SNN baseline used the original `infer.py` path and default checkpoint:
  - `model_zoo/intel_ndns/spike_fsb/baseline_m/checkpoints/best/pytorch_model.bin`

## Baseline Results

### ANN vs original SNN on `test2.wav`

| Model | Runs | Mean PKG energy | Mean duration | Mean power |
| --- | ---: | ---: | ---: | ---: |
| ANN FullSubNet | 100 | 206.845 J | 11.215 s | 18.445 W |
| SNN default checkpoint | 100 | 29.370 J | 1.632 s | 17.995 W |

The SNN default checkpoint is much faster and lower-energy than the ANN baseline under the measured CPU configuration.

### Python SNN `infer.py` on `2m_test.wav`

| Model | Runs | Mean PKG energy | Mean duration | Mean power |
| --- | ---: | ---: | ---: | ---: |
| Python SNN `infer.py` | 5 | 279.677 J | 15.933 s | 17.555 W |

## Initial C++ Q6.10 Subband Result

The first C++ Q6.10 hybrid replaced only the subband path while keeping STFT, fullband, deepfiltering, and iSTFT in PyTorch.

On `2m_test.wav`:

| Model | Runs | Mean PKG energy | Mean duration | Mean power |
| --- | ---: | ---: | ---: | ---: |
| Python SNN `infer.py` | 5 | 279.677 J | 15.933 s | 17.555 W |
| Initial C++ Q6.10 subband hybrid | 5 | 346.851 J | 22.639 s | 15.324 W |

The initial C++ reference implementation was slower than Python. Profiling showed this was not primarily caused by the Python-to-C++ bridge. The C++ core itself was slower because it used scalar loops, allocated large `std::vector` work buffers on every call, and repeatedly evaluated expensive math such as `exp` and `sqrt`.

## Accuracy Checks on `test2.wav`

The current Python `infer.py` output was compared with `JH_test/enhanced_test2.wav`.

| Output | Sample exact | RMSE vs `enhanced_test2.wav` | SNR |
| --- | --- | ---: | ---: |
| Python `infer.py` output | false | 0.00159458 | 23.719 dB |
| C++ Q6.10 subband output | false | 0.00288072 | 18.582 dB |

`enhanced_test2.wav` is therefore close to, but not sample-exact with, the current Python output in this environment.

## Fast C++ Q6.10 Subband Optimization

A faster C++ Q6.10 path was implemented while keeping the original reference implementation intact.

Main optimizations:

- Persistent C++ workspace/context to avoid repeated large buffer allocation.
- Fused subband layout construction:
  - `FreqUnfold + Concat + Pack + PackedToSequence` writes directly to the sequence layout.
- Fused projection output mapping:
  - projection output is written directly into `df_coef` layout.
- Sigmoid Q6.10 lookup table to remove repeated `std::exp` calls.
- BatchNorm constants are precomputed to reduce repeated `std::sqrt` work.
- Spike-aware dot products use active indices where inputs are binary spike values (`0` or `1024`).

Correctness check:

- On `test2.wav`, fast C++ `df_coef` was bitwise identical to the previous C++ reference for all three bands.

## Subband-Only Profile on `test2.wav`

Settings: `runs=100`, `warmup=10`, `threads=1`.

| Profile | Mean PKG energy | Mean duration | Per-frame duration |
| --- | ---: | ---: | ---: |
| PyTorch subband only | 21.987 J | 1.417 s | 586.850 us |
| C++ Q6.10 reference core | 27.026 J | 1.733 s | 717.686 us |
| C++ Q6.10 fast core | 20.760 J | 1.372 s | 568.252 us |
| C++ Q6.10 fast bridge | 20.952 J | 1.387 s | 574.278 us |

Fast C++ core vs C++ reference core:

- Duration: 79.18% of reference, about 20.82% faster.
- PKG energy: 76.82% of reference, about 23.18% lower.

Fast C++ core vs PyTorch subband:

- Duration: 96.83% of PyTorch subband, about 3.17% faster.

## Full Inference on `test2.wav`

Settings: `runs=5`, `warmup=1`, `threads=1`.

| Model | Mean PKG energy | Mean duration | Mean power |
| --- | ---: | ---: | ---: |
| C++ Q6.10 reference hybrid | 36.090 J | 2.333 s | 15.467 W |
| C++ Q6.10 fast hybrid | 29.722 J | 1.951 s | 15.235 W |

Fast full hybrid vs reference full hybrid:

- Duration: 83.62% of reference, about 16.38% faster.
- PKG energy: 82.35% of reference, about 17.65% lower.

## Full Inference on `2m_test.wav`

Settings: `runs=5`, `warmup=1`, `threads=1`.

| Model | Mean PKG energy | Mean duration | Mean power |
| --- | ---: | ---: | ---: |
| Python SNN `infer.py` | 279.677 J | 15.933 s | 17.555 W |
| C++ Q6.10 reference hybrid | 346.851 J | 22.639 s | 15.324 W |
| C++ Q6.10 fast hybrid | 283.035 J | 18.592 s | 15.224 W |

Fast C++ hybrid vs initial C++ reference hybrid:

- About 4.048 s faster on average.
- Duration: 82.12% of the original C++ reference hybrid.

Fast C++ hybrid vs Python SNN `infer.py`:

- About 2.659 s slower on average.
- Duration: 116.69% of Python SNN.
- PKG energy: 101.20% of Python SNN.

## Interpretation

The optimized C++ Q6.10 subband path produces a meaningful improvement over the original C++ reference implementation. On subband-only profiling, it is also slightly faster than the PyTorch subband path.

However, in full inference on the long `2m_test.wav` input, the hybrid C++ path is still slower than Python `infer.py`. The likely reason is that only the subband core is in C++, while the rest of the pipeline still crosses between PyTorch tensors, NumPy arrays, Q6.10 integer buffers, C++ output, float tensors, deepfiltering, and iSTFT.

A full C++ Q6.10 model could improve performance if it removes the Python/PyTorch bridge and applies the same fast-path ideas to the full model:

- persistent workspaces,
- fused memory layouts,
- fixed-point lookup tables,
- precomputed normalization constants,
- spike-aware sparse operations,
- efficient STFT/iSTFT and deepfiltering implementation.

Simply translating the model into scalar C++ is unlikely to be faster. The performance gain depends on implementing the whole pipeline as an optimized C++ Q6.10 runtime rather than a reference-style scalar translation.
