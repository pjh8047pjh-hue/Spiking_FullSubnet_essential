# Spiking-FullSubNet 이해용 심화 문서
## spike 활성화, GSU/GSN 수식, 뉴런 연결 구조 중심 정리

이 문서는 **Spiking-FullSubNet 논문 설명**과 **업로드된 구현 코드**를 같이 보면서, 다음 3가지를 이해하기 쉽게 풀어쓴 문서다.

1. **spike가 오디오 입력에 대해 언제, 어떻게 활성화되는가**  
2. **GSU / GSN의 알고리즘과 수식이 어떻게 생겼고, LSTM을 어떻게 바꿔 쓴 것인가**  
3. **뉴런과 뉴런 사이가 실제로 어떻게 연결되는가**

---

## 0. 먼저 핵심부터

이 모델을 이해할 때 제일 중요한 포인트는 아래 5개다.

### 핵심 1) 이 구현은 raw waveform을 바로 spike로 바꾸지 않는다
입력 오디오는 먼저 **STFT**를 거쳐 시간-주파수 스펙트럼으로 바뀌고, 그중 **magnitude feature**가 Full-band / Sub-band 모델의 입력으로 들어간다. 즉, 이 저장소의 구현은 `마이크 파형 -> 즉시 spike train` 구조가 아니다. 먼저 **연속값 특징(feature)** 을 만든 다음, 그 특징을 GSN/GSU 셀에 넣는다.

### 핵심 2) spike는 각 시간 프레임마다 GSU 셀의 출력에서 만들어진다
각 시간 프레임 `t`에서 셀은
- 현재 입력 `x_t`
- 이전 시각의 spike 출력 `h_(t-1)`
- 이전 시각의 내부 메모리 `c_(t-1)`
를 받아서, 먼저 새 내부 상태 `c_t`를 만들고, 그 다음 **step 함수**를 적용해 `h_t ∈ {0,1}` spike를 만든다.

즉, spike는 **입력 그 자체**가 아니라, **게이트가 적용된 막전위/메모리 상태를 threshold에 통과시킨 결과**다.

### 핵심 3) 논문 이름은 GSN, 코드 이름은 GSU 계열이다
논문은 **GSN (Gated Spiking Neuron)** 이라고 부르지만, 업로드된 구현 파일에서는 `GSUCell`, `GSULayer`, `StackedGSU`라는 이름을 쓴다. 이 저장소에서는 사실상 **논문의 GSN을 코드에서 GSU 계열 클래스로 구현한 것**으로 읽는 게 자연스럽다.

### 핵심 4) 이 구조는 “스파이킹 버전의 단순 LIF”라기보다 “LSTM을 많이 단순화한 gated recurrent spiking cell”에 가깝다
표면적으로는 스파이킹 뉴런이지만, 수식과 코드 구조를 보면 핵심 아이디어는
- **forget gate** 로 과거 메모리를 얼마나 남길지 정하고
- 그 결과를 **binary spike** 로 뽑는 것
이다.

즉, 느낌상으로는
- **LIF의 fixed decay** 문제를
- **LSTM의 forget gate 아이디어**로 고친 형태
라고 보면 된다.

### 핵심 5) 실제로 다음 층과 다음 시각으로 전달되는 것은 주로 `h_t`다
셀 내부에는 연속값 상태 `c_t`가 남아 있고, 바깥으로 드러나는 신호는 `h_t` spike다.
- **같은 층의 다음 시각**은 `h_t`, `c_t`를 둘 다 상태로 쓴다.
- **다음 층**에는 주로 `h_t`가 입력으로 간다.

그래서 `c_t`는 **셀 내부 메모리**, `h_t`는 **외부로 전달되는 이진 이벤트**라고 이해하면 편하다.

---

## 1. 전체 추론 파이프라인에서 spike가 어디에 있는가

Spiking-FullSubNet의 전체 흐름을 먼저 크게 보면 아래와 같다.

```text
waveform x(t)
  -> STFT
  -> noisy magnitude |X(n,f)|, complex STFT X(n,f)
  -> Full-band GSN/GSU stack
  -> global embedding E(n,f)
  -> Sub-band GSN/GSU stacks (주파수 파티션별)
  -> complex deep-filter coefficients
  -> deep filtering (과거 프레임 포함)
  -> enhanced STFT
  -> iSTFT
  -> enhanced waveform ŝ(t)
```

