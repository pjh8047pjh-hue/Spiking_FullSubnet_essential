# FPGA Bring-Up Readiness Summary (Phase 1)

본 문서는 `SubbandRealtimeTopQ610Ip` HLS IP와 `realtime_dma_bd_wrapper` Vivado 디자인을 Zybo Z7-20 (`xc7z020clg400-1`) 보드에 올리기 전, 기존에 생성된 HLS / Vivado / C-sim 산출물만으로 현재까지의 검증 상태를 점검한 결과를 정리한 것이다. 본 단계에서는 추가 툴 실행(재합성, RTL cosim 재실행, 보드 in-the-loop)은 수행하지 않았으며, 산출물 검토와 cross-check만 수행하였다.

대상 산출물:
- HLS: [build/hls/subband_q610_realtime_hls/solution1/](../build/hls/subband_q610_realtime_hls/solution1/)
- Vivado: [build/vivado/vivado_realtime_dma_zybo_z7_20/](../build/vivado/vivado_realtime_dma_zybo_z7_20/)
- 로그: [logs/hls/](../logs/hls/), [logs/vivado/](../logs/vivado/)

---

## 1. Functional Verification 결과 (HLS C-sim 기준)

### 1.1 Smoke Testbench
- 소스: [testbench/subband_realtime_hls_tb.cpp](../testbench/subband_realtime_hls_tb.cpp)
- 로그: [build/hls/subband_q610_realtime_hls/solution1/csim/report/SubbandRealtimeTopQ610Ip_csim.log](../build/hls/subband_q610_realtime_hls/solution1/csim/report/SubbandRealtimeTopQ610Ip_csim.log)
- 결과: `chunk4 passed.` / `chunk2 passed.` / `chunk1 passed.` → `Realtime 3-band stream smoke test passed.` / `CSim done with 0 errors.`
- 최대 hls::stream depth = 4608 (top design 내부)

### 1.2 High-Coverage Testbench (golden bit-exact)
- 소스: [testbench/subband_realtime_hls_coverage_tb.cpp](../testbench/subband_realtime_hls_coverage_tb.cpp)
- TCL: [scripts/hls/run_hls_realtime_csim_coverage.tcl](../scripts/hls/run_hls_realtime_csim_coverage.tcl)
- 로그: [logs/hls/subband_q610_realtime_coverage_csim.log](../logs/hls/subband_q610_realtime_coverage_csim.log), [logs/hls/vitis_hls_realtime_csim_coverage.log](../logs/hls/vitis_hls_realtime_csim_coverage.log)
- 보고서 cross-ref: [docs/realtime_dfcoef_coverage_report_ko.md](realtime_dfcoef_coverage_report_ko.md)

| 항목 | 값 |
|---|---:|
| Seeds | 32 |
| Profiles | 5 (`small_random`, `full_input_zero_recurrent`, `sparse_identity_bn`, `alternating_nontrivial_bn`, `edge_projection_bias`) |
| Chunk patterns | 5 (`{4}`, `{2,2}`, `{1,1,1,1}`, `{3,1}`, `{1,3}`) |
| Primary scenarios | 800 |
| Reset replay scenarios | 160 |
| Total scenarios | 960 |
| Compared df_coef elements | 4,423,680 |
| df_coef_mismatches | **0** |
| tlast_mismatches | **0** |
| size_mismatches | **0** |
| extra_output_errors | **0** |
| Result | **PASS** |

**해석**: AXI4-Stream `df_coef` 출력은 C++ Q6.10 비최적화 reference (`FreqUnfoldQ610 → ConcatQ610 → PackQ610 → PackedToSequenceQ610 → RunGSULayerQ610 ×2 → RunProjectionQ610 → ProjectToDfCoefQ610`) 와 bit-exact. 단, 이는 **C-sim** (host-side C++ 시뮬레이션) 결과이며 RTL 시뮬레이션 / 보드 결과가 아니다.

---

## 2. HLS 합성 결과 (`SubbandRealtimeTopQ610Ip`)

- 보고서: [build/hls/subband_q610_realtime_hls/solution1/syn/report/csynth.rpt](../build/hls/subband_q610_realtime_hls/solution1/syn/report/csynth.rpt)
- 디바이스: `xc7z020-clg400-1`, target clock = 10 ns
- 합성 결과 동작 주파수 추정: **fail (slack −1.44 ns)** → HLS 자체 estimated period ≈ 11.44 ns. Vivado RTL 단에서 retiming/placement로 closure를 본 케이스 (§3 참조).

