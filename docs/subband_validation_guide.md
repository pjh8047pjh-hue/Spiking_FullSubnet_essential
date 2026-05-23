# Subband Validation Guide

이 문서는 현재 active 코드 기준의 검증 절차를 정리한다. FPGA 보드 후보의 1차 정확도 기준은 wav 품질 비교가 아니라 realtime HLS IP의 `df_coef`가 C++ Q6.10 golden reference와 bit-exact로 일치하는지 확인하는 것이다.

## 1. HLS Smoke C-sim

목적: 짧은 chunk 패턴에서 stream count, TLAST, 기본 값 비교가 통과하는지 확인한다.

```powershell
& 'C:\Xilinx\Vitis_HLS\2023.2\bin\vitis_hls.bat' `
  -f .\scripts\hls\run_hls_realtime_rtl_engine_csim_only.tcl `
  -l .\logs\hls\vitis_hls_realtime_rtl_engine_csim.log
```

PASS 기준:

- `chunk4 passed`
- `chunk2 passed`
- `chunk1 passed`
- `Realtime 3-band stream smoke test passed`

## 2. High-Coverage C-sim

목적: `SubbandRealtimeTopQ610Ip`의 AXI-stream `df_coef` 전체를 C++ Q6.10 golden reference와 전수 비교한다.

```powershell
powershell -ExecutionPolicy Bypass `
  -File .\scripts\hls\run_realtime_rtl_engine_coverage_segments.ps1 `
  -ParallelJobs 1
```

기준 결과:

| 항목 | 기준 |
|---|---:|
| Total scenarios | 960 |
| Compared `df_coef` elements | 4,423,680 |
| `df_coef_mismatches` | 0 |
| `tlast_mismatches` | 0 |
| `size_mismatches` | 0 |
| `extra_output_errors` | 0 |

최종 보드 후보의 통과 로그는 아래 release bundle에 보존되어 있다.

```text
release/rtl_engine_board_candidate_20260523/verification_logs/coverage_segments_rtl_engine/
```

## 3. HLS Synthesis

목적: stable `USE_RTL_BAND_ENGINE` 경로가 Zybo Z7-20 resource와 latency 기준 안에 들어오는지 확인한다.

```powershell
& 'C:\Xilinx\Vitis_HLS\2023.2\bin\vitis_hls.bat' `
  -f .\scripts\hls\run_hls_realtime_rtl_engine_synth_only.tcl `
  -l .\logs\hls\vitis_hls_realtime_rtl_engine_synth.log
```

기준:

- latency `<= 1,000,000 cycles`
- BRAM_18K `<= 280`
- DSP `<= 220`
- LUT `<= 53,200`
- estimated clock `<= 10 ns`

최종 보드 후보의 보존 리포트:

```text
release/rtl_engine_board_candidate_20260523/hls_reports/SubbandRealtimeTopQ610Ip_csynth.rpt
```

## 4. Vivado Implementation

목적: DMA block design 포함 post-route timing/resource/DRC를 확인한다.

권장 실행은 safe wrapper를 사용한다.

```powershell
powershell -ExecutionPolicy Bypass `
  -File .\scripts\vivado\run_vivado_safe.ps1 `
  -Script .\scripts\vivado\run_vivado_realtime_dma_rtl_engine_impl.tcl
```

기준:

- bitstream 생성 성공
- post-route `WNS >= 0`
- DRC error 0
- LUT/FF/BRAM/DSP가 `xc7z020clg400-1` 한도 내

최종 보드 후보 산출물과 리포트는 아래에 보존되어 있다.

```text
release/rtl_engine_board_candidate_20260523/fpga/
release/rtl_engine_board_candidate_20260523/vivado_reports/
```

## 5. Board DMA Self-Test

목적: 실제 Zybo Z7-20에서 bitstream programming, bare-metal ELF 실행, DMA stream, HLS register access, DDR result block을 확인한다.

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\vitis\run_realtime_dma_selftest.ps1 -ProbeOnly
powershell -ExecutionPolicy Bypass -File .\scripts\vitis\run_realtime_dma_selftest.ps1 -Run
```

PASS 기준은 `docs/rtl_engine_board_bringup_readiness_ko.md`의 result block 표를 따른다.

## 6. Optional Wav Regression

Python inference의 wav 출력 회귀 검증은 system-level 보조 검증이다. HLS `df_coef` bit-exact 검증을 대체하지 않는다.

예시:

```powershell
python .\infer.py -i .\JH_test\test1.wav -o .\JH_test\test1_rerun.wav
python .\infer.py -i .\JH_test\test2.wav -o .\JH_test\test2_rerun.wav
```

비교 방식:

- sample rate 동일
- shape 동일
- sample-level exact 또는 허용 오차 기반 비교
- 기존 golden wav가 있을 경우 `Get-FileHash`로 파일 해시 비교
