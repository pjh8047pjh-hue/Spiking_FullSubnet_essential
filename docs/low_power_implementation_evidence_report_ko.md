# 실시간 음성 향상 HLS 가속기의 저전력 구현 근거 보고서

## 1. 실험 환경 및 평가 조건

본 설계는 Zybo Z7-20 보드에 탑재되는 Zynq-7020 계열 FPGA를 대상으로 하며, Vivado/Vitis HLS 2023.2 환경에서 구현 및 평가하였다. 대상 디바이스는 `xc7z020clg400-1`이며, HLS top은 `SubbandRealtimeTopQ610Ip`, Vivado block design 내 가속기 인스턴스는 `subband_realtime_0`이다. 시스템은 FFT-domain 입력을 AXI DMA를 통해 전달하고, HLS 가속기가 3-band time-share 방식으로 음성 향상용 DF coefficient를 생성하는 구조이다.

평가 클럭은 `100 MHz`이며, Vivado post-route timing report 기준 `clk_fpga_0`의 주기는 `10.000 ns`이다. Timing summary에서 WNS는 `+0.195 ns`, TNS는 `0.000 ns`로 보고되었으며, 모든 사용자 지정 timing constraint가 만족되었다. 따라서 본 설계는 100 MHz 조건에서 routing 이후에도 timing closure를 달성한 구현 결과를 기준으로 전력 및 자원 사용량을 분석하였다.

전력 수치는 실제 보드 측정값이 아니라 Vivado 2023.2의 post-route `report_power` 결과이다. 해당 power report는 routed design을 대상으로 생성되었으며, process condition은 typical이다. 다만 simulation activity file이 제공되지 않았기 때문에 내부 switching activity는 vectorless/default activity 기반으로 추정되었고, Vivado가 보고한 전체 confidence level은 `Medium`이다. 따라서 본 보고서에서는 모든 전력 값을 measured power가 아닌 post-route estimated power로 해석한다.

## 2. 실시간 처리 성능

Vitis HLS 합성 결과, `SubbandRealtimeTopQ610Ip`의 최대 latency는 `892,507 cycles`로 보고되었다. 100 MHz 클럭 기준 이는 `8.925 ms`에 해당한다. 본 설계는 4-frame chunk를 기본 처리 단위로 하며, 10 ms hop을 가정하면 4개 frame 입력이 누적되는 시간은 `40 ms`이다. 따라서 입력 대기 시간과 계산 시간을 합산한 end-to-end 지연은 다음과 같다.

```text
End-to-end latency = 40 ms input wait + 8.925 ms compute
                   = 48.925 ms
```

이 결과는 실시간 음성 향상을 위한 50 ms 이하 지연 조건을 만족한다. 또한 목표 성능을 100 MHz 단일 클럭에서 달성하므로, 더 높은 동작 주파수를 요구하지 않는다. 이는 FPGA 구현에서 clock tree power와 dynamic switching power를 과도하게 증가시키지 않고 실시간성을 확보했다는 점에서 저전력 설계의 근거로 사용할 수 있다.

## 3. FPGA 자원 활용 결과

Vivado post-route utilization report에서 전체 시스템의 주요 자원 사용량은 다음과 같이 보고되었다.

| Resource | Used | Available | Utilization |
|---|---:|---:|---:|
| DSP | 175 | 220 | 79.55% |
| Slice LUTs | 38,152 | 53,200 | 71.71% |
| Slice Registers | 48,845 | 106,400 | 45.91% |
| Block RAM Tile | 129.5 | 140 | 92.50% |
| BUFGCTRL | 1 | 32 | 3.13% |

본 설계는 MAC 연산 비중이 큰 RNN/GSU 기반 음성 향상 구조를 LUT fabric에 집중시키지 않고, DSP48 자원으로 적극 매핑하였다. 그 결과 DSP 사용률은 `79.55%`로 높지만, post-route power report에서 DSP block이 차지하는 추정 전력은 `0.145 W`로 제한되었다. DSP당 평균 추정 전력은 다음과 같다.

