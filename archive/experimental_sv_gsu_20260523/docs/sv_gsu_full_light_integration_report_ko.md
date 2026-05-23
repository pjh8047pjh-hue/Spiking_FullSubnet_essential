# GSU Layer + Projection SV RTL Light Integration Report

## 요약

`SubbandRealtimeTopQ610Ip`의 외부 인터페이스는 유지한 상태에서 GSU layer와 projection dot-product를 SystemVerilog RTL blackbox 경로로 연결하는 light integration을 진행했다.

이번 라운드는 사용자가 요청한 대로 hard verification은 돌리지 않았다. 실행 범위는 SV syntax compile, smoke C-sim, HLS csynth 시도까지다.

결론부터 말하면, smoke C-sim은 통과했지만 현재 `USE_SV_GSU_FULL` synthesis는 Vitis HLS 2023.2 내부 `EXCEPTION_ACCESS_VIOLATION`으로 완료되지 않았다. 따라서 이번 경로에 대한 새 latency/resource 수치는 아직 생성되지 않았다.

## 추가/수정 파일

- `subband_ref_q610_opt_stage4_latency_stepL2.cpp`
  - `USE_SV_GSU_FULL` compile switch 추가
  - `RunSvGsuLayerFullTilesQ610` C shim 추가
  - `ProjectionDotProductPackedScalarSvQ610` C shim 추가
  - C-sim에서는 기존 C++ Q6.10 동작을 사용하고, synthesis에서는 RTL blackbox 연결을 의도하도록 구성
- `rtl/gsu/gsu_layer_full_tiles_bb.sv`
  - GSU layer-level SystemVerilog RTL
  - frame/subband/hidden/tile FSM, Q6.10 arithmetic, sigmoid PWL, gate update, BN, step activation 포함
- `rtl/gsu/gsu_layer_full_tiles_bb.json`
  - Vitis HLS blackbox JSON
- `rtl/gsu/projection_dot_scalar_bb.sv`
  - projection dot-product용 scalar-port SystemVerilog RTL blackbox
- `rtl/gsu/projection_dot_scalar_bb.json`
  - Vitis HLS blackbox JSON
- `scripts/hls/run_hls_realtime_sv_gsu_full_csim_only.tcl`
  - `USE_SV_GSU_FULL` smoke C-sim용 Tcl
- `scripts/hls/run_hls_realtime_sv_gsu_full_synth_only.tcl`
  - `USE_SV_GSU_FULL` csynth용 Tcl
- `scripts/hls/run_hls_realtime_sv_gsu_full_synth_gsu_only.tcl`
  - GSU blackbox만 켠 진단용 Tcl
- `scripts/hls/run_hls_realtime_sv_gsu_full_synth_projection_only.tcl`
  - projection blackbox만 켠 진단용 Tcl

## Light Sanity 결과

### 1. SV syntax compile

명령:

```powershell
& 'C:\Xilinx\Vivado\2023.2\bin\xvlog.bat' -sv .\rtl\gsu\gsu_q610_pkg.sv .\rtl\gsu\gsu_layer_full_tiles_bb.sv .\rtl\gsu\projection_dot_scalar_bb.sv
```

결과:

- `gsu_q610_pkg.sv` 분석 통과
- `RunSvGsuLayerFullTilesQ610` 분석 통과
- `ProjectionDotProductPackedScalarSvQ610` 분석 통과
- syntax error 없음

### 2. HLS smoke C-sim

명령:

```powershell
& 'C:\Xilinx\Vitis_HLS\2023.2\bin\vitis_hls.bat' -f H:/scripts/hls/run_hls_realtime_sv_gsu_full_csim_only.tcl -l H:/logs/hls/vitis_hls_realtime_sv_gsu_full_csim.log
```

로그 근거:

- `chunk4 passed.`
- `chunk2 passed.`
- `chunk1 passed.`
- `Realtime 3-band stream smoke test passed.`
- `Finished Command csim_design`

주의:

- 이 결과는 작은 smoke 검증이다.
- 32-seed high-coverage 검증, RTL coverage, RTL cosim은 이번 라운드에서 의도적으로 실행하지 않았다.

### 3. HLS csynth

명령:

```powershell
& 'C:\Xilinx\Vitis_HLS\2023.2\bin\vitis_hls.bat' -f H:/scripts/hls/run_hls_realtime_sv_gsu_full_synth_only.tcl -l H:/logs/hls/vitis_hls_realtime_sv_gsu_full_synth.log
```

결과:

