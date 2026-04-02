# subband_model.py 자체를 수정해서 의존성을 제거하는 가이드

이 문서는 **Spiking_FullSubnet_essential 저장소의 기존 파일 구조를 유지한 채**,  
`audiozen/models/spiking_fullsubnet/subband_model.py` **자체를 직접 수정해서**  
하드웨어 포팅에 방해되는 의존성을 단계적으로 제거하는 실무용 가이드이다.

즉, 목표는 **새 파일을 많이 추가하는 것**이 아니라,

- 기존 `subband_model.py` 안에서
- `SequenceModel`, `einops`, `torch.nn.Module` 스타일 의존을 줄이고
- 최종적으로 C/HLS로 옮기기 쉬운 forward-only 구조로 바꾸는 것

이다.

---

## 0. 핵심 결론

이전에 제안된 구조는 **subband 파일 바깥에서 경계를 자르는 방법**에 가까웠다.  
하지만 지금 네 목표는 분명히 다음이다.

> **`subband_model.py` 자체를 수정해서, 이 파일 하나가 하드웨어 포팅 기준점이 되게 만들기**

따라서 지금은 파일 분리보다 아래 순서가 맞다.

1. `subband_model.py` 안의 외부 의존성 확인
2. 하드웨어에 불필요한 추상화 제거
3. `subband_model.py` 안에서 직접 forward-only 연산으로 바꾸기
4. 마지막에야 필요하면 C/HLS 대응 stub 또는 별도 reference 파일 생성

---

## 1. 현재 `subband_model.py`가 의존하는 것

현재 repo 기준 `subband_model.py`는 최소한 다음에 의존한다.

- `torch`
- `torch.nn as nn`
- `einops.rearrange`
- `torch.nn.functional as F`
- `audiozen.models.spiking_fullsubnet.sequence_model.SequenceModel`

즉, 핵심 의존성은 아래 3개다.

### (1) `SequenceModel`
가장 큰 의존성이다.

현재 `SubBandSequenceModel`이 `SequenceModel`을 상속하고 있어서,
subband 파일만 봐서는 실제 핵심 연산이 다 보이지 않는다.

결국 subband를 하드웨어로 옮기려면,
`SequenceModel.forward()` 안으로 다시 들어가야 하고,
거기서 또 `efficient_spiking_neuron`, `GSUCell`, `Triangle`로 따라가야 한다.

즉, **subband_model.py가 독립적이지 않다.**

### (2) `einops.rearrange`
이건 기능적으로는 단순 reshape/permute지만,
하드웨어 포팅 관점에서는 블랙박스처럼 보이기 쉽다.

특히 C/HLS 대응 검증에서는
`rearrange(...)`보다
`view/reshape/permute` 또는 명시적 인덱싱이 더 낫다.

### (3) `F.unfold`, `F.pad`
`SubbandModel._freq_unfold()`는 사실상 subband 입력 생성의 핵심인데,
지금은 `F.pad(..., mode="reflect")`와 `F.unfold(...)`에 크게 의존하고 있다.

이 둘은 PyTorch에서는 편하지만,
하드웨어 구현에서는 결국 직접 인덱싱으로 다시 풀어야 한다.

---

## 2. 지금 당장 하지 말아야 할 것

### 2-1. 파일을 여러 개로 더 나누기
지금은 `subband_model.py`를 더 쪼개는 것이 우선이 아니다.

이유:
- 이미 repo에서 역할별 파일이 어느 정도 나뉘어 있음
- 지금 문제는 구조가 더러워서가 아니라
  **subband 파일이 sequence model에 종속되어 있다는 점**임
- 파일을 더 나누면 오히려 따라가야 할 곳이 늘어남

### 2-2. 처음부터 전체 모델을 다 self-contained로 만들기
처음부터 `STFT → fullband → subband → deepfiltering → iSTFT`를
한 파일에 다 넣는 것은 비추천이다.

지금 목표는 **subband 블록만 독립화**하는 것이다.

---

## 3. 수정 방향: `subband_model.py` 안에서 무엇을 직접 들고 올 것인가

핵심은 다음이다.

> `subband_model.py`가 더 이상 `SequenceModel`에 기대지 않도록 만든다.

즉,
현재 구조:

- `SubBandSequenceModel(SequenceModel)`
- `super().forward(input_features)` 호출

이걸 아래 방향으로 바꾸는 것이 핵심이다.

### 바꿔야 하는 방향

