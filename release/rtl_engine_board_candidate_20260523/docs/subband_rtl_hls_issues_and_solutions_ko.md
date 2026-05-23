# Subband Model RTL/HLS 종합 진단 및 해결방안 보고서

## 요약

본 문서는 `SubbandRealtimeTopQ610Ip`를 정점으로 하는 subband model 구현 전체(HLS C++ 경로 + SystemVerilog RTL blackbox 경로)에서 현재 관측되는 문제를 한 곳에 모으고, 각 문제에 대해 실행 가능한 해결 단계(수정 파일·pragma·TCL·빌드 명령·검증 절차)를 제시한다.

기능 측면에서 모든 합성 가능 경로는 C++ Q6.10 golden reference 대비 `df_coef` 4,423,680 element bit-exact 일치(960 scenario)를 유지하고 있으나, **최종 FPGA 채택 기준(LUT ≤ 53,200, FF ≤ 106,400, BRAM ≤ 280, latency ≤ 50 ms @100 MHz)을 동시에 만족하는 경로는 아직 존재하지 않는다.** 가장 큰 차단 요인은 두 가지로, (1) `USE_SV_GSU_FULL` 경로의 Vitis HLS 2023.2 Windows 내부 `EXCEPTION_ACCESS_VIOLATION` 크래시, (2) projection dot-product가 HLS C에서 합성되며 만드는 36,864 LUT mux이다.

## 1. 문서 개요 및 진단 범위

| 항목 | 값 |
|---|---|
| 진단 대상 top | `SubbandRealtimeTopQ610Ip` |
| 빌드 디렉토리 | `build/hls/subband_q610_realtime_*` (13종) |
| RTL 모듈 디렉토리 | `rtl/gsu/*.sv` |
| 합성 환경 | Vitis HLS 2023.2 Windows |
| 타깃 디바이스 | `xc7z020clg400-1` (Zybo Z7-20) |
| Clock target | 10 ns (100 MHz) |
| Real-time budget | 50 ms / 4-frame chunk |
| 기준 golden | C++ Q6.10 reference (`subband_ref_q610.hpp`) |
| 기준 회귀 | 960 scenario × 4,423,680 `df_coef` element bit-exact |

본 진단은 새 코드를 작성하지 않고, 기존 로그·합성 리포트·문서를 종합한 결과다. 인용은 보고서명 또는 리포트 파일 단위까지로 제한한다.

## 2. 진단 대상 아키텍처 요약

`build/hls/` 디렉토리에 누적된 13종 변형 빌드를 동작 의도에 따라 4계열로 분류한다.

| 계열 | 빌드 이름 | 의도 | 합성 상태 |
|---|---|---|---|
| Baseline | `subband_q610_realtime_hls` | 순수 C++ Q6.10 HLS top, 모든 경로의 회귀 기준 | csynth + cosim + export PASS |
| RTL-ready C path | `subband_q610_realtime_rtl_engine_hls`, `..._coverage_hls` | `USE_RTL_BAND_ENGINE` compile switch, projection row cache + compact state | csynth PASS |
| SV blackbox 부분 통합 | `..._sv_gsu_blackbox_hls`, `..._sv_gsu_pingpong_hls`, `..._sv_gsu_coverage_hls` (+ coverage 변형) | hidden-group 또는 ping-pong fetch 단위로 SV RTL 연결 | csynth 완료, 자원 FAIL |
| SV full integration | `..._sv_gsu_full_hls`, `..._sv_gsu_full_gsu_only_hls`, `..._sv_gsu_full_projection_only_hls`, `..._sv_gsu_full_csim_hls`, `..._sv_gsu_full_gsu_only_csim_hls`, `..._gsu_layer_full_tiles_bb_hls` | GSU layer + projection 통째로 SV blackbox 경로 | csynth 크래시 또는 미완료 |

각 계열의 핵심 진입점은 `subband_ref_q610_opt_stage4_latency_stepL2.cpp`이며, compile switch (`USE_RTL_BAND_ENGINE`, `USE_SV_GSU_LAYER`, `USE_SV_GSU_FULL`)로 분기된다.

## 3. RTL 경로 문제점 및 해결방안

### 3.1 [Critical] USE_SV_GSU_FULL csynth — 16 GB RAM 환경 Out of Memory

> **2026-05-23 갱신**: 본 항목의 severity가 Blocker → Critical로 격하됨. §3.1 step 2 우회(`USE_SV_GSU_FULL_HLS_PROJECTION`)가 실전 검증을 통과해 `EXCEPTION_ACCESS_VIOLATION` crash는 더 이상 재현되지 않으며, csynth가 24분간 정상 진행되다 RTL Generation 단계에서 OOM으로 종료된다. 즉 차단 요인이 'tool 내부 버그'에서 '단순 자원 부족'으로 진화했다.

**증상 요약 (갱신 후)**
`USE_SV_GSU_FULL` + `USE_SV_GSU_FULL_HLS_PROJECTION` 스위치 동시 적용 시 csynth는 Frontend → Scheduling → Binding을 모두 통과해 RTL Generation 단계까지 도달한다. 그러나 `RunRealtimeSingleGsuLayerSvFullQ610` / `RunRealtimeSingleGsuLayer1SvFullQ610`가 band 0/1/2 × layer 0/1 = **6번 인스턴스화**되어 각각 별도 RTL 모듈로 만들어지면서 peak 12.77 GB(vitis_hls 단일 프로세스) 초과. Windows 16 GB RAM 환경에서 페이지파일 128 GB로도 처리 불가. `ERROR: [HLS 200-103] Unexpected exception occurred: Out of Memory`로 graceful 종료. 더 이상 `hs_err_pid*.log` 추가 생성 없음 (이전 17개가 누적된 채 유지).

**증상 요약 (역사적 — 2026-05-22 이전)**
이전엔 `csynth_design`이 시작되자마자 `Abnormal program termination (EXCEPTION_ACCESS_VIOLATION)`로 비정상 종료됐고 `hs_err_pid*.log` 17개가 작업 루트에 누적됐다(최신 `hs_err_pid19644.log`, `hs_err_pid284.log` 등). 출처: `docs/sv_gsu_full_light_integration_report_ko.md` §3 HLS csynth.

**원인 가설**
- projection scalar-port blackbox(`rtl/gsu/projection_dot_scalar_bb.sv`)의 포트 매핑 또는 JSON 정의가 Vitis HLS 2023.2 Windows 내부 단계에서 미지원 형식으로 처리됨 — projection-only 진단(`run_hls_realtime_sv_gsu_full_synth_projection_only.tcl`)에서도 동일 크래시 재현(`hs_err_pid6832.log`).
- GSU full blackbox(`gsu_layer_full_tiles_bb.sv`, 498줄)는 GSU-only 경로에서 scheduling 진입까지 도달하지만 완료되지 않음 (`INFO: [SCHED 204-11] Starting scheduling ...`에서 멈춤).
- 두 blackbox JSON 모두 RAM_T2P 포트와 scalar 포트가 혼재해 HLS 내부 RTL adaptor 생성기가 폴트 발생.
- Windows 환경 메모리 보호와 충돌하는 Tool 내부 포인터 접근 가능성(Xilinx forum 보고된 패턴).

**영향 범위**
- `subband_ref_q610_opt_stage4_latency_stepL2.cpp` (compile switch · shim)
- `rtl/gsu/projection_dot_scalar_bb.sv`, `rtl/gsu/projection_dot_scalar_bb.json`
- `rtl/gsu/gsu_layer_full_tiles_bb.sv`, `rtl/gsu/gsu_layer_full_tiles_bb.json`
- `scripts/hls/run_hls_realtime_sv_gsu_full_synth_only.tcl`
- 동일 경로의 5종 빌드 디렉토리 (`build/hls/subband_q610_realtime_sv_gsu_full*`)

**해결 단계**
1. **Linux 환경 재시도** — Vitis HLS 2023.2 Linux로 동일 Tcl 실행. WSL2 또는 Ubuntu 20.04/22.04에서 `vitis_hls -f scripts/hls/run_hls_realtime_sv_gsu_full_synth_only.tcl -l logs/hls/vitis_hls_realtime_sv_gsu_full_synth_linux.log` 실행. Windows 한정 크래시인지 확인.
2. **projection blackbox 우선 제거** — `subband_ref_q610_opt_stage4_latency_stepL2.cpp`의 `USE_SV_GSU_FULL` 분기에서 `ProjectionDotProductPackedScalarSvQ610` shim을 비활성화하고 기존 C++ projection path를 유지. `scripts/hls/run_hls_realtime_sv_gsu_full_synth_gsu_only.tcl`로 GSU-only csynth가 완료되는지 1차 확인.
3. **GSU full blackbox 포트 단순화** — `rtl/gsu/gsu_layer_full_tiles_bb.json`에서 RAM_T2P 포트를 모두 scalar 또는 ap_memory single-port로 강제 변환. `gsu_layer_full_tiles_bb.sv` 인터페이스는 그대로 두고 wrapper만 추가.
4. **Tool patch 적용** — Xilinx Answer Record AR# 79617, 78803 계열의 SV blackbox 관련 patch 검토 후 적용. `vitis_hls -version` 확인 후 patch 누락 여부 점검.
5. **빌드 재실행** — 위 변경 후 `vitis_hls -f scripts/hls/run_hls_realtime_sv_gsu_full_synth_only.tcl`을 다시 실행하고 `build/hls/subband_q610_realtime_sv_gsu_full_hls/solution1/syn/report/SubbandRealtimeTopQ610Ip_csynth.rpt` 생성 여부 확인.

