# `subband_model.py` → C++ (HLS 전) 변환 가이드

이 문서는 `audiozen/models/spiking_fullsubnet/subband_model.py`를 **바로 HLS 최적화까지 가지 않고**, 먼저 **C++ 기준 구현으로 옮긴 뒤 SHA 검증을 통과할 수 있도록** 변환하는 실무 가이드다.

이번 단계의 목표는 딱 하나다.

> **Python subband 기준 구현과 C++ 기준 구현이 같은 바이트 스트림을 내도록 만드는 것**

즉, 지금은

- HLS pragma 최적화
- `ap_fixed` 전환
- deepfiltering / iSTFT 통합
- fullband와의 전체 파이프라인 통합

까지 가지 않는다.

---

## 1. 이번 단계의 범위

### 대상 파일
- `audiozen/models/spiking_fullsubnet/subband_model.py`

### 바로 연결되는 의존 파일
- `audiozen/models/spiking_fullsubnet/sequence_model.py`
- `audiozen/models/spiking_fullsubnet/efficient_spiking_neuron.py`
- `recipes/intel_ndns/spiking_fullsubnet/baseline_m.toml`

### 이번 단계에서 유지할 것
- **FP32 유지**
- **inference-only forward 유지**
- **baseline 설정 고정**
- **출력 SHA 검증 가능하도록 serialization 규칙 고정**

### 이번 단계에서 하지 않을 것
- `ap_fixed` / 정수화
- HLS pragma 튜닝
- 루프 unroll/partition 최적화 강제
- 모델 구조 변경
- 수식 근사(LUT sigmoid, 근사 BN 등)

---

## 2. 지금 코드에서 먼저 고정해야 하는 사실

현재 repo의 `subband_model.py`는 다음 구조를 가진다.

1. `SubBandSequenceModel`은 `SequenceModel`을 상속한다.
2. `SubbandModel`은 band별로 `SubBandSequenceModel`을 생성한다.
3. `forward()`에서는 각 band에 대해
   - `noisy_input`에 `_freq_unfold()` 적용
   - `fb_output`에 `_freq_unfold()` 적용
   - 둘을 `torch.cat(..., dim=-2)`로 이어 붙임
   - band별 sequence model에 넣음
4. `_freq_unfold()`는 `reflect` padding과 `F.unfold()`를 사용한다.

즉, **subband 파일의 C++ 변환 핵심은 두 덩어리**다.

- **A. 데이터 이동 / shape 변환 경로**
  - `_freq_unfold`
  - `torch.cat`
  - `rearrange`
- **B. sequence / GSN 계산 경로**
  - `SequenceModel.forward`
  - `efficient_spiking_neuron`
  - `GSUCell.forward`

이번 단계에서는 **A를 먼저 바이트 단위로 맞추고**, 그 다음에 **B를 가져오는 순서**가 가장 안전하다.

---

## 3. baseline 기준으로 이번 C++ 포트에서 고정해도 되는 값

`baseline_m.toml` 기준으로 subband 관련 설정은 다음과 같다.

- `sb_hidden_size = 224`
- `sb_num_layers = 2`
- `freq_cutoffs = [0, 32, 128, 256]`
- `df_orders = [5, 3, 1]`
- `center_freq_sizes = [4, 32, 64]`
- `neighbor_freq_sizes = [15, 15, 15]`
- `use_pre_layer_norm_sb = false`
- `bn = true`
- `shared_weights = true`
- `sequence_model = "GSN"`
- `num_spks = 1`

이 값들을 이용하면 band별 상수는 아래처럼 **컴파일 타임 상수**로 고정할 수 있다.

### band 0
- lower = 0
- upper = 32
- ctr = 4
- nbr = 15
- df = 5
- num_subbands = (32 - 0) / 4 = 8
- sb_freq_size = 4 + 2×15 = 34
- packed input size = 34 + 4 = 38
- proj size = 2 × 4 × 5 × 1 = 40

### band 1
- lower = 32
- upper = 128
- ctr = 32
- nbr = 15
- df = 3
- num_subbands = (128 - 32) / 32 = 3
- sb_freq_size = 32 + 2×15 = 62
- packed input size = 62 + 32 = 94
- proj size = 2 × 32 × 3 × 1 = 192

