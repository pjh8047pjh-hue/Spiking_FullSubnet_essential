# Subband Realtime FPGA 설계 천천히 이해하기

이 문서는 `SubbandRealtimeTopQ610Ip` 설계를 대학교 2학년 수준에서 천천히 이해하기 위한 설명서다. Verilog/SystemVerilog를 조금 봤거나, HLS와 FPGA를 이제 연결해서 배우는 사람을 기준으로 쓴다.

목표는 이 문서를 다 읽은 뒤 아래 문장을 스스로 설명할 수 있게 되는 것이다.

> 이 설계는 FFT-domain 음성 입력 두 개를 AXI4-Stream으로 받아, 3개 frequency band를 순서대로 처리하고, Q6.10 fixed-point GSU/RNN 계층과 projection을 거쳐 실시간 음성 향상용 `df_coef`를 AXI4-Stream으로 출력하는 FPGA 가속기다.

관련 파일:

- HLS top 선언: [`subband_ref_q610.hpp`](../subband_ref_q610.hpp)
- HLS 구현: [`subband_ref_q610_opt_stage4_latency_stepL2.cpp`](../subband_ref_q610_opt_stage4_latency_stepL2.cpp)
- smoke testbench: [`testbench/subband_realtime_hls_tb.cpp`](../testbench/subband_realtime_hls_tb.cpp)
- coverage testbench: [`testbench/subband_realtime_hls_coverage_tb.cpp`](../testbench/subband_realtime_hls_coverage_tb.cpp)
- GSU RTL core: [`rtl/gsu/gsu_layer_engine_rtl.sv`](../rtl/gsu/gsu_layer_engine_rtl.sv)
- RTL 학습 lab: [`rtl/learning/basic_rtl_labs.sv`](../rtl/learning/basic_rtl_labs.sv)
- FPGA readiness: [`docs/fpga_readiness_summary.md`](fpga_readiness_summary.md)

---

## 0. 먼저 큰 그림부터

이 설계는 음성 향상 모델을 FPGA에서 실시간으로 돌리기 위한 가속기다. CPU나 Python에서 하던 계산을 FPGA logic, BRAM, DSP로 옮기는 것이 목적이다.

입력은 이미 FFT가 끝난 frequency-domain 데이터라고 생각하면 된다. 시간-domain waveform을 직접 받는 구조가 아니라, 각 frame마다 frequency bin 값들이 들어온다.

전체 흐름은 다음과 같다.

```text
noisy FFT stream       feedback FFT stream
      |                       |
      v                       v
  AXI4-Stream input       AXI4-Stream input
      |                       |
      +----------+------------+
                 |
                 v
        4-frame realtime chunk
                 |
                 v
      +------------------------+
      | 3-band subband engine  |
      |                        |
      | band0 -> GSU -> proj   |
      | band1 -> GSU -> proj   |
      | band2 -> GSU -> proj   |
      +------------------------+
                 |
                 v
           df_coef stream
                 |
                 v
          AXI4-Stream output
```

여기서 `df_coef`는 deep filtering coefficient의 약자로 보면 된다. 음성 향상 후단에서 frequency bin을 보정하는 계수다.

이 설계의 HLS top 이름은 `SubbandRealtimeTopQ610Ip`다. 외부에서 볼 때는 하나의 FPGA IP처럼 보인다.

```text
SubbandRealtimeTopQ610Ip
  input  : noisy_fft_stream
  input  : fb_fft_stream
  input  : weights_q610 from DDR
  control: num_frames, reset_state
  output : df_coef_stream
```

**여기까지 이해했는지 확인**

- 이 설계는 time-domain waveform을 직접 처리하는가, FFT-domain 값을 처리하는가?
- `df_coef_stream`은 입력인가 출력인가?
- 왜 HLS top 이름이 중요할까?

---

## 1. 필요한 디지털 설계 기초

이 설계를 이해하려면 고급 이론보다 아래 6개가 먼저 필요하다.

### 1.1 Clock

FPGA 회로는 대부분 clock edge에 맞춰 움직인다.

```text
clk:  _/^\_/^\_/^\_/^\_/^\_
          ^   ^   ^   ^
          register update
```

`always_ff @(posedge clk)`는 clock 상승 edge마다 register를 갱신한다는 뜻이다.

이 설계는 Vivado 구현 기준 100 MHz clock을 목표로 한다. 100 MHz는 한 cycle이 10 ns라는 뜻이다.

```text
100 MHz -> 10 ns per cycle
892,507 cycles -> 약 8.925 ms
```

### 1.2 Reset

Reset은 회로의 시작 상태를 정한다.

예를 들어 AXI output valid가 reset 후 1로 튀면, 받는 쪽은 쓰레기 데이터를 진짜 데이터로 착각할 수 있다. 그래서 stream 설계에서는 reset 후 보통 `valid=0`이 되어야 한다.