### 2.1 Latency / Throughput
| Metric | Value |
|---|---:|
| Top latency (cycles) | **892,507** |
| Top latency (time @100 MHz) | **8.925 ms** |
| Top initiation interval | 892,508 (no II pipeline at top) |
| Throughput basis | 4-frame chunk per AP_START |
| 4-frame input 누적 (10 ms hop 가정) | 40 ms |
| End-to-end latency 추정 | **48.925 ms** (< 50 ms 실시간 목표) |

### 2.2 HLS Resource Estimate (top 모듈)
| Resource | Used | Available | Util% |
|---|---:|---:|---:|
| BRAM | 267 | 280 | **95%** |
| DSP | 168 | 220 | 76% |
| FF | 52,909 | 106,400 | 49% |
| LUT | 43,763 | 53,200 | **82%** |
| URAM | 0 | 0 | — |

(주: HLS estimate는 Vivado 실제 utilization과 차이가 있음. 실제 값은 §3 참조.)

### 2.3 HLS HW Interfaces
| Interface | Type | 신호 |
|---|---|---|
| `noisy_fft_stream` | AXIS in | TDATA=16, TKEEP=2, TLAST, TVALID, TREADY |
| `fb_fft_stream` | AXIS in | TDATA=16, TKEEP=2, TLAST |
| `df_coef_stream` | AXIS out | TDATA=16, TKEEP=2, TLAST |
| `m_axi_weights` | M_AXI (256-bit) | burst length 16 R/W, 1 outstanding |
| `s_axi_control` | S_AXILite | CTRL/GIER/IP_IER/IP_ISR/`weights_q610`@0x10/`num_frames`@0x18/`reset_state`@0x20 |
| `interrupt` | level | AP_DONE / AP_READY tied via IP_ISR |

PS firmware 작성 시 위 offset/폭 그대로 사용.

### 2.4 M_AXI Burst 분석 (주의 항목)
| 위치 (subband_ref_q610_opt_stage4_latency_stepL2.cpp) | Loop | Burst Status |
|---|---|---|
| L2517, L2519 | VITIS_LOOP_2514_2 | **Fail (Could not analyze pattern)** |
| L2538, L2540 | VITIS_LOOP_2535_6 | **Fail** |
| L2559 | VITIS_LOOP_2556_10 | **Fail** |
| L2571 | VITIS_LOOP_2569_12 | **Fail** |
| L2582 | VITIS_LOOP_2580_14 | **Fail** |
| L2605, L2607 | VITIS_LOOP_2600_2 | **Fail** |
| L2628 | VITIS_LOOP_2624_5 | **Fail** |

10개 모든 `m_axi_weights` 액세스에서 HLS가 burst pattern 추론 실패. RTL 상에서는 단발 transaction으로 떨어질 가능성이 높아, **DDR weight load 단의 평균 throughput과 stall 비율을 RTL/board 검증 단계에서 측정 필요**. burst 16 length는 선언만 되어 있고 실제 사용 보장은 없는 상태.

---

## 3. Vivado Post-Route 결과 (`realtime_dma_bd_wrapper`)

- 보고서 경로: [build/vivado/vivado_realtime_dma_zybo_z7_20/reports/](../build/vivado/vivado_realtime_dma_zybo_z7_20/reports/)
- 산출물: `realtime_dma_zybo_z7_20.bit`, `realtime_dma_zybo_z7_20.xsa`, `realtime_dma_zybo_z7_20_routed.dcp` 생성됨
- 클럭: `clk_fpga_0` = **100 MHz** (10.000 ns period)

### 3.1 Timing Summary (post_route_timing_summary.rpt)
| Metric | Value |
|---|---:|
| WNS | **+0.195 ns** |
| TNS | 0.000 ns |
| Failing Setup endpoints | 0 / 138,275 |
| WHS | +0.009 ns |
| THS | 0.000 ns |
| Failing Hold endpoints | 0 / 138,275 |
| WPWS (Pulse Width) | +3.750 ns |
| All user timing constraints | **Met** ✅ |

Worst path (Setup):
- Source: `subband_realtime_0/.../noisy_chunk_U/ram_reg/CLKBWRCLK` (RAMB18E1)
- Destination: `.../grp_p_anonymous_namespace_RunRealtimeGSULayersSharedBandQ610_fu_202/cell_input_395_fu_1272_reg[4]/D`
- Path Group: `clk_fpga_0`, Requirement 10.000 ns
- Slow process corner, single PVT 분석.

