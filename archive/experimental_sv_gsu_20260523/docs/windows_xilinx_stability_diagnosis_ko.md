# Windows Vivado/Vitis 안정성 진단 메모

## 결론

오늘 발생한 멈춤은 Vivado 단일 오류라기보다, Vivado/Vitis 같은 대형 합성 작업과 Claude/VS Code/GUI 프로세스를 동시에 돌리면서 Windows commit memory가 압박되고, 그 여파로 DWM과 .NET 서비스까지 연쇄 실패한 증상으로 판단된다.

2026-05-22 오후 2:49 재시도에서도 `USE_SV_GSU_FULL` HLS csynth가 `RunRealtimeSingleGsuLayerSvFullQ610` binding 단계에 진입한 직후 시스템이 다시 비정상 재부팅됐다. 이 경로는 현재 Windows Vitis HLS 2023.2에서 PC 안정성을 해치는 것으로 분류하고, 기본 실행을 차단한다.

## 관측 증거

- 현재 Xilinx 잔여 프로세스: 없음
- 현재 여유 메모리: 약 9.8 GB
- 현재 commit: 약 8.2 GB / 19.6 GB
- C: 여유 공간: 약 336 GB
- Windows System log:
  - `Kernel-Power 41`: 비정상 재부팅/먹통 이벤트 2회
  - `Volsnap 6`: `The system may be low on virtual memory`
  - `EventLog 6008`: unexpected shutdown
- 2026-05-22 14:54 추가 System log:
  - `Kernel-Power 41`: HLS csynth 중 비정상 재부팅
  - `EventLog 6008`: 이전 shutdown 시각 `14:49:31`
- Windows Application log:
  - `dwm.exe` 오류 다수
  - `.NET Runtime` / `LogiPluginService.exe` heap initialization 실패
  - `powershell.exe` stack overflow 계열 오류
- 2026-05-22 14:52~14:53 추가 Application log:
  - `dwm.exe` fault, exception `0xc00000fd`
  - `msedgewebview2.exe` fault
  - `LogiPluginService.exe` CoreCLR 생성 실패 `0x800705AA`
- HLS log:
  - 마지막 정상 지점은 `RunSvGsuLayerFullTilesQ610` IP block 인식 이후 `p_anonymous_namespace_RunRealtimeSingleGsuLayerSvFullQ610` binding 진입이다.
  - `SubbandRealtimeTopQ610Ip_csynth.rpt`는 생성되지 않았다.

## 적용한 보호 조치

- Vivado Tcl에서 기본 thread 수를 `2`로 제한했다.
  - `scripts/vivado/run_vivado_realtime_dma_impl.tcl`
  - `scripts/vivado/run_vivado_realtime_dma_xsa_only.tcl`
- `VIVADO_MAX_THREADS` 환경변수로 필요할 때만 thread 수를 올릴 수 있게 했다.
- 안전 실행 wrapper를 추가했다.
  - `scripts/vivado/run_vivado_safe.ps1`
  - 기존 Xilinx 프로세스가 남아 있으면 기본적으로 실행을 거부한다.
  - 사용 가능 메모리가 8 GB 미만이면 실행을 거부한다.
  - Vivado를 `BelowNormal` priority와 hidden batch mode로 실행한다.
- `USE_SV_GSU_FULL` HLS blackbox csynth 스크립트는 기본 실행을 차단했다.
  - `scripts/hls/run_hls_realtime_sv_gsu_full_synth_gsu_only.tcl`
  - `scripts/hls/run_hls_gsu_layer_full_tiles_blackbox_synth_only.tcl`
  - 강제 실행은 `ALLOW_UNSTABLE_HLS_BB=1` 환경변수를 명시해야 가능하다.

## 권장 실행 방식

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\vivado\run_vivado_safe.ps1
```

잔여 Xilinx 프로세스를 강제로 종료하고 시작해야 할 때만:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\vivado\run_vivado_safe.ps1 -KillStale
```

## 재발 방지 규칙

- Vivado implementation과 Claude/다른 AI agent의 대형 작업을 동시에 실행하지 않는다.
- GUI Vivado보다 batch mode를 우선 사용한다.
- 안정화 전까지 `VIVADO_MAX_THREADS=2`를 기본값으로 둔다.
- post-route implementation은 하나씩 실행한다.
- 멈춤이 다시 발생하면 Windows pagefile을 system-managed 또는 최소 32 GB 이상으로 늘린 뒤 재시도한다.
- `USE_SV_GSU_FULL` HLS blackbox csynth는 이 Windows 환경에서 더 이상 반복하지 않는다.
- 다음 검증은 Vivado out-of-context synthesis 또는 Linux Vitis HLS 환경에서 수행한다.