### 1.3 Register

Register는 한 cycle 동안 값을 기억하는 저장소다.

```systemverilog
always_ff @(posedge clk) begin
  if (!rst_n) begin
    count <= 0;
  end else begin
    count <= count + 1;
  end
end
```

FPGA에서 register는 flip-flop 자원을 쓴다. Vivado report에서 FF 또는 register 사용량으로 나타난다.

### 1.4 FSM

FSM은 finite state machine이다. 쉽게 말해 “상태를 가진 순서 제어기”다.

예를 들어 입력 받고, 계산하고, 출력하는 회로는 다음처럼 생각할 수 있다.

```text
IDLE -> READ_INPUT -> COMPUTE -> WRITE_OUTPUT -> DONE
```

`rtl/gsu/gsu_layer_engine_rtl.sv`의 GSU RTL core도 FSM으로 되어 있다.

```text
ST_IDLE
  -> ST_COPY_STATE
  -> ST_SNAPSHOT
  -> ST_MAC_INIT
  -> ST_MAC_TILE
  -> ST_GATE
  -> ST_ADVANCE
  -> ST_DONE
```

### 1.5 Memory

FPGA에서 큰 배열은 보통 BRAM에 들어간다. 이 설계는 weight, state, intermediate output을 많이 저장하므로 BRAM 사용량이 중요하다.

```text
small variables -> FF or LUT
large arrays    -> BRAM
multiply        -> DSP
control mux     -> LUT
```

### 1.6 Stream

Stream은 “주소를 찍어서 읽는 memory”가 아니라, 앞에서 뒤로 흐르는 데이터 줄이다.

```text
data0, data1, data2, data3, ...
```

AXI4-Stream은 이런 stream을 FPGA IP끼리 연결할 때 많이 쓰는 protocol이다.

**여기까지 이해했는지 확인**

- Register와 memory는 어떻게 다른가?
- FSM이 필요한 이유는 무엇인가?
- Stream은 memory처럼 random access가 가능한가?

---

## 2. 이 설계가 처리하는 데이터

### 2.1 입력 데이터

입력은 두 종류다.

| 이름 | 의미 |
|---|---|
| `noisy_fft_stream` | 잡음이 섞인 현재 입력 FFT |
| `fb_fft_stream` | feedback 또는 이전 처리 결과 기반 FFT |

각 stream의 data width는 16-bit다. HLS 코드에서는 `ap_axiu<16, 0, 0, 0>` 형태로 정의되어 있다.

관련 코드:

- [`subband_ref_q610.hpp`](../subband_ref_q610.hpp)
- `axis_q610_t`

### 2.2 Frame과 chunk

이 설계는 realtime 처리를 위해 4-frame chunk를 기본 단위로 쓴다.

```text
frame0 frame1 frame2 frame3
   \     |      |     /
    +----+------+----+
          chunk
```

1 frame이 10 ms hop이라고 가정하면 4 frame은 40 ms에 해당한다. 계산 시간이 약 8.925 ms이면 전체 지연은 다음처럼 계산된다.

```text
입력 4 frame 대기: 40 ms
FPGA 계산 시간   : 8.925 ms
총 지연 추정     : 48.925 ms
```

그래서 50 ms 이하 realtime 목표에 들어간다고 설명한다.

주의할 점은 이 숫자가 HLS/Vivado report 기반이라는 것이다. 실제 보드에서 측정한 end-to-end latency와는 구분해야 한다.

### 2.3 Frequency bin

이 설계는 `kNumFreqs = 256`개의 frequency bin을 기준으로 한다.

```text
freq bin: 0 1 2 3 ... 255
```

그런데 256개 전체를 한 번에 같은 방식으로 처리하지 않고, 3개의 band로 나누어 처리한다.

| Band | Subband 수 | Center freq step | Packed input size | Projection size | DF order |
|---|---:|---:|---:|---:|---:|
| band0 | 8 | 4 | 38 | 40 | 5 |
| band1 | 3 | 32 | 94 | 192 | 3 |
| band2 | 2 | 64 | 158 | 128 | 1 |

쉽게 말하면 낮은 주파수 영역은 촘촘하게, 높은 주파수 영역은 넓게 묶어서 처리하는 구조라고 보면 된다.

**여기까지 이해했는지 확인**

- 왜 이 설계는 4-frame chunk를 쓰는가?
- `noisy_fft_stream`과 `fb_fft_stream`은 각각 어떤 역할인가?
- 3개 band는 모두 같은 크기인가?

---

## 3. 전체 데이터 흐름

가장 중요한 흐름을 한 번 더 크게 보자.

