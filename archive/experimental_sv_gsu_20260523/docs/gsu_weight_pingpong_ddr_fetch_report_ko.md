# GSU Weight Ping-Pong DDR Fetch 적용 및 검증 보고서

## 요약

`SubbandRealtimeTopQ610Ip`의 외부 AXI-stream, AXI-Lite, `weights_q610` M_AXI 인터페이스는 유지하면서, GSU layer의 `weight_ih`/`weight_hh` full-layer tile buffer를 제거하고 hidden row-pair 단위 ping-pong fetch 구조를 추가했다.

기능 검증 결과, realtime `df_coef` 출력은 C++ Q6.10 golden reference와 high-coverage C-sim에서 bit-exact 일치했다.

다만 현재 합성은 SystemVerilog hidden-group blackbox가 아니라 C++ hidden-group 모델을 HLS가 직접 합성한 경로이므로, BRAM은 hard limit 안으로 들어왔지만 LUT/FF/latency는 최종 FPGA 구현 기준을 만족하지 못한다. 즉 ping-pong weight fetch의 기능 구조는 검증됐고, 최종 구현에는 hidden-group RTL blackbox 연결이 필요하다.

## 적용 내용

- 기존 full-layer GSU weight tile cache 제거 방향으로 `RunRealtimeGSULayersSvPackedQ610`를 재구성했다.
- 새 hidden-group helper `RunSvGsuHiddenGroupPackedQ610`를 추가했다.
- 새 DDR row-pair prefetch helper `PrefetchGsuWeightGroupPingPongQ610`를 추가했다.
- `hidden_base` 2개 row 기준으로 `ih[2][7]`, `hh[2][7]`, forget/cell bias, BN mul/add만 ping-pong buffer에 유지한다.
- frame마다 recurrent state snapshot을 만든 뒤, hidden group별로 weight row-pair를 fetch하고 모든 subband에 대해 해당 hidden group을 계산한다.
- ping-pong buffer는 `7 x 512-bit` 축까지 complete partition하여 BRAM bank로 잡히지 않게 했다.
- 합성 재현용 Tcl을 추가했다.

## 주요 코드 위치

- `RunSvGsuHiddenGroupPackedQ610`: `subband_ref_q610_opt_stage4_latency_stepL2.cpp`
- `PrefetchGsuWeightGroupPingPongQ610`: `subband_ref_q610_opt_stage4_latency_stepL2.cpp`
- `RunRealtimeGSULayersSvPackedQ610`: `subband_ref_q610_opt_stage4_latency_stepL2.cpp`
- 합성 Tcl: `scripts/hls/run_hls_realtime_sv_gsu_pingpong_synth_only.tcl`

## 기능 검증 결과

실행 로그:

- `logs/hls/vitis_hls_realtime_sv_gsu_pingpong_csim.log`
- `logs/hls/vitis_hls_realtime_sv_gsu_pingpong_csim_coverage_full.log`

High-coverage C-sim 결과:

| 항목 | 값 |
|---|---:|
| seeds | 32 |
| profiles | 5 |
| chunk patterns | 5 |
| primary scenarios | 800 |
| reset replay scenarios | 160 |
| total scenarios | 960 |
| compared `df_coef` elements | 4,423,680 |
| `df_coef` mismatches | 0 |
| TLAST mismatches | 0 |
| size mismatches | 0 |
| extra output errors | 0 |
| C-sim result | PASS, 0 errors |

결론: ping-pong DDR fetch 경로의 realtime AXI-stream `df_coef` 출력은 tested scenario 전체에서 C++ Q6.10 golden reference와 bit-exact 일치한다.

## HLS 합성 결과

실행 로그:

- `logs/hls/vitis_hls_realtime_sv_gsu_pingpong_partition_synth.log`

주요 리포트:

- `build/hls/subband_q610_realtime_sv_gsu_pingpong_hls/solution1/syn/report/SubbandRealtimeTopQ610Ip_csynth.rpt`
- `build/hls/subband_q610_realtime_sv_gsu_pingpong_hls/solution1/syn/report/p_anonymous_namespace_RunRealtimeGSULayersSvPackedQ610_csynth.rpt`
- `build/hls/subband_q610_realtime_sv_gsu_pingpong_hls/solution1/syn/report/RunSvGsuHiddenGroupPackedQ610_csynth.rpt`

Top-level HLS estimate:

| 항목 | 결과 |
|---|---:|
| latency max | 6,384,194 cycles |
| absolute latency max @ 100 MHz | 63.842 ms |
| estimated clock | 8.829 ns |
| BRAM_18K | 216 / 280 |
| DSP | 28 / 220 |
| FF | 117,458 / 106,400 |
| LUT | 123,176 / 53,200 |

GSU layer estimate:

| 항목 | 결과 |
|---|---:|
| GSU layer latency max | 2,072,293 cycles |
| GSU layer BRAM_18K | 87 |
| GSU layer DSP | 12 |
| GSU layer FF | 90,200 |
| GSU layer LUT | 70,543 |

## 분석

Full `weight_ih_tiles`/`weight_hh_tiles` cache는 제거되었다. 첫 no-blackbox 합성에서는 ping-pong buffer의 `7 x 512-bit` row-pair banks가 BRAM으로 잡혀 120 BRAM을 추가로 사용했으나, tile 축 complete partition 후 해당 BRAM 증가는 사라졌다.

현재 남는 큰 BRAM 항목은 weight cache가 아니라 다음 구조다.

- packed state tiles: layer0/layer1 hx/cx
- layer1 output tile buffer
- layer0 input/output tile buffer
- frame-level previous hx snapshot
- AXI master adapter internal buffer

반면 최종 실패 원인은 BRAM보다 LUT/FF/latency다. `RunSvGsuHiddenGroupPackedQ610`를 HLS C로 직접 합성하면 512-bit packed lane insert/extract, dynamic lane update, wide mux가 과도하게 생성된다. 따라서 이 C 합성 결과는 최종 RTL 품질 기준으로 채택하면 안 된다.

## 결론

이번 단계의 목표였던 GSU full weight buffer 제거 및 DDR row-pair ping-pong fetch 구조는 구현했고, high-coverage C-sim에서 bit-exact 검증을 통과했다.

하지만 최종 FPGA 구현으로 채택하려면 `RunSvGsuHiddenGroupPackedQ610`를 SystemVerilog RTL blackbox로 대체해야 한다. 그때 HLS C 모델은 C-sim golden-equivalent wrapper로 유지하고, synthesis/export에서는 직접 작성한 SV hidden-group module이 MAC, gate update, packed lane writeback을 담당해야 한다.
