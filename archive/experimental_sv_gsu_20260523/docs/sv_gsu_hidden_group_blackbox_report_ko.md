# SV GSU Hidden-Group Blackbox 구현 및 검증 보고서

## 요약

`RunSvGsuHiddenGroupPackedQ610` 경로를 SystemVerilog RTL blackbox로 연결했다. 목적은 HLS C가 512-bit packed tile 연산을 직접 합성하면서 생기던 mux/FF 폭발을 줄이고, GSU hidden-group 연산을 직접 RTL로 제어하기 위한 것이다.

현재 결론은 다음과 같다.

- 기능 검증: 통과. 최종 AXI-stream `df_coef`는 C++ Q6.10 golden reference와 tested scenario 전체에서 bit-exact 일치했다.
- RTL blackbox 연결: 통과. Vitis HLS csynth가 SV blackbox 포함 상태로 완료됐다.
- FPGA 채택성: 아직 미통과. BRAM은 device limit 안으로 들어왔지만 LUT와 latency가 목표를 초과한다.

## 적용 파일

- HLS shim 및 호출 경로: `subband_ref_q610_opt_stage4_latency_stepL2.cpp`
- SV scalar hidden-group core: `rtl/gsu/gsu_hidden_group_scalar_bb.sv`
- SV HLS blackbox wrapper: `rtl/gsu/gsu_hidden_group_packed_bb.sv`
- HLS blackbox JSON: `rtl/gsu/gsu_hidden_group_packed_bb.json`
- HLS C-sim coverage Tcl: `scripts/hls/run_hls_realtime_sv_gsu_blackbox_csim_coverage.tcl`
- HLS csynth Tcl: `scripts/hls/run_hls_realtime_sv_gsu_blackbox_synth_only.tcl`
- Coverage segment runner: `scripts/hls/run_realtime_sv_gsu_blackbox_coverage_segments.ps1`

## 기능 검증 결과

검증 대상은 `SubbandRealtimeTopQ610Ip`의 최종 `df_coef` stream이다. Golden은 기존 C++ Q6.10 reference path이며, Python/PyTorch float 모델 비교가 아니다.

| 항목 | 결과 |
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
| result | PASS |

구간별 로그:

- `logs/hls/coverage_segments/coverage_seed00_08.log`
- `logs/hls/coverage_segments/coverage_seed08_16.log`
- `logs/hls/coverage_segments/coverage_seed16_24.log`
- `logs/hls/coverage_segments/coverage_seed24_32.log`

## RTL 단위 검증

Standalone scalar RTL hidden-group test는 이전 단계에서 통과했다.

- scenarios: 960
- compared elements: 92,160
- mismatches: 0
- timeouts: 0
- DUT line coverage: 약 99.47%
- DUT branch coverage: 약 96.43%
- DUT condition coverage: 100%

이 결과는 arithmetic, MAC tile, sigmoid boundary, gate update, packed lane writeback을 포함한다.

## HLS 합성 결과

리포트:

- `build/hls/subband_q610_realtime_sv_gsu_blackbox_hls/solution1/syn/report/SubbandRealtimeTopQ610Ip_csynth.rpt`

주요 결과:

| 항목 | 결과 | 판정 |
|---|---:|---|
| estimated clock | 8.829 ns | pass |
| top latency max | 2,892,482 cycles | fail |
| top latency @ 100 MHz | 28.925 ms | fail |
| BRAM_18K | 234 / 280 | pass |
| DSP | 89 / 220 | pass |
| FF | 61,779 / 106,400 | pass |
| LUT | 92,276 / 53,200 | fail |

주요 인스턴스:

| Instance | Latency max | BRAM_18K | DSP | FF | LUT |
|---|---:|---:|---:|---:|---:|
| `RunRealtimeGSULayersSvPackedQ610` | 908,389 | 105 | 73 | 34,521 | 39,643 |
| `ProjectionDotProductRealtimePackedTilesRtlDspQ610` | - | 0 | 16 | 1,545 | 36,864 |

## 해석

SV hidden-group blackbox는 기능적으로 연결됐고, full GSU weight buffer 제거 효과로 BRAM은 이전의 초과 상태에서 `234/280`까지 내려왔다. 따라서 BRAM 문제는 개선됐다.

그러나 현재 설계는 최종 FPGA 구현으로 채택하기에는 아직 부족하다. 가장 큰 이유는 두 가지다.

1. GSU 주변 HLS wrapper가 여전히 frame/subband/hidden 반복 제어와 packed tile mux를 많이 만든다.
2. Projection dot-product가 HLS C 경로에서 큰 LUT mux 구조로 남아 `36,864 LUT`를 사용한다.

즉, 이번 단계의 결론은 “SV hidden-group RTL 연결과 bit-exact 검증은 완료됐지만, 최종 latency/LUT 목표를 만족하려면 GSU layer 전체 제어 또는 projection까지 RTL화해야 한다”이다.

## 다음 최적화 우선순위

1. `RunRealtimeGSULayersSvPackedQ610`를 hidden-group 단위 호출이 아니라 layer-level SV engine으로 확장한다.
2. Projection packed dot-product를 SV RTL로 이동해 HLS가 만드는 512-bit mux를 제거한다.
3. layer0/layer1 intermediate tile buffer를 줄여 state/output memory traffic을 낮춘다.
4. HLS blackbox JSON resource estimate를 실제 RTL 사용량에 가깝게 보정해 리포트 과대 추정을 줄인다.