```text
1. AXI stream에서 noisy/fb FFT 입력을 읽는다.

2. 각 band마다 subband 입력을 만든다.
   - noisy FFT 주변 bin을 모은다.
   - feedback FFT 일부를 붙인다.
   - 하나의 packed input vector를 만든다.

3. GSU layer0을 통과한다.

4. GSU layer1을 통과한다.

5. projection을 통과한다.

6. band별 결과를 df_coef output 위치에 쓴다.

7. df_coef를 AXI stream으로 출력한다.
```

코드 관점에서는 다음 경로를 따라가면 된다.

```text
SubbandRealtimeTopQ610Ip
  -> RunSubbandRealtimeTopCoreQ610
      -> ReadRealtimeInputChunkQ610
      -> RunRealtime...Band...
          -> GSU layer0
          -> GSU layer1
          -> Projection
      -> EmitRealtimeOutputChunkQ610
```

관련 코드:

- `SubbandRealtimeTopQ610Ip`: [`subband_ref_q610_opt_stage4_latency_stepL2.cpp`](../subband_ref_q610_opt_stage4_latency_stepL2.cpp)
- `RunSubbandRealtimeTopCoreQ610`: [`subband_ref_q610_opt_stage4_latency_stepL2.cpp`](../subband_ref_q610_opt_stage4_latency_stepL2.cpp)

### 3.1 왜 band를 나누는가?

음성 신호의 주파수 영역은 모든 frequency bin이 같은 성격을 갖지 않는다. 낮은 주파수와 높은 주파수는 다르게 묶어도 된다. 그래서 band별로 `num_subbands`, `ctr_freq`, `df_order`가 다르다.

이 구조의 장점은 계산량과 모델 구조를 조절할 수 있다는 것이다. 단점은 주소 계산과 output ordering이 복잡해진다는 점이다.

### 3.2 Output count

한 frame에서 출력되는 `df_coef` 개수는 1152개다.

계산은 이렇게 볼 수 있다.

```text
band0: df_order 5 * total_freqs 32  * complex 2 = 320
band1: df_order 3 * total_freqs 96  * complex 2 = 576
band2: df_order 1 * total_freqs 128 * complex 2 = 256

total per frame = 320 + 576 + 256 = 1152
```

4-frame chunk라면:

```text
1152 * 4 = 4608 output words
```

이 4608번째 output word에서 `TLAST=1`이 되어야 DMA가 packet 끝을 알 수 있다.

**여기까지 이해했는지 확인**

- 한 frame당 `df_coef`는 몇 개인가?
- 4-frame chunk의 output word 수는 몇 개인가?
- `TLAST`가 잘못되면 왜 DMA가 멈춘 것처럼 보일 수 있을까?

---

## 4. HLS top 인터페이스

HLS top은 외부 세계와 만나는 문이다. 이 설계의 top은 `SubbandRealtimeTopQ610Ip`다.

외부 인터페이스는 크게 3종류다.

```text
AXI4-Stream : 실시간 데이터 입력/출력
M_AXI       : DDR memory에서 weight 읽기
AXI-Lite    : control register 설정
```

### 4.1 AXI4-Stream 입력과 출력

```text
noisy_fft_stream  -> AXIS input
fb_fft_stream     -> AXIS input
df_coef_stream    -> AXIS output
```

AXI4-Stream은 주소가 없다. 데이터를 순서대로 흘려보낸다.

### 4.2 M_AXI weights

`weights_q610`는 DDR에 저장된 weight를 읽기 위한 interface다. data width는 256-bit다.

왜 256-bit인가?

Q6.10 값 하나는 16-bit다.

```text
256-bit word / 16-bit = 16 lanes
```

즉 DDR에서 한 번 읽을 때 Q6.10 weight 16개를 묶어서 읽는 구조다.

```text
256-bit packed weight word

| lane15 | lane14 | ... | lane1 | lane0 |
| 16 bit | 16 bit | ... |16 bit |16 bit |
```

### 4.3 AXI-Lite control

AXI-Lite는 control register를 쓰기 위한 interface다.

이 설계에서는 대표적으로 다음 값을 제어한다.

| Register 의미 | 설명 |
|---|---|
| `weights_q610` pointer | DDR에 있는 weight 시작 주소 |
| `num_frames` | 이번 chunk에서 처리할 frame 수 |
| `reset_state` | 내부 recurrent state 초기화 여부 |
| `ap_start` | IP 실행 시작 |
| `ap_done` | IP 실행 완료 |

### 4.4 HLS top을 유지하는 이유

외부 인터페이스를 HLS가 만들어주면 DMA, AXI-Lite register, IP packaging이 쉬워진다. 그래서 전체를 직접 RTL로 다시 만들기보다, top은 HLS로 유지하고 내부 병목만 RTL로 옮기는 방향이 자연스럽다.

