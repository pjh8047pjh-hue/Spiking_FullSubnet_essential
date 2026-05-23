# Documentation

현재 active 문서는 `USE_RTL_BAND_ENGINE` 보드 후보 기준으로 정리되어 있다. `USE_SV_GSU_FULL`, ping-pong weight fetch, projection external IP 같은 실험 경로는 최종 보드 기준선에서 제외했고, 관련 문서는 archive로 이동했다.

## Active Docs

- `rtl_engine_final_verification_report_ko.md`: 최종 검증 보고서. C-sim coverage, HLS csynth, Vivado post-route timing/resource/power, 채택 판단을 한 곳에 합쳤다.
- `rtl_engine_board_bringup_readiness_ko.md`: Zybo Z7-20 JTAG bare-metal DMA self-test 실행 절차와 현재 보드 준비 상태.
- `subband_q610_conversion_guide.md`: Q6.10 고정소수점 변환 및 C++ reference 구조 설명.
- `subband_validation_guide.md`: Python/wav 레벨 검증 기준과 사용 방법.

## Final Release Bundle

최종 보드 후보 산출물은 아래 경로에 고정되어 있다.

```text
release/rtl_engine_board_candidate_20260523/
```

주요 파일:

- `fpga/realtime_dma_zybo_z7_20.bit`
- `fpga/realtime_dma_zybo_z7_20.xsa`
- `fpga/realtime_dma_zybo_z7_20_routed.dcp`
- `fpga/bd.hwh`
- `hls_reports/SubbandRealtimeTopQ610Ip_csynth.rpt`
- `hls_ip/ip/`
- `software/realtime_dma_selftest.elf`
- `software/fsbl.elf`
- `verification_logs/coverage_segments_rtl_engine/`
- `vivado_reports/`

## Archived Docs

중복되었거나 현재 메인 코드 경로와 맞지 않는 문서는 active `docs/`에서 제외하고 아래에 보관했다.

```text
archive/experimental_sv_gsu_20260523/docs/merged_or_outdated_active_docs/
```