### 3.2 Utilization (post_route_util.rpt)
| Resource | Used | Available | Util% |
|---|---:|---:|---:|
| Slice LUTs (logic) | 36,359 | 53,200 | 68.34% |
| Slice LUTs (memory) | 1,793 | 17,400 | 10.30% |
| **Slice LUTs total** | **38,152** | 53,200 | **71.71%** |
| Slice Registers | 48,845 | 106,400 | 45.91% |
| F7 Muxes | 3,105 | 26,600 | 11.67% |
| F8 Muxes | 224 | 13,300 | 1.68% |
| **Slice (occupied)** | **13,234** | 13,300 | **99.50%** ⚠️ |
| BRAM Tile (RAMB36 + RAMB18/2) | 129.5 | 140 | **92.50%** ⚠️ |
| RAMB36E1 | 119 | 140 | 85.00% |
| RAMB18E1 | 21 | 280 | 7.50% |
| DSP48E1 | 175 | 220 | 79.55% |
| BUFGCTRL | 1 | 32 | 3.13% |
| IO (PS-only design, no external pins) | 0 (130 IOPADs for PS7) | 125 | — |

**경고 포인트**:
- `Slice (occupied) 99.50%` — 13,234 / 13,300. ECO/디버그 logic 추가 여유가 거의 없으며, 재합성 시 placement noise에 의해 timing/route 결과가 흔들릴 위험이 있음. (LUT 자체는 71.7%지만 packing 결과 slice가 모두 점유됨.)
- `BRAM 92.5%` — weights/state/stream FIFO가 BRAM 거의 한계.

### 3.3 DRC (drc.rpt, 12건)
| Rule | Severity | Count | 의미 |
|---|---|---:|---|
| DPIP-1 | Warning | 2 | DSP48 입력단 미파이프라인 (`mac_muladd_7ns_3ns_8ns_10_4_1`, `ama_addmuladd_12ns_3ns_7ns_12ns_12_4_1`) |
| DPOP-2 | Warning | 6 | DSP48 MREG 미사용 — `RunGSUGatePhaseBand0Q610` 안의 `mul_16s_16s_32_3_1` 6 인스턴스. 동작 주파수/전력 효율 손실 |
| RTSTAT-10 | Warning | 1 | No routable loads |
| REQP-181 | Advisory | 3 | writefirst 권고 |

모두 functional blocker는 아님. **DPOP-2 6건은 명백한 효율 손실** — DSP48 P 레지스터 활성화 시 동일 path에서 동작 주파수 마진 ↑ + dynamic power ↓ 가능. Phase 3 (재합성) 후보.

### 3.4 Power Estimation (post_route_power.rpt)
| Item | Value |
|---|---:|
| Total On-Chip Power | **2.304 W** |
| Dynamic Power | 2.133 W |
| Device Static Power | 0.171 W |
| PS7 | 1.530 W (66.4%) |
| HLS Accelerator `subband_realtime_0` (hierarchy)* | 0.542 W (23.5%) |
| DSPs | 0.145 W (≈ 0.83 mW/DSP) |
| BRAM | 0.026 W |
| Clocks | 0.080 W |
| Signals | 0.204 W |
| Slice Logic | 0.148 W |
| Junction Temperature (typical) | 51.6 °C @ effective TJA 11.5 °C/W |
| Confidence | **Medium** (no SAIF/VCD activity) |

\* `subband_realtime_0` 계층 전력은 [docs/low_power_implementation_evidence_report_ko.md](low_power_implementation_evidence_report_ko.md) 의 hierarchical breakdown 인용. 본 readiness 검토 시점에서 hierarchical report 원본은 별도 파일로 저장되어 있지 않았고 §4의 evidence report에 표 형태로 보존되어 있음.

내부 switching activity가 vectorless로 추정되었으므로 **실 음성 입력 기반 SAIF를 이용한 재계산 없이는 power 값을 "measured"라고 부를 수 없다**. 논문/보고에서는 `post-route estimated, confidence=Medium` 표기를 유지해야 함.

---

## 4. RTL Co-Simulation 상태 (Critical Gap)