여기서 **spike가 직접 등장하는 부분은 Full-band / Sub-band의 sequence model 내부**다.  
STFT나 deep filtering은 spike 연산이 아니라 일반적인 신호 처리 / 텐서 연산이다.

### 논문 관점
논문은 입력 noisy speech `x(t) = s(t) + u(t)`를 STFT로 바꾼 뒤, magnitude sequence `X`를 Full-band GSN에 넣어 global embedding `E`를 만들고, 다시 이를 Sub-band GSN으로 보내 local + global 정보를 합쳐 enhancement를 수행한다.

### 코드 관점
업로드된 구현에서는 실제로 아래 순서로 간다.

1. `stft(input)`으로 waveform을 복소 STFT로 변환  
2. magnitude `noisy_mag`를 만들고 `fdrc` 지수 압축을 적용  
3. **Full-band 입력**으로 일부 low-band bin만 잘라 씀  
4. Full-band sequence model(=GSN/GSU 또는 LSTM 선택 가능)을 통과  
5. 그 출력을 주파수축으로 반복해 `fb_output` embedding 생성  
6. 각 주파수 파티션마다 noisy local bins + `fb_output`를 합쳐 Sub-band sequence model에 입력  
7. Sub-band 출력으로 complex deep-filter coefficient를 만들고, 과거 프레임을 포함한 deep filtering 수행  
8. iSTFT로 waveform 복원

즉, **spike는 오디오의 맨 앞단이 아니라 recurrent sequence model 내부에서 발생한다**.

---

## 2. 질문 1: spike가 오디오 입력에 대해 언제, 어떻게 활성화되는가

이 부분을 제일 구체적으로 보자.

## 2.1 “언제” 활성화되나?

정답은 **매 시간 프레임마다**다.

오디오는 STFT를 거치면 `[frequency bin, time frame]` 형태가 된다.  
그 뒤 sequence model은 입력을 `t=1,2,3,...,T` 순서로 하나씩 본다.

즉, spike는
- 샘플 단위가 아니라
- **STFT time frame 단위**로
- 각 recurrent layer의 각 뉴런에서
- 매 스텝마다 계산된다.

쉽게 말해,
- 16kHz 파형 전체를 바로 spike로 바꾸는 게 아니라
- 8ms hop 등으로 잘린 각 프레임 feature를 한 스텝씩 읽고
- 그때마다 뉴런이 “발화할지 말지”를 정한다.

---

## 2.2 “어떤 입력”에 대해 활성화되나?

이 구현에서 GSU/GSN 셀이 직접 받는 입력은 보통 아래 둘 중 하나다.

### Full-band 경로
- 특정 프레임 `t`의 full-band feature vector
- 코드에서는 보통 low-band 일부를 잘라 만든 벡터

### Sub-band 경로
- 특정 주파수 그룹의 noisy local bins
- 그 주변 neighbor bins
- 같은 위치의 full-band embedding
을 이어붙인 벡터

즉, 셀이 받는 것은 **연속값 feature vector**다.  
입력 자체가 binary spike train이 아니다.

이 점이 중요하다. 많은 사람이 “spiking network니까 입력부터 spike일 것이다”라고 생각하는데, **이 저장소 구현은 그렇지 않다.**  
입력은 dense real-valued feature이고, **출력 hidden state를 binary spike로 만드는 방식**이다.

---

## 2.3 한 시간 스텝에서 실제로 무슨 일이 일어나나?

각 시간 `t`에서 GSU 셀은 아래 값을 갖고 시작한다.

- `x_t`: 현재 프레임 입력 feature
- `h_(t-1)`: 이전 시각의 spike 출력
- `c_(t-1)`: 이전 시각의 내부 메모리(막전위 역할)

그 다음 아래 순서로 계산한다.

### 1단계) 입력과 이전 spike를 선형 결합한다

```text
a_t = W_ih x_t + W_hh h_(t-1) + b
```

여기서
- `W_ih`: 입력 -> 뉴런 연결 가중치
- `W_hh`: 이전 spike -> 현재 뉴런 연결 가중치
- `b`: bias

이다.

### 2단계) 이 값을 두 덩어리로 나눈다

```text
a_t = [a_t^(forget), a_t^(cell)]
```

