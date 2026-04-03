
# Subband Q6.10 변환 가이드

## 1. 목적

이 문서는 현재 Python `subband_model.py`와 float C++ `subband_ref.cpp`를 기준으로, **subband 경로를 Q6.10 고정소수점 C++ reference**로 바꾸는 정확한 절차를 정리한 문서이다.

이번 단계의 목표는 딱 두 가지다.

1. **Python 수식 의미를 유지한 채** Q6.10 reference를 만든다.
2. **SHA/bitwise 검증이 가능한 중간 버퍼**를 확보한다.

즉, 이번 문서는 **바로 HLS top function을 만드는 문서가 아니다.**  
먼저 **Q6.10 reference를 안정적으로 맞추는 단계**를 문서화한 것이다.

---

## 2. 소스 오브 트루스

이번 변환의 기준은 아래 파일들이다.

- `subband_model.py`
  - `_freq_unfold()`
  - `SubBandSequenceModel.forward()`
  - `SubbandModel.forward()`
- `efficient_spiking_neuron.py`
  - `GSUCell.forward()`
  - `Triangle.forward()`
- `baseline_m.toml`
  - 실제 고정 스펙
- `subband_ref.cpp`
  - float C++ reference 구조
- `translate_instructions.md`
  - Q-format / HLS-friendly 규칙

이번 Q6.10 변환은 **코드 구조는 `subband_ref.cpp`를 따르고**,  
**수식 의미는 Python 구현을 따른다.**

---

## 3. 이번 단계에서 고정하는 스펙

### 3.1 모델 고정 스펙

이번 reference는 아래 baseline만 지원한다.

- `sequence_model = "GSN"`
- `sb_hidden_size = 224`
- `sb_num_layers = 2`
- `shared_weights = true`
- `bn = true`
- `use_pre_layer_norm_sb = false`
- `num_spks = 1`

즉, 이번 Q6.10 reference에는 아래를 **구현하지 않는다.**

- LSTM 분기
- LayerNorm 분기
- `shared_weights = false`
- `num_spks > 1`
- 임의 band 설정

---

## 4. Q6.10 정의

### 4.1 정의

- 총 비트수: 16-bit signed
- 소수부: 10-bit
- 스케일: `2^10 = 1024`

### 4.2 기준값

- `1.0  -> 1024`
- `0.5  -> 512`
- `0.0  -> 0`
- `-1.0 -> -1024`

### 4.3 표현 범위

Q6.10 signed 16-bit의 표현 범위는 대략 다음과 같다.

- 최소값: `-32.0`
- 최대값: `31.9990234375`

---

## 5. 텐서/파라미터 변환 규칙

### 5.1 기본 양자화 규칙

모든 float tensor를 Q6.10으로 바꿀 때는 **하나의 규칙만** 사용한다.

```python
def float_to_q610(x):
    q = round(x * 1024.0)
    q = clip(q, -32768, 32767)
    return int16(q)
```

### 5.2 역변환 규칙

```python
def q610_to_float(x_q):
    return float(x_q) / 1024.0
```

### 5.3 반드시 같은 규칙을 써야 하는 항목

아래는 모두 같은 규칙으로 양자화해야 한다.

- `noisy_input`
- `fb_output`
- `weight_ih`
- `weight_hh`
- `bias_ih`
- `proj.weight`
- `proj.bias`
- `bn_running_mean`
- `bn_running_var`
- `bn_weight`
- `bn_bias`

---

## 6. BN epsilon은 예외다

`BatchNorm1d`의 `eps`는 보통 `1e-5` 수준이다.  
Q6.10의 최소 분해능은 `1 / 1024 ≈ 0.0009765625` 이므로, `1e-5`는 Q6.10으로 표현하면 **0이 된다**.

따라서 이번 reference에서는 `eps`를 **Q6.10으로 양자화하지 않는다.**

권장 방식:

- `bn` 파라미터는 Q6.10
- `eps`는 `float kBnEpsFloat = 1e-5f;` 로 유지

이건 의도된 예외다.  
지금 단계에서는 **정확도와 검증 안정성**이 우선이다.

---

## 7. band별 고정 shape

현재 baseline 기준 band spec은 아래처럼 고정된다.

### Band 0

- `lower_cutoff = 0`
- `upper_cutoff = 32`
- `ctr_freq = 4`
- `nbr_freq = 15`
- `df_order = 5`

계산:

- `num_subbands = (32 - 0) / 4 = 8`
- `noisy_freq_size = 4 + 2*15 = 34`
- `fb_freq_size = 4`
- `packed_input_size = 34 + 4 = 38`
- `proj_size = 2 * 4 * 5 * 1 = 40`