```text
DSP power per used DSP = 0.145 W / 175
                       = 0.000829 W
                       = 0.829 mW/DSP
```

이 수치는 본 설계가 연산 병렬성을 확보하면서도 DSP48 기반 MAC 구조를 통해 LUT 기반 연산 확장보다 전력 효율적인 방향으로 구현되었음을 보여준다. 특히 LUT 사용률은 `71.71%`, FF 사용률은 `45.91%`로 디바이스 한도 내에 있으며, 주요 산술 연산을 DSP에 배치함으로써 LUT fabric의 과도한 증가를 억제하였다.

## 4. Post-route 전력 추정 결과

Vivado post-route power report의 전체 on-chip power는 `2.304 W`이며, dynamic power는 `2.133 W`, device static power는 `0.171 W`로 보고되었다. 주요 구성 요소별 전력은 다음과 같다.

| Component | Estimated Power |
|---|---:|
| Total On-Chip Power | 2.304 W |
| Dynamic Power | 2.133 W |
| Device Static Power | 0.171 W |
| HLS Accelerator `subband_realtime_0` | 0.542 W |
| PS7 | 1.531 W |
| DSPs | 0.145 W |
| Block RAM | 0.026 W |
| Clocks | 0.080 W |
| Slice Logic | 0.148 W |
| Signals | 0.204 W |

전체 on-chip power `2.304 W`에는 Zynq processing system, AXI DMA, interconnect, HLS accelerator가 모두 포함된다. 이 중 PS7의 추정 전력은 `1.531 W`로 전체 전력의 가장 큰 비중을 차지한다. 반면 제안한 HLS accelerator인 `subband_realtime_0`의 계층별 추정 전력은 `0.542 W`이다. 즉, 전체 SoC 전력 중 상당 부분은 음성 향상 연산 코어 자체가 아니라 PS7 및 DMA 기반 테스트 플랫폼에서 발생한다.

제안 가속기 전력의 전체 전력 대비 비율은 다음과 같다.

```text
Accelerator power ratio = 0.542 W / 2.304 W
                        = 23.5%
```

반면 PS7 전력 비율은 다음과 같다.

```text
PS7 power ratio = 1.531 W / 2.304 W
                = 66.4%
```

따라서 본 설계의 저전력성을 논의할 때는 전체 Zynq SoC power만을 기준으로 평가하기보다, 제안한 FPGA accelerator 계층의 전력과 PS/DMA 플랫폼 전력을 분리하여 분석하는 것이 타당하다. Post-route 추정 결과 기준으로 제안 가속기는 `0.542 W`에서 3-band 실시간 음성 향상 연산을 수행하며, 100 MHz에서 50 ms 이하 지연 조건을 만족한다.

## 5. 논문 본문용 서술 예시

다음 문단은 논문 본문에 그대로 사용할 수 있는 보수적 서술 예시이다.

> 제안한 실시간 음성 향상 가속기는 Xilinx Zynq-7020 계열의 `xc7z020clg400-1` 디바이스를 대상으로 Vivado/Vitis HLS 2023.2 환경에서 구현하였다. Post-route timing analysis 결과, 100 MHz 조건에서 WNS는 `+0.195 ns`, TNS는 `0.000 ns`로 나타나 모든 timing constraint를 만족하였다. HLS 합성 결과 4-frame chunk 처리에 대한 최대 latency는 `892,507 cycles`로, 100 MHz 기준 `8.925 ms`에 해당한다. 10 ms hop을 갖는 입력 frame 4개를 처리한다고 가정하면 전체 지연은 입력 대기 시간 `40 ms`와 계산 시간 `8.925 ms`를 합산한 `48.925 ms`로, 실시간 음성 향상을 위한 50 ms 이하 조건을 만족한다.