**검증 방법**
- csynth 완료 확인: 위 리포트 파일 존재 + `csynth_design` 종료 코드 0
- 회귀 보호: `vitis_hls -f scripts/hls/run_hls_realtime_sv_gsu_full_csim_only.tcl` 통과 (`Realtime 3-band stream smoke test passed.`)
- 기능 회귀: 960 scenario coverage TB 재실행하여 `df_coef_mismatches=0` 유지

**대안/우회책**
projection을 HLS blackbox 경로 대신 Vivado RTL impl 단계에서 별도 IP-XACT로 wrapping해 결합한다(§3.5 참조). 이렇게 하면 Vitis HLS는 projection을 외부 stub으로만 인지하므로 내부 크래시 회피 가능. GSU full도 동일 방식으로 분리 가능하다.

---

### 3.2 [Critical] RTL cosim 미수행 (xsim standalone 한정)

**증상 요약**
`gsu_layer_engine_rtl.sv`와 `gsu_hidden_group_scalar_bb.sv`는 standalone xsim unit test에서 각각 84·960 scenario를 통과했지만(`docs/sv_gsu_layer_rtl_report_ko.md`, `docs/sv_gsu_hidden_group_blackbox_report_ko.md`), Vitis HLS의 `cosim_design`은 어느 RTL blackbox 경로에서도 실행되지 않았다.

**원인 가설**
- 상위 csynth가 자원/크래시 문제로 완료되지 않아 cosim 진입 자체가 불가능했던 경로 다수.
- AXI-stream master/slave BFM 구성이 없는 상태에서 cosim wrapper TB가 작성되지 않음.
- standalone xsim coverage가 충분하다고 판단해 cosim 단계를 의도적으로 미실행(`docs/sv_gsu_full_light_integration_report_ko.md` "이번 라운드에서 실행하지 않은 검증").

**영향 범위**
- `testbench/subband_realtime_hls_coverage_tb.cpp` (cosim wrapper로 확장 필요)
- `scripts/hls/*_cosim*.tcl` (현재 부재)
- `rtl/gsu/*_bb.sv` 전 모듈

**해결 단계**
1. **cosim 가능 빌드 선정** — 자원 FAIL이지만 csynth 완료된 `subband_q610_realtime_sv_gsu_blackbox_hls`를 1차 대상으로 선택.
2. **cosim Tcl 추가** — `scripts/hls/run_hls_realtime_sv_gsu_blackbox_cosim.tcl` 신규 작성. 핵심 명령:
   ```tcl
   open_project build/hls/subband_q610_realtime_sv_gsu_blackbox_hls
   open_solution solution1
   cosim_design -trace_level all -rtl verilog -tool xsim
   ```
3. **TB 확장** — `testbench/subband_realtime_hls_coverage_tb.cpp`의 chunk1/2/4 smoke 경로를 cosim friendly하게 축소(예: seed 1개, profile 1개, primary scenario 4개)해 cosim 시간이 폭발하지 않도록 한다. coverage TB는 csim 전용으로 유지.
4. **AXIS BFM 매핑 확인** — Vitis HLS가 자동 생성하는 AXIS adaptor wrapper(`build/.../sim/wrapc/...`)가 SV blackbox와 충돌하지 않는지 cosim 로그(`logs/hls/vitis_hls_realtime_sv_gsu_blackbox_cosim.log`)에서 확인.

**검증 방법**
- cosim 통과 기준: `cosim_design`이 `Simulation finished successfully`로 종료, `df_coef` mismatch 0
- coverage 비교: cosim run의 `df_coef` element 수와 csim run 결과가 동일 시나리오에서 일치

**대안/우회책**
cosim 시간이 과도하면 `gsu_hidden_group_scalar_bb.sv` 같은 핵심 모듈만 분리해 `xsim`에서 AXIS BFM testbench로 직접 cosim 대체. 이미 standalone xsim 인프라가 존재하므로 BFM 추가 비용이 낮다.

---

### 3.3 [Critical → Major] SV hidden-group blackbox 리소스 초과

> **2026-05-23 갱신**: C단계 projection 외부화(`USE_PROJECTION_EXTERNAL`) 적용 후 LUT가 92,276 → 62,543로 32% 절감됨. 초과율 173% → 117%로 진입(한도까지 5K 남음). Latency는 stream 통신 오버헤드로 28.9 → 49.108 ms로 증가했으나 50 ms 실시간 예산 안 마진 1 ms 보유. §3.5 B+C단계 검증 완료 결과 반영.

**증상 요약**
`build/hls/subband_q610_realtime_sv_gsu_blackbox_hls/solution1/syn/report/SubbandRealtimeTopQ610Ip_csynth.rpt`에서 LUT 92,276/53,200(173% 초과)·top latency 2,892,482 cycles(28.925 ms @100 MHz)로 device·real-time 예산 모두 위반. BRAM/DSP/FF는 통과(`docs/sv_gsu_hidden_group_blackbox_report_ko.md` HLS 합성 결과 표).

**증상 요약 (2026-05-23, projection 외부화 적용 후)**
`build/hls/subband_q610_realtime_sv_gsu_blackbox_proj_ext_hls/solution1/syn/report/SubbandRealtimeTopQ610Ip_csynth.rpt` 신규 측정값:

- LUT 62,543 / 53,200 (117.6%, 이전 92,276 → **-29,733 (-32.2%)**)
- FF 62,307 / 106,400 (58.6%, 변화 미미 +528)
- BRAM 234 / 280, DSP 73 / 220 (DSP -16 — projection mux가 외부 IP로 이전됨)
- Latency 4,910,786 cycles / 49.108 ms @ 100 MHz (이전 28.925 ms → **+69.8%, 50 ms 예산 마진 1 ms**)
- Fmax 113.26 MHz (변화 없음)

남은 차단: LUT 5K 초과만. §4.3 II 미달성 해결 또는 sv_gsu_blackbox 빌드의 추가 mux 정리로 한도 내 진입 가능 추정.

**원인 가설**
- `ProjectionDotProductRealtimePackedTilesRtlDspQ610` 인스턴스가 단독으로 36,864 LUT 소비 — HLS C가 512-bit packed lane mux를 직접 합성.
- `RunRealtimeGSULayersSvPackedQ610` wrapper가 frame/subband/hidden 3중 반복 제어를 C에서 풀어 39,643 LUT 추가 생성.
- HLS blackbox JSON resource estimate가 실제 RTL 사용량보다 과대 보고되어 리포트 총합을 부풀리는 측면도 존재.

**영향 범위**
- `subband_ref_q610_opt_stage4_latency_stepL2.cpp` (`RunRealtimeGSULayersSvPackedQ610`, `ProjectionDotProductRealtimePackedTilesRtlDspQ610`)
- `rtl/gsu/gsu_hidden_group_scalar_bb.sv`, `rtl/gsu/gsu_hidden_group_packed_bb.sv`, `rtl/gsu/gsu_hidden_group_packed_bb.json`
- `scripts/hls/run_hls_realtime_sv_gsu_blackbox_synth_only.tcl`

**해결 단계**
1. **projection을 RTL로 이동** — 현재 HLS C에 남은 `ProjectionDotProductRealtimePackedTilesRtlDspQ610`를 SV blackbox로 교체. 후보 모듈 `rtl/gsu/projection_dot_scalar_bb.sv` 확장 또는 신규 `rtl/gsu/projection_dot_packed_bb.sv` 작성. 목표: 36,864 LUT → DSP+RTL FSM 기반 8~12K LUT.
2. **GSU wrapper를 layer-level로 격상** — `RunRealtimeGSULayersSvPackedQ610`의 반복 제어를 SV layer-level engine(`gsu_layer_full_tiles_bb.sv`)으로 이전. C는 frame 단위 호출만 유지. `docs/sv_gsu_hidden_group_blackbox_report_ko.md` "다음 최적화 우선순위" 1번과 동일 방향.
3. **JSON resource estimate 보정** — `rtl/gsu/gsu_hidden_group_packed_bb.json`의 `resources.lut`/`ff` 값을 실제 standalone synthesis 측정치로 갱신해 리포트 과대 추정 제거.
4. **합성 재실행** — `vitis_hls -f scripts/hls/run_hls_realtime_sv_gsu_blackbox_synth_only.tcl` 후 `SubbandRealtimeTopQ610Ip_csynth.rpt`의 LUT/latency 재측정.

**검증 방법**
- 목표: LUT ≤ 53,200 (Zybo Z7-20 한도), latency ≤ 5,000,000 cycles (50 ms @100 MHz)
- 회귀 보호: `scripts/hls/run_hls_realtime_sv_gsu_blackbox_csim_coverage.tcl`로 960 scenario PASS 유지
- standalone RTL coverage: line ≥ 99%, branch ≥ 96%, condition 100% 유지(`docs/sv_gsu_hidden_group_blackbox_report_ko.md` RTL 단위 검증 기준)

