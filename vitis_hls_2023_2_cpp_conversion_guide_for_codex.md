# AMD Vitis HLS 2023.2용 C/C++ → HLS 변환 가이드 (Codex 지시용)

> 문서 목적: AMD **UG1399 Vitis HLS User Guide 2023.2**의 공식 제약과 권장 패턴을 바탕으로, 기존 C/C++ 코드를 **Vitis HLS가 합성 가능한 C++**로 바꿀 때 필요한 핵심 규칙을 **Codex가 바로 적용할 수 있는 형태**로 재정리한 문서다.  
> 이 문서는 **1회 통과를 보장하지 않는다**. 실제 통과 여부는 코드 구조, 타깃 디바이스, 클럭 제약, 인터페이스 선택, 테스트벤치 품질에 따라 달라진다. 다만 **C simulation → C synthesis → C/RTL co-simulation**까지 한 번에 통과할 확률을 높이는 방향으로 구성했다.  
> 본문에서 **[DOC]** 는 AMD 공식 문서에 직접 근거한 규칙, **[INF]** 는 공식 문서의 제약/예제를 바탕으로 도출한 실전 변환 규칙이다.

---

## 0. 사용 방법

1. 이 문서를 Codex에게 함께 준다.
2. 원본 코드를 변환할 때 **Hard constraints**를 절대 위반하지 않도록 지시한다.
3. Codex 출력은 반드시 다음을 포함하게 한다.
   - 변환 요약
   - 추가한 상수/경계/`assert`
   - 바꾼 자료형(`ap_int`, `ap_fixed` 등)
   - 추가한 pragma와 이유
   - 남아 있는 수동 검토 항목
4. 변환 후에는 순서대로 검증한다.
   - C simulation
   - C synthesis
   - C/RTL co-simulation

---

## 1. Codex용 요약 규칙 (machine-readable)

```yaml
target_tool: AMD Vitis HLS 2023.2
primary_goal:
  - preserve functional behavior
  - eliminate non-synthesizable constructs
  - maximize first-pass success in C sim / C synth / C-RTL cosim
hard_forbidden:
  - malloc
  - free
  - new
  - delete
  - recursion
  - virtual functions
  - STL containers or STL algorithms that require dynamic behavior in the synth region
  - OS/system calls in the synth region
  - undefined behavior
  - relying on debug I/O for functionality
hard_required:
  - top-level synthesis target must be a function
  - every runtime size must have a compile-time maximum
  - every variable-bound loop must be bounded or documented
  - multi-access external pointers must be rewritten carefully; use volatile only when repeated external accesses are intentional
  - internal task-to-task channels should use hls::stream
preferred_patterns:
  - fixed-size local arrays
  - constexpr maxima + assert(runtime_value <= MAX)
  - explicit ap_int/ap_uint widths
  - ap_fixed/ap_ufixed when range/error budget is known
  - load/compute/store decomposition
  - #pragma HLS dataflow between stages
  - #pragma HLS pipeline on throughput-critical loops
  - #pragma HLS array_partition when parallel array access is required
  - explicit sequential loops for m_axi bursting
output_must_include:
  - transformed code
  - assumptions_and_bounds
  - type_changes
  - pragma_list_with_rationale
  - testbench_changes
  - remaining_risks
```

---

## 2. 절대 규칙 (이걸 어기면 HLS 실패 가능성이 높음)

### 2.1 합성 대상은 **top-level function** 이어야 한다
- **[DOC]** Vitis HLS의 합성 대상은 함수다. 클래스/객체는 내부에서 사용할 수 있지만, **최상위 엔트리는 함수**로 잡는 것이 기본이다. `[S22]`
- **실전 규칙 [INF]**: 원본이 클래스 중심 구조라면, **public method를 호출하는 얇은 wrapper 함수**를 만든 뒤 그 wrapper를 top으로 지정하라.

```cpp
class Kernel {
public:
  void run(const int in[256], int out[256]);
};

void top(const int in[256], int out[256]) {
  Kernel k;
  k.run(in, out);
}
```

### 2.2 합성 구역에서 **시스템 호출/OS 의존 코드**를 제거하라
- **[DOC]** 하드웨어에는 운영체제가 없으므로, 시스템 호출은 합성되지 않는다. 디스플레이용 `printf`/`fprintf(stdout, ...)` 는 합성 시 무시될 수 있지만, **기능에 영향을 주는 시스템 호출은 재작성**해야 한다. `[S4]`
- **[DOC]** `__SYNTHESIS__` 매크로로 조건부 컴파일이 가능하지만, C simulation과 RTL 동작이 달라지지 않게 주의해야 한다. `[S4]`
- **실전 규칙 [INF]**: 디버그 출력은 가능하면 **테스트벤치로 이동**하고, 남겨야 한다면 아래처럼 감싸라.

