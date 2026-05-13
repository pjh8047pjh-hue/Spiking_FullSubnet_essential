# 음성 향상 성능 지표 측정 가이드
## WB-PESQ / STOI / SI-SDR

---

## 1. 지표 개요

| 지표 | 측정 대상 | 범위 | 높을수록 |
|:---|:---|:---|:---:|
| WB-PESQ | 음질 (지각적) | -0.5 ~ 4.5 | 좋음 |
| STOI | 명료도 (알아듣기) | 0 ~ 1 | 좋음 |
| SI-SDR | 신호 왜곡 | dB (제한 없음) | 좋음 |

> 세 지표 모두 **intrusive metric** — clean reference 음성이 반드시 필요하다.

---

## 2. 설치

```bash
pip install pesq pystoi torch torchaudio numpy
```

| 패키지 | 지표 | 비고 |
|:---|:---|:---|
| `pesq` | WB-PESQ | ITU-T P.862.2 구현 |
| `pystoi` | STOI | Taal et al. 2011 구현 |
| `torch` | SI-SDR | 직접 구현 또는 torchmetrics |

---

## 3. 전체 측정 코드

```python
import torch
import torchaudio
import numpy as np
from pesq import pesq
from pystoi import stoi

# ──────────────────────────────────────────
# 0. 설정
# ──────────────────────────────────────────
SAMPLE_RATE = 16000  # 16kHz (WB-PESQ 필수 조건)

# ──────────────────────────────────────────
# 1. 음성 파일 로드
# ──────────────────────────────────────────
def load_wav(path, sr=SAMPLE_RATE):
    wav, orig_sr = torchaudio.load(path)
    if orig_sr != sr:
        wav = torchaudio.functional.resample(wav, orig_sr, sr)
    return wav.squeeze().numpy()  # (T,) numpy array

clean   = load_wav("clean.wav")    # reference 깨끗한 음성
noisy   = load_wav("noisy.wav")    # 입력 잡음 음성
enhanced = load_wav("enhanced.wav") # 모델 출력 향상 음성

# 길이 맞추기 (짧은 쪽 기준)
min_len = min(len(clean), len(enhanced))
clean    = clean[:min_len]
enhanced = enhanced[:min_len]
noisy    = noisy[:min_len]

# ──────────────────────────────────────────
# 2. WB-PESQ 측정
# ──────────────────────────────────────────
# mode='wb' : Wideband (16kHz), mode='nb' : Narrowband (8kHz)
pesq_noisy    = pesq(SAMPLE_RATE, clean, noisy,    mode='wb')
pesq_enhanced = pesq(SAMPLE_RATE, clean, enhanced, mode='wb')

print(f"WB-PESQ (Noisy):    {pesq_noisy:.3f}")
print(f"WB-PESQ (Enhanced): {pesq_enhanced:.3f}")
print(f"WB-PESQ 향상:       {pesq_enhanced - pesq_noisy:+.3f}")

# ──────────────────────────────────────────
# 3. STOI 측정
# ──────────────────────────────────────────
# extended=False : STOI, extended=True : ESTOI
stoi_noisy    = stoi(clean, noisy,    SAMPLE_RATE, extended=False)
stoi_enhanced = stoi(clean, enhanced, SAMPLE_RATE, extended=False)

print(f"\nSTOI (Noisy):    {stoi_noisy:.3f}")
print(f"STOI (Enhanced): {stoi_enhanced:.3f}")
print(f"STOI 향상:       {stoi_enhanced - stoi_noisy:+.3f}")

# ──────────────────────────────────────────
# 4. SI-SDR 측정
# ──────────────────────────────────────────
def si_sdr(reference, estimated, eps=1e-8):
    """
    Scale-Invariant Signal-to-Distortion Ratio
    reference, estimated: numpy array (T,)
    """
    reference = reference - np.mean(reference)
    estimated = estimated - np.mean(estimated)

    # 최적 스케일링
    alpha = np.dot(estimated, reference) / (np.dot(reference, reference) + eps)
    projection = alpha * reference

    noise = estimated - projection
    si_sdr_val = 10 * np.log10(
        (np.sum(projection ** 2) + eps) /
        (np.sum(noise ** 2) + eps)
    )
    return si_sdr_val

sisnr_noisy    = si_sdr(clean, noisy)
sisnr_enhanced = si_sdr(clean, enhanced)

print(f"\nSI-SDR (Noisy):    {sisnr_noisy:.2f} dB")
print(f"SI-SDR (Enhanced): {sisnr_enhanced:.2f} dB")
print(f"SI-SDR 향상:       {sisnr_enhanced - sisnr_noisy:+.2f} dB")

# ──────────────────────────────────────────
# 5. 최종 결과 요약 출력
# ──────────────────────────────────────────
print("\n" + "="*50)
print("결과 요약")
print("="*50)
print(f"{'지표':<12} {'Noisy':>10} {'Enhanced':>10} {'향상':>10}")
print("-"*50)
print(f"{'WB-PESQ':<12} {pesq_noisy:>10.3f} {pesq_enhanced:>10.3f} {pesq_enhanced-pesq_noisy:>+10.3f}")
print(f"{'STOI':<12} {stoi_noisy:>10.3f} {stoi_enhanced:>10.3f} {stoi_enhanced-stoi_noisy:>+10.3f}")
print(f"{'SI-SDR (dB)':<12} {sisnr_noisy:>10.2f} {sisnr_enhanced:>10.2f} {sisnr_enhanced-sisnr_noisy:>+10.2f} dB")
```