코드에서는 이것을
- `forgetgate`
- `cellgate`
로 나눈다.

### 3단계) forget gate를 sigmoid로 만든다

```text
f_t = sigmoid(a_t^(forget))
```

이 값은 0~1 사이여서, “이전 메모리를 얼마나 유지할지”를 결정한다.

- `f_t`가 1에 가까우면: 이전 메모리를 많이 유지
- `f_t`가 0에 가까우면: 이전 메모리를 빨리 버리고 현재 입력을 많이 반영

### 4단계) 새로운 내부 메모리 `c_t`를 만든다

코드 구현은 아래와 같다.

```text
g_t = a_t^(cell)
c_t = f_t ⊙ c_(t-1) + (1 - f_t) ⊙ g_t
```

여기서 `⊙`는 element-wise 곱이다.

이 식의 의미는 아주 직관적이다.

- 과거를 남길 비율: `f_t`
- 새 입력을 반영할 비율: `1 - f_t`

즉, 셀은 매 시간마다
> “지금은 과거를 오래 붙잡고 갈까?”  
> “아니면 지금 들어온 신호로 빨리 갈아탈까?”
를 결정한다.

### 5단계) threshold를 넘으면 spike를 낸다

코드에서는 step function이 아래처럼 구현된다.

```text
h_t = H(c_t) = 1[c_t >= 0]
```

즉,
- `c_t >= 0` 이면 spike = 1
- `c_t < 0` 이면 spike = 0

이 `h_t`가 바로 **다음 층 / 다음 시각으로 전달되는 spike 출력**이다.

---

## 2.4 그래서 spike는 정확히 무엇이 threshold를 넘었을 때 나오나?

핵심은 **현재 입력 `x_t`가 직접 threshold를 넘는 게 아니다**는 점이다.

정확히는,
1. `x_t`와 `h_(t-1)`가 선형 변환을 거치고  
2. `forget gate`가 계산되고  
3. 이전 메모리 `c_(t-1)`와 새 candidate가 섞여서 `c_t`가 만들어진 뒤  
4. **그 결과 `c_t`가 threshold를 넘으면 spike가 발생**한다.

즉, spike는 “입력이 컸다”만으로 정해지지 않는다.  
아래 3개가 동시에 영향을 준다.

- 현재 입력이 얼마나 강한가
- 이전까지 누적된 메모리가 무엇이었는가
- 현재 시점의 forget gate가 과거/현재 중 어느 쪽을 더 믿는가

그래서 같은 입력이 들어와도,
- 직전 상태가 다르면 spike 여부가 달라질 수 있다.

이게 바로 **순차 모델**인 이유다.

---

## 2.5 간단한 숫자 예시

예를 들어 어떤 뉴런에서

- 이전 메모리 `c_(t-1) = 0.8`
- forget gate `f_t = 0.9`
- candidate `g_t = -0.2`

라고 하자.

그러면

```text
c_t = 0.9 * 0.8 + 0.1 * (-0.2)
    = 0.72 - 0.02
    = 0.70
```

이 값은 0보다 크므로

```text
h_t = 1
```

즉 spike 발생.

반대로,

- 이전 메모리 `c_(t-1) = 0.8`
- forget gate `f_t = 0.2`
- candidate `g_t = -0.5`

이면

```text
c_t = 0.2 * 0.8 + 0.8 * (-0.5)
    = 0.16 - 0.40
    = -0.24
```

이제는

```text
h_t = 0
```

즉 spike가 꺼진다.

이 예시가 말해주는 건,
- **같은 뉴런이라도 상황에 따라 느리게 기억할 수도 있고**
- **빠르게 현재 입력으로 갈아탈 수도 있다**
는 것이다.

---

## 2.6 논문 그림에는 “resetting”이 있는데, 코드에는 왜 안 보이나?

좋은 질문이다.

전통적인 LIF는 흔히
- 막전위 누적
- threshold 초과 시 firing
- 그 뒤 reset

형태를 갖는다.

그런데 업로드된 PyTorch 구현을 보면, spike 발생 후에

```text
c_t <- c_t - threshold * h_t
```

같은 **명시적 reset subtraction**이 코드에 드러나지 않는다.

현재 구현은 더 직접적으로

```text
c_t 계산 -> step(c_t) -> h_t 생성
```

형태다.

