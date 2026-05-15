# Realtime HLS IP `df_coef` Golden Model 고커버리지 검증 보고서

## 1. 검증 목적

본 검증의 목적은 실시간 음성 향상용 HLS IP top인 `SubbandRealtimeTopQ610Ip`가 출력하는 AXI4-Stream `df_coef` 값이 C++ Q6.10 golden reference와 bit-exact로 일치하는지 확인하는 것이다. 비교 대상은 최종 출력 stream의 모든 `df_coef` element이며, 값뿐 아니라 chunk별 output count와 TLAST 위치도 함께 검증하였다.

본 검증에서 golden model은 기존 비최적화 C++ Q6.10 reference path로 정의하였다. 사용한 golden path는 다음과 같다.

```text
FreqUnfoldQ610
  -> ConcatQ610
  -> PackQ610
  -> PackedToSequenceQ610
  -> RunGSULayerQ610 layer0
  -> RunGSULayerQ610 layer1
  -> RunProjectionQ610
  -> ProjectToDfCoefQ610
```

따라서 본 결과는 HLS realtime IP top과 C++ Q6.10 reference 사이의 bit-exact 검증 결과이며, PyTorch float model과 직접 비교한 결과는 아니다.

## 2. 검증 환경

| 항목 | 내용 |
|---|---|
| HLS top | `SubbandRealtimeTopQ610Ip` |
| Device | `xc7z020clg400-1` |
| Tool | Vitis HLS 2023.2 |
| Clock target | 10 ns |
| Testbench | `subband_realtime_hls_coverage_tb.cpp` |
| Tcl script | `scripts/hls/run_hls_realtime_csim_coverage.tcl` |
| HLS log | `logs/hls/vitis_hls_realtime_csim_coverage.log` |
| C-sim log copy | `logs/hls/subband_q610_realtime_coverage_csim.log` |

Vitis HLS가 공백 포함 경로에서 project/source path를 안정적으로 처리하지 못했기 때문에, 실행 시 소스 파일을 `C:\hls_cov_subband\src` 임시 경로로 복사하고, HLS project는 `C:\hls_cov_subband\subband_q610_realtime_coverage_hls`에서 생성하였다. 최종 로그는 workspace로 복사하였다.

## 3. Coverage 구성

검증은 32개 deterministic seed, 5개 input/weight profile, 5개 chunk pattern을 조합하여 수행하였다. 각 primary scenario는 4-frame 입력에 대해 `4 * 1152 = 4608`개의 `df_coef` element를 전수 비교한다.

| Coverage 항목 | 값 |
|---|---:|
| Seeds | 32 |
| Input/weight profiles | 5 |
| Chunk patterns | 5 |
| Primary scenarios | 800 |
| Reset replay scenarios | 160 |
| Total scenarios | 960 |
| Compared `df_coef` elements | 4,423,680 |

사용한 profile은 다음과 같다.

| Profile | 의도 |
|---|---|
| `small_random` | 작은 범위 random input/weight |
| `full_input_zero_recurrent` | full-range int16 입력과 recurrent weight zero 조건 |
| `sparse_identity_bn` | zero-heavy sparse 입력과 identity BN |
| `alternating_nontrivial_bn` | alternating-sign 입력과 nontrivial BN scale/add |
| `edge_projection_bias` | edge-biased 입력과 projection bias stress |

사용한 chunk pattern은 다음과 같다.

| Pattern | Chunk split |
|---|---|
| `chunk4` | `{4}` |
| `chunk2_2` | `{2, 2}` |
| `chunk1_1_1_1` | `{1, 1, 1, 1}` |
| `chunk3_1` | `{3, 1}` |
| `chunk1_3` | `{1, 3}` |

각 chunk pattern은 첫 chunk에서 `reset_state=1`을 적용하고, 이후 chunk에서는 `reset_state=0`으로 state를 유지하여 연속 chunk 처리 결과가 4-frame golden reference와 일치하는지 확인하였다. 또한 각 seed/profile 조합마다 `chunk4`를 한 번 더 reset replay로 실행하여, 동일 입력을 reset 후 재실행해도 동일한 `df_coef`가 출력되는지 확인하였다.

## 4. 검증 결과

Vitis HLS C-sim은 정상 종료되었으며, 최종 summary는 다음과 같다.

```text
COVERAGE SUMMARY
seeds=32
profiles=5
chunk_patterns=5
primary_scenarios=800
reset_replay_scenarios=160
total_scenarios=960
df_coef_elements_compared=4423680
df_coef_mismatches=0
tlast_mismatches=0
size_mismatches=0
extra_output_errors=0
result=PASS
Realtime df_coef high-coverage golden comparison passed.
CSim done with 0 errors.
```

검증 결과, 총 `4,423,680`개의 `df_coef` element가 C++ Q6.10 golden reference와 bit-exact로 일치하였다. 모든 scenario에서 `df_coef_mismatches=0`이며, AXI4-Stream protocol 관점에서도 `tlast_mismatches=0`, `size_mismatches=0`, `extra_output_errors=0`으로 확인되었다.

전체 C-sim elapsed time은 Vitis HLS log 기준 약 `4249.92 s`이다.

## 5. 논문 본문용 서술 예시

다음 문단은 논문 검증 절에 사용할 수 있는 보수적 서술 예시이다.

> 제안한 realtime HLS IP의 기능 정확도를 검증하기 위해, `SubbandRealtimeTopQ610Ip`의 AXI4-Stream `df_coef` 출력을 C++ Q6.10 golden reference와 bit-exact 비교하였다. Golden reference는 `FreqUnfoldQ610`, `ConcatQ610`, `PackQ610`, 두 개의 `RunGSULayerQ610`, `RunProjectionQ610`, `ProjectToDfCoefQ610`로 구성된 비최적화 Q6.10 reference path를 사용하였다. 검증은 32개 deterministic seed, 5개 input/weight profile, 5개 chunk pattern에 대해 수행되었으며, reset replay scenario를 포함하여 총 960개 scenario를 평가하였다. 각 4-frame scenario에서 frame별 1152개 `df_coef` element를 전수 비교하여 총 4,423,680개의 출력 element를 검증한 결과, 모든 값이 golden reference와 bit-exact로 일치하였고 `df_coef_mismatches=0`을 확인하였다. 또한 chunk별 output count와 TLAST 위치도 모두 일치하여 `tlast_mismatches=0`, `size_mismatches=0`으로 확인되었다.

> 본 검증은 PyTorch floating-point model과의 직접 비교가 아니라, HLS realtime IP top과 C++ Q6.10 golden reference 사이의 bit-exact 검증이다. 따라서 본 결과는 HLS 최적화 및 AXI-stream chunk 처리 구조가 Q6.10 기준 수치 동작과 출력 ordering을 보존함을 보여준다.

## 6. 결론

Realtime HLS IP top의 AXI4-Stream `df_coef` 출력은 tested scenario 전체에서 C++ Q6.10 golden reference와 bit-exact로 일치하였다. 특히 chunk 분할 `{4}`, `{2,2}`, `{1,1,1,1}`, `{3,1}`, `{1,3}`에 대해 동일한 4-frame golden output을 재현하였으므로, realtime chunk 처리와 내부 RNN state 유지 로직이 최종 `df_coef` 출력 기준으로 검증되었다.

본 결과를 근거로, 논문에서는 “제안한 realtime HLS IP는 4.42M개 이상의 `df_coef` output element에 대해 C++ Q6.10 golden reference와 bit-exact 일치함을 C-sim에서 확인하였다”고 서술할 수 있다.