# AI 추론 전력 측정 가이드
## 대기 전력 차감 기반 순수 추론 전력 계산 (pyRAPL)

> 참고 논문:
> - Green AI: Energy Consumption in DL Models (arXiv:2402.13640)
> - Enhancing Energy-Awareness in Deep Learning (ACM TOSEM 2024)
> - Evaluating Energy Efficiency of NPU-Accelerated ML Inference (arXiv:2509.17533)
> - Measuring and Improving Energy Efficiency of LLMs (UPM 2024)

---

## 1. 측정 원리

### 핵심 공식

```
순수 추론 에너지 = 추론 중 측정 에너지 - 동일 시간 동안의 대기 에너지
```

즉:

```
E_net = E_inference - (P_idle × T_inference)
```

| 항목 | 설명 | 단위 |
|:---|:---|:---|
| `E_net` | 순수 추론 에너지 | μJ |
| `E_inference` | 추론 중 RAPL 측정값 | μJ |
| `P_idle` | 단위 시간당 대기 전력 | μJ/μs |
| `T_inference` | 추론 소요 시간 | μs |

---

### 논문 근거

실제 논문에서는 CPU 대기 전력을 10분간 측정하여 평균 전력을 계산하고, 이를 추론 측정값에서 차감하는 방식을 표준 방법론으로 사용합니다.

엣지 디바이스 추론 에너지 측정 논문에서는 대기 전력 차감(idle-state subtraction)을 통해 추론에 실제로 귀속되는 에너지를 정확히 산출하는 방식을 채택하고 있습니다.

ACM 논문에서는 대기 전력 기준값 측정 시 백그라운드 프로세스를 최소화하고, 각 측정 실행 후 짧은 idle 구간을 두어 CPU의 tail power state로 인한 오차를 방지하도록 권장합니다.

---

## 2. 측정 절차

```
[단계 1] 환경 준비
    → 백그라운드 프로세스 최소화
    → CPU 주파수 고정 (performance 모드)
    → 시스템 안정화 대기 (2~3분)

[단계 2] 대기 전력 측정
    → 아무 연산 없이 10분간 RAPL 측정
    → 평균 대기 전력(P_idle) 계산

[단계 3] 워밍업
    → 모델 10~20회 dummy 추론 (JIT 캐시, 클럭 안정화)

[단계 4] 추론 전력 측정
    → 100회 반복 측정
    → 각 회차별 E_inference, T_inference 기록

[단계 5] 순수 추론 에너지 계산
    → E_net = E_inference - (P_idle × T_inference)
    → 100회 평균값 사용
```

---

## 3. 전체 코드