즉, 이 구현은 전통적인 LIF의 물리적 reset을 그대로 재현하기보다,
- **가변 decay가 있는 내부 상태 `c_t`**
- **그 상태를 thresholding한 binary 출력 `h_t`**

에 초점을 둔 형태다.

그래서 이 모델은 “클래식 LIF 그대로”라기보다 **gated recurrent spiking cell**로 이해하는 게 더 정확하다.

---

## 3. 질문 2: GSU / GSN 알고리즘과 수식은 어떻게 생겼고, LSTM을 어떻게 변형했는가

이제 구조를 LSTM과 비교해 보자.

## 3.1 논문 수식 형태

논문은 GSN의 핵심을 아래 식으로 설명한다.

```text
i_t = W_mn x_t + W_nn h_(t-1) + b
λ_t = sigmoid(W_mn x_t + W_nn h_(t-1) + b~)
u_t = λ_t ⊙ u_(t-1) + (1 - λ_t) ⊙ i_t
```

논문 표기에서
- `i_t`: 입력 전류/후보값
- `λ_t`: 입력 의존 decay rate
- `u_t`: 막전위(내부 상태)

라고 보면 된다.

코드 표기와 연결하면 대략 아래처럼 대응시킬 수 있다.

```text
paper i_t     <-> code cellgate
paper λ_t     <-> code forgetgate(sigmoid 후)
paper u_t     <-> code cy 또는 c_t
paper spike   <-> code hy
```

즉, 논문과 코드가 이름은 약간 다르지만, 핵심 아이디어는 같다.

---

## 3.2 코드 수식 형태

업로드된 코드 기준으로 쓰면 실제 업데이트는 아래다.

```text
gates = W_ih x_t + W_hh h_(t-1) + b
[forgetgate, cellgate] = split(gates)
f_t = sigmoid(forgetgate)
g_t = cellgate
c_t = f_t ⊙ c_(t-1) + (1 - f_t) ⊙ g_t
h_t = H(c_t)
```

이 식이 현재 구현의 핵심이다.

### 논문 표기와 코드 변수 대응

| 개념 | 논문 쪽 표기 | 코드 변수 이름 | 의미 |
|---|---|---|---|
| 이전 spike | `o_(t-1)` 또는 recurrent spike | `hx` | 이전 시각 출력 |
| 이전 막전위/메모리 | `u_(t-1)` | `cx` | 이전 내부 상태 |
| 입력 전류 / 후보값 | `i_t` | `cellgate` | 현재 입력이 만든 새 정보 |
| decay / forget 비율 | `λ_t` | `forgetgate`(sigmoid 후) | 과거 상태 유지 비율 |
| 현재 막전위/메모리 | `u_t` | `cy` | 새 내부 상태 |
| 현재 spike 출력 | `o_t` | `hy` | step 함수 통과 후 이진 출력 |

즉, 코드에서 보이는 `hx, cx -> hy, cy` 흐름은 논문의 `이전 spike/이전 membrane -> 현재 spike/현재 membrane` 구조와 1:1로 대응한다고 보면 된다.

---

## 3.3 LSTM과 가장 닮은 부분

LSTM의 표준 식은 보통 아래와 같다.

```text
i_t = sigmoid(W_i x_t + U_i h_(t-1) + b_i)
f_t = sigmoid(W_f x_t + U_f h_(t-1) + b_f)
o_t = sigmoid(W_o x_t + U_o h_(t-1) + b_o)
g_t = tanh(W_g x_t + U_g h_(t-1) + b_g)
c_t = f_t ⊙ c_(t-1) + i_t ⊙ g_t
h_t = o_t ⊙ tanh(c_t)
```

여기서 GSN/GSU와 제일 비슷한 건

```text
c_t = f_t ⊙ c_(t-1) + ...
```

부분이다.  
즉, **과거 셀 상태를 얼마나 유지할지 `f_t`가 결정한다**는 점이 거의 동일하다.

논문도 GSN이 **LSTM의 forget gate와 닮아 있다**고 직접 설명한다.

---

## 3.4 LSTM에서 무엇을 버리고, 무엇을 남겼나?

GSN/GSU를 LSTM 관점에서 보면 아래처럼 정리할 수 있다.

