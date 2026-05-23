# Realtime SV GSU Path df_coef Coverage Report

## 요약

`USE_SV_GSU_LAYER` 경로의 `SubbandRealtimeTopQ610Ip`를 Vitis HLS C-sim으로 검증했다. 검증 대상은 최종 AXI-stream `df_coef` 출력이며, C++ Q6.10 golden reference와 bit-exact 비교했다.

결론: tested scenario 전체에서 `df_coef` 값, 출력 개수, TLAST 위치가 모두 일치했다.

## 실행 환경

- Tool: Vitis HLS 2023.2
- Top: `SubbandRealtimeTopQ610Ip`
- Compile switch: `-DUSE_SV_GSU_LAYER`
- Device target: `xc7z020clg400-1`
- Clock target: `10 ns`

## 검증 범위

- Seeds: 32개, `0..31`
- Profiles: 5개
  - `small_random`
  - `full_input_zero_recurrent`
  - `sparse_identity_bn`
  - `alternating_nontrivial_bn`
  - `edge_projection_bias`
- Chunk patterns: 5개
- Reset replay: 각 seed/profile마다 추가 수행
- 총 scenarios: `960`
- 총 비교 `df_coef`: `4,423,680`

## 결과

| Seed range | Scenarios | df_coef compared | df mismatch | TLAST mismatch | Size mismatch | Extra output | Result |
|---|---:|---:|---:|---:|---:|---:|---|
| `0..7` | 240 | 1,105,920 | 0 | 0 | 0 | 0 | PASS |
| `8..15` | 240 | 1,105,920 | 0 | 0 | 0 | 0 | PASS |
| `16..23` | 240 | 1,105,920 | 0 | 0 | 0 | 0 | PASS |
| `24..31` | 240 | 1,105,920 | 0 | 0 | 0 | 0 | PASS |
| Total | 960 | 4,423,680 | 0 | 0 | 0 | 0 | PASS |

## 로그

- `logs/hls/vitis_hls_realtime_sv_gsu_csim_coverage_seed_0_8.log`
- `logs/hls/vitis_hls_realtime_sv_gsu_csim_coverage_seed_8_16.log`
- `logs/hls/vitis_hls_realtime_sv_gsu_csim_coverage_seed_16_24.log`
- `logs/hls/vitis_hls_realtime_sv_gsu_csim_coverage_seed_24_32.log`

각 로그는 `CSim done with 0 errors`와 `result=PASS`를 포함한다.

## 소요 시간

각 8-seed 구간은 약 32.1분에서 33.8분이 걸렸다. 네 구간 합산 HLS C-sim elapsed time은 약 `7,935.83 s`, 즉 약 `132.26 min`이다.

## 결론 문장

`USE_SV_GSU_LAYER` 경로의 Realtime HLS top은 32 deterministic seeds, 5 input/weight profiles, 5 chunk patterns 및 reset replay 조건에서 C++ Q6.10 golden reference와 최종 `df_coef` AXI-stream 출력이 bit-exact로 일치했다. 총 `4,423,680`개 `df_coef` element 비교에서 mismatch는 0이며, TLAST 및 output count protocol 오류도 0이다.

## 한계

이 검증은 HLS C-sim 기반의 C++/C-model 검증이다. SystemVerilog blackbox 포함 RTL integration 검증은 별도의 HLS csynth/export 및 custom xsim AXIS BFM 단계에서 추가 확인해야 한다.