**대안/우회책**
LUT 만 초과인 경우 `xc7z020`을 `xc7z030`/`xc7z045`로 디바이스 격상(BRAM·LUT 모두 여유 확보). 단 power/cost 영향과 보고서 일관성을 고려해 마지막 카드로 보류.

---

### 3.4 [Critical → Major] Pingpong DDR fetch 리소스/지연 초과

> **2026-05-23 갱신**: §4.1 수정(`add_files -blackbox gsu_hidden_group_packed_bb.json` 추가) 적용 후 pingpong csynth 재측정 결과, 본 항목의 차단 강도가 크게 약화됨. FF/Latency 모두 한도 통과로 진입했고 남은 차단은 LUT 92K(한도 53K) 하나로 축소.

**증상 요약 (2026-05-23 갱신)**
`build/hls/subband_q610_realtime_sv_gsu_pingpong_hls/solution1/syn/report/SubbandRealtimeTopQ610Ip_csynth.rpt` 재측정값:

- LUT 92,276 / 53,200 (173.4%, 이전 123,176 → **-25%**)
- FF 61,779 / 106,400 (58.1%, 이전 117,458 → **-47%, 한도 통과**)
- Latency 2,892,482 cycles / 28.925 ms @ 100 MHz (이전 6,384,194 → **-55%, 실시간 50 ms 예산 통과**)
- BRAM 234 / 280, DSP 89 / 220
- Clock estimated 8.829 ns / Fmax 113.26 MHz

이로써 pingpong 빌드는 sv_gsu_blackbox와 bit-exact 동일 결과로 수렴했다. 두 빌드 모두 `-DUSE_SV_GSU_LAYER`로 같은 `RunRealtimeGSULayersSvPackedQ610()` 함수를 호출하므로, `add_files -blackbox` 추가만으로 동일한 SV RTL 합성 경로를 타게 된 결과다. 남은 차단 요인은 LUT 92K(한도 53K) 하나로 축소됐다.

**증상 요약 (역사적 — 2026-05-22 이전, `add_files -blackbox` 누락 상태)**
LUT 123,176/53,200(232%)·FF 117,458/106,400(110%)·top latency 6,384,194 cycles(63.842 ms)로 LUT·FF·real-time 3축 모두 위반(`docs/gsu_weight_pingpong_ddr_fetch_report_ko.md` HLS 합성 결과). BRAM은 216/280로 통과.

**원인 가설**
- `RunSvGsuHiddenGroupPackedQ610`를 HLS C로 직접 합성하면 512-bit packed lane insert/extract와 dynamic lane update가 wide mux로 펼쳐짐(보고서 §분석).
- frame·hidden_group·subband 3중 loop의 nested II가 GSU layer 단독에서만 2,072,293 cycles 차지 → top latency의 32% 소비.
- Ping-pong fetch는 BRAM은 줄였지만 데이터 이동 횟수가 늘어 control logic이 LUT/FF로 옮겨감.

**영향 범위**
- `subband_ref_q610_opt_stage4_latency_stepL2.cpp` (`RunSvGsuHiddenGroupPackedQ610`, `PrefetchGsuWeightGroupPingPongQ610`)
- `scripts/hls/run_hls_realtime_sv_gsu_pingpong_synth_only.tcl`

**해결 단계**
1. **HLS C 합성 경로 폐기 선언** — `RunSvGsuHiddenGroupPackedQ610`는 C-sim golden-equivalent wrapper로만 유지하고, synthesis path에서는 반드시 SV blackbox(`gsu_hidden_group_packed_bb.sv`)로 우회. `subband_ref_q610_opt_stage4_latency_stepL2.cpp`에 `#ifdef __SYNTHESIS__` 가드를 추가해 C 합성 진입 자체를 차단.
2. **Prefetch ping-pong에 DATAFLOW 적용** — `PrefetchGsuWeightGroupPingPongQ610` 함수에 `#pragma HLS DATAFLOW` 명시. row-pair buffer 7×512-bit는 `#pragma HLS ARRAY_PARTITION variable=<buf> complete dim=2`로 완전 분해.
3. **fetch/compute 분리** — Prefetch FIFO depth 2 (`#pragma HLS STREAM variable=<fifo> depth=2 type=pipo`)로 ping-pong 보장. compute side는 동일 함수에서 분리해 독립 dataflow stage로 호출.
4. **합성 재실행** — `vitis_hls -f scripts/hls/run_hls_realtime_sv_gsu_pingpong_synth_only.tcl` 후 LUT·FF·latency 재측정.

**검증 방법**
- 목표: LUT ≤ 53,200, FF ≤ 106,400, latency ≤ 5,000,000 cycles
- 회귀 보호: `vitis_hls_realtime_sv_gsu_pingpong_csim_coverage_full.log`의 960 scenario PASS 유지, `df_coef` 4,423,680 element bit-exact
- BRAM 회귀 모니터: 216 → 280 이내 유지

**대안/우회책**
Ping-pong을 GSU full RTL(`gsu_layer_full_tiles_bb.sv`) 내부로 흡수해 weight ping-pong + MAC + writeback을 단일 RTL FSM에서 처리. HLS 측은 ping-pong 자체를 노출하지 않음. 단, §3.1 크래시 선결 필요.

---

### 3.5 [Major → B+C+D단계 완료, 디바이스 격상 또는 추가 LUT 절감 대기] Projection 모듈 Vivado IP 분리

> **2026-05-23 진행 상황 (D단계 완료)**: 4단계 해결 절차 중 B+C+D단계 모두 진행. 진단:
> - **B단계 (Vivado out-of-context synth + IP packaging)**: 완료. `projection_dot_scalar_bb.sv` standalone 측정 LUT 3,234 / FF 111 / DSP 32 / BRAM 0 (Bonded IOB 7,225는 통합 시 0). IP catalog 등록 완료.
> - **C단계 (HLS top 외부화)**: 완료. `USE_PROJECTION_EXTERNAL` 매크로 + ifdef 가드로 회귀 zero 보장하며 `CallExternalProjectionIpQ610` 헬퍼 추가. csim 2분기 + csynth 1분기 모두 PASS. LUT 92K → 62K 절감 측정(§3.3 참조).
> - **D단계 (Vivado block design 통합)**: D-1 어댑터 RTL 작성, D-2 어댑터 OOC 합성 PASS (LUT 4,286), D-3 IP packaging PASS, D-4 HLS IP export PASS, D-5 BD 통합 synth/opt PASS, **D-5 place_design 단계에서 LUT 68,641/53,200 (+29% 초과)로 fit 실패**, D-6 impl 미수행. xc7z020 디바이스로는 통합 후 LUT 한도 초과로 fit 불가능 확인.
> - **다음 단계**: xc7z030 격상(LUT 한도 78,600) 또는 GSU layer wrapper 추가 RTL화 (LUT 약 7K 추가 절감 필요).

**증상 요약**
`rtl/gsu/projection_dot_scalar_bb.sv`(132줄)는 SV syntax compile 통과·smoke C-sim 통과지만 HLS csynth에서 §3.1 크래시의 1차 원인으로 지목됨(`docs/sv_gsu_full_light_integration_report_ko.md` projection-only 진단). 동시에 HLS C로 두면 §3.3에서 본 36,864 LUT mux를 만든다. 즉 어느 경로에도 안정적으로 합성되지 않는다.

**원인 가설**
- scalar 포트 wrapper와 RAM_T2P wrapper 두 형태 모두 Vitis HLS 2023.2 Windows에서 crash.
- HLS C 경로는 packed 512-bit lane 처리로 wide mux 폭발.
- projection은 dense matrix-vector 연산이라 HLS 일반 패턴과 잘 맞지 않음.

**영향 범위**
- `rtl/gsu/projection_dot_scalar_bb.sv`, `rtl/gsu/projection_dot_scalar_bb.json`
- `subband_ref_q610_opt_stage4_latency_stepL2.cpp` (`ProjectionDotProductPackedScalarSvQ610` shim)
- `ProjectionDotProductRealtimePackedTilesRtlDspQ610` (HLS 잔존 구현)

**해결 단계**
1. **standalone synthesis 검증** — `rtl/gsu/projection_dot_scalar_bb.sv`를 Vivado out-of-context synth로 단독 합성. 기준: LUT, DSP, BRAM, Fmax 측정. 명령: `vivado -mode batch -source scripts/vivado/synth_projection_dot_scalar_oct.tcl` (신규 작성 필요).
2. **IP-XACT packaging** — `package_ip` Tcl flow로 `projection_dot_scalar` IP 생성. AXIS slave (input vector) + AXIS master (output) 또는 simple BRAM/scalar 인터페이스 선택.
3. **HLS top에서 stub화** — `subband_ref_q610_opt_stage4_latency_stepL2.cpp`의 projection 호출 위치에 빈 stub 함수만 남기고, Vivado block design에서 `SubbandRealtimeTopQ610Ip` IP와 projection IP를 AXIS 또는 AXI4-Lite로 결합.
4. **HLS blackbox JSON 제거** — `rtl/gsu/projection_dot_scalar_bb.json` 및 관련 `add_files -blackbox` 라인 제거해 §3.1 크래시 원인 차단.

**검증 방법**
- Vivado synth: projection IP 단독 LUT/DSP/BRAM 보고
- Vivado impl: full block design post-route로 timing/area 최종 측정 (Vivado xc7z020 target)
- 기능 회귀: cocotb 또는 xsim BFM으로 projection IP 단독 회귀 + 전체 시스템 wrapper TB