| 항목 | LSTM | GSN / GSU |
|---|---|---|
| 셀 메모리 | 있음 (`c_t`) | 있음 (`c_t` 또는 `u_t`) |
| forget gate | 있음 | 있음 / 핵심 |
| input gate | 있음 (`i_t`) | 별도 gate 없음, 대신 `1 - f_t`가 current mixing 비율 역할 |
| output gate | 있음 (`o_t`) | 없음 |
| hidden 출력 | `o_t * tanh(c_t)` | `step(c_t)` = binary spike |
| hidden state 성질 | 연속값 | 이진값(0/1) |
| recurrent 입력 | 이전 hidden continuous | 이전 spike `h_(t-1)` |

즉, GSN/GSU는 **LSTM을 아주 단순화해서**
- forget gate만 남기고
- output gate를 없애고
- hidden activation을 tanh 대신 step 함수로 바꾼 형태
라고 볼 수 있다.

---

## 3.5 왜 input gate 대신 `(1 - f_t)`를 쓰는가?

코드 식을 보면

```text
c_t = f_t ⊙ c_(t-1) + (1 - f_t) ⊙ g_t
```

이다.

이건 사실상
- `f_t`: 과거 유지 비율
- `1 - f_t`: 새 입력 반영 비율

로 해석할 수 있다.

즉, LSTM처럼 `input gate`를 따로 두지 않고, **forget gate와 서로 보완되는 값**으로 새 입력 반영량을 정한다.

이렇게 하면
- 파라미터 수가 줄고
- 계산량도 줄고
- 시간 축 길이가 길어져도 관리가 쉬워진다.

즉, **저전력 / 경량화** 목적과도 잘 맞는다.

---

## 3.6 왜 hidden output을 tanh 대신 spike로 바꾸나?

LSTM은 hidden output이 연속값이다.

```text
h_t = o_t ⊙ tanh(c_t)
```

반면 GSN/GSU는

```text
h_t = H(c_t)
```

즉 0/1이다.

이렇게 하면 장점이 두 가지다.

### 장점 1) 출력 표현이 sparse/event-driven 해질 수 있다
연속값을 계속 주고받는 대신, **발화 여부** 중심으로 전달할 수 있다.

### 장점 2) 뉴로모픽 하드웨어에 유리한 방향이다
논문이 노리는 큰 방향은 **ultralow-power neuromorphic speech enhancement**다.  
즉, spike 기반 통신이 가능한 하드웨어라면, 모든 값을 dense하게 계속 보내는 것보다 전력상 유리할 수 있다.

다만 중요한 현실적인 포인트도 있다.

### 현실적인 포인트
현재 업로드된 PyTorch 코드는 여전히
- `torch.mm`
- dense tensor
- dense batch 연산

을 쓴다.

즉, 소프트웨어 수준에서는 **완전한 event-driven 실행기**가 아니다.  
여기서의 장점은 주로
- 모델 표현 방식이 spike-friendly 하다는 점
- 향후 neuromorphic hardware mapping에 유리하다는 점
에 가깝다.

---

## 3.7 shared_weights는 무슨 뜻인가?

코드에는 `shared_weights=True/False` 옵션이 있다.

이게 켜지면 입력/재귀 가중치를 하나만 두고, 그걸 gate와 cell 쪽에 **반복 사용**한다.

쉽게 말해,
- 원래는 forgetgate용 가중치와 cellgate용 가중치를 따로 둘 수 있는데
- shared mode에서는 같은 행렬을 재사용한다.

이건 논문이 말하는 **weight-sharing**과 연결된다.

장점은 분명하다.
- 파라미터 수 감소
- 메모리 사용량 감소
- 연산량 감소

즉, GSN/GSU는 처음부터 **경량 recurrent spiking block**을 목표로 설계된 셀이다.

---

## 4. 질문 3: 뉴런과 뉴런 사이의 연결은 어떻게 되어 있나?

이 질문은 사실 3개 층위로 나눠서 봐야 제대로 이해된다.

1. **한 셀 내부에서의 연결**  
2. **같은 recurrent stack 안에서 층-층 사이 연결**  
3. **Full-band / Sub-band / Deep filtering까지 포함한 전체 모델 구조 연결**

---

## 4.1 한 GSU 셀 내부의 연결

한 뉴런 벡터를 기준으로 보면, 현재 시각 `t`의 각 뉴런은 아래 두 입력을 동시에 받는다.