```cpp
#ifndef __SYNTHESIS__
  printf("debug: x=%d\n", x);
#endif
```

### 2.3 **동적 메모리**를 없애라
- **[DOC]** `malloc`, `free`, `new`, `delete` 같은 동적 메모리 할당은 합성되지 않는다. `[S5]`
- **실전 규칙 [INF]**: 모든 동적 크기는 **컴파일 시 최대 크기**를 둔 정적/지역 배열로 바꾸고, 런타임 값은 `assert` 로 제한하라.

```cpp
constexpr int N_MAX = 1024;

void top(const float *in, float *out, int n) {
  assert(n >= 0 && n <= N_MAX);
  float buf[N_MAX];
  // ...
}
```

### 2.4 **재귀**를 제거하라
- **[DOC]** 재귀 함수는 지원되지 않는다. 꼬리 재귀도 포함해서 반복문 또는 정적 전개 형태로 바꿔야 한다. `[S6]`
- **실전 규칙 [INF]**:
  - 일반 재귀 → 반복문/명시적 상태기계
  - 작고 정적인 재귀 → 템플릿 기반 정적 전개 검토

### 2.5 **가상 함수(virtual)** 를 제거하라
- **[DOC]** 가상 함수는 지원되지 않는다. `[S3]`
- **실전 규칙 [INF]**:
  - 런타임 다형성 → `enum + switch` 의 정적 분기
  - 필요한 구현 개수가 작으면 템플릿 파라미터로 분리

### 2.6 **STL 의존 코드**를 합성 구역에서 제거하라
- **[DOC]** AMD 문서는 STL에 대해 제한적 지원을 설명하며, 예로 `std::complex` 는 지원하지만 `std::complex<long double>` 는 지원하지 않는다고 명시한다. `[S7]`
- **실전 규칙 [INF]**:
  - 따라서 동적 메모리나 복잡한 런타임 동작에 기대는 STL 컨테이너/알고리즘은 합성 구역에서 제거하는 것이 안전하다.
  - `std::vector`, `std::string`, `std::map`, `std::unordered_map`, `std::function` 등은 합성 구역에서 제거
  - 고정 길이 버퍼, 고정 길이 링버퍼, 정적 배열, 단순 구조체로 치환
  - 필요 시 테스트벤치에서만 STL 사용

### 2.7 **정의되지 않은 동작(UB)** 을 제거하라
- **[DOC]** 정의되지 않은 동작은 합성/시뮬레이션/RTL 결과 불일치를 유발할 수 있다. AMD 문서는 **초기화되지 않은 변수 사용**을 대표적 위험으로 지적한다. `[S8]`
- **실전 규칙 [INF]**:
  - 모든 지역 변수와 누산기는 명시적으로 초기화
  - AP 타입 배열도 자동 초기화를 기대하지 말 것
  - 경계 밖 접근, 음수 길이, 쓰레기 값 비교를 없앨 것

---

## 3. 자료형 변환 규칙

### 3.1 정수형은 가능한 한 **정확한 비트 폭**으로 바꿔라
- **[DOC]** `ap_int<W>`, `ap_uint<W>` 는 필요한 비트 수를 정확히 지정할 수 있다. 기본 지원 폭은 1~1024비트이며, 더 넓은 폭은 설정으로 확장 가능하다. `[S9]`
- **실전 규칙 [INF]**:
  - 인터페이스/버퍼/카운터/누산기 폭을 문서화하라.
  - `int` 를 무심코 유지하지 말고, **정확한 범위를 계산해 폭을 줄이는 것**이 좋다.
  - 단, 범위를 확신할 수 없으면 성급히 폭을 줄이지 말고 **보수적으로 넓게** 잡아라.

```cpp
#include "ap_int.h"

using u8_t   = ap_uint<8>;
using u16_t  = ap_uint<16>;
using acc_t  = ap_int<24>;
```

### 3.2 부동소수점이 꼭 필요 없으면 **고정소수점**을 검토하라
- **[DOC]** `ap_fixed<W,I>` / `ap_ufixed<W,I>` 는 총 비트수와 정수부 비트수를 지정하는 고정소수점 타입이다. `I` 는 signed 타입에서 sign bit를 포함한다. `[S10]`
- **[DOC]** 기존 C++ 코드가 부동소수점이나 임의 비트폭 정수를 사용한다면, Vitis HLS가 제공하는 고정소수점/정수 타입으로 리팩터링하는 것이 HLS 친화적이다. `[S2][S10]`
- **실전 규칙 [INF]**:
  - `float`/`double` 을 그대로 합성할 수는 있지만, 리소스/지연/스케줄 측면에서 불리할 수 있다.
  - 수치 오차 예산을 알고 있다면 `ap_fixed` 로 바꾸고, **폭/정수부/overflow/quantization 가정**을 출력에 명시하게 하라.
  - 변환 전후의 오차 허용 범위를 테스트벤치에 넣어라.