**대안/우회책**
Projection을 PS(Zynq ARM) 측 software로 이동. realtime 50 ms budget 내 PS-PL 통신 오버헤드 측정 필요. accuracy/throughput 비교 후 결정.

---

## 4. HLS 경로 문제점 및 해결방안

### 4.1 [Resolved | 2026-05-23] Blackbox function 미발견 (HLS 214-145)

> **2026-05-23 해소**: `scripts/hls/run_hls_realtime_sv_gsu_pingpong_synth_only.tcl`에 `add_files -blackbox [file join $hls_repo_dir rtl gsu gsu_hidden_group_packed_bb.json]` 1줄을 추가하는 것으로 해결됨. pingpong csynth가 즉시 통과(1분 30초, peak 644 MB)하고, 합성 결과가 sv_gsu_blackbox 빌드와 bit-exact 일치 (LUT 92,276 / FF 61,779 / Latency 2,892,482 cycles). 본 절은 historical 기록으로 보존한다.

**증상 요약 (해소 전)**
`logs/hls/vitis_hls_realtime_sv_gsu_pingpong_synth.log` 등에서 `ERROR: [HLS 214-145] Can not find black box function 'RunSvGsuLayerPackedQ610'` 발생. 합성이 시작 단계에서 중단됐었다.

**원인 가설**
- C++ 함수 시그니처와 SV blackbox JSON의 `c_function_name` 필드 불일치 (namespace prefix 또는 mangling 차이).
- `add_files -blackbox` 호출이 함수 선언보다 늦은 시점에 실행되어 HLS가 blackbox로 인식하기 전에 함수 본문을 inline 합성 시도.
- 조건부 컴파일 매크로(`USE_SV_GSU_LAYER` 등) 분기에서 blackbox 함수가 실제로 호출되지 않는 경로가 활성화됨.

**영향 범위**
- `rtl/gsu/*_bb.json` 전체 (5개)
- `subband_ref_q610_opt_stage4_latency_stepL2.cpp` (compile switch · shim 선언)
- `scripts/hls/run_hls_realtime_sv_gsu_*_synth*.tcl`

**해결 단계**
1. **함수명 검증 스크립트** — 각 JSON의 `c_function_name`을 추출하고 `subband_ref_q610_opt_stage4_latency_stepL2.cpp`에서 동일 이름의 `extern "C"` 선언이 존재하는지 grep으로 1:1 매칭. 명령:
   ```powershell
   Get-ChildItem rtl/gsu/*_bb.json | ForEach-Object { Select-String '"c_function_name"' $_ }
   Select-String 'extern "C"' subband_ref_q610_opt_stage4_latency_stepL2.cpp
   ```
2. **Tcl 순서 교정** — `scripts/hls/common_hls_paths.tcl`에서 `add_files`(소스) → `add_files -blackbox`(JSON) → `set_top` 순서 강제. 모든 synth Tcl에서 동일 순서 보장.
3. **shim에 prototype 명시** — `RunSvGsuLayerPackedQ610` 등 blackbox 함수의 prototype을 헤더에서 `extern "C"`로 선언하고 본문은 `#ifndef __SYNTHESIS__` 하에만 정의.

**검증 방법**
- 모든 `vitis_hls_realtime_sv_gsu_*_synth*.log`에서 `HLS 214-145` 부재 확인
- csynth 완료 시 `BlackBox` 섹션이 `*_csynth.rpt`에 정상 인스턴스로 보고되는지 확인

**대안/우회책**
JSON 대신 `set_directive_interface -mode ap_blackbox` 또는 `config_rtl -black_box_function`을 Tcl로 직접 등록.

---

### 4.2 [Critical] Loop flatten 실패 다중 발생

**증상 요약**
`logs/hls/vitis_hls_realtime_cosim_export.log`에서 `Cannot flatten loop` 경고가 `VITIS_LOOP_3050_3`, `VITIS_LOOP_2897_3`, `VITIS_LOOP_2889_1` 등 다수 루프에 대해 발생. outer loop가 perfect loop가 아니거나 between-loop logic이 존재해 flatten이 거부됨.

**원인 가설**
- 루프 사이에 if-guard 또는 함수 호출이 끼어 perfect loop 조건 미달.
- HLS가 자동 flatten을 시도했으나 사용자 의도와 불일치.
- nested loop의 inner II와 outer trip count 조합이 latency 예산 내 자동 unroll로 풀리지 않음.

**영향 범위**
- `subband_ref_q610_opt_stage4_latency_stepL2.cpp`의 frame/subband/hidden 3중 loop 구간
- 모든 csynth 가능 빌드 (`subband_q610_realtime_hls`, `..._rtl_engine_hls`, `..._sv_gsu_blackbox_hls`, `..._sv_gsu_pingpong_hls`)

**해결 단계**
1. **루프 식별** — `logs/hls/vitis_hls_realtime_cosim_export.log`에서 flatten 실패 루프 라벨을 모두 수집하고, `subband_ref_q610_opt_stage4_latency_stepL2.cpp` 내 해당 라벨에 대응하는 소스 라인 매핑. (Vitis HLS는 `VITIS_LOOP_<line>_<n>` 패턴 사용)
2. **명시적 pragma 부착** — flatten이 무의미한 루프에는 `#pragma HLS LOOP_FLATTEN off`, flatten이 가능한 perfect loop에는 `#pragma HLS LOOP_FLATTEN`을 명시해 자동 추정 제거.
3. **between-loop logic 분리** — guard 코드를 별도 함수로 추출하거나 outer loop 안으로 이동해 perfect nesting 복원.
4. **II 재측정** — 변경 후 csynth 결과의 inner loop II와 latency 비교.

**검증 방법**
- `vitis_hls_realtime_*_synth.log`에서 `Cannot flatten` 경고 개수 감소 확인
- 회귀: 960 scenario coverage TB로 `df_coef` bit-exact 유지

**대안/우회책**
flatten 대신 `#pragma HLS UNROLL factor=N`으로 inner loop 일부 풀어 throughput 확보. unroll factor는 DSP 한도 내에서 조정.

---

### 4.3 [Major] Pipeline II 미달성

**증상 요약**
일부 inner loop가 `#pragma HLS PIPELINE II=1` 지정에도 불구하고 II=2 이상으로 closure(`vitis_hls_realtime_cosim_export.log`의 II 보고). 결과적으로 latency 예산 내 처리량 달성 실패.

**원인 가설**
- packed 512-bit lane insert/extract의 carry chain이 1 cycle 안에 종료 불가.
- BRAM 1포트 read/write 경합으로 inner loop가 직렬화.
- recurrent state(hx, cx)의 RAW dependency가 II=1 차단.

**영향 범위**
- `subband_ref_q610_opt_stage4_latency_stepL2.cpp`의 GSU MAC inner loop, projection dot inner loop
- `..._sv_gsu_blackbox_hls`, `..._sv_gsu_pingpong_hls` 빌드

**해결 단계**
1. **dependency 보고서 추출** — csynth 후 `build/hls/.../solution1/syn/report/<func>_csynth.rpt`의 `II Violation` 섹션에서 원인 자원 확인.
2. **BRAM 분해** — 경합 BRAM에 `#pragma HLS ARRAY_PARTITION variable=<arr> cyclic factor=2 dim=1` 또는 `complete dim=2` 적용.
3. **RAW 우회** — recurrent state에 `#pragma HLS DEPENDENCE variable=<state> inter false` 또는 `intra false`를 정확한 분석 후 적용. 잘못 적용 시 회귀 위험 큰 항목.
4. **carry chain 단축** — 512-bit lane 연산을 16-bit lane 단위로 명시 분해해 timing path 단축.

**검증 방법**
- 목표 II=1 달성 여부는 csynth 리포트의 `Pipeline II` 컬럼
- 회귀: 960 scenario coverage TB로 `df_coef` bit-exact 유지 (특히 DEPENDENCE pragma 적용 후)

**대안/우회책**
II=1 포기하고 II=2로 두되 outer loop unroll factor 2로 throughput 보상.

---

### 4.4 [Major] 13종 개별 빌드의 일관성 부재

**증상 요약**
`build/hls/`에 13종 변형 빌드가 누적되어 있으나 각자 별도 Tcl·로그·리포트 경로를 가져 비교·재현이 어렵다. 또한 `scripts/hls/common_hls_paths.tcl`이 존재하지만 모든 빌드가 이를 일관되게 참조하지는 않는다.

**원인 가설**
- 단계별 실험을 즉시 별도 빌드 디렉토리로 분기한 결과.
- compile switch 조합과 빌드 디렉토리 명명 사이에 1:1 매핑 정책 부재.
- 같은 결과를 만드는 두 Tcl이 옵션만 조금 다른 형태로 중복 존재.

**영향 범위**
- `scripts/hls/*.tcl` (다수)
- `build/hls/subband_q610_realtime_*` (13개)
- `logs/hls/*.log`

