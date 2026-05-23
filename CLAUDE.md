# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Spiking_FullSubnet의 3-band subband speech enhancement model을 Q6.10 fixed-point으로 양자화하고 Zynq-7020 (xc7z020clg400-1, Zybo Z7-20)에서 100 MHz · 50 ms 실시간 처리 예산 안에 동작시키는 HLS/RTL 공동 설계 프로젝트. 진단·최적화 이력은 `docs/subband_rtl_hls_issues_and_solutions_ko.md`가 단일 진실 소스 (single source of truth)이며, 새 작업 전에 반드시 §5.1 비교표와 §8 검증 로그를 먼저 읽어야 한다.

## Toolchain & Environment

- **Vitis HLS 2023.2** (Windows): `C:\Xilinx\Vitis_HLS\2023.2\bin\vitis_hls.bat`
- **Vivado 2023.2** (Windows): `C:\Xilinx\Vivado\2023.2\bin\vivado.bat`
- 타깃: `xc7z020clg400-1`, clock 10 ns (100 MHz target), latency budget 50 ms / 4-frame chunk
- 환경: RAM 16 GB + 페이지파일 128 GB (RAM 부족 환경 — 아래 "Critical Constraints" 참조)

### Path workaround (mandatory for HLS/Vivado batch runs)

워크스페이스 경로(`c:\Users\User\Documents\Speech Enhancement\...`)에 공백이 있어 Vitis HLS / Vivado가 일부 명령에서 오류를 낸다. **모든 batch 실행은 H: 드라이브 매핑 후** 진행한다.

```powershell
subst H: "c:\Users\User\Documents\Speech Enhancement\Spiking_FullSubnet_opt_hls"
$env:HLS_REPO_DIR = "H:/"        # vitis_hls 실행 시
$env:VIVADO_MAX_THREADS = "6"     # vivado 실행 시 (기본 6, 최대 8)
Set-Location "H:\"
```

매핑은 재부팅 시 풀린다. `common_hls_paths.tcl`에 공백 경로 자동 우회 로직(`C:/hls_subband/src`로 복사)이 있으나 `add_files -blackbox` 같은 명령에서 `$hls_repo_dir`을 그대로 쓰는 곳들이 있어 H: 매핑이 더 안전.

## Critical Constraints (must respect)

### 시스템 안정성

- **합성 중 다른 무거운 작업 금지**: 과거 Vivado + Claude/Codex 동시 실행으로 Kernel-Power 41 hard hang + PC 재부팅 사고 다수. `docs/windows_xilinx_stability_diagnosis_ko.md` 참조. 합성 작업 시작 전 메모리 점검 (`FreeCommitGB > 30 GB` 권장).
- **USE_SV_GSU_FULL csynth는 16 GB RAM에서 OOM 보장**: peak 12.77+ GB까지 도달 후 `Out of Memory`로 graceful 종료. 정상 종료이며 hard hang은 아님(페이지파일 덕분). 실행하려면 RAM 32 GB 증설 또는 Linux Vitis HLS 환경 필요.
- **Windows 260자 경로 제한**: HLS가 생성하는 긴 함수명(예: `SubbandRealtimeTopQ610Ip_p_anonymous_namespace_CallExternalProjectionIpQ610_Pipeline_VITIS_LOOP_4558_1_VIT.v`)이 깊은 폴더 구조와 합쳐 260자를 넘으면 Vivado가 fail. 짧은 빌드 경로(예: `H:/bv/dpe`) 사용.

### 회귀 보호 원칙 (mandatory)

모든 새 합성 경로는 `#ifdef` 가드로 추가한다. 기존 baseline / sv_gsu_blackbox / pingpong 빌드의 합성 수치가 변경되면 즉시 회귀. 황금 기준:

- baseline csynth: LUT 43,763 / FF 52,909 / BRAM 267 / DSP 168 / Latency 892,507 cycles (8.925 ms)
- sv_gsu_blackbox csynth: LUT 92,276 / Latency 28.925 ms
- 기능 회귀: 4,423,680 `df_coef` element bit-exact 일치 (32 seed × 5 profile × 5 chunk pattern × 4-frame chunk = 960 scenario)

## Common Commands

모든 명령은 H: 드라이브 매핑된 상태에서 실행한다고 가정.

### HLS C-simulation (가장 가벼움, 30초 이내, 100 MB 메모리)

