# 프로젝트 파일 정리 구조

루트 디렉터리는 소스 코드와 핵심 문서 위주로 유지하고, 실행 산출물은 아래 폴더로 분리하였다.

| 폴더 | 내용 |
|---|---|
| `scripts/hls/` | Vitis HLS 실행 Tcl |
| `scripts/vivado/` | Vivado batch 실행 Tcl |
| `testbench/` | HLS C-sim용 C++ testbench |
| `logs/hls/` | Vitis HLS 및 C-sim 로그 |
| `logs/vivado/` | Vivado log/journal |
| `build/hls/` | 생성된 HLS project 및 synthesis/csim report |
| `build/vivado/` | Vivado project, bitstream, XSA, post-route report |
| `artifacts/executables/` | 임시 로컬 C-sim 실행파일 |

## 주요 실행 예시

공백 포함 경로 문제를 피하기 위해 HLS Tcl은 필요 시 내부적으로 `C:/hls_subband` 임시 경로를 사용할 수 있다.

```powershell
& 'C:\Xilinx\Vitis_HLS\2023.2\bin\vitis_hls.bat' -f scripts/hls/run_hls_realtime_csim_coverage.tcl -l logs/hls/vitis_hls_realtime_csim_coverage.log
```

```powershell
& 'C:\Xilinx\Vivado\2023.2\bin\vivado.bat' -mode batch -source scripts/vivado/run_vivado_realtime_dma_impl.tcl -journal logs/vivado/vivado_realtime_dma.jou -log logs/vivado/vivado_realtime_dma.log
```

## 참고

- 기존 HLS/Vivado 결과물은 `build/` 아래로 이동했다.
- 기존 로그는 `logs/hls/`, `logs/vivado/`로 이동했다.
- 기존 Tcl은 새 위치 기준으로 소스, testbench, build 경로를 찾도록 수정했다.