```cpp
#include "ap_fixed.h"

using coef_t = ap_fixed<16, 4>;
using data_t = ap_fixed<16, 6>;
using acc_t  = ap_fixed<32, 12>;
```

### 3.3 AP 타입 배열은 **자동 0 초기화**를 기대하지 말라
- **[DOC]** AMD 문서는 AP 타입 배열이 선언만으로 0 초기화되지 않는 예를 보여준다. `[S9]`
- **실전 규칙 [INF]**:
  - 누산/버퍼/상태 배열은 반드시 직접 초기화하라.
  - 테스트벤치와 합성 결과가 초기값에 의존하지 않게 하라.

```cpp
ap_int<10> regfile[10];
for (int i = 0; i < 10; ++i) regfile[i] = 0;
```

### 3.4 자료형 정의는 **한 곳에 모아라**
- **실전 규칙 [INF]**: `hls_types.h` 같은 전용 헤더에 타입 alias를 모아두면 Codex가 폭 변경을 일관되게 적용하기 쉽다.

```cpp
// hls_types.h
#pragma once
#include "ap_int.h"
#include "ap_fixed.h"

using sample_t = ap_int<12>;
using coef_t   = ap_fixed<18, 3>;
using acc_t    = ap_fixed<32, 10>;
```

---

## 4. 인터페이스/포인터/스트림 규칙

### 4.1 인터페이스는 **데이터 이동 패턴** 기준으로 선택하라
- **[DOC]** top-level 함수의 인자/반환값은 하드웨어 인터페이스로 합성된다. `[S23]`
- **실전 규칙 [INF]**:
  - scalar 제어값 → 보통 `s_axilite`
  - 대용량 메모리 버퍼 → 보통 `m_axi`
  - 순차 스트리밍 입출력 → AXI4-Stream 또는 `hls::stream` 기반 top-level 스트림 인터페이스
  - 내부 단계 간 채널 → `hls::stream`

### 4.2 내부 채널은 `hls::stream` 을 우선하라
- **[DOC]** `hls::stream` 은 내부에서 FIFO 채널 모델링에 적합하고, 내부 변수로 쓰면 `ap_fifo` 로 합성된다. `[S12][S16]`
- **[DOC]** `hls::axis`, `ap_axis`, `ap_axiu` 같은 AXI4-Stream 인터페이스 타입은 **internal variables/function arguments** 로는 지원되지 않으며, top-level 인터페이스에만 사용해야 한다. `[S16]`
- **실전 규칙 [INF]**:
  - **내부 함수 인자/로컬 채널은 `hls::stream<T>`**
  - **top-level 포트에만 AXI4-Stream 패키징 타입 사용**

```cpp
#include "hls_stream.h"

static void compute(hls::stream<int> &in_s, hls::stream<int> &out_s, int n) {
  for (int i = 0; i < n; ++i) {
    #pragma HLS pipeline II=1
    int x = in_s.read();
    out_s.write(x + 1);
  }
}
```

### 4.3 외부 포인터를 여러 번 읽거나 쓰는 코드는 조심하라
- **[DOC]** 같은 포인터를 여러 번 액세스하는 인터페이스 코드는 합성 시 액세스가 병합/삭제될 수 있으므로, 그런 동작이 의도라면 `volatile` 이 필요할 수 있다. `[S17]`
- **실전 규칙 [INF]**:
  - 외부 포인터를 한 싸이클에 여러 번 읽는 의미가 필요하면 `volatile` 검토
  - 하지만 **첫 번째 선택은 `volatile` 남발이 아니라 구조 재작성**이다.
  - 다중 액세스 포인터는 가능하면:
    1. 한 번 읽어 로컬 변수에 저장하거나
    2. 로컬 배열에 preload 하거나
    3. 스트림으로 모델링하라

```cpp
void top(volatile int *status_reg, int *out) {
  int a = *status_reg;
  int b = *status_reg;  // 실제로 두 번 읽어야 하는 의미라면 volatile이 필요할 수 있음
  *out = a + b;
}
```

### 4.4 포인터로 스트림/FIFO 를 모델링하려면 **읽기 전용 또는 쓰기 전용** 이어야 한다
- **[DOC]** 포인터를 FIFO처럼 합성하려면 그 포인터는 읽기 전용이거나 쓰기 전용이어야 한다. `[S17]`
- **실전 규칙 [INF]**: 읽기/쓰기를 모두 수행하는 포인터를 스트림처럼 쓰지 말고, **입력 포트와 출력 포트를 분리**하라.