### band 2
- lower = 128
- upper = 256
- ctr = 64
- nbr = 15
- df = 1
- num_subbands = (256 - 128) / 64 = 2
- sb_freq_size = 64 + 2×15 = 94
- packed input size = 94 + 64 = 158
- proj size = 2 × 64 × 1 × 1 = 128

**이번 C++ 기준 구현은 반드시 이 baseline 고정값으로 시작하는 것이 좋다.**
Generic하게 만들수록 SHA 검증 범위가 커지고, 문제 위치를 좁히기 어려워진다.

---

## 4. SHA 검증 규칙을 먼저 고정해야 한다

이번 단계에서 가장 중요한 건 **수식보다 먼저 “무엇을 SHA로 비교할지”를 고정하는 것**이다.

### 권장 SHA 대상
처음에는 아래 순서로 검증한다.

1. `band{i}_noisy_subbands`
2. `band{i}_fb_subbands`
3. `band{i}_sb_input`
4. `band{i}_packed_input`
5. 그 다음에야 `band{i}_df_coef`

즉, **최종 출력부터 바로 SHA를 맞추지 말고**, 먼저 **subband의 데이터 이동 경로**부터 SHA를 통과시켜야 한다.

### SHA 직전 serialization 규칙
Python과 C++ 모두 아래 규칙을 동일하게 써야 한다.

- dtype: `float32`
- byte order: little-endian
- memory order: C contiguous
- file format: raw binary (`.bin`)
- shape는 별도 `.json` 또는 `.txt`로 저장

### 권장 파일 예시
- `band0_noisy_subbands.bin`
- `band0_fb_subbands.bin`
- `band0_sb_input.bin`
- `band0_packed_input.bin`
- `band0_shape.json`

### 중요한 점
**SHA는 텍스트가 아니라 바이트에 대해 걸어야 한다.**
`print()` 결과나 CSV는 줄바꿈/반올림 때문에 SHA 비교에 부적합하다.

---

## 5. 왜 처음 SHA 타깃을 `_freq_unfold` / `sb_input`에 두는가

이건 현재 코드 구조 때문이다.

- `subband_model.py` 자체의 고유 기능은 `_freq_unfold()`와 band별 입력 조립이다.
- 실제 신경망 계산은 `SequenceModel`과 `GSUCell`에 더 많이 들어 있다.
- `GSUCell.forward()`는 `torch.sigmoid`, BN, step activation을 포함한다.

따라서 지금 바로 전체 `df_coef` SHA까지 한 번에 맞추려 하면,
문제가 생겼을 때 원인이

- `_freq_unfold` 인덱싱 문제인지
- `torch.cat` 차원 문제인지
- `rearrange` 축 순서 문제인지
- GSU 연산 문제인지
- BN 상태 문제인지

구분이 안 된다.

**그래서 이번 단계의 첫 SHA 목표는 `_freq_unfold`와 `sb_input`이다.**

---

## 6. C++ 변환 원칙

### 원칙 1. 먼저 `subband_model.py`의 데이터 경로만 C++로 옮긴다
이번 단계에서 우선 C++로 옮길 범위:

- `_freq_unfold()`
- `torch.cat([noisy_subbands, fb_subbands], dim=-2)`
- `SubBandSequenceModel.forward()`의 첫 번째 reshape
  - `(b, n, c, fs, t) -> (b*n, c*fs, t)`
- 마지막 output reshape 틀
  - 실제 수치 계산 전후의 축 순서 재배치 규칙

즉, **shape semantics**를 먼저 옮긴다.

### 원칙 2. C++ 첫 버전은 HLS-friendly C++로 쓴다
AMD Vitis HLS는 동적 메모리 제거와 고정된 자원 표현을 요구하고, 배열은 합성 가능 코드에서 크기가 고정되어 있어야 한다. 또 variable loop bounds는 latency 계산과 unroll/pipeline에 불리하다. 따라서 첫 C++ 버전부터 아래 규칙으로 쓰는 것이 좋다.

