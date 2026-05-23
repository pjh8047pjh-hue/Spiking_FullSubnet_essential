# SystemVerilog GSU Layer RTL 전환 진행 보고서

## 요약

- `SubbandRealtimeTopQ610Ip`의 외부 AXI 인터페이스는 건드리지 않고, 병목인 GSU layer를 직접 RTL로 옮기기 위한 독립 SystemVerilog core를 추가했다.
- 추가된 RTL은 `HiddenPar=2`, `DotPar=32`, signed Q6.10, 48-bit accumulator, sigmoid PWL, gate update, BN, step activation을 C++ Q6.10 규칙과 맞춘다.
- 이번 단계는 RTL core와 xsim 단위/기능 검증 harness를 먼저 만든 단계다. HLS blackbox production 연결은 RAM_T2P 포트 mapping이 필요하므로 별도 integration 단계로 남는다.

## 추가 파일

- `rtl/gsu/gsu_q610_pkg.sv`: Q6.10 arithmetic package.
- `rtl/gsu/gsu_layer_engine_rtl.sv`: 직접 작성한 SystemVerilog GSU layer FSM.
- `rtl/gsu/gsu_layer_engine_bb.v`: HLS blackbox wrapper 자리. 현재는 production wrapper가 아니라 integration stub이다.
- `testbench/rtl/tb_gsu_layer_engine_rtl.sv`: arithmetic, cell, layer 기능을 비교하는 xsim testbench.
- `scripts/rtl/run_gsu_layer_engine_xsim.ps1`: Vivado xsim 실행 스크립트.

## 실행 결과

- 실행 명령:
  - `powershell -ExecutionPolicy Bypass -File scripts\rtl\run_gsu_layer_engine_xsim.ps1 -Threads 8`
- xsim 결과:
  - scenarios: `84`
  - checked elements: `497,728`
  - mismatches: `0`
  - result: `GSU layer RTL unit/function test PASS`
- 대표 latency:
  - `(frames=4, subbands=8, input_size=38)`: `40,322 cycles`
  - `(frames=4, subbands=3, input_size=94)`: `15,682 cycles`
  - `(frames=4, subbands=2, input_size=158)`: `10,754 cycles`
  - `(frames=2, subbands=8, input_size=224)`: `20,610 cycles`
- Coverage report:
  - `build/rtl/gsu_layer_engine_xsim/codecov_report/index.html`
  - RTL module `gsu_layer_engine_rtl_default`: line `100%`, branch `90.91%`, condition `100%`
  - 전체 report 점수는 testbench까지 포함되어 line `96.08%`, branch `89.83%`, condition `78.57%`이다. acceptance 기준은 RTL DUT module 기준으로 판단한다.

## 검증 시나리오

- arithmetic unit: saturation, positive/negative round-shift, Q6.10 multiply, sigmoid clamp/boundary/mirror, step activation.
- control edge: zero-frame, zero-subband, `input_size=1`, `input_size=0`.
- layer function:
  - seeds 4개
  - profiles 5개
  - band-like shapes: `(frames, subbands, input_size) = (4,8,38), (4,3,94), (4,2,158), (2,8,224)`
  - output sequence, final `hx`, final `cx`를 cycle-independent reference와 전수 비교

## 남은 integration 이슈

- AMD Vitis HLS RTL blackbox는 JSON으로 array를 RAM 포트에 mapping할 수 있지만, production HLS 연결에는 `weight_ih`, `weight_hh`, state, output을 RAM_T2P 형태로 정확히 맞춘 wrapper가 필요하다.
- 현재 `gsu_layer_engine_bb.v`는 이 포트를 확정하기 전의 stub이다. 바로 HLS synthesis에 넣는 최종 blackbox가 아니다.
- 따라서 이번 보고서의 검증 표현은 “standalone SystemVerilog GSU layer core 검증”으로 제한해야 하며, `df_coef` end-to-end bit-exact 주장은 기존 HLS high-coverage C-sim 결과와 분리해서 적어야 한다.

## 참고

- AMD Vitis HLS RTL blackbox는 C 함수 signature, JSON description, RTL IP files를 요구하고, Verilog RTL과 `ap_ctrl_chain` 스타일 common signal mapping을 사용한다.