```text
권장 방향

HLS top
  - AXI4-Stream
  - AXI-Lite
  - M_AXI
  - top-level packaging

RTL block
  - GSU datapath
  - projection datapath
  - 명시적인 FSM
```

**여기까지 이해했는지 확인**

- AXI4-Stream과 M_AXI의 가장 큰 차이는 무엇인가?
- Q6.10 값 16개가 256-bit word 하나에 들어가는 이유는?
- 왜 모든 것을 RTL로 만들지 않고 HLS top을 유지하려고 할까?

---

## 5. AXI4-Stream 천천히 이해하기

AXI4-Stream의 핵심은 handshake다.

```text
전송 발생 조건:

TVALID == 1 && TREADY == 1
```

clock 상승 edge에서 위 조건이 참이면 data 하나가 이동한다.

```text
producer                        consumer
   |                                |
   | TDATA                          |
   | TVALID ----------------------> |
   | <---------------------- TREADY |
   | TLAST                          |
   v                                v
```

### 5.1 TVALID

`TVALID`는 보내는 쪽이 “지금 데이터가 유효하다”고 말하는 신호다.

### 5.2 TREADY

`TREADY`는 받는 쪽이 “지금 받을 수 있다”고 말하는 신호다.

### 5.3 가장 중요한 규칙

`TVALID=1`인데 `TREADY=0`이면 데이터는 아직 전송되지 않았다. 이때 `TDATA`, `TLAST`, `TKEEP`를 바꾸면 안 된다.

```text
cycle 0: TVALID=1, TREADY=0, TDATA=A
cycle 1: TVALID=1, TREADY=0, TDATA=A  유지해야 함
cycle 2: TVALID=1, TREADY=1, TDATA=A  여기서 전송
```

`rtl/learning/basic_rtl_labs.sv`의 `learning_axis_skid_buffer`는 이 규칙을 연습하기 위한 작은 모듈이다.

### 5.4 TLAST

`TLAST`는 packet의 마지막 beat를 의미한다.

이 설계에서 output packet은 보통 chunk 하나에 해당한다.

```text
output word 0
output word 1
...
output word 4607  <- TLAST=1
```

만약 DMA가 S2MM 방향으로 output을 받는다면, `TLAST`가 안 나오면 packet이 끝났다는 것을 모를 수 있다. 그래서 DMA가 기다리다가 hang처럼 보일 수 있다.

### 5.5 TKEEP

`TKEEP`는 byte 단위로 어떤 byte가 유효한지 표시한다. 이 설계는 16-bit data이므로 2 byte가 유효하다.

```text
TDATA = 16 bit = 2 byte
TKEEP = 2'b11
```

**여기까지 이해했는지 확인**

- `TVALID=1`, `TREADY=0`일 때 데이터가 전송되었는가?
- `TLAST`는 매 word마다 1인가, packet 마지막에서만 1인가?
- DMA hang을 의심할 때 왜 TLAST를 먼저 봐야 할까?

---

## 6. Q6.10 fixed-point 이해하기

FPGA에서 floating-point는 비싸다. 그래서 이 설계는 Q6.10 fixed-point를 쓴다.

Q6.10은 16-bit signed 정수 안에 소수 값을 담는 방식이다.

```text
Q6.10

총 16 bit signed
소수부 10 bit
scale = 2^10 = 1024
```

실수 1.0은 정수 1024로 저장된다.

```text
real 1.0  -> Q6.10 1024
real 0.5  -> Q6.10 512
real -1.0 -> Q6.10 -1024
```

### 6.1 곱셈

Q6.10 값 두 개를 곱하면 scale이 두 번 들어간다.

```text
(A / 1024) * (B / 1024)
= (A * B) / 1024^2
```

그래서 raw product는 Q12.20처럼 생각할 수 있다. 다시 Q6.10으로 돌아오려면 10 bit shift right가 필요하다.

```text
raw_product = a_q610 * b_q610
result_q610 = round_shift_right(raw_product, 10)
```

### 6.2 MAC 누산

MAC은 multiply accumulate다.

```text
sum = sum + input[i] * weight[i]
```

이 설계에서는 곱한 결과를 48-bit accumulator에 더한다. 이유는 16-bit 곱셈 결과를 여러 개 더하면 16-bit 안에 안 들어갈 수 있기 때문이다.

```text
q_data_t  : 16-bit
accum_q_t : 48-bit
```

관련 코드:

- Q6.10 type: [`subband_ref_q610.hpp`](../subband_ref_q610.hpp)
- Q6.10 변환 가이드: [`docs/subband_q610_conversion_guide.md`](subband_q610_conversion_guide.md)
- SV 산술 package: [`rtl/gsu/gsu_q610_pkg.sv`](../rtl/gsu/gsu_q610_pkg.sv)

### 6.3 Saturation

계산 결과가 16-bit 범위를 넘으면 잘라야 한다.