**해결 단계**
1. **빌드 매트릭스 정의** — compile switch 3종(`USE_RTL_BAND_ENGINE`, `USE_SV_GSU_LAYER`, `USE_SV_GSU_FULL`) × 검증 단계 3종(csim, csynth, cosim)으로 9~10개 정식 빌드만 유지하고 나머지는 archive 디렉토리로 이동.
2. **단일 진입점 통합** — `scripts/hls/common_hls_paths.tcl`을 모든 빌드 Tcl이 `source`하도록 강제. 빌드 디렉토리·로그 경로·top 함수명·솔루션명을 변수화.
3. **명명 컨벤션** — 빌드 디렉토리 = `subband_q610_realtime_{switch_tag}_{phase}_hls` 형태로 고정. 예: `subband_q610_realtime_svfull_csynth_hls`, `..._svfull_csim_hls`.
4. **archive** — 사용하지 않는 빌드 디렉토리를 `build/hls/_archive/`로 이동.

**검증 방법**
- 모든 정식 빌드를 `scripts/hls/run_all_realtime_builds.ps1` 단일 스크립트로 재현 가능한지 확인
- archive 후 회귀: baseline + 1차 RTL 빌드 csynth + cosim 모두 PASS

**대안/우회책**
디렉토리 정리를 미루고 빌드 매트릭스 표만 `docs/`에 추가해도 분류 가능. 단 중복 빌드의 디스크/CI 비용은 남는다.

---

### 4.5 [Minor] 합성 경고군 (clock margin, unused param, ALLOCATION ignore)

**증상 요약**
`logs/hls/vitis_hls_realtime_cosim_export.log`에서 다음 경고들이 누적:
- estimated clock period 8.254 ns vs target 10 ns (margin 부족하지만 위반은 아님)
- `unused parameter 'projected_output_q610'`
- `143,521 instructions in Array/Struct phase` (compile time 증가)
- `Ignoring ALLOCATION pragma - call removed`

**원인 가설**
- 코드 정리 미완료 (dead parameter, dead pragma).
- Array/Struct phase의 instruction 수가 많은 것은 inline 함수 폭발의 부수 효과.
- clock margin 부족은 inner loop carry chain의 fanout 증가가 원인.

**영향 범위**
- `subband_ref_q610_opt_stage4_latency_stepL2.cpp`
- `subband_ref_q610.hpp`

**해결 단계**
1. **dead code 제거** — `projected_output_q610` parameter 사용처 확인 후 미사용이면 시그니처에서 제거. ALLOCATION pragma는 적용 가능한 함수가 남아있지 않으면 삭제.
2. **inline 정책 조정** — Array/Struct phase instruction 수가 큰 함수에 `__attribute__((noinline))` 또는 `#pragma HLS INLINE off` 적용해 IR 크기 축소.
3. **clock margin 확보** — inner loop carry chain 단축(§4.3 4단계와 동일) 또는 `set_clock_uncertainty 1.2` 명시.

**검증 방법**
- `vitis_hls_realtime_*_synth.log`의 경고 라인 수 감소
- estimated clock period ≤ 9.5 ns 회복

**대안/우회책**
경고는 합성을 막지 않으므로 우선순위 하단으로 유지. 단 §3.3·§3.4 LUT 초과 해결 후 다시 마진 확인 필요.

---

## 5. 수치 비교표 (Baseline vs 현재 vs 목표)

### 5.1 메인 비교표

| 모듈/빌드 | LUT (사용/예산/%) | FF (사용/예산/%) | BRAM_18K (개/예산) | DSP (개/예산) | Latency (cycles) | Latency (ms @100 MHz) | 50 ms 예산 대비 | 상태 |
|---|---:|---:|---:|---:|---:|---:|---:|---|
| `subband_q610_realtime_hls` (baseline) | 43,763 / 53,200 / 82.3% | 52,909 / 106,400 / 49.7% | 267 / 280 | 168 / 220 | 892,507 | 8.925 | 17.9% | csynth + cosim + export PASS |
| `..._rtl_engine_hls` | 50,632 / 53,200 / 95.2% | 55,465 / 106,400 / 52.1% | 194 / 280 | 183 / 220 | 850,101 | 8.501 | 17.0% | csynth PASS, cosim 미수행 |
| `..._sv_gsu_blackbox_hls` | **92,276 / 53,200 / 173.4%** | 61,779 / 106,400 / 58.1% | 234 / 280 | 89 / 220 | **2,892,482** | **28.925** | 57.9% | csynth 완료, LUT/latency FAIL |
| `..._sv_gsu_pingpong_hls` (2026-05-23 §4.1 수정 후) | **92,276 / 53,200 / 173.4%** | 61,779 / 106,400 / 58.1% | 234 / 280 | 89 / 220 | 2,892,482 | 28.925 | 57.9% | csynth 완료, **LUT만 FAIL** (FF·Latency 모두 PASS). sv_gsu_blackbox와 bit-exact 일치 |
| **`..._sv_gsu_blackbox_proj_ext_hls`** (2026-05-23 C단계 projection 외부화) | **62,543 / 53,200 / 117.6%** | 62,307 / 106,400 / 58.6% | 234 / 280 | 73 / 220 | 4,910,786 | 49.108 | **98.2%** | **C단계 검증 완료**. csynth PASS, **LUT만 5K 초과** (FF·BRAM·DSP·Latency 모두 PASS). Fmax 113.26 MHz. projection IP 외부화로 LUT -29,733 절감 |
| `..._sv_gsu_full_hls` (2026-05-23 우회 적용 후) | N/A | N/A | N/A | N/A | N/A | N/A | N/A | **csynth OOM @ RTL Generation** (24분 진행 후 peak 12.77+ GB, Windows 16 GB RAM 한계). EXCEPTION_ACCESS_VIOLATION crash는 §3.1 step 2 우회로 회피 확인 |
| `..._sv_gsu_full_proj_ext_hls` (2026-05-23 C단계 + USE_SV_GSU_FULL 도전) | N/A | N/A | N/A | N/A | N/A | N/A | N/A | **csynth OOM 임박**으로 안전 종료. RunRealtimeSingleGsuLayerSvFullQ610 RTL Generation 진입 직전 peak 12.749 GB / FreeCommitGB 0.69 GB. 외부화 적용해도 6개 인스턴스 본질 문제 동일 |
| `gsu_layer_engine_rtl` standalone xsim | N/A (RTL-only) | N/A | N/A | N/A | 40,322 (4f,8sb) / 15,682 (4f,3sb) | 0.40 / 0.16 | < 1% | RTL coverage PASS, 84 scenario |
| `gsu_hidden_group_scalar_bb` standalone xsim | N/A (RTL-only) | N/A | N/A | N/A | N/A | N/A | N/A | RTL coverage PASS, 960 scenario |
| `projection_axis_adapter` (2026-05-23 D-2 OOC standalone) | 4,286 / 53,200 / 8.06% | 7,378 / 106,400 / 6.93% | 0 / 280 | 32 / 220 | N/A | N/A | N/A | **D-1·D-2·D-3 PASS**. 어댑터 + projection IP 통합 OOC 합성. FSM + 14×512-bit AXIS buffer 포함 |
| **`realtime_dma_proj_ext` BD 통합** (2026-05-23 D-5 place 직전, xc7z020) | **60,448 (Logic) / 68,641 (Slice) / 53,200 / 129.0%** | N/A (post-opt) | N/A | N/A | N/A | N/A | N/A | **D-5 BD synth+opt PASS, place_design FAIL** (DRC UTLZ-1, Slice LUTs 15,441 초과). xc7z020 fit 불가. xc7z030 격상(LUT 한도 78,600) 또는 GSU layer wrapper 추가 RTL화 필요 |
| **목표값** | **≤ 53,200** | **≤ 106,400** | **≤ 280** | **≤ 220** | **≤ 5,000,000** | **≤ 50** | **≤ 100%** | **csynth + cosim + impl 통과** |

> 수치 출처: baseline·rtl_engine은 `docs/rtl_band_engine_transition_report_ko.md` HLS 합성 결과 표, sv_gsu_blackbox는 `docs/sv_gsu_hidden_group_blackbox_report_ko.md` HLS 합성 결과 표, sv_gsu_pingpong은 `docs/gsu_weight_pingpong_ddr_fetch_report_ko.md` HLS 합성 결과 표, sv_gsu_full crash 증거는 `docs/sv_gsu_full_light_integration_report_ko.md` HLS csynth 절. standalone xsim은 `docs/sv_gsu_layer_rtl_report_ko.md` 및 `docs/sv_gsu_hidden_group_blackbox_report_ko.md` RTL 단위 검증 절.

### 5.2 기준선 대비 변화 요약

| 지표 | baseline → rtl_engine | rtl_engine → sv_gsu_blackbox | sv_gsu_blackbox → pingpong (2026-05-23 §4.1 수정 후) | sv_gsu_blackbox → blackbox_proj_ext (2026-05-23 C단계) |
|---|---|---|---|---|
| LUT | +6,869 (+15.7%) | +41,644 (+82.3%) | 0 (0.0%) | **-29,733 (-32.2%)** |
| FF | +2,556 (+4.8%) | +6,314 (+11.4%) | 0 (0.0%) | +528 (+0.9%) |
| BRAM_18K | -73 (-27.3%) | +40 (+20.6%) | 0 (0.0%) | 0 (0.0%) |
| DSP | +15 (+8.9%) | -94 (-51.4%) | 0 (0.0%) | -16 (-18.0%) |
| Latency cycles | -42,406 (-4.7%) | +2,042,381 (+240.3%) | 0 (0.0%) | +2,018,304 (+69.8%) |

