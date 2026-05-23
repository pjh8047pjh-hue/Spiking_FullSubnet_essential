# USE_RTL_BAND_ENGINE 최종 검증 보고서

작성일: 2026-05-23  
대상: `SubbandRealtimeTopQ610Ip`, `-DUSE_RTL_BAND_ENGINE`  
보드/디바이스: Zybo Z7-20급 `xc7z020clg400-1`  
툴: Vitis HLS/Vivado 2023.2

## 1. 채택한 기준선

메인라인은 `USE_RTL_BAND_ENGINE` 경로로 고정하였다. `USE_SV_GSU_LAYER`, `USE_SV_GSU_FULL`, `USE_PROJECTION_EXTERNAL`, ping-pong/SV full 실험 경로는 이번 최종 보드 구현 기준에서 제외하였다.

수정 사항:

- `subband_ref_q610_opt_stage4_latency_stepL2.cpp`의 anonymous namespace 내부 중복 `kRealtimeTotalSubbands` 정의를 제거했다. 동일 상수는 이미 `subband_ref_q610.hpp`에 존재하므로, C-sim의 ambiguous reference 컴파일 오류를 제거하기 위한 정리다.
- `scripts/hls/run_hls_realtime_rtl_engine_export_only.tcl`을 추가했다.
- `scripts/hls/run_hls_realtime_rtl_engine_cosim_only.tcl`을 추가했다.
- `scripts/hls/run_realtime_rtl_engine_coverage_segments.ps1`을 추가해 high-coverage C-sim을 seed 구간별로 순차 실행할 수 있게 했다.
- `scripts/vivado/run_vivado_realtime_dma_rtl_engine_impl.tcl`을 추가했다.
- Vivado Windows 안정화를 위해 `scripts/vivado/run_vivado_safe.ps1`는 `H:/` working directory에서 실행하도록 수정했다.
- Windows path length 회피를 위해 RTL-engine Vivado 프로젝트명은 `rtdma_rtl`, BD명은 `bd`로 축약했다.

## 2. C-sim 검증

Smoke C-sim:

- 로그: `logs/hls/vitis_hls_realtime_rtl_engine_csim.log`
- 결과: `chunk4 passed`, `chunk2 passed`, `chunk1 passed`
- 결과: `Realtime 3-band stream smoke test passed`
- 참고: 첫 smoke 실행은 Vitis가 공백 포함 원래 cwd로 복귀하다 exit code 1을 냈지만, 테스트 자체는 모두 통과했다.

High-coverage C-sim:

- 실행: `scripts/hls/run_realtime_rtl_engine_coverage_segments.ps1 -ParallelJobs 1`
- 로그: `logs/hls/coverage_segments_rtl_engine/coverage_seed*.log`
- Seeds: 32
- Primary scenarios: 800
- Reset replay scenarios: 160
- Total scenarios: 960
- `df_coef` elements compared: 4,423,680
- `df_coef_mismatches`: 0
- `tlast_mismatches`: 0
- `size_mismatches`: 0
- `extra_output_errors`: 0
- 결론: realtime RTL-engine 경로의 AXI-stream `df_coef` 출력은 테스트된 모든 scenario에서 C++ Q6.10 golden과 bit-exact 일치했다.

## 3. HLS 합성 및 IP Export

스크립트:

- `scripts/hls/run_hls_realtime_rtl_engine_synth_only.tcl`
- `scripts/hls/run_hls_realtime_rtl_engine_export_only.tcl`

주요 리포트:

- `build/hls/subband_q610_realtime_rtl_engine_hls/solution1/syn/report/SubbandRealtimeTopQ610Ip_csynth.rpt`
- `build/hls/subband_q610_realtime_rtl_engine_hls/solution1/impl/ip`
- `build/hls/subband_q610_realtime_rtl_engine_hls/solution1/impl/export.zip`

HLS 결과:

| 항목 | 결과 |
|---|---:|
| Estimated clock | 8.739 ns |
| Estimated Fmax | 114.43 MHz |
| Latency max | 850,101 cycles |
| Latency @ 100 MHz | 8.501 ms |
| BRAM_18K | 194 / 280 |
| DSP | 183 / 220 |
| FF | 55,465 / 106,400 |
| LUT | 50,632 / 53,200 |