```text
최대:  32767
최소: -32768
```

그냥 overflow가 나면 값이 이상하게 wrap될 수 있다. 그래서 saturation이 필요하다.

**여기까지 이해했는지 확인**

- Q6.10에서 1.0은 어떤 정수로 저장되는가?
- Q6.10끼리 곱한 뒤 왜 10 bit right shift가 필요한가?
- MAC 누산기를 16-bit가 아니라 48-bit로 둔 이유는?

---

## 7. GSU layer를 RNN cell처럼 이해하기

GSU layer는 이 설계에서 가장 계산이 무거운 부분이다. 완전히 수식으로 외우려고 하기보다, recurrent state가 있는 cell이라고 이해하면 된다.

입력은 현재 frame/subband의 feature vector다.

```text
input vector
    |
    v
+-----------+
| GSU cell  |
+-----------+
    |
    v
hidden output
```

GSU는 이전 state도 사용한다.

```text
current input x[t]
previous hx[t-1]
previous cx[t-1]
        |
        v
    GSU update
        |
        v
new hx[t], new cx[t]
```

### 7.1 hx와 cx

이 설계에는 두 state가 있다.

| State | 직관적 의미 |
|---|---|
| `hx` | 현재 hidden output |
| `cx` | cell 내부 기억값 |

RNN/LSTM을 배운 적이 있다면 `cx`는 memory, `hx`는 output에 가깝다고 보면 된다.

### 7.2 GSU 계산 흐름

아주 단순화하면 다음과 같다.

```text
1. input dot product
2. recurrent dot product
3. bias 더하기
4. sigmoid PWL로 gate 계산
5. 이전 cx와 새 candidate를 섞기
6. batch norm 적용
7. step activation으로 hx 만들기
```

코드와 RTL에서는 이 과정이 MAC phase와 gate phase로 나뉜다.

```text
MAC phase:
  input * weight_ih
  hx    * weight_hh
  sum

Gate phase:
  bias
  sigmoid
  cx update
  BN
  step activation
```

### 7.3 왜 DSP가 많이 필요한가?

GSU는 dot product가 많다. Dot product는 곱셈을 많이 한다.

```text
224 hidden size
-> hidden마다 많은 multiply
-> DSP48 사용량 증가
```

그래서 Vivado report에서 DSP 사용량이 중요하다.

### 7.4 RTL GSU core

직접 작성한 GSU RTL core는 [`rtl/gsu/gsu_layer_engine_rtl.sv`](../rtl/gsu/gsu_layer_engine_rtl.sv)에 있다.

FSM은 다음처럼 진행된다.

```text
ST_IDLE
  start 기다림

ST_COPY_STATE
  입력 state를 output state buffer로 복사

ST_SNAPSHOT
  현재 subband의 이전 hx/cx를 local register로 복사

ST_MAC_INIT
  MAC accumulator 초기화

ST_MAC_TILE
  DOT_PAR 단위로 dot product 수행

ST_GATE
  sigmoid, cx update, BN, step activation

ST_ADVANCE
  다음 hidden/subband/frame으로 이동

ST_DONE
  done/ready 출력
```

**여기까지 이해했는지 확인**

- GSU가 일반 feed-forward layer보다 복잡한 이유는 무엇인가?
- `hx`와 `cx`는 매 frame마다 유지되는가?
- GSU에서 DSP가 많이 필요한 이유는?

---

## 8. Projection과 df_coef 만들기

GSU layer1의 output은 hidden vector다. 이 hidden vector를 바로 최종 출력으로 쓰지 않고 projection을 통과시킨다.

```text
GSU layer1 output: hidden size 224
        |
        v
projection weight
        |
        v
df_coef values
```

Projection도 본질적으로 dot product다.

```text
output[j] = bias[j] + sum(hidden[i] * weight[j][i])
```

### 8.1 projection row cache

기존에는 projection weight 전체를 BRAM에 올리는 구조가 컸다. RTL-ready path에서는 row 하나씩 읽어서 register row cache에 넣고 계산한다.

```text
DDR packed weights
       |
       v
load one projection row
       |
       v
proj_row[224] register cache
       |
       v
dot product with hidden vector
```

장점:

- projection weight 전체 BRAM buffer를 줄일 수 있다.
- BRAM 사용량 감소에 도움이 된다.

단점:

- DDR access pattern과 controller가 중요해진다.
- M_AXI burst inference가 잘 안 되면 성능 위험이 생긴다.

관련 문서:

- [`docs/rtl_band_engine_transition_report_ko.md`](rtl_band_engine_transition_report_ko.md)
- [`docs/fpga_readiness_summary.md`](fpga_readiness_summary.md)

**여기까지 이해했는지 확인**

- Projection은 왜 dot product로 볼 수 있는가?
- projection row cache는 BRAM을 줄이는가, 늘리는가?
- DDR에서 weight를 자주 읽으면 어떤 위험이 생길까?

