# USE_RTL_BAND_ENGINE 최종 검증 보고서

작성일: 2026-05-24  
대상 top: `SubbandRealtimeTopQ610Ip`  
메인 플래그: `-DUSE_RTL_BAND_ENGINE`  
대상 보드/디바이스: Zybo Z7-20급 `xc7z020clg400-1`  
도구: Vitis HLS 2023.2, Vivado 2023.2

## 1. 채택 기준

최종 보드 후보는 `USE_RTL_BAND_ENGINE` 경로로 고정한다. 다음 경로는 active 메인라인에서 제외한다.

- `USE_SV_GSU_LAYER`
- `USE_SV_GSU_FULL`
- `USE_PROJECTION_EXTERNAL`
- ping-pong weight fetch 실험 경로
- projection external IP 실험 경로

이유는 안정 경로가 이미 C++ Q6.10 golden과 bit-exact 검증, HLS synthesis, Vivado route/bitstream 생성을 통과했고, 실험 경로는 Windows Vitis HLS blackbox/OOM/합성 안정성 문제가 남아 있기 때문이다.

## 2. 기능 검증

### Smoke C-sim

사용 스크립트:

```text
scripts/hls/run_hls_realtime_rtl_engine_csim_only.tcl
```

결과:

- `chunk4 passed`
- `chunk2 passed`
- `chunk1 passed`
- `Realtime 3-band stream smoke test passed`

### High-Coverage C-sim

사용 스크립트:

```text
scripts/hls/run_realtime_rtl_engine_coverage_segments.ps1
```

보존 로그:

```text
release/rtl_engine_board_candidate_20260523/verification_logs/coverage_segments_rtl_engine/
```

검증 결과:

| 항목 | 결과 |
|---|---:|
| Seeds | 32 |
| Primary scenarios | 800 |
| Reset replay scenarios | 160 |
| Total scenarios | 960 |
| Compared `df_coef` elements | 4,423,680 |
| `df_coef_mismatches` | 0 |
| `tlast_mismatches` | 0 |
| `size_mismatches` | 0 |
| `extra_output_errors` | 0 |

결론: realtime RTL-engine 경로의 AXI-stream `df_coef` 출력은 테스트된 모든 scenario에서 C++ Q6.10 golden reference와 bit-exact 일치했다.

## 3. HLS 결과

보존 리포트:

```text
release/rtl_engine_board_candidate_20260523/hls_reports/SubbandRealtimeTopQ610Ip_csynth.rpt
```

HLS IP:

```text
release/rtl_engine_board_candidate_20260523/hls_ip/ip/
release/rtl_engine_board_candidate_20260523/hls_ip/export.zip
```

주요 결과:

| 항목 | 결과 |
|---|---:|
| Estimated clock | 8.739 ns |
| Estimated Fmax | 114.43 MHz |
| Latency max | 850,101 cycles |
| Latency at 100 MHz | 8.501 ms |
| BRAM_18K | 194 / 280 |
| DSP | 183 / 220 |
| FF | 55,465 / 106,400 |
| LUT | 50,632 / 53,200 |

4-frame chunk, 10 ms hop 기준 end-to-end 지연 추정:

| 항목 | 시간 |
|---|---:|
| Input wait | 40.000 ms |
| Compute | 8.501 ms |
| Total | 48.501 ms |

결론: 50 ms 실시간 요구를 만족한다.

## 4. Vivado Post-Route 결과

보존 산출물:

```text
release/rtl_engine_board_candidate_20260523/fpga/realtime_dma_zybo_z7_20.bit
release/rtl_engine_board_candidate_20260523/fpga/realtime_dma_zybo_z7_20.xsa
release/rtl_engine_board_candidate_20260523/fpga/realtime_dma_zybo_z7_20_routed.dcp
release/rtl_engine_board_candidate_20260523/fpga/bd.hwh
release/rtl_engine_board_candidate_20260523/vivado_reports/
```

Timing:

| 항목 | 결과 |
|---|---:|
| WNS | +0.136 ns |
| TNS | 0.000 ns |
| WHS | +0.020 ns |
| THS | 0.000 ns |
| Timing | Met |

Resource:

| 항목 | 사용량 | 한도 | 사용률 |
|---|---:|---:|---:|
| Slice LUTs | 38,814 | 53,200 | 72.96% |
| Slice Registers | 53,861 | 106,400 | 50.62% |
| Block RAM Tile | 89 | 140 | 63.57% |
| DSP48E1 | 189 | 220 | 85.91% |

DRC:

- Errors: 0
- Critical Warnings: 0
- Bitstream generation: PASS

## 5. 전력 추정

본 수치는 실제 전류 측정값이 아니라 Vivado 2023.2 post-route power estimation이다. Simulation Activity File 기반 switching activity는 반영하지 않았으므로 논문에서는 `measured power`가 아니라 `post-route estimated power`로 표현해야 한다.

| 항목 | 전력 |
|---|---:|
| Total On-Chip Power | 2.315 W |
| Dynamic Power | 2.149 W |
| Device Static Power | 0.166 W |
| `subband_realtime_0` accelerator hierarchy | 0.559 W |
| PS7 | 1.530 W |
| DSPs | 0.147 W |
| Block RAM | 0.035 W |
| Clocks | 0.079 W |
| Slice logic | 0.138 W |
| Signals | 0.218 W |

해석:

- 전체 SoC 전력은 PS7와 DMA 테스트 플랫폼의 영향이 크다.
- 제안 accelerator hierarchy는 약 0.559 W로 분리된다.
- DSP 사용률은 높지만, DSP power는 0.147 W 수준이다.
- 100 MHz 단일 클럭에서 48.501 ms end-to-end 추정 지연을 만족하므로, 실시간 처리 성능 대비 전력 근거로 사용할 수 있다.

주의:

- power confidence는 post-route estimate 기준이다.
- 강한 저전력 주장을 위해서는 추후 SAIF/VCD 기반 power analysis 또는 Zybo 보드 전류 측정이 필요하다.

## 6. HLS Cosim 상태

`scripts/hls/run_hls_realtime_rtl_engine_cosim_only.tcl`로 Vitis HLS cosim을 시도했으나, RTL simulation 단계에서 `0 / 7 transaction` 상태로 30분 타임박스를 초과했다. 이는 기존에도 반복 관찰된 AXIS/cosim harness hang으로 분리한다.

최종 correctness 근거는 다음 조합으로 둔다.

- High-coverage C-sim bit-exact PASS
- HLS csynth PASS
- Vivado post-route timing/resource/DRC PASS
- 이후 보드 DMA self-test PASS 필요

## 7. 최종 판단

현재 `USE_RTL_BAND_ENGINE` 구조는 Zybo Z7-20용 bitstream 후보로 채택 가능하다.

채택 근거:

- C++ Q6.10 golden 대비 `df_coef` high-coverage bit-exact PASS
- HLS latency `850,101 cycles = 8.501 ms`
- 4-frame chunk 기준 end-to-end `48.501 ms`
- HLS resource가 `xc7z020clg400-1` 한도 내
- Vivado post-route timing met
- Vivado post-route LUT/FF/BRAM/DSP 한도 내
- DRC error 0
- bitstream, XSA, HWH, ELF가 release bundle에 보존됨

남은 작업:

- 실제 Zybo Z7-20 JTAG target 탐지
- bitstream programming
- bare-metal DMA self-test 실행
- DDR result block에서 `df_coef mismatch = 0` 확인