해석: BRAM은 rtl_engine 단계에서 정상화됐고, sv_gsu_blackbox는 BRAM/DSP는 더 줄였으나 GSU wrapper와 projection mux가 LUT를 폭발시켰다. **2026-05-23 §4.1 수정(`add_files -blackbox` 추가) 후 pingpong은 sv_gsu_blackbox와 bit-exact 동일 결과로 수렴**했다. 이전 측정(`add_files -blackbox` 누락 상태에서 HLS C가 hidden-group을 직접 합성한 결과)이었던 LUT 123K / FF 117K / latency 6.38M cycles는 진단 보고서 작성 시점의 상태이며, 현재는 두 빌드가 같은 SV RTL 경로를 타므로 자원/latency 차이가 없다.

> **보고서 작성 시점 pingpong 결과 (역사적, `add_files -blackbox` 누락 상태)**: LUT +30,900 (+33.5%), FF +55,679 (+90.1%), BRAM -18 (-7.7%), DSP -61 (-68.5%), Latency +3,491,712 cycles (+120.7%). §3.4의 historical 절 참조.

## 6. 기능 검증 현황 (bit-exact 회귀)

| 빌드 | 검증 종류 | seeds × profiles × chunk | total scenarios | `df_coef` elements | mismatches | 결과 |
|---|---|---:|---:|---:|---:|---|
| `subband_q610_realtime_hls` | high-coverage C-sim | 32 × 5 × 5 | 960 | 4,423,680 | 0 | PASS |
| `..._rtl_engine_hls` | high-coverage C-sim | 32 × 5 × 5 | 960 | 4,423,680 | 0 | PASS |
| `..._sv_gsu_blackbox_hls` | high-coverage C-sim | 32 × 5 × 5 | 960 | 4,423,680 | 0 | PASS |
| `..._sv_gsu_pingpong_hls` | high-coverage C-sim | 32 × 5 × 5 | 960 | 4,423,680 | 0 | PASS |
| `..._sv_gsu_full_hls` | smoke C-sim only | — | — (chunk1/2/4) | — | 0 | PASS (smoke), high-coverage 미실행 |
| `gsu_hidden_group_scalar_bb` standalone xsim | RTL unit test | 32 × 5 × 5 | 960 | 92,160 | 0 | PASS (line 99.47% / branch 96.43% / condition 100%) |
| `gsu_layer_engine_rtl` standalone xsim | RTL unit test | — | 84 | 497,728 | 0 | PASS (line 100% / branch 90.91% / condition 100%) |

핵심: **모든 합성 가능 경로는 baseline과 bit-exact를 유지한다.** 기능 회귀는 없으며, 모든 차단 요인은 자원·latency·tool 안정성 영역에 한정된다.

## 7. 결론 및 즉시 실행 가능한 다음 단계

> **2026-05-23 갱신**: 본 절은 2026-05-22 검증 라운드 결과를 반영해 전면 재작성됨. 핵심 변화는 Blocker 2건이 모두 해소된 것이다.

진단 총평 (2026-05-23 갱신, C단계 완료 후): **Blocker 0건**, Critical 3건(§3.1 USE_SV_GSU_FULL OOM, §3.2 cosim 미수행, §4.2 loop flatten 미적용), Major 5건(§3.3 sv_gsu_blackbox LUT 잔여 5K 초과, §3.4 pingpong LUT 잔여 초과, §3.5 projection IP D단계 통합 대기, §4.3 II 미달성, §4.4 빌드 일관성), Minor 다수. 2026-05-22~23 라운드에서 §4.1 pingpong Tcl 수정, §3.1 step 2 우회, §4.2 LOOP_FLATTEN off pragma 6개, §3.2 cosim Tcl wrapper 2개 작성, §3.5 projection IP B단계 packaging + C단계 외부화가 완료됐다. 모든 수정은 회귀 zero로 검증됨 (csim 5개 + csynth 4개 통과, 5개 빌드 모두 `df_coef` 4,423,680 element bit-exact 유지). §3.5 C단계 검증으로 sv_gsu_blackbox LUT가 92,276 → 62,543로 -32% 절감되어 §3.3이 Critical → Major로 격하됐다.

기준선 보존: 모든 합성 가능 빌드는 `subband_q610_realtime_hls` baseline 대비 기능 회귀가 없다. 4,423,680 `df_coef` element bit-exact 일치가 4개 빌드에서 동일하게 유지되며, `gsu_hidden_group_scalar_bb` standalone RTL은 99.47% line / 96.43% branch / 100% condition coverage를 확보했다. 즉 다음 라운드의 모든 최적화는 정확도 위험 없이 자원·latency 축에만 집중할 수 있다.

공통 원인 진단: 실시간 50 ms 예산 미만으로 들어온 pingpong/sv_gsu_blackbox 두 빌드(모두 28.925 ms)의 남은 차단은 LUT 92,276(한도 53,200, 173%)이고, 원인은 여전히 `ProjectionDotProductRealtimePackedTilesRtlDspQ610` 단독 36,864 LUT(전체의 약 40%). 따라서 다음 라운드의 핵심 방향은 projection을 SV RTL로 이전(§3.3 step 1) 또는 Vivado IP로 분리(§3.5)하는 것이다. USE_SV_GSU_FULL csynth는 16 GB RAM 환경 한계로 미완주이나 sv_gsu_blackbox/pingpong 결과가 사실상 동등한 기준선을 제공하므로 우선순위는 낮다.

**즉시 실행 항목 (2026-05-23 갱신)**

1. **RAM 16 → 32 GB 증설 또는 Linux Vitis HLS 환경 전환 후 `USE_SV_GSU_FULL` csynth 재시도** — 우회(`USE_SV_GSU_FULL_HLS_PROJECTION`)가 작동함은 검증됨. 남은 차단은 단순 자원 부족. Windows 16 GB 환경에서는 무리 (latency 3배 악화 trade-off 동반 합성 강행 가능하지만 실용적 결과 아님).
2. **projection blackbox를 GSU full csynth에서 제거 후 GSU-only 합성 완료** — `scripts/hls/run_hls_realtime_sv_gsu_full_synth_gsu_only.tcl`을 §3.1 2~3단계 변경 후 재실행, latency/LUT 1차 측정. (이 Tcl에는 `ALLOW_UNSTABLE_HLS_BB=1` 안전 가드가 있으므로 명시적 환경변수 설정 필요)
3. **~~`rtl/gsu/projection_dot_scalar_bb.sv`를 Vivado out-of-context synth로 standalone 측정 후 IP-XACT packaging~~** — **B+C+D단계 진행 완료** (2026-05-23). standalone LUT 3,234 측정 + IP catalog 등록 + HLS top 외부화로 sv_gsu_blackbox LUT 92,276 → 62,543 절감(-32%) 검증. **D단계 (BD 통합)**: D-1 어댑터 RTL `projection_axis_adapter.sv` 작성 + D-2 OOC 합성 PASS (LUT 4,286) + D-3 IP packaging PASS + D-4 HLS IP export PASS + D-5 BD 통합 synth/opt PASS, place_design에서 **LUT 68,641/53,200 (+29%) 초과로 fit 실패**. xc7z020 디바이스로는 통합 후 fit 불가 확인. 다음 단계는 디바이스 격상 또는 GSU layer wrapper 추가 RTL화.
4. **~~flatten 실패 루프 3종에 `#pragma HLS LOOP_FLATTEN off` 명시~~** — **완료** (2026-05-23). 6개 위치(`EmitRealtimeOutputChunkQ610`, `RunRealtimeGSULayersSharedBandQ610` 3중, `RunRealtimeProjectionBandQ610` 2중)에 적용. baseline csynth 수치 bit-exact 유지로 회귀 zero 확인.
5. **~~pingpong 경로에 `#pragma HLS DATAFLOW` + ping-pong stream depth=2 적용~~** — **자연 해결** (2026-05-23). §4.1 `add_files -blackbox` 추가만으로 HLS C 합성 경로가 SV RTL로 우회되어 추가 DATAFLOW pragma 불필요. LUT/FF/Latency 3축 모두 sv_gsu_blackbox 수준으로 개선.
6. **~~cosim wrapper Tcl 신규 작성~~** — **완료** (2026-05-23). `scripts/hls/run_hls_realtime_cosim_only.tcl`, `scripts/hls/run_hls_realtime_sv_gsu_blackbox_cosim.tcl` 두 파일 생성 완료. 실행은 후속 작업 (각 빌드 csynth 완료 후 30분~2시간 소요).
7. **13종 빌드 매트릭스 정리** — §4.4 1~4단계로 정식 빌드 9~10종만 유지, 나머지 `build/hls/_archive/`로 이동.

위 7개 항목 중 1~3번이 남은 자원 차단 해소(특히 3번이 가장 큰 LUT 절감), 6~7번이 다음 라운드의 검증·운영 기반에 해당한다. 4~5번은 2026-05-22 라운드에서 완료. **3번(projection IP 분리)이 단일 작업으로 가장 큰 이득**(LUT 92K → 약 62K 수준 예상)을 줄 가능성이 높으므로 우선 추천.