### Band 1

- `lower_cutoff = 32`
- `upper_cutoff = 128`
- `ctr_freq = 32`
- `nbr_freq = 15`
- `df_order = 3`

계산:

- `num_subbands = (128 - 32) / 32 = 3`
- `noisy_freq_size = 32 + 2*15 = 62`
- `fb_freq_size = 32`
- `packed_input_size = 62 + 32 = 94`
- `proj_size = 2 * 32 * 3 * 1 = 192`

### Band 2

- `lower_cutoff = 128`
- `upper_cutoff = 256`
- `ctr_freq = 64`
- `nbr_freq = 15`
- `df_order = 1`

계산:

- `num_subbands = (256 - 128) / 64 = 2`
- `noisy_freq_size = 64 + 2*15 = 94`
- `fb_freq_size = 64`
- `packed_input_size = 94 + 64 = 158`
- `proj_size = 2 * 64 * 1 * 1 = 128`

---

## 8. Python 수식을 Q6.10으로 어떻게 옮겼는가

### 8.1 `_freq_unfold`

이 블록은 **산술 연산이 아니라 데이터 재배치**이므로, float와 Q6.10의 차이가 없다.  
즉 아래 연산은 **값을 복사**하기만 하면 된다.

- reflect index 계산
- noisy subband 생성
- fullband subband 생성

Q6.10으로 바꾸더라도 연산은 그대로다.

### 8.2 `sb_input = cat([noisy_subbands, fb_subbands], dim=-2)`

이것도 데이터 복사/병합이다.  
Q6.10에서는 `int16_t` 버퍼에 그대로 이어 붙이면 된다.

### 8.3 `packed_input = reshape(...)`

이 단계도 수치 연산이 없다.  
shape만 바뀌므로 SHA 검증의 첫 단계로 적합하다.

### 8.4 `sequence_input = packed_input.permute(2,0,1)`

이것도 reorder만 수행한다.

---

## 9. GSUCell의 Q6.10 변환 규칙

현재 Python 수식은 다음 의미를 가진다.

```python
gates = x @ W_ih^T + bias_ih + hx @ W_hh^T
forgetgate, cellgate = gates.chunk(2, dim=1)
forgetgate = sigmoid(forgetgate)
cy = forgetgate * cx + (1 - forgetgate) * cellgate
cy = batchnorm_eval(cy)
hy = step(cy)
```

현재 baseline은 `shared_weights = true` 이므로 실제 수식은 더 정확히 이렇게 봐야 한다.

```text
common = x @ W_ih^T + hx @ W_hh^T
forget_pre = common + bias_ih[:hidden]
cell_pre   = common + bias_ih[hidden:]
```

즉, **입력/재귀 dot product는 forget gate와 cell gate가 공유**하고,  
**bias만 두 갈래로 나뉜다.**

### 9.1 dot product 누산 규칙

입력과 가중치가 둘 다 Q6.10이면 raw product는 Q12.20이 된다.

따라서 dot product는 이렇게 계산한다.

1. 각 곱을 **raw product 그대로** 누산한다.  
   즉, 매 곱마다 바로 `>> 10` 하지 않는다.
2. bias는 Q6.10이므로 누산기 스케일(Q20)에 맞추기 위해 `<< 10` 해서 더한다.
3. 모든 합산이 끝난 뒤 **한 번만** `>> 10` 하여 Q6.10으로 되돌린다.

권장 수식:

```text
common_q20 = Σ (x_q * w_ih_q) + Σ (hx_q * w_hh_q)
forget_q20 = common_q20 + (bias_forget_q << 10)
cell_q20   = common_q20 + (bias_cell_q   << 10)

forget_pre_q = round_shift_right(forget_q20, 10)
cell_pre_q   = round_shift_right(cell_q20, 10)
```

이 순서를 깨면 Python과 차이가 커진다.

### 9.2 왜 곱마다 바로 shift 하면 안 되나

곱마다 바로 `>> 10` 해버리면 각 곱셈에서 반올림 오차가 누적된다.  
hidden size가 224이므로 이 오차는 무시하기 어렵다.

따라서 **dot은 raw product 누산 → 마지막에 한 번만 shift**가 맞다.

---

## 10. sigmoid 처리

현재 Python은 `torch.sigmoid()`를 사용한다.  
이번 reference에서는 **첫 번째 고정소수점 기준 코드**이므로, 아래 방식을 사용한다.

1. `forget_pre_q610`을 float로 역변환
2. float sigmoid 계산
3. 결과를 다시 Q6.10으로 양자화

즉,

```text
sigmoid_q610 = float_to_q610(sigmoid(q610_to_float(x_q610)))
```