- `SubBandSequenceModel`이 `SequenceModel` 상속을 끊는다.
- `SequenceModel.forward()`에서 실제로 필요한 부분만 `subband_model.py` 안으로 가져온다.
- baseline에서 실제 쓰는 경로만 남긴다.

현재 baseline 기준으로는 다음 조건이 고정이다.

- `sequence_model = "GSN"`
- `bn = true`
- `shared_weights = true`
- `num_spks = 1`
- `sb_num_layers = 2`
- `use_pre_layer_norm_sb = false`

즉, `subband_model.py` 안에서는
애초에 generic sequence model을 유지할 필요가 거의 없다.

---

## 4. 의존성 제거 순서

순서를 잘 지켜야 한다.

---

### 단계 1. `SequenceModel` 상속 끊기

현재 가장 먼저 할 일은 이것이다.

#### 현재
```python
class SubBandSequenceModel(SequenceModel):
```

#### 목표
```python
class SubBandSequenceModel(nn.Module):
```

그리고 `super().forward(input_features)`를 없애고,
`SequenceModel.forward()` 안에서 subband에 실제 필요한 부분만
직접 이 파일 안으로 옮긴다.

#### 여기서 subband에 필요한 최소 기능
- 입력 shape 확인
- states 초기화
- `input_features`의 시간축/배치축 재배열
- GSN forward 호출
- projection
- output reshape

즉, `SequenceModel` 전체를 가져오는 게 아니라
**subband가 실제로 쓰는 forward 경로만 복사/정리**하는 방식이다.

---

### 단계 2. `LSTM` 분기 삭제

현재 `SequenceModel`은 `GSN`과 `LSTM` 둘 다 지원하는 구조다.
하지만 baseline은 `sequence_model = "GSN"`이다.

따라서 subband 하드웨어 포팅용 `subband_model.py`에서는
아래 같은 generic 분기가 오히려 방해다.

```python
if self.sequence_model_name == "LSTM":
    ...
```

이 분기는 제거하는 게 맞다.

즉, subband 파일 안에서는 아예

- `GSN 전용`
- `forward-only`

로 고정하는 편이 낫다.

---

### 단계 3. `einops.rearrange` 제거

현재 `subband_model.py`는 `rearrange`를 여러 번 사용한다.
이건 Python에서는 편하지만,
C/HLS 대응 검증에서는 명시성이 떨어진다.

예를 들어:

```python
input_features = rearrange(input_features, "b n c fs t -> (b n) (c fs) t")
```

이건 가능하면 아래 둘 중 하나로 바꾸는 게 좋다.

#### 방법 A: `permute + reshape`
```python
input_features = input_features.permute(0, 1, 2, 3, 4).contiguous()
input_features = input_features.reshape(batch_size * num_subbands, num_channels * sb_freq_size, sequence_length)
```

#### 방법 B: 명시적 pack loop
```python
packed = torch.zeros(...)
for b in range(batch_size):
    for n in range(num_subbands):
        ...
```

초기에는 A가 낫고,
하드웨어와 1:1 비교용 reference까지 생각하면 B가 더 좋다.

---

### 단계 4. `_freq_unfold()`를 `F.unfold` 없이 다시 쓰기

이게 사실상 subband 파일 수정의 핵심이다.

현재 `_freq_unfold()`는 다음 두 의존성이 크다.

- `F.pad(..., mode="reflect")`
- `F.unfold(...)`

하드웨어 포팅 기준에서는 이 둘을 직접 인덱싱으로 바꾸는 게 맞다.

#### 목표
`_freq_unfold()` 안에서

1. 각 subband의 center frequency 범위를 계산하고
2. 좌우 neighbor를 reflect 규칙으로 채우고
3. 최종 `[B, N, C, FS, T]` 텐서를 직접 작성

하도록 바꾼다.

#### 이유
이렇게 해야
- Python reference와 C 코드가 같은 인덱싱 규칙을 공유할 수 있고
- mismatch가 났을 때 원인을 찾기 쉬워진다.

즉, `_freq_unfold()`는 PyTorch helper 함수 기반 구현에서
**명시적 루프 기반 구현**으로 바꾸는 것이 맞다.

---

### 단계 5. subband 파일 안에 GSN forward 경로를 직접 포함

`SequenceModel` 상속을 끊었다면,
이제 `subband_model.py` 안에서 실제 recurrent 계산 경로도 보이게 해야 한다.

여기서 중요한 점은,
처음부터 `efficient_spiking_neuron.py` 전체를 다 복사하는 게 아니라,
**subband가 실제 쓰는 최소 경로만 직접 넣는 것**이다.