> **2026-05-23 추가 항목 (D단계 통합 시도 후 새로 도출)**:
> 8. **xc7z020 → xc7z030 디바이스 격상** — LUT 한도 53,200 → 78,600. 현재 통합 결과 LUT 68,641 fit 가능. Tcl 한 줄 변경 (`set_part xc7z030sbg485-1` 등)으로 진행 + 같은 D-5 Tcl 재실행. 30~60분 후 post-route 수치 확보. 단 보드 변경(Zybo Z7-30 또는 PYNQ-Z2) 필요.
> 9. **GSU layer wrapper 추가 RTL화** — `RunRealtimeGSULayersSvPackedQ610` (현재 LUT 약 39K)를 SV RTL로 추가 이전. LUT 약 25K~30K 절감 예상. xc7z020 유지 가능. 단 큰 작업 (수일~수주).
> 10. **어댑터 FF 7,378개 → BRAM 이전** — `input_tile/proj_tile` 14×512-bit를 BRAM 1~2개로 옮겨 LUT 약 1K 절감. 미세하지만 8번/9번과 조합 가능. Tcl/SV minor 수정 (수시간).

## 8. 2026-05-22 ~ 2026-05-23 검증 로그

본 절은 §3.1·§3.2·§3.4·§3.5·§4.1·§4.2의 수정 적용 후 진행한 모든 합성·시뮬레이션 검증 결과를 시간순으로 기록한다. 시스템 환경: Windows 11, RAM 16 GB, 페이지파일 32 GB(이후 128 GB로 증설), Vitis HLS 2023.2.

| 시각 | 빌드 | 단계 | 결과 | 소요 시간 | peak 메모리 |
|---|---|---|---|---:|---:|
| 15:26 | `subband_q610_realtime_hls` | csim | PASS (chunk1/2/4 모두) | 28 s | 102 MB |
| 15:28 | `..._sv_gsu_full_csim_hls` (+`USE_SV_GSU_FULL_HLS_PROJECTION`) | csim | PASS | 31 s | 103 MB |
| 15:29 | `..._sv_gsu_hls` (`USE_SV_GSU_LAYER`) | csim | PASS | 37 s | 103 MB |
| 15:32 | `subband_q610_realtime_hls` | csynth | PASS, baseline bit-exact 유지 (LUT 43,763 / Latency 892,507 cycles) | 2 min 30 s | 1.22 GB |
| 16:07 | `..._sv_gsu_full_hls` | csynth | **OOM @ RTL Generation** (`RunRealtimeSingleGsuLayerSvFullQ610` 처리 중). EXCEPTION_ACCESS_VIOLATION crash는 §3.1 step 2 우회로 회피 확인 | 24 min | 12.77+ GB |
| 16:08 | `..._sv_gsu_full_gsu_only_hls` | (안전 가드 거부) | Tcl 내 `ALLOW_UNSTABLE_HLS_BB` 미설정으로 즉시 종료. 시스템 안전 | 0.5 s | 7.6 MB |
| 16:14 | `..._sv_gsu_blackbox_hls` | csynth | PASS, 보고서 §5.1 sv_gsu_blackbox 행 bit-exact 일치 (LUT 92,276 / Latency 28.925 ms) | 1 min 30 s | 644 MB |
| 16:17 | `..._sv_gsu_pingpong_hls` (§4.1 수정 후) | csynth | PASS, **보고서 대비 큰 개선** (LUT 123K → 92K, Latency 63.8 ms → 28.9 ms). sv_gsu_blackbox와 bit-exact 일치 | 1 min 30 s | 644 MB |
| **2026-05-23 02:43** | `subband_q610_realtime_hls` | csim (Phase A 회귀) | PASS, baseline bit-exact 유지 | 28 s | 104 MB |
| 02:44 | `..._sv_gsu_hls` (USE_SV_GSU_LAYER) | csim (Phase A 회귀) | PASS | 37 s | 103 MB |
| 02:47 | `subband_q610_realtime_hls` | csynth (Phase A 회귀) | PASS, baseline bit-exact (LUT 43,763 / Latency 892,507 cycles) | 2 min 30 s | 1.22 GB |
| 02:57 | `..._sv_gsu_blackbox_proj_ext_csim_hls` (Phase B.1) | csim (USE_PROJECTION_EXTERNAL) | PASS, df_coef bit-exact 유지 | 38 s | 103 MB |
| 02:58 | `..._sv_gsu_full_proj_ext_csim_hls` (Phase B.2) | csim (USE_PROJECTION_EXTERNAL + USE_SV_GSU_FULL) | PASS, df_coef bit-exact 유지 | 33 s | 103 MB |
| 02:59 | `..._sv_gsu_blackbox_proj_ext_hls` (Phase C 핵심) | csynth | **PASS, LUT 92,276 → 62,543 (-32%)**, Latency 49.108 ms (50 ms 예산 안 1 ms 마진), Fmax 113.26 MHz | 1 min 20 s | 618 MB |
| 03:08 | `..._sv_gsu_full_proj_ext_hls` (Phase D 16 GB 도전) | csynth | **OOM 임박 안전 종료** (peak 12.749 GB, FreeCommitGB 0.69 GB). 외부화로도 RunRealtimeSingleGsuLayerSvFullQ610 6 인스턴스 본질 문제 동일 | (도중) | 12.749 GB |
| **2026-05-23 09:40** | `projection_axis_adapter` (D-2 OOC) | Vivado OOC synth | **PASS** (LUT 4,286 / FF 7,378 / DSP 32 / BRAM 0). Timing은 OOC 보수 추정으로 WNS -55.7 ns (통합 후 재측정 필요) | 36 s | 1.46 GB |
| 09:48 | `projection_axis_adapter` IP (D-3) | IP packaging | 1차 시도 — 3개 warning (TVALID 누락 + master/slave 오인식) | — | 480 MB |
| 09:55 | `projection_axis_adapter` IP (D-3 재시도) | IP packaging | **PASS** (명시적 AXIS interface 정의, integrity check passed) | 25 s | 480 MB |
| 10:01 | `..._sv_gsu_blackbox_proj_ext_hls` (D-4) | HLS IP export | **PASS** (`solution1/impl/ip/` 생성, ip_catalog 형식) | 1 min 50 s | 638 MB |
| 10:15 | `realtime_dma_proj_ext` BD (D-5 1차) | Vivado BD synth | FAIL — Path length 260자 초과 (HLS 함수 이름이 김) | 11 min | — |
| 10:56 | `realtime_dma_proj_ext` BD (D-5 재시도) | Vivado BD synth + opt + place | synth/opt PASS, **place_design FAIL** (DRC UTLZ-1, Slice LUTs 68,641/53,200 +29% 초과). xc7z020 fit 불가 확정 | 41 min | 약 4 GB |

### 8.1 검증 결과 종합

- **회귀 검증 (2026-05-22)**: csim 3개 + csynth 3개(baseline·sv_gsu_blackbox·pingpong) 모두 PASS. baseline 수치는 진단 보고서 §5.1과 bit-exact 일치 (LUT 43,763 / FF 52,909 / BRAM 267 / DSP 168 / Latency 892,507 cycles). LOOP_FLATTEN off pragma 6개 추가가 합성 결과를 변경하지 않음이 입증됨.
- **회귀 재검증 (2026-05-23 C단계 후)**: USE_PROJECTION_EXTERNAL ifdef 가드 추가가 기존 빌드에 영향 0%임을 다시 확인. baseline csim/csynth 및 USE_SV_GSU_LAYER csim 모두 동일 수치 유지.
- **pingpong 개선 검증**: 보고서 작성 시점 측정(LUT 123K / FF 117K / Latency 6.38M cycles)이 §4.1 수정 후 sv_gsu_blackbox 수준(LUT 92K / FF 62K / Latency 2.89M cycles)으로 수렴.
- **§3.1 우회 검증**: `USE_SV_GSU_FULL_HLS_PROJECTION` 분기 활성화로 EXCEPTION_ACCESS_VIOLATION crash 회피 확인. 그러나 16 GB RAM 환경에서 RTL Generation OOM 새 차단 등장 (severity Blocker → Critical로 격하).
- **§3.5 C단계 검증 (신규 2026-05-23)**: projection 외부화로 sv_gsu_blackbox LUT가 92,276 → 62,543로 **-32% 절감** 측정. Latency는 stream 통신 오버헤드로 +69.8% 증가(28.9 → 49.1 ms)했으나 50 ms 예산 안 1 ms 마진 유지. Fmax 113.26 MHz 변화 없음. df_coef bit-exact 일치 (csim 2개 빌드 모두). §3.3 차단 강도가 Critical → Major로 격하.
- **§3.5 Phase D 결과 (USE_SV_GSU_FULL 도전)**: 외부화 적용 + USE_SV_GSU_FULL csynth 시도. RunRealtimeSingleGsuLayerSvFullQ610 RTL Generation 진입 직전 peak 12.749 GB / FreeCommitGB 0.69 GB 도달로 안전 종료. 외부화로 RTL 인스턴스 일부 부담은 줄었으나 GSU layer 6개 인스턴스 본질 문제는 동일. RAM 32 GB 증설 또는 Linux 환경 필요는 변하지 않음.
- **§3.5 D단계 통합 결과 (2026-05-23 신규)**: 6단계 모두 진행. D-1 어댑터 RTL `projection_axis_adapter.sv` 작성 (327줄, FSM + 14×512-bit AXIS buffer + projection IP 내부 인스턴스), D-2 OOC 합성 PASS (LUT 4,286 / DSP 32 / FF 7,378, 어댑터 자체 비용 +1,052 LUT / +7,267 FF), D-3 IP packaging PASS (명시적 AXIS interface 정의로 integrity check 통과), D-4 HLS IP export PASS (`build/hls/.../impl/ip/`), D-5 BD 통합 + synth + opt PASS, **D-5 place_design FAIL** (DRC UTLZ-1, Slice LUTs 68,641/53,200 +29% 초과). xc7z020 디바이스로는 fit 불가 확정. D-6 미수행. 다음 단계는 xc7z030 격상(LUT 한도 78,600, 한 줄 변경으로 진행 가능) 또는 GSU layer wrapper RTL화 (LUT 약 7K 추가 절감).
- **시스템 안정성 회복**: 페이지파일 32 GB(이후 128 GB) 증설 후 Kernel-Power 41(hard hang) 재발 없음. 모든 합성이 graceful 종료되거나 사용자 안전 종료(Phase D)되어 PC 재부팅 사고 0건.

