# Q6.10 Fixed-Point 양자화 기반 CPU 추론 최적화 계획

## 1. 현재 상황 분석 및 가설 검증

### 현재 구조
```
[학습] Q6.10 데이터로 학습된 커스텀 모델
  ↓
[Python 추론] PyTorch float32/float16 — 기존 방식 (느림)
[C++ 추론]   현재 Python보다 낮은 성능 — 현재 상태
```

### 제기된 가설
> "Q6.10으로 학습된 모델을 Python 추론에서도 Q6.10 fixed-point 연산으로 바꾸면,  
>  float 연산 대비 코드가 가벼워져서 CPU 추론 속도가 빨라질 것이다."

---

## 2. 가설 타당성 검증

### ✅ 타당한 부분

| 근거 | 설명 |
|------|------|
| 메모리 대역폭 절감 | float32(4B) → Q6.10(2B, int16 패킹) 시 모델 크기 ~50% 감소 → 캐시 효율 향상 |
| 정수 연산 속도 | CPU의 정수 ALU는 FPU보다 처리량이 높고, SIMD(AVX2) 활용에 유리 |
| 학습-추론 일관성 | Q6.10으로 학습했으므로 추론 시 동일 수치 표현 사용 → 정밀도 손실 없음 |
| PyTorch 오버헤드 제거 | float 텐서 관리·자동미분 그래프 오버헤드 제거 가능 |

### ⚠️ 주의할 부분

| 위험 요소 | 설명 |
|-----------|------|
| PyTorch 미지원 | PyTorch는 Q6.10 fixed-point 네이티브 연산을 지원하지 않음 → 직접 구현 필요 |
| 누적 오차 | 16비트 fixed-point 덧셈 누적 시 int32 중간값 처리 필요 (overflow 방지) |
| 활성화 함수 | ReLU는 trivial하나, Sigmoid/Tanh/Softmax는 fixed-point 근사 구현 필요 |
| C++ 성능이 낮은 이유 | C++ 구현 자체의 버그·비최적화가 원인일 수 있음 → 별도 프로파일링 필요 |

### 💡 핵심 판단
가설은 **원칙적으로 타당**하다. 단, PyTorch에서 Q6.10을 그대로 쓰는 것은 불가능하므로  
**"Python에서 Q6.10 추론"이 아닌 "C++ Q6.10 추론 엔진 최적화"가 실질적인 목표**가 된다.

---

## 3. 왜 현재 C++ 모델이 Python보다 느린가? — 가능한 원인

```
1. SIMD 미활용        → AVX2/SSE4 벡터화 없이 스칼라 루프 사용
2. 메모리 레이아웃     → 행렬이 캐시 비친화적 순서로 배열됨
3. fixed-point 오버플로우 → int32 누적 미처리로 결과 오류 → 정확도 보정에 오버헤드
4. Python 바인딩 비용  → pybind11/ctypes 호출 오버헤드
5. 병렬화 부재         → OpenMP 미사용
```

---

## 4. 최적화 로드맵

### Phase 0 — 현재 상태 벤치마크 (1~2일)

목적: 병목 지점을 수치로 확인하기 위한 기준점 확보

```bash
# Python 추론 프로파일링
python -m cProfile -o profile.out inference.py
python -c "import pstats; p=pstats.Stats('profile.out'); p.sort_stats('cumtime'); p.print_stats(20)"

# C++ 추론 타이밍 (레이어별 분리)
# 각 레이어 입출력 시점에 std::chrono 삽입
```

측정 지표:
- 전체 추론 시간 (ms)
- 레이어별 소요 시간 비율
- 메모리 사용량 (peak)
- cache miss rate (`perf stat -e cache-misses ./inference`)

---

### Phase 1 — Python 추론 Q6.10 변환 (3~5일)

PyTorch에서 Q6.10 시뮬레이션 레이어 구현