---

## 5. 변환 구조: load / compute / store 로 쪼개라

- **[DOC]** AMD 문서는 메모리 기반 커널을 리팩터링할 때 **읽기(load), 계산(compute), 쓰기(store)** 로 태스크를 나누고, 필요하면 병렬화/벡터화하는 방향을 권장한다. `[S2][S11]`
- **실전 규칙 [INF]**:
  - 메모리 버퍼 기반 커널은 가장 먼저 아래 구조로 바꿔라.
  - 이 구조는 이후 `DATAFLOW`, `PIPELINE`, `m_axi burst` 최적화와 궁합이 좋다.

```cpp
#include "hls_stream.h"
#include <assert.h>

using in_t  = ap_uint<16>;
using out_t = ap_uint<16>;
constexpr int N_MAX = 1024;

static void load_input(const in_t *in, hls::stream<in_t> &s, int n) {
  for (int i = 0; i < n; ++i) {
    #pragma HLS pipeline II=1
    s.write(in[i]);
  }
}

static void compute_core(hls::stream<in_t> &in_s, hls::stream<out_t> &out_s, int n) {
  for (int i = 0; i < n; ++i) {
    #pragma HLS pipeline II=1
    in_t x = in_s.read();
    out_s.write((out_t)(x + 1));
  }
}

static void store_output(hls::stream<out_t> &s, out_t *out, int n) {
  for (int i = 0; i < n; ++i) {
    #pragma HLS pipeline II=1
    out[i] = s.read();
  }
}

void top(const in_t *in, out_t *out, int n) {
  assert(n >= 0 && n <= N_MAX);

  #pragma HLS dataflow
  hls::stream<in_t>  s_in;
  hls::stream<out_t> s_out;

  load_input(in, s_in, n);
  compute_core(s_in, s_out, n);
  store_output(s_out, out, n);
}
```

---

## 6. 루프 변환 규칙

### 6.1 처리율이 중요한 루프는 `PIPELINE` 을 기본 검토하라
- **[DOC]** Vitis HLS는 루프/함수의 pipeline을 지원하며, 목표 II(initiaton interval)를 줄이려 한다. `[S13]`
- **[DOC]** 중첩 루프에서 바깥 루프를 pipeline하면 내부 루프가 자동으로 unroll될 수 있다. `[S13]`
- **실전 규칙 [INF]**:
  - 메모리 읽기/쓰기/스트림 read-write가 1개씩인 단순 루프는 먼저 `II=1` 을 시도
  - 실패 시 원인을 두 부류로 나눠 본다.
    1. **메모리 포트 부족**
    2. **데이터 의존성**

```cpp
for (int i = 0; i < n; ++i) {
  #pragma HLS pipeline II=1
  out[i] = in[i] + bias;
}
```

### 6.2 병렬 읽기/쓰기가 필요하면 `ARRAY_PARTITION` 을 검토하라
- **[DOC]** 배열 partition은 배열을 여러 개의 더 작은 메모리/레지스터로 쪼개 병렬 접근성을 높인다. `complete`, `block`, `cyclic` 방식이 있다. `[S15]`
- **[DOC]** 스케줄이 메모리 포트 부족으로 느슨해지는 경우가 있으며, AMD 문서는 이런 경우 partition/재구성을 검토하라고 안내한다. `[S13][S15]`
- **실전 규칙 [INF]**:
  - 같은 루프 iteration에서 같은 배열에 여러 원소를 병렬 접근하면 partition 없이는 II가 막히기 쉽다.
  - 작은 상수 계수/커널 윈도우는 `complete partition` 이 자주 먹힌다.
  - interleaving access 패턴이면 `cyclic`, 구간 분할이면 `block` 을 우선 검토하라.

```cpp
int coeff[8];
#pragma HLS array_partition variable=coeff complete dim=1
```

### 6.3 가변 루프 bound는 **반드시 문서화/제한**하라
- **[DOC]** 루프 반복 횟수가 런타임 값에 의존하면 보고서에 latency가 `?` 로 보일 수 있다. `LOOP_TRIPCOUNT` 는 **주로 리포트 품질**을 위한 것이고, 실제 합성 제약을 위해서는 `assert` 등으로 상한을 주는 방법이 소개된다. `[S14]`
- **실전 규칙 [INF]**:
  - `for (i = 0; i < n; ++i)` 가 있으면 항상:
    1. `assert(n <= N_MAX)` 추가
    2. 필요한 경우 `LOOP_TRIPCOUNT` 추가
  - `LOOP_TRIPCOUNT` 만 넣고 상한 검증을 안 하면 실제 구조는 여전히 불분명할 수 있다.