- `new`, `delete`, `malloc`, `free` 사용 금지
- `std::vector` 의존 최소화 또는 금지
- 배열 크기는 `constexpr` 또는 템플릿 상수로 고정
- loop upper bound는 고정 상수 사용
- band 수, hidden size, layer 수, subband 수를 baseline 값으로 고정

### 원칙 3. 첫 C++ 버전은 최적화하지 않는다
지금은

- array partition
- loop unroll
- pipeline pragma
- fixed-point

를 넣는 시점이 아니다.

먼저 **Python과 동일한 바이트 결과**를 얻는 것이 우선이다.

---

## 7. 권장 변환 순서

## Step 0. Python 기준 구현을 얼린다
먼저 Python reference를 고정한다.

- 모델은 `eval()` 상태로 사용
- 같은 checkpoint 사용
- 같은 입력 사용
- SHA 대상 intermediate를 저장

여기서 중요한 건 **BN이 켜져 있으므로 반드시 inference 상태를 고정하는 것**이다.
훈련 모드와 평가 모드를 섞으면 SHA 비교 자체가 의미가 없다.

### Python 쪽에서 먼저 저장할 것
최소한 아래는 저장해 둔다.

- 입력 `noisy_input`
- 입력 `fb_output`
- `band{i}_noisy_subbands`
- `band{i}_fb_subbands`
- `band{i}_sb_input`
- `band{i}_packed_input`

이 단계에서는 아직 `df_coef`까지 저장하지 않아도 된다.

---

## Step 1. `_freq_unfold()`를 C++로 그대로 옮긴다
이 단계는 **100% 데이터 이동 문제**다.

### Python 동작을 그대로 해석하면
`_freq_unfold()`는 band마다 아래를 수행한다.

1. 유효 구간 slice
2. 경계 band면 `reflect` pad
3. 주파수축에서 `ctr_freq` stride로 sliding block 생성
4. 결과를 `[B, num_subbands, C, sb_freq_size, T]`로 정렬

### C++에서 해야 할 일
`F.pad(..., mode="reflect")`와 `F.unfold()`를 직접 loop로 풀어 쓴다.

#### 권장 함수 분리
- `reflect_index()`
- `extract_valid_input_bandX()`
- `freq_unfold_bandX()`

처음부터 generic하게 만들지 말고,

- `freq_unfold_band0`
- `freq_unfold_band1`
- `freq_unfold_band2`

로 나누는 편이 SHA 검증에 유리하다.

### Step 1의 완료 기준
아래 SHA가 모두 Python과 동일하면 통과.

- `band0_noisy_subbands`
- `band1_noisy_subbands`
- `band2_noisy_subbands`
- `band0_fb_subbands`
- `band1_fb_subbands`
- `band2_fb_subbands`

---

## Step 2. `sb_input` 조립 경로를 C++로 옮긴다
현재 Python에서는

- `noisy_subbands`와 `fb_subbands`를 `dim=-2`에서 concat
- 결과 shape는 `[B, N, C, (ctr+2*nbr)+ctr, T]`

즉, 이 단계는 단순히 **subband 입력을 만드는 단계**다.

### C++에서 해야 할 일
- band별 `concat_freq_axis()` 구현
- 결과를 Python과 완전히 같은 메모리 순서로 배치

### Step 2의 완료 기준
아래 SHA가 Python과 동일하면 통과.

- `band0_sb_input`
- `band1_sb_input`
- `band2_sb_input`

---

## Step 3. `packed_input` reshape까지 맞춘다
`SubBandSequenceModel.forward()`는 sequence model에 넣기 전에

`(b, n, c, fs, t) -> (b*n, c*fs, t)`

로 reshape 한다.

현재 baseline에서는 `c=1`이므로 사실상

`(b, n, fs, t) -> (b*n, fs, t)`

로 보면 된다.

### C++에서 해야 할 일
- band별 pack 함수 작성
  - `pack_band0_input()`
  - `pack_band1_input()`
  - `pack_band2_input()`

### Step 3의 완료 기준
아래 SHA가 Python과 동일하면 통과.