- 현재 입력 feature vector `x_t`
- 이전 시각의 spike vector `h_(t-1)`

이 둘은 각각 선형층을 거쳐 더해진다.

```text
W_ih x_t
W_hh h_(t-1)
```

즉, 셀 내부에서는 보통 **dense all-to-all 연결**이라고 보면 된다.

### 의미
- 현재 입력 feature의 모든 차원이 현재 뉴런 계산에 영향을 줄 수 있고
- 이전 spike vector의 모든 차원도 현재 뉴런 계산에 영향을 줄 수 있다.

즉, 셀 내부 수준에서는 연결이 꽤 촘촘하다.

---

## 4.2 시간축 방향 연결: recurrent connection

같은 층에서 시간 방향 연결은 아래처럼 된다.

```text
time t-1:  h_(t-1), c_(t-1)
              |
              v
time t:    [GSU cell] -> h_t, c_t
              |
              v
time t+1:  [GSU cell] -> h_(t+1), c_(t+1)
```

즉, 같은 층의 뉴런은
- `h_t`와 `c_t`를 들고 다음 시각으로 넘어간다.

여기서
- `h_t`는 외부로도 나가는 spike 출력
- `c_t`는 내부 누적 메모리

다.

그래서 **시간축 recurrent connection은 2개 상태를 함께 가진다**고 볼 수 있다.

---

## 4.3 층 방향 연결: layer-to-layer feedforward

GSU는 보통 여러 층으로 쌓인다.

예를 들면 2층 구조에서는

```text
Layer 1 at time t -> h_t^(1)
Layer 2 at time t <- h_t^(1)
```

처럼 된다.

즉,
- **아래 층의 현재 시각 spike 출력**이
- **윗층의 현재 시각 입력**으로 들어간다.

정리하면,
- 시간축 연결: 같은 층의 과거 -> 현재
- 층축 연결: 아래 층의 현재 -> 위 층의 현재

이다.

---

## 4.4 Full-band 경로의 연결

Full-band 경로는 **global context**를 만드는 역할이다.

논문 개념상으로는 전체 주파수 magnitude vector `x(n) ∈ R^F`를 보고, 그와 같은 크기의 embedding `E(n)`를 만든다.

그런데 업로드된 현재 코드에서는 약간 현실적인 변형이 있다.

### 코드의 실제 동작
- magnitude 전체를 만들긴 하지만
- Full-band 입력으로는 `fb_input_size`개의 **low-band bin만 사용**한다.
- 그 출력 embedding을 주파수축으로 반복해 전체 대역에 맞춘다.

즉,

```text
low-band 64 bins -> Full-band GSN -> 64-d embedding
                        -> repeat -> 전체 주파수 대역용 embedding
```

이라는 흐름이다.

이건 논문 서술의 “전체 스펙트럼 full-band 처리”와 완전히 동일한 형태는 아니고, **현재 구현이 취한 경량화된 구체화 방식**으로 이해하면 좋다.

---

## 4.5 Sub-band 경로의 연결: 로컬 + 글로벌 연결

Sub-band 모델의 입력은 단순히 중심 주파수만 보지 않는다.

특정 주파수 그룹에 대해 아래를 이어 붙인다.

1. 중심 주파수 그룹 (`ctr_freq`)  
2. 좌우 이웃 주파수 (`nbr_freq`씩)  
3. 같은 위치에 해당하는 Full-band embedding

즉,

```text
subband input = [local noisy bins | global full-band embedding]
```

이다.

이 연결이 매우 중요하다.

### 왜 중요하나?
- local noisy bins만 보면 “지금 이 근처 주파수에서 무슨 일이 일어나나”를 볼 수 있다.
- full-band embedding까지 같이 주면 “전체 스펙트럼 문맥상 지금 이 구간이 어떤 의미인가”를 같이 볼 수 있다.

그래서 Sub-band 뉴런은 완전히 독립된 로컬 필터가 아니라,
- **로컬 주파수 문맥**
- **전체 스펙트럼 문맥**
을 동시에 받는 구조다.

---

## 4.6 주파수 파티션은 연결을 어떻게 바꾸나?

이 모델의 중요한 설계 포인트는 **주파수 파티션마다 처리 granularity를 다르게 둔다는 점**이다.

논문에서는 파티션 `P_k`마다 grouping parameter `g_k`를 둬서,
- 저주파는 더 세밀하게
- 고주파는 더 거칠게