```cpp
assert(n >= 0 && n <= N_MAX);

LOOP_I:
for (int i = 0; i < n; ++i) {
  #pragma HLS loop_tripcount min=1 max=N_MAX
  #pragma HLS pipeline II=1
  // ...
}
```

### 6.4 unroll은 **정적 반복 수**에 먼저 써라
- **[DOC]** unroll은 루프 바디를 복제하여 병렬화를 만든다. `[S13]`
- **실전 규칙 [INF]**:
  - 반복 수가 작고 고정된 내부 루프에 먼저 적용
  - 메모리 병목이 해결되지 않은 상태에서 unroll만 늘리면 실패하거나 리소스만 커질 수 있다

```cpp
for (int k = 0; k < 8; ++k) {
  #pragma HLS unroll
  sum += a[k] * b[k];
}
```

---

## 7. `DATAFLOW` 를 쓸 때의 구조 규칙

- **[DOC]** AMD 문서는 `DATAFLOW` 가 잘 작동하는 **canonical form** 을 제시한다. 함수 수준에서는 채널 선언과 **non-inlined function call** 위주로, 루프 수준에서는 선언과 단일 loop/function-call 중심으로 단순한 형태가 유리하다. `[S19]`
- **[DOC]** 태스크 간 통신에는 `hls::stream` 같은 FIFO 채널을 사용한다. `[S11][S12]`
- **실전 규칙 [INF]**:
  - `DATAFLOW` 영역 안에는 가급적 다음만 둬라.
    - 스트림 선언
    - stage 함수 호출
    - 필요한 최소한의 지역 변수 선언
  - `DATAFLOW` 영역 안에서 복잡한 분기, 임시 계산, side-effect 코드를 섞지 말라.
  - top에서 `load / compute / store` 로 쪼개는 것이 가장 안전한 시작점이다.

```cpp
void top(...) {
  #pragma HLS dataflow
  hls::stream<int> s1;
  hls::stream<int> s2;
  load(..., s1);
  compute(..., s1, s2);
  store(..., s2);
}
```

---

## 8. `m_axi` 버스트가 나오게 쓰는 법

- **[DOC]** AMD 문서는 `m_axi` burst 성능을 위해 다음을 강조한다. `[S18]`
  - `memcpy` 는 inline/pipeline이 어렵고, 때로는 인자 타입이 `char *` 로 바뀌어 partition/reshape/disaggregate와 궁합이 나쁘다.
  - 버스트 추론에는 **명시적 루프**가 더 유리하다.
  - 주소는 연속 증가 패턴이 좋다.
  - 버스트 read/write 루프 안의 추가 분기는 피하는 것이 좋다.
  - burst 최적화 목적이라면 nested loop를 수동으로 flatten하지 말라고 권장한다.
- **실전 규칙 [INF]**:
  - 외부 메모리 ↔ 로컬 버퍼 복사는 `memcpy` 대신 **명시적 for-loop + pipeline**
  - 버스트용 루프는 **순차 주소, 조건문 최소화, 단순한 바디** 유지
  - compute와 memory access를 섞지 말고 분리

```cpp
// 권장: 명시적 버스트 친화 루프
for (int i = 0; i < n; ++i) {
  #pragma HLS pipeline II=1
  local[i] = in[offset + i];
}
```

```cpp
// 비권장: 버스트 추론/최적화 관점에서 불리할 수 있음
memcpy(local, in + offset, n * sizeof(int));
```

### 8.1 메모리 액세스와 계산을 섞지 말라
- **실전 규칙 [INF]**: `m_axi` 입력을 읽는 루프와 연산 루프, 출력 저장 루프를 섞으면 burst 추론과 스케줄링이 복잡해진다. 가능하면 분리하라.

---

## 9. 클래스/템플릿을 안전하게 쓰는 법

- **[DOC]** AMD 문서는 클래스와 템플릿 사용을 지원한다. 클래스의 멤버 함수, 연산자 오버로드, 템플릿 인스턴스화가 합성 가능하다. 다만 virtual은 제외다. `[S22][S3]`
- **실전 규칙 [INF]**:
  - 템플릿은 **컴파일타임 크기/상수 파라미터**에 사용하라.
  - 클래스는 **상태/행동 캡슐화**에 쓸 수 있지만, 최상위는 wrapper function으로 빼라.
  - Codex가 필요 이상으로 템플릿 메타프로그래밍을 만들지 못하게 하라. HLS 코드는 **명시적이고 단순한 구조**가 유리하다.

