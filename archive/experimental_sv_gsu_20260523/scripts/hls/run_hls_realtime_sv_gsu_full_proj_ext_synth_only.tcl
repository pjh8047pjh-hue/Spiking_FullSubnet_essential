source [file join [file dirname [file normalize [info script]]] common_hls_paths.tcl]
catch {unset ::env(DEBUG)}
# C단계 Phase D: USE_SV_GSU_FULL + USE_SV_GSU_FULL_HLS_PROJECTION + USE_PROJECTION_EXTERNAL csynth
# 16 GB RAM 환경 한계로 OOM 가능. 별도 PowerShell 창에서 메모리 모니터 동시 실행 권장.
# projection 외부화로 RTL Generation 메모리 부담 일부 감소 기대.
set ::env(HLS_EXTRA_CFLAGS) "-DUSE_SV_GSU_FULL -DUSE_SV_GSU_FULL_HLS_PROJECTION -DUSE_PROJECTION_EXTERNAL"

open_project -reset [hls_prepare_project subband_q610_realtime_sv_gsu_full_proj_ext_hls subband_realtime_hls_tb.cpp]
set_top SubbandRealtimeTopQ610Ip
hls_add_core_and_tb
add_files -blackbox [file join $hls_repo_dir rtl gsu gsu_layer_full_tiles_bb.json]

open_solution -reset solution1 -flow_target vivado
set_part {xc7z020clg400-1}
create_clock -period 10 -name default
config_interface -m_axi_addr64=false -m_axi_num_read_outstanding=1 -m_axi_num_write_outstanding=1

csynth_design
exit