처리한다고 설명한다.

코드에서는 이 개념이 대략 아래 파라미터로 구현된다.

- `freq_cutoffs`
- `center_freq_sizes`
- `neighbor_freq_sizes`
- `df_orders`

즉, 파티션마다
- 몇 개 중심 bin을 묶을지
- 양옆 neighbor를 얼마나 볼지
- deep filtering order를 몇으로 둘지
를 따로 정한다.

---

## 4.7 baseline_m.toml 예시로 보면 연결 구조가 더 잘 보인다

업로드된 `baseline_m.toml` 예시를 기준으로 보면 아래처럼 된다.

### 파티션 설정 예시
- `freq_cutoffs = [0, 32, 128, 256]`
- `center_freq_sizes = [4, 32, 64]`
- `neighbor_freq_sizes = [15, 15, 15]`
- `df_orders = [5, 3, 1]`

이 의미는 대략 다음과 같다.

### 파티션 1: 0~31 bin
- 중심 그룹 크기: 4
- 좌우 이웃: 15씩
- deep filter order: 5

즉 입력 feature 차원은

```text
(중심 4 + 이웃 15*2) + full-band embedding 4 = 38
```

이다.

### 파티션 2: 32~127 bin
- 중심 그룹 크기: 32
- 좌우 이웃: 15씩
- deep filter order: 3

입력 feature 차원은

```text
(중심 32 + 이웃 30) + full-band embedding 32 = 94
```

이다.

### 파티션 3: 128~255 bin
- 중심 그룹 크기: 64
- 좌우 이웃: 15씩
- deep filter order: 1

입력 feature 차원은

```text
(중심 64 + 이웃 30) + full-band embedding 64 = 158
```

이다.

### 이 구조가 의미하는 것
- **저주파**는 center group이 작고 deep filter order가 길다  
  -> 더 세밀하게, 더 긴 시간 문맥으로 본다
- **고주파**는 center group이 크고 deep filter order가 짧다  
  -> 더 거칠게, 더 짧은 시간 문맥으로 본다

즉, 이 모델은 “모든 주파수를 똑같이 처리”하지 않는다.  
**인간 청각과 계산 효율을 동시에 의식한 비균일 연결 구조**다.

---

## 4.8 Deep filtering은 시간축 연결을 한 번 더 추가한다

Sub-band 모델이 뽑는 것은 최종 waveform이 아니라 **complex deep-filter coefficient**다.

그리고 실제 enhancement는
- 현재 프레임만 보는 게 아니라
- **현재 + 과거 여러 프레임**을 함께 본다.

즉, 특정 파티션에서 deep filter order가 `d_k`이면,

```text
x(n,f), x(n-1,f), ..., x(n-d_k,f)
```

같은 과거 프레임들이 같이 들어간다.

참고로 여기에는 **논문 표기와 코드 구현의 카운트 방식 차이**를 주의해서 봐야 한다.  
논문 식은 보통 `x(n)`부터 `x(n-d_k)`까지 적어서 현재 프레임과 여러 과거 프레임을 설명한다. 반면 코드 구현은 `unfold(order)`를 써서 **현재를 포함한 총 `order`개 프레임**을 묶는다. 그래서 문헌의 `d_k`와 코드 변수 `df_order`는 직관상 비슷하지만, 세부 카운트는 off-by-one처럼 보일 수 있다. 문서를 읽을 때는 숫자 그 자체보다 **“현재 + 여러 과거 프레임을 함께 본다”**는 핵심을 잡는 것이 중요하다.

이건 또 다른 종류의 연결이다.

- GSU recurrent는 **은닉 상태의 시간 연결**
- deep filtering은 **STFT 입력 자체의 시간 연결**

이다.

즉, 이 모델은 시간 정보를 두 번 본다.

1. GSN/GSU가 recurrent state로 시간축을 본다  
2. deep filtering이 실제 STFT 프레임 묶음으로 시간축을 다시 본다

그래서 speech / noise의 temporal pattern을 더 잘 구분할 수 있다.

---

## 5. Full-band / Sub-band / GSU를 한 번에 연결해서 보면

이제 전체를 한 그림으로 다시 정리하면 아래와 같다.