- `band0_packed_input`
- `band1_packed_input`
- `band2_packed_input`

**여기까지 통과하면 `subband_model.py`의 “입력 조립 의미”는 거의 다 C++로 옮긴 것이다.**

---

## Step 4. 그 다음에야 GSN 계산 경로를 가져온다
이제부터가 실제 연산이다.

하지만 이번 단계에서도 **generic하게 구현하지 말고 baseline 경로만 옮긴다.**

### baseline 기준으로 제거 가능한 분기
- `sequence_model == "LSTM"` 경로 제거
- `use_pre_layer_norm_sb == false` 이므로 subband 쪽 LayerNorm 경로 제거
- `num_spks == 1` 고정

### 그래도 유지해야 하는 것
- `sb_num_layers = 2`
- `sb_hidden_size = 224`
- `bn = true`
- `shared_weights = true`

### GSUCell에서 그대로 가져와야 하는 핵심 수식
- `forgetgate = sigmoid(...)`
- `cellgate = ...`
- `cy = forgetgate * cx + (1 - forgetgate) * cellgate`
- BN 적용
- `hy = step(cy)`

현재 Python 구현에서 activation은 `Triangle.apply(cy)`이고, forward는 `input.ge(0.0).float()`이므로 **inference 관점에서는 hard step**이다. backward는 C++ inference 포트에서 필요 없다.

### 이 단계에서 주의할 점
이 단계부터는 **raw-float SHA가 어려워질 수 있다.**
이유는 Python reference가 `torch.sigmoid`와 PyTorch BN 구현을 사용하기 때문이다.

즉, `_freq_unfold`/`concat`/`reshape`처럼 단순한 데이터 이동과 달리,
GSN math path는 구현체 차이 때문에 작은 부동소수점 차이가 날 수 있다.

그래서 이 단계는 다음 순서가 좋다.

1. 먼저 intermediate numeric diff 확인 (`max_abs_err`, `mean_abs_err`)
2. 그 다음 SHA 대상을 늘림

만약 네 검증 harness가 **최종 `df_coef`도 raw SHA exact match**를 요구한다면,
그때는 **Python과 C++이 완전히 같은 수학 커널/rounding 경로를 쓰도록 추가 정리**가 필요하다.

---

## 8. C++ 파일 구조는 이렇게 시작하는 게 좋다

이번 단계에서는 파일을 많이 늘리지 말고, 아래 정도가 적당하다.

```text
subband_ref.hpp
subband_ref.cpp
subband_sha_dump.cpp   # 또는 테스트용 main
```

### `subband_ref.hpp`
- compile-time constants
- tensor buffer type alias
- band별 함수 선언

### `subband_ref.cpp`
- `reflect_index`
- `freq_unfold_band0/1/2`
- `concat_band0/1/2`
- `pack_band0/1/2`
- 이후 GSN math path 추가

### `subband_sha_dump.cpp`
- Python이 저장한 입력 `.bin` 로드
- C++ 함수 호출
- 결과 `.bin` 저장
- SHA는 외부 툴 또는 Python 스크립트로 계산

**중요:** SHA 계산 자체를 HLS 대상 코드 안에 넣을 필요는 없다.  
HLS 대상 코드는 `.bin`을 쓰기만 하고, SHA는 바깥 스크립트가 계산하는 편이 훨씬 단순하다.

---

## 9. 추천 검증 방식

### 방법 A. 가장 단순한 방식
1. Python이 reference `.bin` 생성
2. C++가 같은 단계 결과 `.bin` 생성
3. SHA-256을 Python 또는 shell에서 계산
4. 파일별 digest 비교

이 방식이 좋은 이유는,
**C++/HLS 코드 안에 해시 라이브러리 의존성을 넣지 않아도 되기 때문**이다.

### 추천 SHA 비교 순서
- `band0_noisy_subbands.bin`
- `band0_fb_subbands.bin`
- `band0_sb_input.bin`
- `band0_packed_input.bin`
- band1 동일
- band2 동일
- 마지막에만 `df_coef`

---

## 10. 지금 단계에서 절대 하지 말아야 할 것