최소 포함 대상:

- `MemoryState`
- `GSUCell forward`
- `GSULayer forward`
- 2-layer stacked GSU forward
- step activation forward

#### 이때 제거 가능한 것
- custom autograd backward
- 학습용 surrogate gradient
- batch_first 옵션
- shared_weights=False 분기
- bn=False 분기

왜냐하면 지금 목표는 training이 아니라
**하드웨어 추론 기준 모델**이기 때문이다.

즉, subband 파일 안에서는 다음처럼 단순화하는 것이 맞다.

- `shared_weights=True` 고정
- `bn=True` 고정
- `num_layers=2` 고정
- `sequence_model="GSN"` 고정
- `step activation forward only`

---

### 단계 6. BatchNorm도 모듈 호출 대신 식으로 펼치기

baseline에서 `bn = true`이므로,
BN을 아예 없애면 안 된다.

하지만 `nn.BatchNorm1d` 모듈 호출을 그대로 두면
하드웨어 포팅 관점에서는 불필요한 추상화가 남는다.

따라서 subband 파일 안에서는 eval 기준 BN을 아래 식으로 직접 쓰는 방향이 좋다.

```python
y = gamma * (x - running_mean) / sqrt(running_var + eps) + beta
```

즉,
BN은 남기되 **모듈 의존성은 줄이는 방식**이 맞다.

---

## 5. 최종적으로 `subband_model.py`를 어떤 상태로 만들면 좋은가

최종 목표는 아래에 가깝다.

### 파일 내부 구성 예시

```text
subband_model.py
├── step_activation()
├── batchnorm_eval()
├── gsu_cell_forward()
├── gsu_layer_forward()
├── stacked_gsu_forward()
├── class SubBandSequenceModel(nn.Module)
│   └── forward()
├── class SubbandModel(nn.Module)
│   ├── forward()
│   └── _freq_unfold()   # explicit loop version
```

즉,
`subband_model.py` 하나만 열어도 아래가 다 보여야 한다.

- subband 입력이 어떻게 만들어지는지
- recurrent core가 어떻게 계산되는지
- 출력 `df_coef`가 어떻게 만들어지는지

이렇게 해야 이 파일이 곧바로
**하드웨어 포팅 기준 문서**가 된다.

---

## 6. 실제 수정 우선순위

한 번에 다 하지 말고 아래 순서로 가는 게 맞다.

### 1순위
`SequenceModel` 상속 제거

### 2순위
`LSTM` 분기 제거, GSN 전용화

### 3순위
`rearrange` 제거

### 4순위
`_freq_unfold()`를 explicit loop로 재작성

### 5순위
GSN core를 subband 파일 안으로 직접 포함

### 6순위
BN을 eval 수식으로 펼치기

이 순서로 해야 중간마다 검증이 가능하다.

---

## 7. 지금 단계에서의 실전 권장안

지금 네가 원하는 방향을 가장 정확히 표현하면 이거다.

> **새로운 subband 전용 reference 파일을 따로 만들기 전에, 먼저 기존 `subband_model.py`를 직접 수정해서 외부 의존성을 줄인다.**

즉,

- 파일 분리는 나중 문제
- 먼저 `subband_model.py` 자체가 독립적인 하드웨어 기준 파일이 되게 만들기
- 그다음에야 필요하면 C/HLS 대응용 별도 파일을 만들기

이 순서가 맞다.

---

## 8. 최종 체크리스트

- [ ] `SubBandSequenceModel`이 더 이상 `SequenceModel`을 상속하지 않는다.
- [ ] `subband_model.py` 안에 GSN forward 경로가 직접 보인다.
- [ ] `LSTM` 관련 분기가 제거되었다.
- [ ] `einops.rearrange`가 제거되었거나 최소화되었다.
- [ ] `_freq_unfold()`가 `F.unfold` 없이 explicit loop로 동작한다.
- [ ] `BatchNorm1d` 호출이 eval 식 기반으로 단순화되었다.
- [ ] 최종적으로 `subband_model.py` 하나만 봐도 subband 하드웨어 포팅 경로가 이해된다.

---

## 9. 한 줄 결론

이번 작업의 핵심은 **subband 파일을 바깥에서 감싸는 게 아니라**,  
**`subband_model.py` 자체를 직접 고쳐서 dependency-light, forward-only, hardware-friendly 파일로 만드는 것**이다.