```python
import pyRAPL
import torch
import time
import numpy as np
import pandas as pd

# ──────────────────────────────────────────
# 0. 설정
# ──────────────────────────────────────────
IDLE_MEASURE_SEC = 600    # 대기 전력 측정 시간 (10분, 논문 표준)
WARMUP_RUNS      = 20     # 워밍업 횟수
MEASURE_RUNS     = 100    # 측정 반복 횟수
COOLDOWN_MS      = 100    # 측정 간 대기 (tail power state 방지)

pyRAPL.setup(devices=[pyRAPL.Device.PKG, pyRAPL.Device.DRAM])

# ──────────────────────────────────────────
# 1. 환경 준비
# ──────────────────────────────────────────
# CPU 주파수 고정 (터미널에서 실행)
# sudo cpupower frequency-set -g performance

# 시스템 안정화 대기
print("시스템 안정화 대기 중 (30초)...")
time.sleep(30)

# ──────────────────────────────────────────
# 2. 대기 전력 측정 (10분)
# ──────────────────────────────────────────
print(f"대기 전력 측정 중 ({IDLE_MEASURE_SEC}초)...")

idle_meter = pyRAPL.Measurement('idle_baseline')
idle_meter.begin()
time.sleep(IDLE_MEASURE_SEC)
idle_meter.end()

idle_pkg_total  = idle_meter.result.pkg[0]   # μJ
idle_dram_total = idle_meter.result.dram[0]  # μJ
idle_duration   = idle_meter.result.duration # μs

# 단위 시간당 대기 전력 (μJ/μs = W)
P_idle_pkg  = idle_pkg_total  / idle_duration
P_idle_dram = idle_dram_total / idle_duration
P_idle_total = P_idle_pkg + P_idle_dram

print(f"대기 전력 (PKG):   {P_idle_pkg  * 1e6:.2f} μW/μs")
print(f"대기 전력 (DRAM):  {P_idle_dram * 1e6:.2f} μW/μs")
print(f"대기 전력 (합계):  {P_idle_total * 1e6:.2f} μW/μs")

# ──────────────────────────────────────────
# 3. 모델 준비
# ──────────────────────────────────────────
# 실제 모델로 교체
# from model import ANNModel, SNNModel
# ann_model = ANNModel(...); ann_model.eval()
# snn_model = SNNModel(...); snn_model.eval()

# 테스트용 더미 모델
ann_model = torch.nn.LSTM(257, 512, 2, batch_first=True).eval()
snn_model = torch.nn.LSTM(64,  320, 2, batch_first=True).eval()

dummy_ann = torch.randn(1, 16000, 257)
dummy_snn = torch.randn(1, 16000, 64)

# ──────────────────────────────────────────
# 4. 워밍업
# ──────────────────────────────────────────
print(f"\n워밍업 중 ({WARMUP_RUNS}회)...")
with torch.no_grad():
    for _ in range(WARMUP_RUNS):
        ann_model(dummy_ann)
        snn_model(dummy_snn)

# ──────────────────────────────────────────
# 5. 추론 전력 측정 함수
# ──────────────────────────────────────────
def measure_inference_power(model, dummy_input, model_name,
                             n_runs=MEASURE_RUNS):
    results = []

    print(f"\n{model_name} 측정 중 ({n_runs}회)...")

    for i in range(n_runs):
        meter = pyRAPL.Measurement(f'{model_name}_run_{i}')
        meter.begin()

        with torch.no_grad():
            model(dummy_input)

        meter.end()

        E_pkg  = meter.result.pkg[0]   # μJ
        E_dram = meter.result.dram[0]  # μJ
        T      = meter.result.duration # μs
        E_total = E_pkg + E_dram

        # 대기 전력 차감
        E_idle_during = P_idle_total * T
        E_net = E_total - E_idle_during

        results.append({
            'run':      i,
            'E_total_uj':  E_total,
            'E_idle_uj':   E_idle_during,
            'E_net_uj':    E_net,          # 순수 추론 에너지
            'T_us':        T,
            'P_avg_mw':    E_net / T * 1000  # 평균 전력 (mW)
        })

        # tail power state 방지
        time.sleep(COOLDOWN_MS / 1000)

    return pd.DataFrame(results)

# ──────────────────────────────────────────
# 6. ANN / SNN 측정 실행
# ──────────────────────────────────────────
df_ann = measure_inference_power(ann_model, dummy_ann, "ANN")
df_snn = measure_inference_power(snn_model, dummy_snn, "SNN")

# ──────────────────────────────────────────
# 7. 결과 계산 및 출력
# ──────────────────────────────────────────
def summarize(df, model_name):
    return {
        'model':        model_name,
        'E_net_mean_uj': df['E_net_uj'].mean(),
        'E_net_std_uj':  df['E_net_uj'].std(),
        'T_mean_ms':     df['T_us'].mean() / 1000,
        'P_avg_mw':      df['P_avg_mw'].mean(),
    }

ann_summary = summarize(df_ann, "ANN")
snn_summary = summarize(df_snn, "SNN")

print("\n" + "="*60)
print("측정 결과 요약")
print("="*60)
print(f"{'항목':<25} {'ANN':>15} {'SNN':>15}")
print("-"*60)
print(f"{'순수 추론 에너지 (μJ)':<25} "
      f"{ann_summary['E_net_mean_uj']:>15.2f} "
      f"{snn_summary['E_net_mean_uj']:>15.2f}")
print(f"{'표준편차 (μJ)':<25} "
      f"{ann_summary['E_net_std_uj']:>15.2f} "
      f"{snn_summary['E_net_std_uj']:>15.2f}")
print(f"{'평균 추론 시간 (ms)':<25} "
      f"{ann_summary['T_mean_ms']:>15.2f} "
      f"{snn_summary['T_mean_ms']:>15.2f}")
print(f"{'평균 전력 (mW)':<25} "
      f"{ann_summary['P_avg_mw']:>15.2f} "
      f"{snn_summary['P_avg_mw']:>15.2f}")

ratio = snn_summary['E_net_mean_uj'] / ann_summary['E_net_mean_uj'] * 100
reduction = 100 - ratio
print(f"\nSNN/ANN 에너지 비율:  {ratio:.1f}%")
print(f"에너지 절감률:         {reduction:.1f}%")

# ──────────────────────────────────────────
# 8. CSV 저장
# ──────────────────────────────────────────
df_ann['model'] = 'ANN'
df_snn['model'] = 'SNN'
df_all = pd.concat([df_ann, df_snn])
df_all.to_csv("power_measurement_results.csv", index=False)
print("\n결과 저장: power_measurement_results.csv")
```

---

## 4. 출력 예시

```
대기 전력 (PKG):   8234.12 μW/μs
대기 전력 (DRAM):  1823.45 μW/μs
대기 전력 (합계):  10057.57 μW/μs

============================================================
측정 결과 요약
============================================================
항목                              ANN             SNN
------------------------------------------------------------
순수 추론 에너지 (μJ)          12483.21         3821.47
표준편차 (μJ)                    234.12           98.34
평균 추론 시간 (ms)               85.43           31.24
평균 전력 (mW)                   146.12          122.33

SNN/ANN 에너지 비율:   30.6%
에너지 절감률:          69.4%
```

---

## 5. 논문 결과표 형식

측정 완료 후 아래 표 형식으로 기재:

| 모델 | 순수 추론 에너지 (μJ) | 평균 전력 (mW) | 추론 시간 (ms) | ANN 대비 절감률 |
|:---|---:|---:|---:|---:|
| ANN FullSubNet | [값] ± [std] | [값] | [값] | - |
| SNN | [값] ± [std] | [값] | [값] | [X]% |
| SNN Q6.10 | [값] ± [std] | [값] | [값] | [X]% |

> 논문 명시 필수:
> "대기 전력은 10분간 측정한 평균값을 기준으로 추론 측정값에서 차감하였으며,
> 본 측정은 CPU 소프트웨어 환경 기준으로 뉴로모픽 하드웨어의 저전력 특성을
> 직접 반영하지 않는다."

---

## 6. 주의사항

| 항목 | 권장 방법 | 근거 |
|:---|:---|:---|
| 대기 측정 시간 | 최소 10분 | Green AI 논문 표준 |
| 워밍업 | 최소 20회 | JIT, 캐시 안정화 |
| 반복 횟수 | 100회 이상 | 통계적 신뢰도 |
| 측정 간 대기 | 100ms | tail power state 방지 |
| CPU 주파수 | performance 모드 고정 | 클럭 변동 오차 제거 |
| 백그라운드 | 최소화 | GUI, 브라우저 종료 |
| RAPL 정확도 | Intel CPU만 유효 | AMD는 부정확 |