- 로그: [logs/hls/vitis_hls_realtime_cosim_export.log](../logs/hls/vitis_hls_realtime_cosim_export.log) (1,567 lines)
- 흐름: csim PASS → `cosim_design -rtl verilog` 시작 → XSIM 컴파일/엘라보레이션 완료 → run all 시작.
- **로그 마지막 라인 (1567)**: `// RTL Simulation : 0 / 7 [1120.44%] @ "100000145000"` (= 100 µs 시점에 7개 transaction 중 **0개** 완료, latency 추정 대비 1120% 초과)

**해석**:
- 7개 transaction (smoke TB의 chunk4 / chunk2×2 / chunk1×4 등) 중 단 한 건도 완료되지 않은 상태에서 로그가 끊김 → 시뮬레이션이 **hang/abort 되었거나, 사용자가 중단**한 것으로 판단됨.
- 종료 메시지 (`*** C/RTL co-simulation finished`, `Cosim Done`, PASS/FAIL summary) 미존재.
- 단, [build/hls/subband_q610_realtime_hls/solution1/impl/](../build/hls/subband_q610_realtime_hls/solution1/impl/) 에 `xilinx_com_hls_SubbandRealtimeTopQ610Ip_1_0.zip`가 생성되어 있음 → `export_design` 자체는 완료된 것으로 보이지만, 이는 cosim PASS와 무관 (export는 cosim 실패와 독립 수행 가능).

**판정**: **RTL bit-exact 검증은 미확인 상태**. C-sim 4.4M element PASS는 RTL 영역(state machine, AXIS handshake, deadlock monitor)을 **커버하지 않음**. FPGA bring-up 전 cosim 또는 보드 in-the-loop 중 하나는 반드시 필요.

---

## 5. 문서 vs 산출물 Cross-Check

| 항목 | 문서 값 | 산출물 값 | 일치 |
|---|---:|---:|:---:|
| Clock period | 10.000 ns | 10.000 ns (post_route_timing_summary.rpt L154) | ✅ |
| Post-route WNS | +0.195 ns | +0.195 ns (L141, L164) | ✅ |
| TNS | 0.000 ns | 0.000 ns | ✅ |
| HLS latency cycles | 892,507 | 892,507 (csynth.rpt L22) | ✅ |
| HLS latency time | 8.925 ms | 8.925e+06 ns (L22) | ✅ |
| DSP util | 175 / 220 (79.55%) | 175 / 220 (post_route_util.rpt L121) | ✅ |
| Slice LUT util | 38,152 / 53,200 (71.71%) | 38,152 / 53,200 (L35) | ✅ |
| Slice Register util | 48,845 / 106,400 (45.91%) | 48,845 / 106,400 (L40) | ✅ |
| BRAM Tile | 129.5 / 140 (92.50%) | 129.5 / 140 (L106) | ✅ |
| Total Power | 2.304 W | 2.304 W (post_route_power.rpt L33) | ✅ |
| Dynamic / Static | 2.133 / 0.171 W | 2.133 / 0.171 W (L36-37) | ✅ |
| PS7 | 1.531 W (문서) | 1.530 W (L67) | ≈ (반올림 오차) |
| Confidence | Medium | Medium (L41) | ✅ |
| Coverage scenarios | 960 | 960 (coverage TB) | ✅ |
| df_coef elements compared | 4,423,680 | 4,423,680 | ✅ |
| df_coef mismatches | 0 | 0 | ✅ |

→ `low_power_implementation_evidence_report_ko.md` 와 `realtime_dfcoef_coverage_report_ko.md` 의 수치는 실 산출물과 모두 일치 (PS7 항목만 소수점 셋째 자리에서 반올림 차이). **문서는 신뢰 가능**.

추가로 문서에 누락되어 있으나 본 readiness 단계에서 식별된 항목:
- 문서에는 **Slice (occupied) 99.50%** 가 명시되어 있지 않음 — 별도 risk로 다룰 것.
- 문서에는 **M_AXI burst inference Fail (10건)** 이 명시되어 있지 않음.
- 문서에는 **DRC DPOP-2 ×6 (DSP MREG 미사용)** 이 명시되어 있지 않음.

---

## 6. FPGA Bring-Up Sign-Off 체크리스트