```python
# Q6.10 Fixed-point 표현: int16, 스케일 = 2^10 = 1024
Q6_10_SCALE = 1024  # 2^10

def to_q6_10(x: torch.Tensor) -> torch.Tensor:
    """float → Q6.10 (int16 범위: -32768 ~ 32767 → 실수범위 -32~31.999)"""
    return torch.clamp(torch.round(x * Q6_10_SCALE), -32768, 32767).to(torch.int16)

def from_q6_10(x: torch.Tensor) -> torch.Tensor:
    """Q6.10 → float"""
    return x.to(torch.float32) / Q6_10_SCALE

class Q6_10Linear(nn.Module):
    """Q6.10 fixed-point Linear 레이어"""
    def __init__(self, weight_q: torch.Tensor, bias_q: torch.Tensor = None):
        super().__init__()
        # 가중치를 int16로 저장
        self.weight = nn.Parameter(weight_q, requires_grad=False)
        self.bias = nn.Parameter(bias_q, requires_grad=False) if bias_q is not None else None

    def forward(self, x_q: torch.Tensor) -> torch.Tensor:
        # int16 → int32로 업캐스트 후 행렬곱 (overflow 방지)
        x_int32 = x_q.to(torch.int32)
        w_int32 = self.weight.to(torch.int32)
        
        # 행렬곱: 스케일이 2^20 (10+10) → 다시 2^10으로 내림
        out = torch.matmul(x_int32, w_int32.T) >> 10  # 오른쪽 시프트로 재정규화
        
        if self.bias is not None:
            out = out + self.bias.to(torch.int32)
        
        return out.to(torch.int16)

def quantize_model(model: nn.Module) -> nn.Module:
    """기존 float 모델의 Linear 레이어를 Q6.10으로 변환"""
    for name, module in model.named_children():
        if isinstance(module, nn.Linear):
            w_q = to_q6_10(module.weight.data)
            b_q = to_q6_10(module.bias.data) if module.bias is not None else None
            setattr(model, name, Q6_10Linear(w_q, b_q))
        else:
            quantize_model(module)  # 재귀
    return model
```

예상 효과:
- 모델 메모리: ~50% 감소 (float32 → int16)
- 추론 속도: 10~30% 향상 (캐시 효율, 단순 연산)

---

### Phase 2 — C++ 추론 엔진 최적화 (5~10일)

#### 2-1. SIMD 벡터화 적용

```cpp
#include <immintrin.h>  // AVX2

// Q6.10 내적: int16 벡터 × int16 벡터 → int32 누적
int32_t dot_q6_10_avx2(const int16_t* a, const int16_t* b, int n) {
    __m256i acc = _mm256_setzero_si256();
    int i = 0;
    for (; i <= n - 16; i += 16) {
        __m256i va = _mm256_loadu_si256((__m256i*)(a + i));
        __m256i vb = _mm256_loadu_si256((__m256i*)(b + i));
        // int16 × int16 → int32 누적 (madd 명령어 활용)
        acc = _mm256_add_epi32(acc, _mm256_madd_epi16(va, vb));
    }
    // 수평 합산
    __m128i lo = _mm256_extracti128_si256(acc, 0);
    __m128i hi = _mm256_extracti128_si256(acc, 1);
    __m128i sum = _mm_add_epi32(lo, hi);
    sum = _mm_hadd_epi32(sum, sum);
    sum = _mm_hadd_epi32(sum, sum);
    int32_t result = _mm_extract_epi32(sum, 0);
    // 나머지 처리
    for (; i < n; i++) result += (int32_t)a[i] * b[i];
    return result >> 10;  // Q6.10 재정규화
}
```

#### 2-2. 메모리 레이아웃 최적화

```cpp
// 가중치 행렬을 캐시 친화적으로 전치 저장
// 추론 시 행 방향 접근으로 캐시 히트율 향상
void prepack_weights(int16_t* packed, const int16_t* w, int rows, int cols) {
    // 16개 열씩 블록 패킹 (AVX2 레지스터 너비)
    for (int r = 0; r < rows; r++)
        for (int c = 0; c < cols; c++)
            packed[c * rows + r] = w[r * cols + c];
}
```

#### 2-3. OpenMP 병렬화

