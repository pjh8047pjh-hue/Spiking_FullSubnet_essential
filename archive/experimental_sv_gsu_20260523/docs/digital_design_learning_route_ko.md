# 디지털 설계 공부 루트

이 문서는 이 프로젝트를 기준으로 디지털 설계를 공부하기 위한 실행형 루트다. 목표는 Verilog/SystemVerilog 문법을 외우는 것이 아니라, RTL이 멈추는 이유, AXI가 hang 나는 이유, BRAM/DSP/timing report가 설계 구조와 어떻게 연결되는지를 스스로 설명하는 것이다.

## 1. 학습 방향

추천 순서는 아래와 같다.

1. **RTL 사고방식**
   - combinational/sequential logic, FSM, reset, counter, RAM, FIFO, valid/ready를 작은 모듈로 만든다.
   - 실습 파일: `rtl/learning/basic_rtl_labs.sv`
   - 실행 파일: `scripts/rtl/run_learning_labs_xsim.ps1`

2. **검증 습관**
   - testbench가 정상 입력만 넣는지, 일부러 깨지는 상황까지 넣는지 구분한다.
   - `TREADY` random stall, reset, full/empty, output ordering, TLAST 위치를 확인한다.
   - 실습 파일: `testbench/learning/tb_learning_labs.sv`

3. **AXI4-Stream / AXI-Lite**
   - AXI4-Stream은 `TVALID && TREADY`에서만 전송이 일어난다는 규칙부터 완전히 고정한다.
   - `TVALID=1`이고 `TREADY=0`이면 `TDATA/TLAST/TKEEP`는 유지되어야 한다.
   - 이 프로젝트에서는 `df_coef_stream`의 output count와 TLAST 위치가 DMA packet framing과 직접 연결된다.

4. **FPGA 구현 감각**
   - Vivado report를 숫자표로만 보지 말고 설계 구조의 증상으로 읽는다.
   - 이 repo의 핵심 관찰점:
     - BRAM 사용률이 높으면 state/weight/output buffering 구조를 의심한다.
     - Slice occupied가 높으면 mux, fanout, placement 여유를 의심한다.
     - DPOP/DPIP warning은 DSP pipeline과 timing/power 효율 문제로 본다.
     - C-sim PASS와 RTL cosim PASS는 서로 다른 검증이다.

5. **HLS와 RTL 연결**
   - HLS top은 인터페이스와 전체 데이터흐름을 빨리 만드는 도구로 본다.
   - RTL은 GSU/projection 같은 병목 block을 명시적인 FSM/datapath로 제어하는 도구로 본다.
   - 현재 프로젝트의 현실적인 목표는 `SubbandRealtimeTopQ610Ip` 외부 인터페이스를 유지하고 내부 병목만 RTL blackbox로 치환하는 것이다.

## 2. 주간 루틴

| 요일 | 할 일 | 산출물 |
|---|---|---|
| 월/화 | 작은 RTL 하나 읽고 수정 | counter, FIFO, skid buffer, MAC FSM 중 하나 |
| 수 | testbench 강화 | random stall, reset, overflow/underflow 시나리오 |
| 목 | xsim waveform/report 확인 | 멈춘 cycle과 원인 메모 |
| 금 | 본 프로젝트와 연결 | `df_coef_stream`, DMA packet length, BRAM 병목 중 하나 분석 |
| 주말 | 문서 1개 읽기 | 읽은 내용과 repo 파일 1개를 연결해서 요약 |

## 3. 바로 실행할 첫 실습

PowerShell에서 아래를 실행한다.

```powershell
powershell -ExecutionPolicy Bypass -File scripts\rtl\run_learning_labs_xsim.ps1
```

실습 testbench는 다음을 확인한다.

- counter wrap 동작
- skid buffer가 random `m_ready` stall에서도 data ordering과 TLAST를 보존하는지
- simple MAC FSM이 input stall을 견디고 기대 누산값을 내는지

PASS가 나오면 다음 순서로 확장한다.

1. `learning_sync_fifo`에 randomized producer/consumer test를 추가한다.
2. skid buffer 앞뒤에 FIFO를 붙인다.
3. dummy compute core를 AXI4-Stream wrapper로 감싼다.
4. output `TLAST`를 일부러 틀리게 만든 뒤 testbench가 잡는지 확인한다.
5. 같은 패턴을 `SubbandRealtimeTopQ610Ip`의 `df_coef_stream` 검증으로 옮긴다.

## 4. 이 프로젝트 기준 과제

| 과제 | 보면 좋은 파일 | 완료 기준 |
|---|---|---|
| GSU RTL FSM 다시 그리기 | `rtl/gsu/gsu_layer_engine_rtl.sv` | state 전이와 counter 조건을 그림으로 설명 |
| AXIS backpressure 이해 | `rtl/learning/basic_rtl_labs.sv` | `TREADY=0` 동안 payload가 유지됨을 waveform에서 확인 |
| TLAST/DMA framing 이해 | `testbench/subband_realtime_hls_coverage_tb.cpp` | chunk별 output count와 TLAST 위치 설명 |
| C-sim vs RTL cosim 구분 | `docs/fpga_readiness_summary.md` | C-sim PASS가 RTL handshake를 보장하지 않는 이유 설명 |
| BRAM/DSP/timing report 읽기 | `docs/low_power_implementation_evidence_report_ko.md` | resource 숫자를 코드 구조와 연결한 표 작성 |

## 5. 참고 자료

- MIT OCW 6.111 Introductory Digital Systems Laboratory: https://ocw.mit.edu/courses/6-111-introductory-digital-systems-laboratory-spring-2006/
- AMD Vivado FPGA Design Flow Workshop: https://www.amd.com/fr/corporate/university-program/vivado/vivado-workshops/vivado-fpga-design-flow.html
- Arm AMBA Specifications: https://www.arm.com/architecture/system-architectures/amba/amba-specifications
- AMD UG1399 AXI4-Stream Interfaces: https://docs.amd.com/r/2023.2-English/ug1399-vitis-hls/AXI4-Stream-Interfaces
- nand2tetris: https://www.nand2tetris.org/copy-of-cool-stuff

## 6. 공부 노트 템플릿

매번 아래 5줄만 남긴다. 길게 쓰려고 하면 오래 못 간다.

```text
날짜:
오늘 본 RTL/문서:
내가 예측한 동작:
waveform/report에서 실제로 본 것:
다음에 확인할 질문:
```

