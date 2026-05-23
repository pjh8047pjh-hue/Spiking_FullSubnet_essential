# USE_RTL_BAND_ENGINE 보드 Bring-Up 준비 보고서

## 결론

- 메인 빌드 경로는 `USE_RTL_BAND_ENGINE`으로 고정했다.
- Projection external IP, `USE_SV_GSU_LAYER`, `USE_SV_GSU_FULL` 경로는 이번 보드 후보에서 제외했다.
- HLS high-coverage C-sim, HLS csynth/export, Vivado route/bitstream, bare-metal self-test ELF 빌드까지 완료했다.
- 현재 남은 blocker는 설계가 아니라 JTAG 물리 연결이다. `hw_server`는 실행되지만 XSCT `targets` 목록에 보드가 보이지 않는다.

## 최종 산출물

| 항목 | 경로 |
|---|---|
| Bitstream | `build/vivado/rtdma_rtl/realtime_dma_zybo_z7_20.bit` |
| XSA | `build/vivado/rtdma_rtl/realtime_dma_zybo_z7_20.xsa` |
| HWH | `build/vivado/rtdma_rtl/rtdma_rtl.gen/sources_1/bd/bd/hw_handoff/bd.hwh` |
| HLS IP repo | `build/hls/subband_q610_realtime_rtl_engine_hls/solution1/impl/ip` |
| Bare-metal ELF | `build/vitis/realtime_dma_selftest_ws/realtime_dma_selftest/Debug/realtime_dma_selftest.elf` |
| FSBL | `build/vitis/realtime_dma_selftest_ws/rtdma_rtl_platform/export/rtdma_rtl_platform/sw/rtdma_rtl_platform/boot/fsbl.elf` |

## 검증 결과

| 검증 | 결과 |
|---|---|
| Smoke C-sim | `chunk4`, `chunk2`, `chunk1`, realtime 3-band stream pass |
| High-coverage C-sim | PASS |
| Coverage scenarios | `960` |
| Compared `df_coef` | `4,423,680` |
| `df_coef` mismatch | `0` |
| TLAST/size/extra output error | `0 / 0 / 0` |
| HLS latency | `850,101 cycles = 8.501 ms` |
| HLS estimated clock | `8.739 ns`, estimated Fmax `114.43 MHz` |
| HLS resources | BRAM_18K `194/280`, DSP `183/220`, LUT `50,632/53,200`, FF `55,465/106,400` |
| Vivado timing | WNS `+0.136 ns`, TNS `0.000 ns`, timing met |
| Vivado resources | LUT `38,814/53,200`, FF `53,861/106,400`, BRAM Tile `89/140`, DSP `189/220` |
| Vivado DRC | `0 Errors` |
| Power estimate | Total `2.315 W`, Dynamic `2.149 W`, Static `0.166 W`, accelerator hierarchy `0.559 W` |
| Bitstream | 생성 성공 |
| Bare-metal self-test ELF | 생성 성공 |

## 보드 Self-Test 방법

현재 PS7 설정은 UART가 꺼져 있으므로, pass/fail은 UART 출력이 아니라 DDR result block을 XSCT로 읽어서 판단한다.

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\vitis\run_realtime_dma_selftest.ps1 -ProbeOnly
powershell -ExecutionPolicy Bypass -File .\scripts\vitis\run_realtime_dma_selftest.ps1 -Run
```

Self-test는 다음을 수행한다.

- FPGA에 `realtime_dma_zybo_z7_20.bit`를 program한다.
- Cortex-A9 #0에 `realtime_dma_selftest.elf`를 다운로드하고 실행한다.
- DDR에 deterministic noisy/fb input과 all-zero weights를 배치한다.
- DMA0 MM2S -> noisy stream, DMA1 MM2S -> fb stream, DMA0 S2MM <- df stream을 구동한다.
- `num_frames=4`, `reset_state=1`로 HLS IP를 실행한다.
- expected `df_coef`는 all-zero이며 output `4 * 1152 = 4608`개를 검사한다.

PASS 기준 result block:

| DDR word | 기대값 |
|---|---|
| `0x1FE00000 + 0*4` | magic `0x51563130` |
| `0x1FE00000 + 1*4` | status `0x00000000` |
| `0x1FE00000 + 12*4` | mismatch count `0` |
| `0x1FE00000 + 16*4` | output nonzero count `0` |

## 현재 JTAG 상태

- `hw_server` launch 문제는 해결했다.
- 원인은 Xilinx가 `C:/Users/User/Local/Temp`를 임시 폴더로 잡는 환경 문제였고, wrapper에서 Xilinx child process의 `TEMP/TMP/HOME/USERPROFILE/APPDATA/LOCALAPPDATA`를 workspace 아래 `build/tmp`로 고정했다.
- 현재 `ProbeOnly` 실행은 `hw_server` 시작까지 성공하지만, XSCT `targets` 목록이 비어 있다.
- 보드 전원, USB-JTAG 케이블, Digilent driver, 장치 관리자 인식 상태를 확인한 뒤 `-Run`을 실행해야 한다.

## 판단

현재 구조는 FPGA bitstream 후보로 채택 가능하다. 설계 기준으로는 timing/resource/DRC/bitstream/ELF 준비가 모두 통과했다. 다만 실제 보드 검증 완료라고 쓰려면 XSCT에서 `xc7z020` 및 `Cortex-A9 #0` target이 보인 뒤 `run_realtime_dma_selftest.ps1 -Run` 결과의 result block이 PASS여야 한다.
