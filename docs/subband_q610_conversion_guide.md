# Subband Q6.10 Conversion Guide

이 문서는 현재 코드 기준의 Q6.10 고정소수점 reference와 HLS top 연결 관계를 정리한다. 최종 보드 후보는 `USE_RTL_BAND_ENGINE` 경로이며, 정확도 기준은 Python/PyTorch float 모델이 아니라 C++ Q6.10 golden reference와의 bit-exact 일치다.

## Active Source Files

| 파일 | 역할 |
|---|---|
| `subband_ref_q610.hpp` | Q6.10 타입, 상수, reference API 선언 |
| `subband_ref_q610.cpp` | C++ Q6.10 golden reference 구현 |
| `subband_ref_q610_opt_stage4_latency_stepL2.cpp` | Vitis HLS top, realtime RTL-engine 경로, 최적화 구현 |
| `testbench/subband_realtime_hls_tb.cpp` | smoke C-sim testbench |
| `testbench/subband_realtime_hls_coverage_tb.cpp` | high-coverage `df_coef` bit-exact testbench |

## Fixed-Point Contract

기본 데이터는 signed 16-bit Q6.10이다.

- Scale: `1.0 == 1024`
- Range: `[-32768, 32767]`
- Main data type: `q_data_t`
- MAC accumulator: signed 48-bit
- Saturation: signed int16 범위로 clamp
- Rounding: C++ reference의 `RoundShiftRight` 동작과 동일해야 함

다음 연산은 HLS path와 golden reference가 bit-exact로 같아야 한다.

- `MulQ610`
- `RoundShiftRight`
- `SaturateInt16`
- `SigmoidPwlQ610`
- GSU gate update
- BN scale/add
- projection dot-product
- `ProjectToDfCoefQ610`

## Realtime Output Order

`SubbandRealtimeTopQ610Ip`의 AXI-stream 출력 순서는 고정이다.

```text
frame -> band0 -> band1 -> band2 -> df_index -> freq_index -> complex_index
```

frame당 출력 개수:

| Band | Count |
|---|---:|
| band0 | 320 |
| band1 | 576 |
| band2 | 256 |
| total | 1152 |

4-frame chunk에서는 `4 * 1152 = 4608`개 `df_coef`가 출력된다.

## Stable HLS Mode

현재 보드 후보에서 사용하는 compile flag:

```text
-DUSE_RTL_BAND_ENGINE
```

현재 보드 후보에서 사용하지 않는 실험 flag:

```text
USE_SV_GSU_LAYER
USE_SV_GSU_FULL
USE_PROJECTION_EXTERNAL
```

위 실험 경로는 active 문서와 최종 보드 판단에서 제외한다. 관련 기록은 archive에만 보관한다.

## Validation Rule

최종 correctness 문장은 다음처럼 표현한다.

```text
Realtime HLS IP top의 AXI-stream df_coef 출력은 C++ Q6.10 golden reference와 tested scenarios에서 bit-exact 일치하였다.
```

주의할 점:

- 이것은 PyTorch float model과의 직접 비교가 아니다.
- wav 품질 비교는 별도 system-level 검증이다.
- 논문이나 보고서에서 수치 근거를 쓸 때는 `C++ Q6.10 golden reference`라고 명시한다.

## Related Docs

- `docs/rtl_engine_final_verification_report_ko.md`
- `docs/rtl_engine_board_bringup_readiness_ko.md`
- `docs/subband_validation_guide.md`