---

## 4. 여러 파일 배치 측정 (데이터셋 전체 평균)

```python
import os
import glob
import pandas as pd

def evaluate_dataset(clean_dir, enhanced_dir, sr=16000):
    results = []

    clean_files = sorted(glob.glob(os.path.join(clean_dir, "*.wav")))

    for clean_path in clean_files:
        filename = os.path.basename(clean_path)
        enhanced_path = os.path.join(enhanced_dir, filename)

        if not os.path.exists(enhanced_path):
            print(f"스킵: {filename} (enhanced 파일 없음)")
            continue

        ref = load_wav(clean_path, sr)
        est = load_wav(enhanced_path, sr)

        # 길이 맞추기
        min_len = min(len(ref), len(est))
        ref = ref[:min_len]
        est = est[:min_len]

        results.append({
            "file":    filename,
            "WB-PESQ": pesq(sr, ref, est, mode='wb'),
            "STOI":    stoi(ref, est, sr, extended=False),
            "SI-SDR":  si_sdr(ref, est),
        })

    df = pd.DataFrame(results)

    print("\n" + "="*50)
    print("데이터셋 평균 결과")
    print("="*50)
    print(f"WB-PESQ: {df['WB-PESQ'].mean():.3f} ± {df['WB-PESQ'].std():.3f}")
    print(f"STOI:    {df['STOI'].mean():.3f} ± {df['STOI'].std():.3f}")
    print(f"SI-SDR:  {df['SI-SDR'].mean():.2f} ± {df['SI-SDR'].std():.2f} dB")

    # CSV 저장
    df.to_csv("evaluation_results.csv", index=False)
    print("\n결과 저장: evaluation_results.csv")

    return df

# 실행
df = evaluate_dataset(
    clean_dir="./data/clean",
    enhanced_dir="./data/enhanced"
)
```

---

## 5. ANN / SNN / SNN Q6.10 비교 측정

```python
models = {
    "ANN":       "./output/ann",
    "SNN":       "./output/snn",
    "SNN Q6.10": "./output/snn_q610",
}

clean_dir = "./data/clean"
summary = {}

for model_name, enhanced_dir in models.items():
    df = evaluate_dataset(clean_dir, enhanced_dir)
    summary[model_name] = {
        "WB-PESQ": df["WB-PESQ"].mean(),
        "STOI":    df["STOI"].mean(),
        "SI-SDR":  df["SI-SDR"].mean(),
    }

# 비교 표 출력
print("\n" + "="*55)
print(f"{'모델':<12} {'WB-PESQ':>10} {'STOI':>10} {'SI-SDR':>10}")
print("="*55)
for name, scores in summary.items():
    print(f"{name:<12} {scores['WB-PESQ']:>10.3f} "
          f"{scores['STOI']:>10.3f} {scores['SI-SDR']:>10.2f}")
```

---

## 6. 출력 예시

```
==================================================
결과 요약
==================================================
지표           Noisy   Enhanced       향상
--------------------------------------------------
WB-PESQ        1.582      2.987     +1.405
STOI           0.721      0.893     +0.172
SI-SDR (dB)    3.21      14.87     +11.66 dB

==================================================
모델          WB-PESQ       STOI     SI-SDR
==================================================
ANN             2.987      0.893      14.87
SNN             2.931      0.881      14.12
SNN Q6.10       2.905      0.876      13.98
```

---

## 7. 주의사항

| 항목 | 내용 |
|:---|:---|
| 샘플링 레이트 | WB-PESQ는 **반드시 16kHz** 필요. 8kHz면 mode='nb' 사용 |
| 파일 길이 | clean과 enhanced 길이가 다르면 짧은 쪽에 맞춰 자르기 |
| 무음 구간 | SI-SDR은 무음 구간에서 -inf 나올 수 있음, 유음 구간만 평가 권장 |
| 스케일 | PESQ/STOI는 볼륨에 민감하므로 정규화(-1~1) 후 측정 권장 |
| 배치 평균 | 파일 1개 결과보다 **데이터셋 전체 평균값**을 논문에 기재 |

---

## 8. 논문 결과표 형식

측정 완료 후 아래 표 형식으로 기재:

| 모델 | WB-PESQ | STOI | SI-SDR (dB) |
|:---|---:|---:|---:|
| Noisy (입력) | [값] | [값] | [값] |
| ANN FullSubNet | [값] | [값] | [값] |
| SNN | [값] | [값] | [값] |
| SNN Q6.10 | [값] | [값] | [값] |