> Vivado post-route power estimation 결과, 전체 on-chip power는 `2.304 W`로 추정되었으며, 이 중 HLS accelerator 계층인 `subband_realtime_0`의 추정 전력은 `0.542 W`이다. 전체 전력에는 PS7, AXI DMA, interconnect가 포함되며, PS7 단독 전력은 `1.531 W`로 전체의 약 `66.4%`를 차지한다. 따라서 제안한 음성 향상 연산 코어의 전력은 전체 Zynq 테스트 플랫폼 전력과 분리하여 해석할 필요가 있다. 제안 가속기는 DSP48 자원을 `175/220`, 즉 `79.55%` 사용하면서도 DSP block의 추정 전력은 `0.145 W`로 제한되었으며, 이는 사용 DSP당 약 `0.829 mW`에 해당한다. 이러한 결과는 MAC 중심의 RNN 연산을 LUT fabric이 아닌 DSP48 자원에 집중 배치함으로써 실시간 처리 성능과 전력 효율을 동시에 확보했음을 보여준다.

> 단, 본 전력 결과는 실제 보드 전류 측정값이 아니라 Vivado post-route power estimation 결과이다. Simulation activity file이 포함되지 않아 내부 switching activity는 tool default/vectorless activity에 기반하며, Vivado가 보고한 confidence level은 `Medium`이다. 따라서 최종 실측 전력 검증을 위해서는 실제 DMA workload 기반 SAIF/VCD power analysis 또는 Zybo Z7-20 보드의 전류 측정이 추가로 필요하다.

## 6. 표 및 캡션 예시

**표 1. 제안 HLS 가속기의 post-route 자원 사용량**

| Resource | Used / Available | Utilization |
|---|---:|---:|
| DSP | 175 / 220 | 79.55% |
| Slice LUTs | 38,152 / 53,200 | 71.71% |
| Slice Registers | 48,845 / 106,400 | 45.91% |
| Block RAM Tile | 129.5 / 140 | 92.50% |

**표 2. Vivado post-route power estimation 결과**

| Item | Estimated Power |
|---|---:|
| Total On-Chip Power | 2.304 W |
| Dynamic Power | 2.133 W |
| Static Power | 0.171 W |
| Proposed HLS Accelerator | 0.542 W |
| PS7 | 1.531 W |
| DSP Blocks | 0.145 W |
| Block RAM | 0.026 W |
| Clock Network | 0.080 W |

**표 3. 실시간 처리 성능 요약**

| Metric | Result |
|---|---:|
| Clock Frequency | 100 MHz |
| Clock Period | 10.000 ns |
| Post-route WNS | +0.195 ns |
| HLS Compute Latency | 892,507 cycles |
| HLS Compute Time | 8.925 ms |
| 4-frame Input Wait | 40 ms |
| Estimated End-to-End Latency | 48.925 ms |

## 7. 한계 및 추가 검증 필요 사항

본 결과는 routed implementation에서 생성된 Vivado power estimation이므로, 실제 보드에서 측정한 소비 전력과 차이가 있을 수 있다. 특히 simulation activity file이 없는 상태에서는 내부 노드 switching activity가 실제 음성 입력 패턴과 완전히 일치하지 않는다. 따라서 논문에서 본 수치를 사용할 때는 `post-route estimated power` 또는 `Vivado power estimation`으로 표현해야 하며, `measured power`라고 표현해서는 안 된다.

향후 검증 단계에서는 실제 DMA workload를 사용해 SAIF/VCD 기반 switching activity를 생성하고, 이를 Vivado power analysis에 반영하는 것이 바람직하다. 또한 Zybo Z7-20 보드의 전원 rail 전류를 측정하면 tool estimation과 실제 board-level power 사이의 차이를 정량화할 수 있다. 이 추가 검증을 통해 제안 가속기의 저전력성을 더 강한 실험 근거로 제시할 수 있다.

## 8. 사용한 리포트

- HLS synthesis: `build/hls/subband_q610_realtime_hls/solution1/syn/report/SubbandRealtimeTopQ610Ip_csynth.rpt`
- Vivado post-route utilization: `build/vivado/vivado_realtime_dma_zybo_z7_20/reports/post_route_util.rpt`
- Vivado post-route timing: `build/vivado/vivado_realtime_dma_zybo_z7_20/reports/post_route_timing_summary.rpt`
- Vivado post-route power: `build/vivado/vivado_realtime_dma_zybo_z7_20/reports/post_route_power.rpt`
