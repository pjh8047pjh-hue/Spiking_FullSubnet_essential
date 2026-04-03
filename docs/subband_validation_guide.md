# Subband Validation Guide

## 목적

subband 관련 리팩터링이나 하드웨어 준비 작업 이후에도 추론 결과가 기존 기준 출력과 동일한지, 모두가 같은 방식으로 검증하기 위한 공통 절차다.

## 검증 범위

- 학습 재수행 없이 기존 체크포인트를 그대로 사용한다.
- `infer.py` 기준 추론 결과를 golden wav와 비교한다.
- 비교 기준은 "청감상 유사"가 아니라 "파일/샘플 값 동일"이다.

## 고정 기준

- 입력 1: `JH_test/test1.wav`
- 입력 2: `JH_test/test2.wav`
- 기준 출력 1: `JH_test/test1_refactor_check.wav`
- 기준 출력 2: `JH_test/test2_refactor_check.wav`
- 추론 스크립트: `infer.py`
- 설정 파일: `recipes/intel_ndns/spiking_fullsubnet/baseline_m.toml`
- 체크포인트: `model_zoo/intel_ndns/spike_fsb/baseline_m/checkpoints/best/pytorch_model.bin`
- Python: `C:\Users\JH\anaconda3\envs\spiking-fullsubnet\python.exe`

## 검증 절차

### 1. test1 추론

```powershell
& 'C:\Users\JH\anaconda3\envs\spiking-fullsubnet\python.exe' infer.py `
  -i JH_test\test1.wav `
  -o JH_test\test1_refactor_rerun.wav
```

### 2. test2 추론

```powershell
& 'C:\Users\JH\anaconda3\envs\spiking-fullsubnet\python.exe' infer.py `
  -i JH_test\test2.wav `
  -o JH_test\test2_refactor_rerun.wav
```

### 3. 해시 비교

```powershell
Get-FileHash JH_test\test1_refactor_rerun.wav, JH_test\test1_refactor_check.wav
Get-FileHash JH_test\test2_refactor_rerun.wav, JH_test\test2_refactor_check.wav
```

### 4. 샘플 단위 exact 비교

```powershell
@'
import soundfile as sf
import numpy as np

pairs = [
    ("JH_test/test1_refactor_rerun.wav", "JH_test/test1_refactor_check.wav"),
    ("JH_test/test2_refactor_rerun.wav", "JH_test/test2_refactor_check.wav"),
]

for rerun_path, ref_path in pairs:
    rerun, sr_rerun = sf.read(rerun_path)
    ref, sr_ref = sf.read(ref_path)

    print("pair", rerun_path, ref_path)
    print("sr_equal", sr_rerun == sr_ref, sr_rerun, sr_ref)
    print("shape_equal", rerun.shape == ref.shape, rerun.shape, ref.shape)
    print("sample_exact_equal", np.array_equal(rerun, ref))

    if rerun.shape == ref.shape:
        diff = np.abs(rerun - ref)
        print("max_abs_diff", float(diff.max()) if diff.size else 0.0)
        print("num_diff_samples", int(np.count_nonzero(diff)))

    print()
'@ | & 'C:\Users\JH\anaconda3\envs\spiking-fullsubnet\python.exe' -
```

## 통과 조건

- 체크포인트 로딩이 성공해야 한다.
- `Get-FileHash` 결과가 기준 파일과 동일해야 한다.
- `sample_exact_equal`이 `True`여야 한다.
- `max_abs_diff = 0.0`
- `num_diff_samples = 0`

## 실패로 판정하는 경우

- 체크포인트 키 불일치로 로딩 실패
- 출력 wav 길이 불일치
- 샘플레이트 불일치
- 해시 불일치
- 샘플 값 하나라도 다름

## 기록 방식

검증 결과를 공유할 때는 아래 네 줄만 통일해서 남긴다.

```text
test1: PASS/FAIL
test2: PASS/FAIL
checkpoint load: PASS/FAIL
note: mismatch가 있으면 max_abs_diff, num_diff_samples만 기록
```

## 주의

- golden 파일 `test1_refactor_check.wav`, `test2_refactor_check.wav`는 덮어쓰지 않는다.
- 리팩터링 중 클래스 구조를 바꾸더라도 기존 체크포인트 키와 호환되어야 한다.
- 비교는 반드시 같은 체크포인트, 같은 config, 같은 Python 환경에서 수행한다.