```cpp
#include <omp.h>

void matmul_q6_10_parallel(
    const int16_t* A, const int16_t* B_packed,
    int16_t* C, int M, int K, int N)
{
    #pragma omp parallel for schedule(dynamic, 4)
    for (int i = 0; i < M; i++) {
        for (int j = 0; j < N; j++) {
            C[i * N + j] = (int16_t)dot_q6_10_avx2(
                A + i * K, B_packed + j * K, K);
        }
    }
}
```

---

### Phase 3 — Python → C++ 바인딩 최적화 (2~3일)

```python
import ctypes
import numpy as np

lib = ctypes.CDLL("./inference_q6_10.so")
lib.infer.argtypes = [
    ctypes.POINTER(ctypes.c_int16),  # input
    ctypes.POINTER(ctypes.c_int16),  # output
    ctypes.c_int,                    # input_len
]
lib.infer.restype = None

def infer_fast(input_array: np.ndarray) -> np.ndarray:
    assert input_array.dtype == np.int16
    output = np.zeros(OUTPUT_SIZE, dtype=np.int16)
    lib.infer(
        input_array.ctypes.data_as(ctypes.POINTER(ctypes.c_int16)),
        output.ctypes.data_as(ctypes.POINTER(ctypes.c_int16)),
        len(input_array)
    )
    return output
```

또는 **pybind11** 사용 시 zero-copy 버퍼 전달로 오버헤드 최소화.

---

## 5. 예상 성능 향상 추정

| 단계 | 방법 | 예상 속도 향상 |
|------|------|---------------|
| Phase 1 | Python float → Q6.10 시뮬레이션 | 1.1x ~ 1.3x |
| Phase 2-1 | C++ SIMD (AVX2) 적용 | 4x ~ 8x (이론) |
| Phase 2-2 | 메모리 레이아웃 최적화 | +20~40% 추가 |
| Phase 2-3 | OpenMP 병렬화 (4코어 기준) | +2x ~ 3x 추가 |
| Phase 3 | 바인딩 오버헤드 제거 | +5~15% 추가 |
| **목표** | **최종 C++ Q6.10 엔진** | **Python float 대비 5x~15x** |

> ⚠️ 실제 수치는 모델 크기, 배치 사이즈, CPU 아키텍처에 따라 다름

---

## 6. 검증 체크리스트

```
[ ] Phase 0: Python float 추론 기준 latency 측정 완료
[ ] Phase 0: C++ 추론 레이어별 병목 구간 식별
[ ] Phase 1: Q6.10 Python 추론 결과가 float 추론과 오차 허용 범위 내 일치 확인
[ ] Phase 1: 정확도 회귀 테스트 통과 (정확도 하락 < 0.5%)
[ ] Phase 2: SIMD 구현 후 단위 테스트 (수치 정확성)
[ ] Phase 2: AVX2 지원 CPU 여부 확인 (cpuid)
[ ] Phase 2: OpenMP 스레드 수 튜닝
[ ] Phase 3: 바인딩 레이어 입출력 타입 일치 확인
[ ] 최종: A/B 비교 벤치마크 (Python float vs C++ Q6.10)
```

---

## 7. 주요 리스크 및 대응

| 리스크 | 대응 방안 |
|--------|-----------|
| Q6.10 정밀도 부족으로 정확도 하락 | 누적 연산에 int32 사용, 중간 재정규화 전략 |
| AVX2 미지원 환경 | SSE4.2 fallback 구현 준비 |
| C++ 구현 버그 (현재 낮은 성능 원인) | Phase 0에서 먼저 원인 규명 후 수정 |
| 활성화 함수 fixed-point 근사 오차 | LUT(lookup table) 방식으로 정밀도 보장 |

---

## 8. 권장 진행 순서 요약

```
Phase 0 (벤치마크) → Phase 2 C++ 최적화 (병목 직접 해결)
                   → Phase 1 Python Q6.10 (비교 기준)
                   → Phase 3 바인딩 (최종 통합)
```

> C++ 성능이 Python보다 낮다는 것은 구현 버그나 최적화 누락이 원인일 가능성이 높으므로,  
> Python을 건드리기 전에 **C++ 엔진 병목을 먼저 프로파일링**하는 것이 효율적입니다.