```cpp
template<int N>
static void mac(const int a[N], const int b[N], int &sum) {
  sum = 0;
  for (int i = 0; i < N; ++i) {
    #pragma HLS unroll
    sum += a[i] * b[i];
  }
}
```

---

## 10. 검증 규칙 (C sim / C synth / C-RTL cosim)

### 10.1 테스트벤치는 **self-checking** 으로 작성하라
- **[DOC]** AMD 문서는 테스트벤치가 합성 대상 top-level 함수를 호출하고, 결과를 비교해 성공 시 `0` 을 리턴하는 구조를 권장한다. `[S21]`
- **실전 규칙 [INF]**:
  - 표준 입력/수동 입력에 의존하지 말 것
  - golden reference와 비교할 것
  - 경계 케이스 포함:
    - `n = 0`
    - `n = 1`
    - `n = N_MAX`
    - saturating/fixed-point 경계 값
    - 홀수 길이, 비정렬 길이 등

```cpp
int main() {
  // input init
  // call top(...)
  // compare against reference
  return (pass ? 0 : 1);
}
```

### 10.2 co-sim까지 보려면 block-level protocol을 함부로 바꾸지 말라
- **[DOC]** AMD 문서는 C/RTL co-simulation이 성공하려면 설계가 특정 조건을 만족해야 하며, 예를 들어 `ap_ctrl_chain` 또는 `ap_ctrl_hs` 를 쓰는 경우, 조합회로인 경우, top-level II=1 인 경우, 혹은 top-level array interface가 모두 streaming(`axis`/`ap_hs`)인 경우 등을 제시한다. `[S20]`
- **[DOC]** `ap_ctrl_none` 이면서 non-blocking `hls::stream` 을 사용하는 설계는 co-sim이 끝나지 않을 수 있다. `[S20]`
- **실전 규칙 [INF]**:
  - 특별한 이유가 없으면 기본 제어 프로토콜(`ap_ctrl_hs`)을 유지하라.
  - 스트림 설계는 testbench에서 **여러 transaction** 을 넣어 II와 deadlock을 확인하라.
  - co-sim hang가 나면 먼저:
    1. `ap_ctrl_none` 사용 여부
    2. 스트림 read/write 균형
    3. testbench transaction 수
    4. blocking/non-blocking stream 호출
    를 본다.

---

## 11. Codex가 실제로 따라야 할 변환 순서

1. **합성 대상 범위 결정**
   - top-level function 후보 선정
   - host/testbench/debug/파일 I/O 코드 분리

2. **비합성 요소 제거**
   - 동적 메모리 제거 `[S5]`
   - 재귀 제거 `[S6]`
   - virtual 제거 `[S3]`
   - STL 컨테이너 제거 `[S7]`
   - 시스템 호출 제거 `[S4]`
   - UB 제거 `[S8]`

3. **크기와 경계 고정**
   - 모든 런타임 크기에 `N_MAX` 부여
   - `assert` 로 상한 제한 `[S14]`

4. **자료형 정리**
   - `ap_int/ap_uint` 로 정확한 폭 지정 `[S9]`
   - 필요하면 `ap_fixed/ap_ufixed` 적용 `[S10]`
   - 타입 정의를 헤더에 집중 `[INF]`

5. **구조 리팩터링**
   - load / compute / store 로 분해 `[S2][S11]`
   - 내부 통신은 `hls::stream` `[S12][S16]`

6. **루프 최적화**
   - throughput-critical loop에 `pipeline` `[S13]`
   - 정적 작은 루프에 `unroll` `[S13]`
   - 병렬 메모리 접근 필요 시 `array_partition` `[S15]`
   - 가변 반복 수는 `assert` + 필요 시 `loop_tripcount` `[S14]`

7. **인터페이스 정리**
   - scalar control vs memory buffer vs streaming data 구분
   - multi-access pointer 위험 제거 `[S17]`
   - AXI4-Stream 타입은 top-level에서만 사용 `[S16]`

8. **검증 코드 정리**
   - self-checking TB
   - golden 비교
   - corner case 추가 `[S21]`

9. **남은 위험 보고**
   - 수치 오차
   - 폭 선택 타당성
   - 남아 있는 데이터 의존성
   - 메모리 포트 병목 가능성
   - co-sim deadlock 가능성

---

## 12. 실패 메시지/징후별 수정 방향