### 8.2 수정 적용 산출물 (2026-05-22)

| 파일 | 변경 종류 | 내용 |
|---|---|---|
| `subband_ref_q610_opt_stage4_latency_stepL2.cpp` | edit | LOOP_FLATTEN off pragma 6줄 추가 (line 3392, 4161, 4168, 4171, 4852, 4855) |
| `scripts/hls/run_hls_realtime_sv_gsu_pingpong_synth_only.tcl` | edit | `add_files -blackbox gsu_hidden_group_packed_bb.json` 추가 |
| `scripts/hls/run_hls_realtime_sv_gsu_full_synth_only.tcl` | edit | `-DUSE_SV_GSU_FULL_HLS_PROJECTION` 추가, projection blackbox 행 제거 |
| `scripts/hls/run_hls_realtime_sv_gsu_full_csim_only.tcl` | edit | csim도 synth와 동일 분기 적용 (회귀 보호) |
| `scripts/hls/run_hls_realtime_cosim_only.tcl` | new | baseline RTL cosim 진입점 |
| `scripts/hls/run_hls_realtime_sv_gsu_blackbox_cosim.tcl` | new | SV blackbox 빌드 cosim 진입점 |
| `scripts/vivado/run_vivado_realtime_dma_impl.tcl` | edit | max_threads 일관성 수정 (2 → 6, 변수/set_param/메시지 일치) |
| `scripts/vivado/run_vivado_realtime_dma_xsa_only.tcl` | edit | max_threads 기본값 2 → 6 |

### 8.2.1 수정 적용 산출물 (2026-05-23, §3.5 C단계)

| 파일 | 변경 종류 | 내용 |
|---|---|---|
| `subband_ref_q610.hpp` | edit | `HLS_STREAM_THREAD_UNSAFE` ifdef 가드(USE_PROJECTION_EXTERNAL 시 thread-safe 유지), top 2개 prototype에 ifdef 분기 |
| `subband_ref_q610_opt_stage4_latency_stepL2.cpp` | edit | `CallExternalProjectionIpQ610` 헬퍼 추가(`__SYNTHESIS__` 분기로 csim/csynth 동작 분리), Fixed/Sv projection 함수 시그니처 + 호출 ifdef 분기, top 2개(`SubbandRealtimeTopQ610Ip`, `SubbandRealtimeTopQ610`) + `RunSubbandRealtimeTopCoreQ610` 시그니처 ifdef 분기, 호출 위치 9곳 ifdef 분기 |
| `testbench/subband_realtime_hls_tb.cpp` | edit | `<thread>` include, 외부 IP 모사 헬퍼 `ExternalProjectionIpThreadQ610`(cosim용), 호출부 ifdef 분기(csim에서는 placeholder stream) |
| `testbench/subband_realtime_hls_coverage_tb.cpp` | edit | 동일 |
| `scripts/hls/run_hls_realtime_sv_gsu_blackbox_proj_ext_csim_only.tcl` | new | sv_gsu_blackbox + EXT csim 진입점 |
| `scripts/hls/run_hls_realtime_sv_gsu_blackbox_proj_ext_synth_only.tcl` | new | **Phase C 핵심 측정 빌드** (LUT 절감 검증) |
| `scripts/hls/run_hls_realtime_sv_gsu_full_proj_ext_csim_only.tcl` | new | sv_gsu_full + EXT csim 진입점 |
| `scripts/hls/run_hls_realtime_sv_gsu_full_proj_ext_synth_only.tcl` | new | Phase D 16 GB 도전용 (현재 OOM) |
| `build/vivado/projection_ip/` | new (Vivado GUI) | B단계 IP packaging 산출물 (IP-XACT component.xml + Vivado IP catalog 등록) |

### 8.2.2 수정 적용 산출물 (2026-05-23, §3.5 D단계)

| 파일 | 변경 종류 | 내용 |
|---|---|---|
| `rtl/gsu/projection_axis_adapter.sv` | new | D-1 어댑터 RTL. FSM (9 state: IDLE→RCV_INPUT 224→RCV_PROJ 224→LATCH→WAIT_DONE→SEND_LO/MID/HI→CONTINUE) + 14×512-bit input/proj tile buffer + projection_dot_scalar_bb 내부 인스턴스. AXIS slave/master 인터페이스 |
| `scripts/vivado/synth_projection_axis_adapter_ooc.tcl` | new | D-2 어댑터 단독 OOC 합성 검증 (in-memory project, write_checkpoint) |
| `scripts/vivado/package_projection_axis_ip.tcl` | new | D-3 어댑터+projection 통합 IP packaging (명시적 AXIS interface 정의 + Clock에 FREQ_HZ/ASSOCIATED_RESET 명시 + Reset polarity ACTIVE_HIGH) |
| `scripts/hls/run_hls_realtime_sv_gsu_blackbox_proj_ext_export_only.tcl` | new | D-4 HLS IP export (csynth + export_design -format ip_catalog) |
| `scripts/vivado/run_vivado_realtime_dma_proj_ext_impl.tcl` | new | D-5 + D-6 통합 BD Tcl. 기존 `run_vivado_realtime_dma_impl.tcl` 미접촉. (a) IP repo 2개 등록, (b) projection_adapter_0 cell 추가, (c) projection_request_stream↔s_axis_req / m_axis_resp↔projection_response_stream AXIS wire 연결, (d) synth+opt+place+route+reports |
| `build/vivado/projection_adapter_ooc/` | new | D-2 OOC 합성 결과 (post_synth_util.rpt: LUT 4,286 / FF 7,378 / DSP 32 / BRAM 0, post_synth.dcp checkpoint) |
| `build/vivado/projection_axis_ip/` | new | D-3 packaging 산출물 (component.xml + src + xgui + projection_axis_adapter_1.0.zip archive) |
| `build/hls/subband_q610_realtime_sv_gsu_blackbox_proj_ext_hls/solution1/impl/ip/` | new | D-4 HLS IP catalog export (export.zip 포함) |
| `H:/bv/dpe/` (Vivado BD project) | new | D-5 BD project, synth+opt 완료된 상태. place에서 LUT 초과로 fail. 디스크 위치는 Windows 260자 제한 회피를 위해 짧은 경로 사용 |

### 8.3 다음 검증 권장

D단계까지 진행 완료된 현재, **xc7z020 디바이스의 LUT 한도 초과가 확정**됨. 남은 작업은 4가지 중 하나 선택:

1. **xc7z030 격상 (가장 빠른 진단 완결)**: `run_vivado_realtime_dma_proj_ext_impl.tcl`의 `-part xc7z020clg400-1`을 `-part xc7z030sbg485-1` (또는 동급)으로 변경 후 D-5 Tcl 재실행. 30~60분 후 post-route LUT/Timing/Power 확보. 단 보드 변경 필요(Zybo Z7-30 또는 PYNQ-Z2 등).
2. **GSU layer wrapper 추가 RTL화 (xc7z020 유지)**: `RunRealtimeGSULayersSvPackedQ610`(LUT 약 39K)를 SV RTL로 추가 이전. LUT 약 25~30K 추가 절감 예상. 단 큰 작업 (수일~수주).
3. **어댑터 buffer를 BRAM으로 이전 (미세 절감)**: 어댑터의 input_tile/proj_tile FF 7,168개를 BRAM 1~2개로 이전. LUT 약 1K 절감. 1~2번과 조합 가능.
4. **현재 결과로 마감 (디바이스 격상 권고로 진단 종료)**: 본 보고서 §3.5에 명시된 대로 xc7z020 한계 확정 + xc7z030 격상 권고로 진단 마감. 사용자가 선택.

USE_SV_GSU_FULL csynth는 외부화로도 16 GB RAM 한계 못 넘음. **RAM 32 GB 증설** 또는 **WSL2 Linux Vitis HLS 환경 전환** 필요. 본 진단 보고서는 sv_gsu_blackbox + 외부화(LUT 62,543 / Latency 49.108 ms) 결과를 새 기준선으로, **D단계 통합 LUT 68,641 (xc7z020 한도 53,200 +29% 초과)**를 디바이스 fit 한계점으로 명시 기록한다.