- `csynth_design`은 시작됨.
- blackbox JSON 추가 명령은 로그에 남음.
  - `add_files -blackbox H:/rtl/gsu/gsu_layer_full_tiles_bb.json`
  - `add_files -blackbox H:/rtl/gsu/projection_dot_scalar_bb.json`
- 최종 `SubbandRealtimeTopQ610Ip_csynth.rpt`는 생성되지 않음.
- 생성된 report는 `csynth_design_size.rpt`, `csynth_design_size.xml`까지만 확인됨.
- Vitis HLS가 내부 예외로 비정상 종료됨.

로그 근거:

```text
Abnormal program termination (EXCEPTION_ACCESS_VIOLATION)
Please check 'C:/Users/User/Documents/Speech Enhancement/Spiking_FullSubnet_opt_hls/hs_err_pid19644.log' for details
```

## 진단 분리 결과

### Projection-only

명령:

```powershell
& 'C:\Xilinx\Vitis_HLS\2023.2\bin\vitis_hls.bat' -f H:/scripts/hls/run_hls_realtime_sv_gsu_full_synth_projection_only.tcl -l H:/logs/hls/vitis_hls_realtime_sv_gsu_full_synth_projection_only.log
```

결과:

- projection blackbox만 켠 상태에서도 `EXCEPTION_ACCESS_VIOLATION` 재현.
- 최신 근거 파일: `hs_err_pid6832.log`
- 최종 csynth report 없음.

해석:

- 현재 full synthesis를 막는 1차 위험 지점은 projection SV blackbox 경로다.
- RAM_T2P projection wrapper와 scalar-port projection wrapper 모두 Vitis HLS 2023.2 Windows 환경에서 내부 crash를 유발했다.

### GSU-only

명령:

```powershell
& 'C:\Xilinx\Vitis_HLS\2023.2\bin\vitis_hls.bat' -f H:/scripts/hls/run_hls_realtime_sv_gsu_full_synth_gsu_only.tcl -l H:/logs/hls/vitis_hls_realtime_sv_gsu_full_synth_gsu_only.log
```

결과:

- projection-only와 달리 즉시 crash는 발생하지 않음.
- `RunSvGsuLayerFullTilesQ610` 구현 단계까지 진입함.
- 로그 마지막 주요 지점:

```text
INFO: [HLS 200-42] -- Implementing module 'p_anonymous_namespace_RunRealtimeGSULayersSvFullQ610'
INFO: [SCHED 204-11] Starting scheduling ...
```

- 최종 `SubbandRealtimeTopQ610Ip_csynth.rpt`는 생성되지 않음.

해석:

- GSU layer SV 경로는 projection보다 앞서 막히는 직접 crash 원인은 아니지만, 아직 완전한 csynth 완료까지 확인되지는 않았다.
- 이 경로는 projection을 제거한 더 작은 top 또는 Vivado-level RTL IP 통합으로 다시 확인할 가치가 있다.

## 현재 결론

이번 synthesis는 실행했지만 성공 완료되지는 않았다. 따라서 다음 항목은 아직 주장할 수 없다.

- `USE_SV_GSU_FULL` 경로의 최종 latency
- `USE_SV_GSU_FULL` 경로의 LUT/BRAM/DSP/FF
- `USE_SV_GSU_FULL` 경로의 post-route timing/power

현재 확정적으로 말할 수 있는 것은 다음이다.

- SV syntax compile은 통과했다.
- smoke C-sim은 통과했다.
- full csynth는 Vitis HLS 2023.2 내부 crash로 실패했다.
- projection SV blackbox는 독립 진단에서도 crash를 재현하므로, 현재 synthesis blocker로 분류된다.

## 다음 권장 작업

1. projection SV blackbox를 잠시 끄고 GSU layer SV path만 합성 가능한 형태로 줄인다.
2. GSU-only csynth가 끝나면 latency/resource 차이를 먼저 확인한다.
3. projection은 HLS blackbox JSON 대신 Vivado 단계의 독립 RTL IP 또는 더 단순한 RTL wrapper 방식으로 연결하는 쪽이 안전하다.
4. 최종 정확도 근거는 다음 라운드에서 high-coverage C-sim 또는 custom xsim BFM으로 다시 만들어야 한다.

## 이번 라운드에서 실행하지 않은 검증

- 32-seed high-coverage C-sim
- RTL line/branch/condition/toggle coverage
- Vitis HLS cosim
- custom xsim AXIS BFM integration
- Vivado implementation, route, bitstream, power report