### 10-1. 처음부터 `SubBandSequenceModel` 전체를 generic C++ 클래스로 만들기
아직 이르다.

지금은
- band 상수 고정
- FP32 고정
- inference-only 고정

이 맞다.

### 10-2. `ap_fixed`로 바로 바꾸기
SHA exact match가 목표인 첫 단계에서는 불리하다.
먼저 float 기준 구현을 맞춘 다음에 정수화로 넘어가야 한다.

### 10-3. HLS pragma부터 넣기
지금은 기능 검증 단계다.
성능 pragma는 출력 일치가 확인된 뒤가 맞다.

### 10-4. `_freq_unfold`를 generic helper 하나로 너무 일찍 합치기
band 0, 1, 2는 경계 조건과 shape가 다르다.
처음에는 분리해서 구현하는 편이 SHA 디버깅이 쉽다.

---

## 11. 이번 단계의 “완료” 기준

이번 문서 기준으로 완료는 아래다.

### 1차 완료
- C++로 `_freq_unfold` 구현 완료
- band 0/1/2의 `noisy_subbands`, `fb_subbands` SHA 일치

### 2차 완료
- C++로 `sb_input` 조립 및 `packed_input` 구현 완료
- band 0/1/2의 `sb_input`, `packed_input` SHA 일치

### 3차 완료
- baseline 고정 GSN forward 추가
- intermediate numeric diff 확인
- 필요 시 최종 `df_coef` SHA 또는 canonicalized hash 정의

즉, **이번 단계의 진짜 목표는 1차 완료 + 2차 완료**다.
그게 되면 subband 파일을 C++로 옮길 때 가장 위험한 부분인 **shape/packing semantics**가 먼저 안정된다.

---

## 12. 체크리스트

- [ ] baseline 값을 C++ compile-time constants로 옮겼다.
- [ ] Python reference intermediate dump 규칙을 고정했다.
- [ ] `_freq_unfold`를 band별 C++ 함수로 구현했다.
- [ ] `noisy_subbands` / `fb_subbands` SHA가 일치한다.
- [ ] `sb_input` 조립 SHA가 일치한다.
- [ ] `packed_input` SHA가 일치한다.
- [ ] 아직 `ap_fixed`, pragma, LUT 근사를 넣지 않았다.
- [ ] 그 다음 단계로만 GSN math path를 올릴 준비가 됐다.

---

## 참고 소스

### 저장소 코드
- Repo root: https://github.com/pjh8047pjh-hue/Spiking_FullSubnet_essential
- `subband_model.py`: https://github.com/pjh8047pjh-hue/Spiking_FullSubnet_essential/blob/main/audiozen/models/spiking_fullsubnet/subband_model.py
- `sequence_model.py`: https://github.com/pjh8047pjh-hue/Spiking_FullSubnet_essential/blob/main/audiozen/models/spiking_fullsubnet/sequence_model.py
- `efficient_spiking_neuron.py`: https://github.com/pjh8047pjh-hue/Spiking_FullSubnet_essential/blob/main/audiozen/models/spiking_fullsubnet/efficient_spiking_neuron.py
- `baseline_m.toml`: https://github.com/pjh8047pjh-hue/Spiking_FullSubnet_essential/blob/main/recipes/intel_ndns/spiking_fullsubnet/baseline_m.toml

### 공식 문서
- AMD Vitis HLS UG1399 — Dynamic Memory Usage: https://docs.amd.com/r/en-US/ug1399-vitis-hls/Dynamic-Memory-Usage
- AMD Vitis HLS UG1399 — Working with Variable Loop Bounds: https://docs.amd.com/r/en-US/ug1399-vitis-hls/Working-with-Variable-Loop-Bounds
- AMD Vitis HLS UG1399 — Arrays on the Interface: https://docs.amd.com/r/en-US/ug1399-vitis-hls/Arrays-on-the-Interface
- PyTorch `BatchNorm1d`: https://docs.pytorch.org/docs/stable/generated/torch.nn.BatchNorm1d.html
- Python `hashlib`: https://docs.python.org/3/library/hashlib.html