```powershell
# Baseline (USE_RTL_BAND_ENGINE/USE_SV_GSU_LAYER/USE_SV_GSU_FULL 모두 off)
vitis_hls -f H:/scripts/hls/run_hls_realtime_csim_only.tcl -l H:/logs/hls/<name>.log

# USE_SV_GSU_LAYER 분기
vitis_hls -f H:/scripts/hls/run_hls_realtime_sv_gsu_csim_only.tcl ...

# USE_SV_GSU_FULL 분기 (HLS_PROJECTION 우회 적용)
vitis_hls -f H:/scripts/hls/run_hls_realtime_sv_gsu_full_csim_only.tcl ...

# USE_PROJECTION_EXTERNAL (C단계, projection 외부화)
vitis_hls -f H:/scripts/hls/run_hls_realtime_sv_gsu_blackbox_proj_ext_csim_only.tcl ...
```

### HLS C-synthesis (1~3분, 1.2 GB 메모리, baseline 기준)

```powershell
# Baseline (bit-exact 회귀 보호용으로 항상 첫 실행)
vitis_hls -f H:/scripts/hls/run_hls_realtime_synth_only.tcl ...

# SV blackbox + projection 외부화 (현재 최선 결과: LUT 62,543 / Latency 49.108 ms)
vitis_hls -f H:/scripts/hls/run_hls_realtime_sv_gsu_blackbox_proj_ext_synth_only.tcl ...
```

### HLS coverage testbench (high-coverage 회귀 검증, 약 5분)

```powershell
vitis_hls -f H:/scripts/hls/run_hls_realtime_csim_coverage.tcl ...
# 결과: df_coef_mismatches=0, total_scenarios=960 확인
```

### Vivado block design + implementation

```powershell
# Baseline (이미 HLS IP가 build/hls/subband_q610_realtime_hls/.../impl/ip 에 있어야 함)
vivado -mode batch -source H:/scripts/vivado/run_vivado_realtime_dma_impl.tcl `
  -log H:/logs/vivado.log -nojournal

# projection 외부화 통합 (D-5 + D-6, 짧은 경로 H:/bv/dpe 사용)
vivado -mode batch -source H:/scripts/vivado/run_vivado_realtime_dma_proj_ext_impl.tcl ...
```

### RTL OOC synthesis (모듈 단독 검증)

```powershell
vivado -mode batch -source H:/scripts/vivado/synth_projection_axis_adapter_ooc.tcl ...
```

## High-Level Architecture

### Compile-time build matrix

`subband_ref_q610_opt_stage4_latency_stepL2.cpp` (메인 파일, 5800+ 줄)에 4개의 compile switch가 정의되어 있고 조합에 따라 13종 빌드가 만들어진다. 각 switch는 `HLS_EXTRA_CFLAGS` Tcl 환경변수로 활성화.

| Switch | 효과 | 대표 빌드 |
|---|---|---|
| (없음) | 순수 HLS C++ baseline. golden reference | `subband_q610_realtime_hls` |
| `-DUSE_RTL_BAND_ENGINE` | projection row cache + compact state (RTL-ready) | `..._rtl_engine_hls` |
| `-DUSE_SV_GSU_LAYER` | hidden-group을 SV RTL blackbox로 | `..._sv_gsu_blackbox_hls`, `..._sv_gsu_pingpong_hls` |
| `-DUSE_SV_GSU_FULL -DUSE_SV_GSU_FULL_HLS_PROJECTION` | GSU layer 전체를 SV blackbox, projection은 HLS C 우회 | `..._sv_gsu_full_hls` (현재 16 GB OOM) |
| `-DUSE_PROJECTION_EXTERNAL` | projection을 외부 AXIS IP로 분리 (C단계 결과) | `..._sv_gsu_blackbox_proj_ext_hls` (최선 LUT 62,543) |

**중요**: 모든 switch는 `#ifdef` 가드 안에서만 코드 활성화. 미정의 시 기존 동작 0% 변경. 새 분기 추가 시 같은 패턴 따를 것.

### HLS top function 진입점

- `SubbandRealtimeTopQ610Ip` (line 5743+): namespace 밖 IP 버전, Vivado block design용
- `SubbandRealtimeTopQ610` (namespace 안, baseline csim/csynth에서만 사용): line 5575+
- 두 top 모두 `RunSubbandRealtimeTopCoreQ610` (line 5238+)을 호출. 모든 실제 로직은 core wrapper에 있음
- AXIS 포트: `noisy_fft_stream`, `fb_fft_stream`, `df_coef_stream` (기본 3개) + `projection_request_stream`/`projection_response_stream` (USE_PROJECTION_EXTERNAL on 시 추가 2개)
- M_AXI: `weights_q610` (DDR weight access)
- AXI4-Lite: `control` (num_frames, reset_state)

