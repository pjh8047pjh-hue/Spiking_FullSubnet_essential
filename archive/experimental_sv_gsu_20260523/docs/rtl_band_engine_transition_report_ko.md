# HLS Top 유지 + RTL-Ready Band Engine 최적화/검증 보고서

## 1. 목적

본 작업의 목적은 `SubbandRealtimeTopQ610Ip`의 AXI-stream, AXI-Lite, M_AXI top 인터페이스를 유지하면서, BRAM 사용량이 큰 realtime band 처리 계층을 RTL 전환에 가까운 구조로 재구성해 BRAM과 전력 여지를 줄이는 것이다. 최종 `df_coef` 출력은 기존 C++ Q6.10 golden reference와 bit-exact를 유지하는 것을 최우선 기준으로 두었다.

이번 구현은 hand-written Verilog RTL blackbox를 완성한 단계가 아니라, HLS top 내부에 `USE_RTL_BAND_ENGINE` compile-time path를 추가해 RTL로 옮기기 쉬운 band-engine 구조를 만든 단계다. Vitis HLS가 이 경로에서 RTL을 생성하며, 실제 standalone RTL module의 xsim line/branch/FSM coverage는 다음 단계 검증 항목으로 남는다.

## 2. 구현 변경 사항

- `SubbandRealtimeTopQ610Ip` top interface는 유지했다.
- `USE_RTL_BAND_ENGINE` path를 추가해 기존 HLS path와 새 RTL-ready path를 compile-time으로 전환할 수 있게 했다.
- band state memory를 기존 max-padding 구조에서 compact 구조로 변경했다.
  - 기존 개념: `3 bands * 8 max subbands = 24 subband slots`
  - 변경 후: 실제 subband 수 `8 + 3 + 2 = 13 subband slots`
- projection weight 전체 BRAM buffer를 제거하고, projection row를 DDR packed weight에서 row 단위로 읽어 register row cache에 저장한다.
- packed 256-bit weight unpack 시 runtime lane extraction 대신 compile-time lane extraction을 사용해 큰 mux를 줄였다.
- projection row cache는 complete partition register row로 두어 cyclic bank address mux를 줄였다.
- projection dot parallelism은 LUT 한도 충족을 위해 `24`에서 `16`으로 낮췄다.

## 3. HLS 합성 결과

실행 로그:

- `logs/hls/vitis_hls_realtime_rtl_engine_synth.log`
- `build/hls/subband_q610_realtime_rtl_engine_hls/solution1/syn/report/SubbandRealtimeTopQ610Ip_csynth.rpt`

합성 조건:

| 항목 | 값 |
|---|---:|
| Tool | Vitis HLS 2023.2 |
| Device | `xc7z020clg400-1` |
| Clock target | 10 ns |
| Estimated clock period | 8.739 ns |
| Estimated Fmax | 114.43 MHz |

주요 결과:

| 지표 | 기존 realtime HLS 기준 | RTL-ready path | 변화 |
|---|---:|---:|---:|
| Latency max | 892,507 cycles | 850,101 cycles | -42,406 cycles |
| Latency @100 MHz | 8.925 ms | 8.501 ms | -0.424 ms |
| BRAM_18K | 267 / 280 | 194 / 280 | -73 BRAM_18K |
| DSP | 168 / 220 | 183 / 220 | +15 DSP |
| LUT | 43,763 / 53,200 | 50,632 / 53,200 | +6,869 LUT |
| FF | 52,909 / 106,400 | 55,465 / 106,400 | +2,556 FF |

Zybo Z7-20 한도 대비 현재 RTL-ready path:

| 지표 | 사용량 |
|---|---:|
| BRAM_18K | 194 / 280 = 69.29% |
| DSP | 183 / 220 = 83.18% |
| LUT | 50,632 / 53,200 = 95.17% |
| FF | 55,465 / 106,400 = 52.13% |

해석:

- 1차 목표였던 BRAM 감소는 달성했다. `267 -> 194`로 약 27.3% 감소했다.
- 4-frame compute latency도 `8.925 ms -> 8.501 ms`로 줄어 50 ms realtime budget 안에 남는다.
- LUT는 증가했지만 XC7Z020 한도 안에 들어왔다. 다만 여유가 약 4.8%뿐이라 Vivado post-route에서 최종 확인이 필요하다.
- DSP 사용량은 증가했지만 `183 / 220`으로 한도 안이며, MAC 중심 구조에 DSP를 더 활용한 형태다.

## 4. 검증 결과

Smoke C-sim:

- Log: `logs/hls/vitis_hls_realtime_rtl_engine_csim.log`
- Result:
  - `chunk4 passed`
  - `chunk2 passed`
  - `chunk1 passed`
  - `Realtime 3-band stream smoke test passed`
  - `CSim done with 0 errors`

High-coverage C-sim:

- Log: `logs/hls/vitis_hls_realtime_rtl_engine_csim_coverage.log`
- Testbench: `testbench/subband_realtime_hls_coverage_tb.cpp`
- Golden: existing C++ Q6.10 reference path

최종 coverage summary:

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

결론:

- RTL-ready path의 AXI-stream `df_coef` 출력은 tested scenario 전체에서 C++ Q6.10 golden reference와 bit-exact로 일치했다.
- 검증된 `df_coef` element 수는 `4,423,680`개이며, value mismatch, TLAST mismatch, output size mismatch, extra output error가 모두 0이다.

## 5. 병목과 다음 RTL 전환 대상

이번 합성 분석으로 확인된 핵심 병목은 GSU cell 단독이 아니라 band 처리 계층의 memory/data movement와 projection datapath 구성이다.

- BRAM 병목 원인:
  - 기존 구조는 band별 최대 subband 수 기준으로 state를 padding해 저장했다.
  - projection weight 전체 buffer가 BRAM을 크게 차지했다.
  - 이를 compact state와 row-cache projection으로 바꾸면서 BRAM이 크게 줄었다.
- LUT 병목 원인:
  - band별 projection module이 별도 인스턴스로 만들어지면서 projection controller와 dot datapath가 복제된다.
  - packed weight의 runtime lane extraction은 큰 mux를 만들었고, compile-time lane extraction으로 완화했다.

진짜 hand-written RTL blackbox로 더 진행한다면 우선순위는 다음과 같다.

1. `RunRealtimeProjectionBandRowCachedFixedQ610`에 해당하는 projection row loader + dot-product FSM을 하나의 shared RTL datapath로 작성한다.
2. `RunRealtimeGSULayersSharedBandCompactStateQ610`의 weight loader, GSU MAC/update, compact state memory controller를 명시적 FSM으로 옮긴다.
3. xsim unit testbench에서 Q6.10 function vector를 직접 주입해 line/branch/condition/FSM coverage를 수집한다.
4. HLS top에는 동일 interface를 유지하고 RTL band engine만 blackbox로 연결한다.

현재 단계에서는 C++/HLS function-level high-coverage bit-exact 검증은 완료했지만, standalone RTL module의 line/branch/FSM coverage는 아직 완료로 주장하면 안 된다. 해당 coverage는 hand-written RTL module을 만든 뒤 별도 xsim coverage run으로 수집해야 한다.