| 항목 | 기준 | 현 상태 | 비고 |
|---|---|:---:|---|
| HLS C-sim smoke TB | PASS | ✅ | `chunk4/2/1` PASS |
| HLS C-sim coverage TB | mismatches = 0 | ✅ | 4.42M elements bit-exact |
| HLS RTL co-simulation | 모든 transaction PASS | ❌ | 7/7 중 0/7, hang/abort 의심 |
| Vivado WNS (slow corner) | ≥ +0.100 ns | ✅ | +0.195 ns |
| Vivado WHS | ≥ 0 ns | ✅ | +0.009 ns |
| DRC critical violations | 0 | ✅ | warning만 12건 |
| DRC DPOP-2 (DSP MREG) | 가능한 한 0 | ⚠️ | 6건 — 효율 손실 |
| Slice util | ≤ 95% | ❌ | 99.50% (위험) |
| BRAM util | ≤ 95% | ⚠️ | 92.50% (한계 근접) |
| DSP util | ≤ 90% | ✅ | 79.55% |
| M_AXI burst inferred | 모든 access PASS | ❌ | 10/10 Fail |
| Bitstream / XSA 생성 | 생성됨 | ✅ | `.bit`, `.xsa` 존재 |
| Power confidence | High 또는 measured | ❌ | Medium (vectorless) |
| 보드 HW-in-the-loop | ≥ 1 scenario bit-exact | ❌ | 미수행 |
| PS firmware / Vitis BSP | 빌드 + 실행 확인 | ❌ | 산출물 없음 |
| AXI DMA SG framing 확인 | RTL 또는 보드 확인 | ❌ | 미수행 |

### 6.1 Go / No-Go 판정
**현 상태: NO-GO (조건부)**

- C-sim 기능 정확도는 매우 강하게 검증됨 (4.4M element bit-exact).
- Vivado 단계까지 routed bitstream 생성 및 100 MHz timing closure 완료.
- 그러나 **C-sim ↔ RTL 일치 확인이 부재**하며, RTL이 실제로 같은 출력을 내는지에 대한 evidence가 없음.
- Slice 99.5%, M_AXI burst inference 실패 등 구현 품질 risk가 존재하며, 보드 위 동작 시 starvation / 재합성 변동성 위험이 있음.

### 6.2 권장 후속 단계 (우선순위 순)
1. **RTL co-simulation 재실행** — 가능하면 `cosim_design -trace_level all -wave_debug`로 hang 원인 식별. 7-transaction smoke TB 단위로 PASS 확인이 최소 조건.
2. **보드 HW-in-the-loop 검증** — 기존 `.xsa` 사용. coverage TB의 deterministic seed/profile 중 1~2개를 PS 측에서 재현, AXIS 입력 → DMA S2MM → DDR → host 비교. PASS 시 RTL cosim hang 무시 가능.
3. **(선택) Slice / DPOP-2 개선 재합성** — Phase 3. 보드 PASS가 우선, 본 항목은 효율 개선.
4. **(선택) SAIF 기반 power 재추정** — 논문 수치 강화용.

---

## 7. 사용한 입력 산출물 목록
- [build/hls/subband_q610_realtime_hls/solution1/syn/report/csynth.rpt](../build/hls/subband_q610_realtime_hls/solution1/syn/report/csynth.rpt)
- [build/hls/subband_q610_realtime_hls/solution1/csim/report/SubbandRealtimeTopQ610Ip_csim.log](../build/hls/subband_q610_realtime_hls/solution1/csim/report/SubbandRealtimeTopQ610Ip_csim.log)
- [build/vivado/vivado_realtime_dma_zybo_z7_20/reports/post_route_timing_summary.rpt](../build/vivado/vivado_realtime_dma_zybo_z7_20/reports/post_route_timing_summary.rpt)
- [build/vivado/vivado_realtime_dma_zybo_z7_20/reports/post_route_util.rpt](../build/vivado/vivado_realtime_dma_zybo_z7_20/reports/post_route_util.rpt)
- [build/vivado/vivado_realtime_dma_zybo_z7_20/reports/post_route_power.rpt](../build/vivado/vivado_realtime_dma_zybo_z7_20/reports/post_route_power.rpt)
- [build/vivado/vivado_realtime_dma_zybo_z7_20/reports/drc.rpt](../build/vivado/vivado_realtime_dma_zybo_z7_20/reports/drc.rpt)
- [logs/hls/vitis_hls_realtime_cosim_export.log](../logs/hls/vitis_hls_realtime_cosim_export.log)
- [logs/hls/subband_q610_realtime_coverage_csim.log](../logs/hls/subband_q610_realtime_coverage_csim.log)
- [docs/realtime_dfcoef_coverage_report_ko.md](realtime_dfcoef_coverage_report_ko.md)
- [docs/low_power_implementation_evidence_report_ko.md](low_power_implementation_evidence_report_ko.md)