| 징후 | 가장 먼저 볼 것 | 보통의 수정 방향 |
|---|---|---|
| 동적 메모리/재귀/virtual/STL 관련 합성 실패 | 금지 요소가 남아 있는지 | 정적 배열, 반복문, 정적 dispatch로 재작성 |
| 루프 II가 목표보다 큼 | 메모리 포트 부족인지, 데이터 의존성인지 | `array_partition`, access pattern 단순화, 누산 구조 재작성 |
| latency가 `?` 로 나옴 | 루프 bound가 가변인지 | `assert(max)` 추가, 필요 시 `loop_tripcount` 추가 |
| 포인터 다중 읽기/쓰기 결과가 이상함 | 같은 외부 포인터를 여러 번 액세스하는지 | `volatile` 검토 또는 preload/stream/로컬 버퍼로 재구성 |
| burst가 안 나옴 | `memcpy`, 비연속 주소, 조건문, 복잡한 루프 바디 | 명시적 순차 루프로 분리, pipeline 부여 |
| co-sim hang/deadlock | `ap_ctrl_none`, stream balance, transaction 수 | 제어 프로토콜 재검토, blocking read/write 정합, TB 보강 |
| 결과 수치가 틀림 | 폭 축소/고정소수점 전환 여부 | accumulator 확장, scaling/rounding/overflow 가정 재검토 |

> 위 표의 “수정 방향”은 AMD 공식 문서의 제약을 바탕으로 정리한 **실전 규칙 [INF]** 이다. 직접 근거는 `[S13][S14][S15][S17][S18][S20]` 에서 확인할 수 있다.

---

## 13. HLS pre-flight checklist

아래를 모두 만족할 때만 “한 번에 통과”를 기대해 볼 수 있다.

- [ ] top-level 합성 대상이 함수다. `[S22]`
- [ ] 합성 구역에 `malloc/free/new/delete` 가 없다. `[S5]`
- [ ] 재귀가 없다. `[S6]`
- [ ] virtual 함수가 없다. `[S3]`
- [ ] 합성 구역에서 STL 동적 컨테이너를 쓰지 않는다. `[S7]`
- [ ] 시스템 호출/파일 I/O/OS 의존 코드를 제거했다. `[S4]`
- [ ] 모든 지역 변수/누산기/AP 배열 초기화를 검토했다. `[S8][S9]`
- [ ] 모든 가변 길이/반복 수에 최대값과 `assert` 가 있다. `[S14]`
- [ ] 내부 채널은 `hls::stream` 이고, AXI4-Stream 타입을 내부 변수에 쓰지 않았다. `[S12][S16]`
- [ ] 처리율이 중요한 루프에 pipeline 검토를 했다. `[S13]`
- [ ] 병렬 메모리 접근 배열에 partition 필요 여부를 검토했다. `[S15]`
- [ ] `m_axi` burst용 접근은 명시적 순차 루프 형태다. `[S18]`
- [ ] 테스트벤치는 self-checking 이고 성공 시 0을 반환한다. `[S21]`
- [ ] co-sim을 볼 계획이면 control protocol/stream 사용법을 검토했다. `[S20]`

---

## 14. Codex에게 그대로 줄 수 있는 프롬프트

```text
You are converting existing C/C++ code into AMD Vitis HLS 2023.2 compatible C++.

Non-negotiable constraints:
1. Keep functional behavior unless you explicitly report a necessary semantic change.
2. Do not use malloc/free/new/delete, recursion, virtual functions, STL dynamic containers, OS/system calls, or undefined behavior in the synth region.
3. The synthesis top must be a function.
4. Every runtime size must have a compile-time maximum and an assert-based bound.
5. Prefer ap_int/ap_uint for exact-width integers.
6. If floating point is not mandatory, consider ap_fixed/ap_ufixed, but report every precision/range assumption.
7. Refactor memory-backed kernels into load / compute / store stages.
8. Use hls::stream for internal stage-to-stage channels.
9. Use AXI4-Stream specific interface types only at the top-level interface, not as internal variables.
10. For throughput-critical loops, consider #pragma HLS pipeline II=1.
11. For static small loops, consider unroll.
12. If a loop needs parallel array accesses, consider array_partition.
13. For m_axi burst friendliness, replace memcpy with explicit sequential pipelined loops when appropriate.
14. Produce self-checking testbench changes and list remaining risks.

Output format:
A. Transformation summary
B. Assumptions and bounds added
C. Type changes
D. Transformed code
E. Pragmas added and why
F. Testbench changes required
G. Remaining manual review items
```

---

## 15. Codex 출력 형식 권장 템플릿

```markdown
# Transformation Summary
- What was removed
- What was bounded
- What interfaces were chosen

# Assumptions and Bounds
- N_MAX = ...
- Input ranges = ...
- Fixed-point assumptions = ...

# Type Changes
- int -> ap_int<...>
- float -> ap_fixed<...>

# Pragmas
- pipeline on loop X because ...
- dataflow on top because ...
- array_partition on buffer Y because ...

# Remaining Risks
- possible accumulator overflow at ...
- memory-port bottleneck may remain at ...
- co-sim deadlock risk if TB does not provide enough transactions
```