### RTL module 구조 (`rtl/gsu/`)

- `gsu_q610_pkg.sv` — 공유 타입(q_t, acc_t) + Q6.10 산술 함수(saturate, round_shift, mul_for_mac, sigmoid_pwl). **모든 SV 파일이 의존**하므로 합성 시 항상 먼저 add.
- `projection_dot_scalar_bb.sv` — projection dot-product RTL (B단계 packaging됨, `build/vivado/projection_ip/`)
- `projection_axis_adapter.sv` — projection IP를 AXIS 인터페이스로 wrap (D-1 산출물, `build/vivado/projection_axis_ip/`)
- `gsu_hidden_group_packed_bb.sv` + `_scalar_bb.sv` — hidden-group SV blackbox (USE_SV_GSU_LAYER 분기)
- `gsu_layer_full_tiles_bb.sv` — GSU layer 전체 SV blackbox (USE_SV_GSU_FULL 분기)
- `*_bb.json` — HLS blackbox 등록 파일 (Tcl의 `add_files -blackbox`로 추가)

### Testbench 구조

- `testbench/subband_realtime_hls_tb.cpp` — smoke csim (chunk1/2/4 패턴)
- `testbench/subband_realtime_hls_coverage_tb.cpp` — high-coverage 회귀 (960 scenario × 4,423,680 element)
- USE_PROJECTION_EXTERNAL 시 두 testbench 모두 외부 projection IP를 std::thread로 모사 (cosim 한정, csim은 직접 함수 호출)
- Golden reference: 같은 cpp 안의 `RunRealtimeProjectionBandRowCachedPackedFixedQ610` template 함수 (회귀 보호용으로 절대 수정 금지)

### Block design 구조 (`scripts/vivado/run_vivado_realtime_dma_impl.tcl`)

- PS7 (Zynq processing system) + 2× AXI DMA (16-bit AXIS I/O) + 2× SmartConnect (control/memory)
- HLS IP `subband_realtime_0`를 catalog에서 자동 검색
- AXI4-Lite (PS → DMA/HLS), M_AXI HP (DMA/HLS → DDR), AXIS (DMA ↔ HLS)
- `max_threads` 변수로 Vivado thread 제어 (env `VIVADO_MAX_THREADS`로 override, 기본 6)

## Documentation Map

- `docs/subband_rtl_hls_issues_and_solutions_ko.md` — **단일 진실 소스**. 모든 진단·수정·검증 결과 + §5.1 비교표 + §7 즉시 실행 항목 + §8 검증 로그
- `docs/windows_xilinx_stability_diagnosis_ko.md` — Windows Vivado/Vitis 안정성 진단 + 보호 조치
- `docs/sv_gsu_full_light_integration_report_ko.md` — USE_SV_GSU_FULL 통합 보고서 (D단계 base)
- `docs/sv_gsu_hidden_group_blackbox_report_ko.md` — hidden-group SV blackbox 보고
- `docs/rtl_band_engine_transition_report_ko.md` — USE_RTL_BAND_ENGINE 전환 보고
- `docs/gsu_weight_pingpong_ddr_fetch_report_ko.md` — pingpong 가중치 fetch 보고
- `docs/realtime_sv_gsu_coverage_report_ko.md` — 960 scenario coverage 검증 기준
- `validation/export_subband_reference_q610.py` — Q6.10 reference export
- `validation/validate_q610_hls_infer.py` — Q6.10 inference 결과 검증

## Working Notes

- 새 작업 전 `docs/subband_rtl_hls_issues_and_solutions_ko.md` §7 "즉시 실행 항목"을 먼저 확인. 이미 완료된 항목(완료/자연 해결로 표시) 다시 하지 말 것.
- 합성 후 결과 수치는 항상 `docs/subband_rtl_hls_issues_and_solutions_ko.md` §5.1 비교표 + §8 검증 로그에 추가 갱신 (회귀 추적용).
- `archive/` 디렉토리는 실패한 빌드/실험의 보존소. 현재 작업과 무관.
- HLS function 이름은 절대 짧게 바꾸지 말 것 — testbench·blackbox JSON·로그·기존 보고서가 모두 정확한 이름으로 cross-reference됨. 대신 Windows 260자 제한은 빌드 경로 단축으로 회피(H:/bv/<short> 형태).