```text
[Waveform]
   |
   v
[STFT]
   |
   +--> complex STFT X(n,f) -------------------------------+
   |                                                       |
   +--> magnitude |X(n,f)|                                |
           |                                              |
           +--> low-band slice -> Full-band GSN stack     |
           |                         |                     |
           |                         v                     |
           |                   global embedding E         |
           |                         |                     |
           +--> partition k: [local bins + neighbors + E] |
                                     |                    |
                                     v                    |
                               Sub-band GSN stack         |
                                     |                    |
                                     v                    |
                           complex DF coefficients w      |
                                                          |
X(n,f), X(n-1,f), ...  <---- deep filtering --------------+
   |
   v
enhanced STFT
   |
   v
iSTFT
   |
   v
enhanced waveform
```

여기서 spike는
- Full-band GSN stack 내부에서도 나오고
- Sub-band GSN stack 내부에서도 나온다.

하지만 deep filtering과 ISTFT는 spike가 아니라 일반 신호 처리다.

---

## 6. 오해하기 쉬운 부분 4가지

## 오해 1) “입력 오디오가 바로 spike train으로 바뀐다”
아니다.  
현재 구현은 **STFT magnitude feature**를 recurrent spiking cell에 넣는다.

## 오해 2) “이건 그냥 LIF다”
아니다.  
핵심은 **input-dependent decay / forget gate**다.  
즉 fixed decay LIF보다 **LSTM 쪽 아이디어가 훨씬 많이 들어간다.**

## 오해 3) “spike가 나오면 반드시 membrane reset이 코드에 있어야 한다”
전통 SNN 관점에서는 그렇게 기대할 수 있지만, 현재 공개 구현은 **명시적 reset subtraction보다는 gated memory + binary output**에 초점을 맞춘다.

## 오해 4) “sub-band는 완전히 local-only다”
아니다.  
Sub-band 입력에는 항상 **full-band embedding**이 같이 붙는다.  
즉 local-only가 아니라 **local + global hybrid**다.

---

## 7. 정말 한 문장으로 요약하면

### 7.1 spike activation
이 구현에서 spike는 **STFT 기반 연속값 feature를 입력으로 받은 GSU/GSN 셀이, 이전 memory와 현재 입력을 gate로 섞어 만든 내부 상태 `c_t`를 thresholding할 때** 발생한다.

### 7.2 GSU / GSN과 LSTM 관계
GSU/GSN은 **LSTM의 forget gate 아이디어를 남기고, input/output gate를 크게 단순화한 뒤, hidden output을 tanh 대신 binary spike로 바꾼 recurrent spiking unit**이라고 보면 된다.

### 7.3 뉴런 연결
뉴런 연결은
- 셀 내부에서는 **dense input/recurrent 연결**
- 시간축으로는 **`h_t`, `c_t` 상태 전달**
- 층 방향으로는 **현재 시각 spike의 상위층 전달**
- 주파수축으로는 **Full-band global + Sub-band local 연결**
- 출력단에서는 **deep filtering으로 과거 프레임 연결**
로 이루어진다.

---

## 8. 마지막 정리: 사용자가 꼭 기억하면 좋은 3줄

1. **이 모델은 raw audio를 바로 spike로 바꾸는 게 아니라, STFT feature를 recurrent spiking cell에 넣는다.**  
2. **GSN/GSU의 본질은 “가변 decay를 가진 LSTM형 memory cell + binary spike output”이다.**  
3. **연결 구조는 단순한 뉴런 체인이 아니라, 시간축 recurrent + 층간 전달 + full/sub-band 결합 + deep filtering까지 포함한 다층 연결 구조다.**

---

## 참고 기준

이 문서는 아래 자료를 기준으로 작성했다.

- 2025 IEEE TNNLS 논문: **Toward Ultralow-Power Neuromorphic Speech Enhancement With Spiking-FullSubNet**
- 업로드된 구현 파일:
  - `efficient_spiking_neuron.py`
  - `modeling_spiking_fullsubnet.py`
  - `baseline_m.toml`
- 기존에 작성된 개요 문서:
  - `spiking_fullsubnet_detailed.md`

필요하면 다음 단계로 이어서 정리할 수 있는 주제는 아래 두 가지다.

1. **코드 줄 단위로 따라가는 실행 순서도**  
2. **하드웨어 관점에서 GSU 셀을 RTL 블록처럼 쪼개서 설명한 문서**