---

## 16. 최소 골격 예제 (메모리 기반 kernel)

```cpp
#include <assert.h>
#include "ap_int.h"
#include "hls_stream.h"

using in_t  = ap_uint<16>;
using out_t = ap_uint<16>;
constexpr int N_MAX = 1024;

static void load_input(const in_t *in, hls::stream<in_t> &s, int n) {
LOAD_I:
  for (int i = 0; i < n; ++i) {
    #pragma HLS pipeline II=1
    s.write(in[i]);
  }
}

static void compute_core(hls::stream<in_t> &in_s, hls::stream<out_t> &out_s, int n) {
COMP_I:
  for (int i = 0; i < n; ++i) {
    #pragma HLS pipeline II=1
    in_t x = in_s.read();
    out_s.write((out_t)(x + 1));
  }
}

static void store_output(hls::stream<out_t> &s, out_t *out, int n) {
STORE_I:
  for (int i = 0; i < n; ++i) {
    #pragma HLS pipeline II=1
    out[i] = s.read();
  }
}

void top(const in_t *in, out_t *out, int n) {
  #pragma HLS INTERFACE m_axi     port=in  bundle=gmem0
  #pragma HLS INTERFACE m_axi     port=out bundle=gmem1
  #pragma HLS INTERFACE s_axilite port=n        bundle=control
  #pragma HLS INTERFACE s_axilite port=return   bundle=control

  assert(n >= 0 && n <= N_MAX);

  #pragma HLS dataflow
  hls::stream<in_t>  s_in;
  hls::stream<out_t> s_out;

  load_input(in, s_in, n);
  compute_core(s_in, s_out, n);
  store_output(s_out, out, n);
}
```

> 위 예제의 인터페이스 pragma 형태는 실전에서 자주 쓰는 골격이며, 세부 bundle/offset/depth 구성은 프로젝트 요구사항에 따라 조정해야 한다. 이 부분은 **예시 [INF]** 다.

---

## 17. Source map

이 문서의 `[Sx]` 는 모두 아래의 **AMD UG1399 Vitis HLS User Guide 2023.2** 내부 섹션을 뜻한다.  
문서 시작점: <https://docs.amd.com/r/2023.2-English/ug1399-vitis-hls/Introduction>

- `[S2]` Refactoring C++ Source Code for HLS
- `[S3]` Unsupported C Constructs
- `[S4]` System Calls
- `[S5]` Dynamic Memory Usage
- `[S6]` Recursive Functions
- `[S7]` Standard Template Library
- `[S8]` Undefined Behaviors
- `[S9]` C++ Arbitrary Precision Integer Types
- `[S10]` C++ Arbitrary Precision Fixed-Point Types
- `[S11]` Task-level Parallelism
- `[S12]` hls::stream Library
- `[S13]` Optimizing the HLS Project
- `[S14]` Working with Variable Loop Bounds
- `[S15]` Array Partitioning
- `[S16]` AXI4-Stream Interfaces
- `[S17]` Interface Synthesis and Multi-Access Pointers / Modeling Streaming Data Using Pointers
- `[S18]` Best Practices for Designing with M_AXI Interfaces
- `[S19]` DATAFLOW canonical form discussion in the UG1399 dataflow review section (function-level / loop-level canonical forms)
- `[S20]` C/RTL Co-Simulation
- `[S21]` Verifying the RTL
- `[S22]` Classes
- `[S23]` Defining Interfaces / interface synthesis discussion

---

## 18. 마지막 주의사항

- **[DOC]** AMD 공식 문서도 “원래 C/C++ 코드를 그대로 넣으면 자동으로 좋은 RTL이 나온다”는 식의 보장을 하지 않는다. 리팩터링과 구조화가 필요하다. `[S2][S13]`
- **[INF]** 그래서 Codex에게 가장 중요한 지시는 “멋있고 일반적인 C++” 를 만드는 것이 아니라, **합성 가능하고, 경계가 명확하고, 인터페이스가 단순하고, 루프/메모리 구조가 드러난 HLS용 C++** 를 만드는 것이다.

이 문서를 기준으로 변환하면, 최소한 다음 실수는 크게 줄일 수 있다:
- 합성 불가능한 언어 기능 잔존
- 경계 없는 동적 크기
- 내부 스트림/인터페이스 타입 오용
- burst가 안 나오는 메모리 코드
- variable loop bound로 인한 불명확한 리포트
- self-checking 없는 테스트벤치