4-frame chunk, 10 ms hop 기준 end-to-end 추정:

- 입력 대기: 40 ms
- 계산: 8.501 ms
- 합계: 48.501 ms
- 결론: 50 ms 실시간 요구를 만족한다.

## 4. Vitis HLS cosim

스크립트:

- `scripts/hls/run_hls_realtime_rtl_engine_cosim_only.tcl`

결과:

- C test bench 단계는 smoke pass.
- RTL simulation 단계에서 `0 / 7 transaction`에 머물러 30분 타임박스 초과.
- 판단: 기존에 반복 관찰된 Vitis HLS AXIS/cosim harness hang으로 분리한다. 기능 correctness 근거는 high-coverage C-sim과 이후 보드 DMA 검증으로 둔다.

## 5. Vivado Implementation

스크립트:

- `scripts/vivado/run_vivado_safe.ps1`
- `scripts/vivado/run_vivado_realtime_dma_rtl_engine_impl.tcl`

산출물:

- Bitstream: `build/vivado/rtdma_rtl/realtime_dma_zybo_z7_20.bit`
- XSA: `build/vivado/rtdma_rtl/realtime_dma_zybo_z7_20.xsa`
- Reports: `build/vivado/rtdma_rtl/reports/`

Post-route timing:

| 항목 | 결과 |
|---|---:|
| WNS | +0.127 ns |
| TNS | 0.000 ns |
| WHS | +0.012 ns |
| THS | 0.000 ns |
| Timing | Met |

Post-route utilization:

| 항목 | 사용량 | 한도 | 사용률 |
|---|---:|---:|---:|
| Slice LUTs | 38,789 | 53,200 | 72.91% |
| Slice Registers | 53,861 | 106,400 | 50.62% |
| Block RAM Tile | 89 | 140 | 63.57% |
| DSP48E1 | 189 | 220 | 85.91% |

Post-route power estimate:

| 항목 | 전력 |
|---|---:|
| Total On-Chip Power | 2.312 W |
| Dynamic Power | 2.146 W |
| Device Static Power | 0.166 W |
| Clocks | 0.079 W |
| Block RAM | 0.035 W |
| DSPs | 0.147 W |
| PS7 | 1.530 W |
| `subband_realtime_0` hierarchy | 0.556 W |

Power confidence:

- Overall confidence: Medium
- Design implementation state: High
- Clock/I/O activity: High
- Internal node activity: Medium
- Simulation Activity File: 없음

## 6. DRC 및 주의 사항

DRC:

- Errors: 0
- Critical Warnings: 0
- Warnings/Advisories: DSP input/output pipelining 권고, SmartConnect/DMA 관련 no-routable-load/write-first advisory 등

중요한 주의:

- `write_bitstream`은 성공했다.
- `write_hw_platform -include_bit`은 Vivado non-project style 실행 흐름에서 bit file을 implementation run에서 찾지 못해 실패했고, Tcl fallback으로 bitstream 미포함 XSA를 생성했다.
- 따라서 산출물은 `.bit`와 `.xsa`가 각각 존재한다. Vitis 앱 단계에서 필요하면 `.bit`를 별도로 지정하거나, project run 기반으로 embedded-bit XSA를 다시 만들면 된다.

## 7. 최종 판단

`USE_RTL_BAND_ENGINE` 경로는 현재 작업공간에서 재현 가능한 최종 안정 기준선으로 채택 가능하다.

- C++ Q6.10 golden 대비 high-coverage `df_coef` bit-exact 검증 통과.
- HLS latency `8.501 ms`, 4-frame chunk 기준 end-to-end `48.501 ms`로 50 ms 목표 만족.
- HLS resource가 Zybo Z7-20 한도 내.
- Vivado post-route implementation, bitstream 생성, timing closure 성공.
- post-route resource도 LUT/FF/BRAM/DSP 모두 `xc7z020clg400-1` 한도 내.

ping-pong/SV full 경로는 LUT/OOM/Windows HLS blackbox 안정성 문제가 남아 있으므로, 본 보고서의 최종 구현 근거에는 포함하지 않는다.