이 방식의 장점:

- Python과의 의미 차이를 최소화할 수 있다.
- LUT/PWL 오차를 지금 단계에서 섞지 않아도 된다.
- 먼저 Q6.10 reference를 안정적으로 맞춘 뒤 LUT로 교체할 수 있다.

### 중요한 점

이 구현은 **첫 단계 reference**용이다.  
이대로 HLS 최종 top에 넣는 것은 추천하지 않는다.  
검증이 끝나면 `SigmoidQ610HostRef()`를 LUT/PWL 함수로 교체하면 된다.

---

## 11. BN 처리

현재 Python은 `batchnorm_eval()`에서 running statistics 기반 eval mode BN을 수행한다.

이번 Q6.10 reference는 아래 방식으로 구현한다.

1. `cy_q610`을 float로 역변환
2. Q6.10으로 양자화된 BN 파라미터를 float로 역변환
3. float BN eval 계산
4. 결과를 다시 Q6.10으로 양자화

즉,

```text
y = gamma * (x - mean) / sqrt(var + eps) + beta
```

를 float에서 계산한 뒤 다시 Q6.10으로 바꾼다.

### 왜 BN folding을 바로 하지 않았나

가능은 하지만, 이번 단계의 목표는 **BN까지 포함한 Q6.10 reference를 먼저 맞추는 것**이다.  
BN folding까지 한 번에 넣으면 mismatch 원인이 늘어난다.

따라서 순서는 이렇게 가는 게 맞다.

1. BN eval 기준 Q6.10 reference 통과
2. 그 다음 BN folding
3. 그 다음 LUT/PWL sigmoid
4. 마지막에 HLS top으로 정리

---

## 12. step activation 처리

Python에서는 `hy = step(cy)`이며, 실제 구현은

```python
hy = 1 if cy >= 0 else 0
```

이다.

Q6.10에서는 이 출력을 이렇게 고정한다.

- `cy >= 0` 이면 `1024`
- `cy < 0` 이면 `0`

즉,

```text
hy_q610 = (cy_q610 >= 0) ? 1024 : 0
```

이다.

여기서 `1`이 아니라 **Q6.10의 1.0 = 1024**를 써야 한다.

---

## 13. projection 처리

projection도 입력과 가중치가 모두 Q6.10이므로 GSU dot product와 동일한 규칙을 쓴다.

```text
sum_q20 = Σ (input_q * proj_weight_q) + (proj_bias_q << 10)
proj_q  = round_shift_right(sum_q20, 10)
```

주의:

- per-multiply shift 금지
- 마지막에 한 번만 shift
- saturation 적용

---

## 14. `df_coef` reshape는 수치 연산이 아니다

`ProjectToDfCoef` 단계는 projection 결과를 최종 shape에 다시 넣는 작업이다.

즉, 아래 의미만 유지하면 된다.

- feature index 분해
- complex real/imag 분리
- df 차원 분리
- subband별 ctr_freq를 이어붙이기

이 단계는 **산술 mismatch가 아니라 indexing mismatch**가 나기 쉬운 구간이다.  
따라서 SHA 검증 대상에 반드시 넣어야 한다.

---

## 15. 이번 코드 파일에서 실제로 바뀐 핵심

이번 `subband_ref_q610.cpp`는 아래 방향으로 바뀌어야 한다.

### 15.1 자료형

- `float` -> `int16_t`
- raw accumulator -> `int64_t`

### 15.2 helper 추가

- `FloatToQ610`
- `Q610ToFloat`
- `MulQ610`
- `RoundShiftRight`
- `StepActivationQ610`
- `SigmoidQ610HostRef`
- `BatchNormEvalQ610HostRef`

### 15.3 데이터 버퍼

아래 버퍼들은 모두 `std::vector<int16_t>`가 된다.

- `noisy_subbands`
- `fb_subbands`
- `sb_input`
- `packed_input`
- `layer_outputs`
- `df_coef`

### 15.4 가중치 구조체

가중치도 전부 Q6.10 `int16_t`로 보관한다.

---

## 16. SHA 검증 순서

Q6.10 변환에서 중요한 건 **처음부터 최종 `df_coef`만 보지 않는 것**이다.  
아래 순서로 검증해야 한다.

### 1단계: 복사/재배치 블록 검증

아래는 산술 연산이 거의 없으므로 **bitwise / SHA exact match**가 나와야 한다.

- `noisy_subbands`
- `fb_subbands`
- `sb_input`
- `packed_input`

이 단계가 틀리면 indexing 문제다.

### 2단계: sequence ordering 검증

- `sequence_input`

이 단계도 재배치이므로 exact match가 나와야 한다.

