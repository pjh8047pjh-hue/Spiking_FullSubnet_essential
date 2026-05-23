# USE_RTL_BAND_ENGINE 보드 Bring-Up 준비 보고서

작성일: 2026-05-24  
대상 보드: Zybo Z7-20급 `xc7z020clg400-1`  
검증 범위: FFT-domain DMA self-test  
메인 경로: `USE_RTL_BAND_ENGINE`

## 결론

현재 설계는 보드에 올릴 준비가 된 bitstream 후보까지 생성되어 있다. 설계 기준으로는 HLS high-coverage C-sim, HLS csynth/export, Vivado route/bitstream, bare-metal self-test ELF 준비가 완료되었다.

남은 blocker는 설계 문제가 아니라 물리 JTAG 연결이다. 이전 `ProbeOnly` 실행에서 `hw_server`는 시작되었지만 XSCT `targets` 목록에 Zybo 보드가 보이지 않았다.

## Release 산출물

최종 보드 후보는 아래 release bundle에 고정되어 있다.

```text
release/rtl_engine_board_candidate_20260523/
```

| 항목 | 경로 |
|---|---|
| Bitstream | `release/rtl_engine_board_candidate_20260523/fpga/realtime_dma_zybo_z7_20.bit` |
| XSA | `release/rtl_engine_board_candidate_20260523/fpga/realtime_dma_zybo_z7_20.xsa` |
| HWH | `release/rtl_engine_board_candidate_20260523/fpga/bd.hwh` |
| Routed checkpoint | `release/rtl_engine_board_candidate_20260523/fpga/realtime_dma_zybo_z7_20_routed.dcp` |
| HLS IP repo | `release/rtl_engine_board_candidate_20260523/hls_ip/ip/` |
| HLS IP zip | `release/rtl_engine_board_candidate_20260523/hls_ip/export.zip` |
| Bare-metal ELF | `release/rtl_engine_board_candidate_20260523/software/realtime_dma_selftest.elf` |
| FSBL | `release/rtl_engine_board_candidate_20260523/software/fsbl.elf` |
| Coverage logs | `release/rtl_engine_board_candidate_20260523/verification_logs/coverage_segments_rtl_engine/` |
| Vivado reports | `release/rtl_engine_board_candidate_20260523/vivado_reports/` |

## 검증 요약

| 항목 | 결과 |
|---|---:|
| Smoke C-sim | PASS |
| High-coverage scenarios | 960 |
| Compared `df_coef` | 4,423,680 |
| `df_coef` mismatch | 0 |
| TLAST/size/extra output error | 0 / 0 / 0 |
| HLS latency | 850,101 cycles = 8.501 ms |
| HLS estimated clock | 8.739 ns |
| HLS resource | BRAM_18K 194/280, DSP 183/220, LUT 50,632/53,200, FF 55,465/106,400 |
| Vivado timing | WNS +0.136 ns, TNS 0.000 ns |
| Vivado resource | LUT 38,814/53,200, FF 53,861/106,400, BRAM Tile 89/140, DSP 189/220 |
| Vivado DRC | 0 Errors |
| Power estimate | Total 2.315 W, accelerator hierarchy 0.559 W |
| Bitstream | PASS |
| Bare-metal self-test ELF | PASS |

## 보드 Self-Test 방법

현재 PS7 설정은 UART 출력 의존 없이 XSCT가 DDR result block을 직접 읽도록 구성되어 있다.

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\vitis\run_realtime_dma_selftest.ps1 -ProbeOnly
powershell -ExecutionPolicy Bypass -File .\scripts\vitis\run_realtime_dma_selftest.ps1 -Run
```

`-Run`은 다음 순서로 동작한다.

1. FPGA에 `realtime_dma_zybo_z7_20.bit`를 program한다.
2. Cortex-A9 #0에 `realtime_dma_selftest.elf`를 다운로드하고 실행한다.
3. DDR에 deterministic noisy/fb input과 all-zero weights를 배치한다.
4. DMA0 MM2S는 noisy stream, DMA1 MM2S는 fb stream, DMA0 S2MM은 df stream을 처리한다.
5. `num_frames=4`, `reset_state=1`로 HLS IP를 실행한다.
6. output `4 * 1152 = 4608`개가 golden expectation과 일치하는지 검사한다.
7. XSCT가 DDR result block을 읽어 PASS/FAIL을 판단한다.

PASS 기준 result block:

| DDR word | 기대값 |
|---|---:|
| `0x1FE00000 + 0*4` | magic `0x51563130` |
| `0x1FE00000 + 1*4` | status `0x00000000` |
| `0x1FE00000 + 12*4` | mismatch count `0` |
| `0x1FE00000 + 16*4` | output nonzero count `0` |

## 현재 JTAG 상태

- `hw_server` launch 문제는 임시 경로를 workspace 내부로 고정해 완화했다.
- `ProbeOnly` 단계에서 XSCT `targets` 목록이 비어 있었다.
- 보드 전원, USB-JTAG 케이블, Digilent driver, Windows 장치 관리자 인식 상태를 확인한 뒤 `-Run`을 실행해야 한다.

## 판단

설계와 산출물 기준으로는 FPGA board bring-up 직전 상태다. 실제 보드 검증 완료 조건은 XSCT에서 `xc7z020` 및 `Cortex-A9 #0` target이 보이고, `run_realtime_dma_selftest.ps1 -Run` 결과 DDR result block이 PASS를 반환하는 것이다.