---

## 9. HLS path, RTL-ready path, SV GSU path 구분하기

이 repo에는 여러 실험 경로가 있다. 이름이 비슷해서 헷갈리기 쉽다.

### 9.1 기본 HLS path

기본 HLS path는 C++ HLS 코드로 전체 가속기를 합성하는 경로다. 외부 interface와 전체 흐름은 안정적으로 잡혀 있다.

### 9.2 `USE_RTL_BAND_ENGINE`

이 경로는 실제 hand-written RTL blackbox를 완성한 것이 아니라, HLS 내부 구조를 RTL로 옮기기 쉽게 바꾼 path다.

핵심 변화:

- compact state 사용
- projection row cache 사용
- projection 전체 BRAM buffer 제거
- RTL로 옮기기 쉬운 datapath 형태로 정리

즉, 이름에 RTL이 들어가지만 “진짜 RTL module을 top에 완전히 붙인 최종 production 경로”라고 보면 안 된다.

### 9.3 `USE_SV_GSU_LAYER`

이 경로는 SystemVerilog GSU layer blackbox 연결을 위한 실험 경로다.

관련 파일:

- [`rtl/gsu/gsu_layer_engine_rtl.sv`](../rtl/gsu/gsu_layer_engine_rtl.sv)
- [`rtl/gsu/gsu_layer_engine_packed_bb.sv`](../rtl/gsu/gsu_layer_engine_packed_bb.sv)
- [`rtl/gsu/gsu_layer_engine_packed_bb.json`](../rtl/gsu/gsu_layer_engine_packed_bb.json)

중요한 주의:

> SV GSU RTL core는 standalone xsim 검증이 되어 있지만, production HLS top에 완전히 통합되어 end-to-end RTL 검증이 끝난 상태라고 말하면 안 된다.

관련 문서:

- [`docs/sv_gsu_layer_rtl_report_ko.md`](sv_gsu_layer_rtl_report_ko.md)
- [`docs/realtime_sv_gsu_coverage_report_ko.md`](realtime_sv_gsu_coverage_report_ko.md)

**여기까지 이해했는지 확인**

- `USE_RTL_BAND_ENGINE`은 hand-written RTL blackbox 최종본인가?
- `USE_SV_GSU_LAYER`에서 검증된 것과 아직 남은 것은 무엇인가?
- 왜 compile switch별로 검증 결과를 구분해야 할까?

---

## 10. Verification 용어 정리

여기서 많은 사람이 헷갈린다. C-sim, smoke, coverage, RTL cosim, xsim은 서로 다르다.

### 10.1 Smoke test

Smoke test는 빠른 기본 확인이다.

이 repo에서는 예를 들어 다음 chunk pattern을 빠르게 확인한다.

```text
chunk4: 4 frame 한 번에 처리
chunk2: 2 + 2 frame으로 처리
chunk1: 1 + 1 + 1 + 1 frame으로 처리
```

Smoke test의 목적:

```text
"큰 문제는 없나?"
```

### 10.2 C-sim

C-sim은 HLS C++ 코드를 PC에서 C++ 프로그램처럼 실행하는 것이다.

```text
HLS C++ code + C++ testbench
        |
        v
host executable
        |
        v
output compare
```

C-sim이 확인하는 것:

- 알고리즘 결과
- Q6.10 golden reference와의 일치
- output 개수
- TLAST 위치를 C++ model 관점에서 확인

C-sim이 확인하지 못하는 것:

- 실제 RTL handshake timing
- RTL FSM deadlock
- Vivado 합성 결과의 cycle-level 문제
- 실제 DMA 동작

### 10.3 Coverage C-sim

Coverage C-sim은 C-sim을 많은 입력 조합으로 세게 돌리는 것이다.

이 프로젝트에서는 문서 기준으로 다음 검증이 있다.

```text
seeds=32
profiles=5
chunk_patterns=5
reset replay 포함
total_scenarios=960
df_coef_elements_compared=4,423,680
df_coef_mismatches=0
```

이 결과는 아주 강한 C++/HLS function-level 검증이다. 하지만 RTL 검증과는 다르다.

### 10.4 RTL cosim

RTL cosim은 HLS가 생성한 RTL을 RTL simulator에서 돌려 C++ 결과와 비교하는 단계다.

```text
C++ testbench
   |
   v
HLS generated RTL simulation
   |
   v
compare with C model
```

이 repo의 readiness 문서에서는 RTL cosim gap이 critical issue로 정리되어 있다. 즉, C-sim은 강하게 통과했지만 RTL cosim PASS evidence는 아직 부족하다고 봐야 한다.

### 10.5 xsim

xsim은 Vivado의 RTL simulator다. 직접 작성한 SystemVerilog GSU core 검증에 사용했다.