### 3단계: arithmetic block 검증

- `layer0_output`
- `layer1_output`
- `projected_output`

이 단계는 Q6.10 연산이 들어가므로 Python의 **Q6.10 emulation 출력**과 비교해야 한다.

### 4단계: final reshape 검증

- `df_coef`

이 단계는 arithmetic + indexing이 결합된 결과다.

---

## 17. Python 쪽에서 반드시 같이 만들어야 하는 것

C++ reference만 만들면 끝이 아니다.  
반드시 Python 쪽에서도 **Q6.10 emulation dump**를 만들어야 한다.

최소한 아래를 export해야 한다.

- `noisy_input_q610`
- `fb_output_q610`
- band별
  - `noisy_subbands_q610`
  - `fb_subbands_q610`
  - `sb_input_q610`
  - `packed_input_q610`
  - `sequence_input_q610`
  - `layer0_output_q610`
  - `layer1_output_q610`
  - `projected_output_q610`
  - `df_coef_q610`

그래야 어느 블록에서 깨지는지 바로 알 수 있다.

---

## 18. 이번 단계에서 아직 하지 않는 것

아래는 **일부러 아직 안 한다.**

- LUT sigmoid
- PWL sigmoid
- BN folding
- top function 분리
- pragma 삽입
- fixed array 기반 HLS top 리팩토링
- `std::vector` 제거
- `ap_fixed` 치환

이건 **다음 단계**다.  
지금 한 번에 들어가면 mismatch 원인을 추적하기 어려워진다.

---

## 19. 권장 개발 순서

### Step 1
Python에서 Q6.10 quantizer를 만든다.

### Step 2
중간 버퍼를 Q6.10 기준으로 dump한다.

### Step 3
`subband_ref_q610.cpp`로 band 0만 먼저 검증한다.

### Step 4
band 1, band 2까지 확장한다.

### Step 5
세 band의 `df_coef`까지 Q6.10 reference를 통과시킨다.

### Step 6
그 다음에만 LUT/PWL sigmoid나 BN folding을 넣는다.

### Step 7
마지막에 HLS-friendly top 함수/고정 배열 구조로 바꾼다.

---

## 20. 자주 틀리는 포인트

### 20.1 step 출력값을 1로 넣는 실수
틀린 방식:

```text
hy = 1 or 0
```

맞는 방식:

```text
hy = 1024 or 0
```

### 20.2 bias를 그냥 더하는 실수
bias는 Q6.10이므로 raw dot accumulator(Q20)에 더할 때는 **`<< 10`** 해서 넣어야 한다.

### 20.3 곱마다 shift 하는 실수
반드시 raw product 누산 후 마지막에 한 번만 shift 한다.

### 20.4 shared_weights=true를 놓치는 실수
이번 baseline은 forget/cell이 weight를 공유한다.  
bias만 따로 있다.

### 20.5 BN eps를 Q6.10으로 양자화하는 실수
`1e-5`는 Q6.10에서 0이 된다.  
이번 reference에서는 float 상수로 둔다.

### 20.6 LayerNorm을 구현하는 실수
현재 baseline은 `use_pre_layer_norm_sb = false`이므로 구현 대상이 아니다.

---

## 21. 파일 체크리스트

최종 코드가 아래를 만족하면 이번 단계는 제대로 끝난 것이다.

- [ ] `subband_model.py`의 band spec과 shape를 그대로 반영했다.
- [ ] `shared_weights = true`를 반영했다.
- [ ] `sb_hidden_size = 224`, `sb_num_layers = 2`를 반영했다.
- [ ] `bn = true`를 반영했다.
- [ ] 모든 입력/가중치/출력이 Q6.10 `int16_t`다.
- [ ] dot product는 raw product 누산 후 마지막에만 shift 한다.
- [ ] `hy` 출력은 `0` 또는 `1024`다.
- [ ] 중간 버퍼 SHA 검증 순서를 따를 수 있다.
- [ ] LUT/PWL, BN folding, HLS pragma는 아직 넣지 않았다.

---

## 22. 최종 요약

이번 단계의 핵심은 하나다.

> **subband float reference를 바로 HLS 코드로 뛰어넘지 말고, 먼저 Python 의미를 유지한 Q6.10 reference로 안정적으로 고정하라.**

즉, 순서는 반드시 이렇다.

1. Python 의미 보존
2. Q6.10 양자화 규칙 고정
3. 중간 버퍼 exact 검증
4. 최종 `df_coef` 검증
5. 그 다음에만 LUT / BN folding / HLS top

이 순서를 지키면 디버깅 범위를 가장 좁게 유지할 수 있다.