관련 test:

- [`testbench/rtl/tb_gsu_layer_engine_rtl.sv`](../testbench/rtl/tb_gsu_layer_engine_rtl.sv)
- [`scripts/rtl/run_gsu_layer_engine_xsim.ps1`](../scripts/rtl/run_gsu_layer_engine_xsim.ps1)

**여기까지 이해했는지 확인**

- Smoke는 테스트 방식인가, 테스트 규모/목적인가?
- C-sim PASS가 왜 RTL PASS를 보장하지 않는가?
- xsim은 언제 쓰는가?

---

## 11. Vivado report 읽는 법

FPGA 설계는 “동작한다”만으로 끝나지 않는다. 실제 FPGA 자원에 들어가야 하고, clock timing을 만족해야 한다.

### 11.1 LUT

LUT는 logic을 만드는 기본 자원이다. mux, 비교기, 간단한 조합 논리 등이 LUT를 쓴다.

LUT가 많이 늘어나는 원인:

- 큰 mux
- 복잡한 address select
- 너무 많은 조건 분기
- 병렬 datapath 복제

### 11.2 FF

FF는 register다. pipeline register, state register, counter 등이 FF를 쓴다.

FF 사용량이 늘어나는 것은 항상 나쁜 것은 아니다. Pipeline을 넣으면 FF는 늘지만 timing이 좋아질 수 있다.

### 11.3 BRAM

BRAM은 큰 memory block이다.

이 설계에서는 다음이 BRAM을 많이 쓴다.

- weight buffer
- recurrent state
- intermediate layer output
- stream buffer

Readiness 문서에서는 BRAM 사용률이 높다고 정리되어 있다. 그래서 compact state와 projection row cache 같은 최적화가 중요해진다.

### 11.4 DSP

DSP48은 곱셈과 MAC에 특화된 FPGA block이다.

GSU와 projection은 dot product가 많으므로 DSP 사용량이 높다. 이건 자연스러운 현상이다.

중요한 것은 “DSP를 많이 썼다”가 아니라 “DSP pipeline이 잘 들어갔는가”다. DPOP/DPIP warning은 DSP pipeline 효율과 관련될 수 있다.

### 11.5 Timing

Timing은 clock 주기 안에 signal이 다음 register까지 도착하는지 보는 것이다.

```text
register A -> combinational logic -> register B
```

100 MHz면 한 cycle이 10 ns다. 이 안에 계산과 routing delay가 들어와야 한다.

중요한 용어:

| 용어 | 의미 |
|---|---|
| WNS | worst negative slack |
| TNS | total negative slack |
| Slack > 0 | timing 만족 |
| Slack < 0 | timing 실패 |

### 11.6 Power

`docs/low_power_implementation_evidence_report_ko.md`의 power 값은 실제 보드 측정값이 아니다.

정확한 표현:

```text
Vivado post-route estimated power
confidence = Medium
```

잘못된 표현:

```text
measured power
실측 전력
```

실측이라고 말하려면 보드 전류 측정이나 SAIF/VCD 기반 activity 반영이 필요하다.

**여기까지 이해했는지 확인**

- BRAM 사용량이 높으면 어떤 코드 구조를 의심해야 하는가?
- DSP warning은 왜 timing/power와 연결되는가?
- Vivado power report를 measured라고 부르면 왜 안 되는가?

---

## 12. 현재 설계의 좋은 점과 남은 위험

### 12.1 좋은 점

1. C-sim 기준 기능 정확도가 강하게 검증되어 있다.
2. 4-frame chunk 기준 realtime latency 목표를 만족하는 것으로 분석되어 있다.
3. Vivado post-route timing closure evidence가 있다.
4. GSU RTL core는 standalone xsim 검증이 있다.
5. HLS top interface가 유지되어 DMA/Vivado integration 방향이 명확하다.

### 12.2 남은 위험

1. RTL cosim PASS evidence가 부족하다.
2. C-sim PASS는 RTL handshake와 DMA 동작을 보장하지 않는다.
3. M_AXI weight access에서 burst inference fail이 보고되어 DDR throughput 위험이 있다.
4. Slice occupied와 BRAM 사용량이 높아 재합성/디버그 여유가 작다.
5. power 수치는 실측이 아니라 추정이다.

이 부분은 논문이나 발표에서 아주 조심해야 한다.

안전한 표현:

```text
C-sim에서 4.42M df_coef element가 golden reference와 bit-exact로 일치했다.
Vivado post-route estimated power는 2.304 W이며 confidence는 Medium이다.
Standalone GSU RTL core는 xsim에서 unit/function test를 통과했다.
End-to-end RTL cosim 또는 board in-the-loop 검증은 추가로 필요하다.
```

위험한 표현:

```text
RTL까지 완전히 bit-exact 검증 완료.
보드에서 실측 전력 2.304 W.
SV GSU blackbox production 통합 완료.
```

**여기까지 이해했는지 확인**

- 현재 설계에서 가장 큰 verification gap은 무엇인가?
- C-sim 결과를 논문에 쓸 때 어떤 표현이 안전한가?
- power 결과를 쓸 때 반드시 붙여야 하는 단어는 무엇인가?

---

## 13. 이 설계를 공부하는 추천 순서

처음부터 `subband_ref_q610_opt_stage4_latency_stepL2.cpp` 전체를 읽으면 너무 크다. 아래 순서가 낫다.

### 13.1 1단계: AXI handshake 연습

먼저 작은 lab부터 본다.

- [`rtl/learning/basic_rtl_labs.sv`](../rtl/learning/basic_rtl_labs.sv)
- [`testbench/learning/tb_learning_labs.sv`](../testbench/learning/tb_learning_labs.sv)

실행:

```powershell
powershell -ExecutionPolicy Bypass -File scripts\rtl\run_learning_labs_xsim.ps1
```

여기서 볼 것:

- `TREADY=0`일 때 data가 유지되는가?
- random stall에도 output 순서가 유지되는가?
- TLAST가 마지막 word에서만 나오는가?

### 13.2 2단계: HLS top interface 읽기

다음은 top 선언을 본다.

- [`subband_ref_q610.hpp`](../subband_ref_q610.hpp)
- [`subband_ref_q610_opt_stage4_latency_stepL2.cpp`](../subband_ref_q610_opt_stage4_latency_stepL2.cpp)

볼 것:

- `axis_q610_t`
- `weights_q610`
- `num_frames`
- `reset_state`
- `df_coef_stream`

### 13.3 3단계: testbench로 output ordering 이해

다음은 coverage testbench를 본다.

- [`testbench/subband_realtime_hls_coverage_tb.cpp`](../testbench/subband_realtime_hls_coverage_tb.cpp)

볼 것:

- expected output을 어떻게 만드는가?
- chunk pattern을 어떻게 바꾸는가?
- TLAST mismatch를 어떻게 잡는가?

### 13.4 4단계: GSU RTL FSM 읽기

그 다음 GSU RTL을 본다.

- [`rtl/gsu/gsu_layer_engine_rtl.sv`](../rtl/gsu/gsu_layer_engine_rtl.sv)

볼 것:

- state enum
- `frame_index`, `subband_index`, `hidden_base`, `dot_tile`
- MAC phase와 gate phase

### 13.5 5단계: Vivado report 읽기

마지막으로 report 문서를 본다.

- [`docs/fpga_readiness_summary.md`](fpga_readiness_summary.md)
- [`docs/low_power_implementation_evidence_report_ko.md`](low_power_implementation_evidence_report_ko.md)
- [`docs/rtl_band_engine_transition_report_ko.md`](rtl_band_engine_transition_report_ko.md)

볼 것:

- latency
- BRAM/DSP/LUT/FF
- WNS/TNS
- DRC warning
- power confidence
- verification gap

**여기까지 이해했는지 확인**

- 코드를 읽을 때 왜 testbench를 먼저 보는 것이 도움이 되는가?
- GSU RTL에서 가장 먼저 찾아볼 signal은 무엇인가?
- Vivado report는 설계의 정답지인가, 증상표인가?

---

## 14. 마지막 한 장 요약

이 설계를 한 장으로 요약하면 다음과 같다.

```text
목표:
  FFT-domain 음성 향상용 df_coef를 FPGA에서 실시간 생성

입력:
  noisy_fft_stream, fb_fft_stream

처리 단위:
  4-frame chunk

내부 처리:
  3-band subband 구성
  -> GSU layer0
  -> GSU layer1
  -> projection
  -> df_coef output ordering

숫자 형식:
  signed 16-bit Q6.10
  48-bit MAC accumulator

외부 interface:
  AXI4-Stream input/output
  M_AXI 256-bit weights
  AXI-Lite control

검증:
  HLS C-sim smoke PASS
  HLS C-sim coverage PASS
  standalone GSU RTL xsim PASS
  end-to-end RTL cosim evidence는 추가 필요

구현 리스크:
  BRAM/Slice 여유 작음
  M_AXI burst inference fail
  power는 measured가 아니라 estimated
```

가장 중요한 태도는 이것이다.

> FPGA 설계는 “값이 맞다”와 “하드웨어로 안전하게 흐른다”를 따로 검증해야 한다.

C-sim은 값이 맞는지 보는 데 강하다. RTL/xsim/cosim/board test는 하드웨어 흐름이 안전한지 보는 데 필요하다. 이 둘을 구분하기 시작하면, 이 설계의 절반은 이미 제대로 이해한 것이다.

