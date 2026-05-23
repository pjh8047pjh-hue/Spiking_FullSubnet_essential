source [file join [file dirname [file normalize [info script]]] common_hls_paths.tcl]
catch {unset ::env(DEBUG)}
# C단계: USE_SV_GSU_FULL + USE_SV_GSU_FULL_HLS_PROJECTION + USE_PROJECTION_EXTERNAL csim
# projection 우회 + 외부화 동시 적용. 16 GB RAM 환경에서도 csim은 가벼움 (~100 MB).
set ::env(HLS_EXTRA_CFLAGS) "-DUSE_SV_GSU_FULL -DUSE_SV_GSU_FULL_HLS_PROJECTION -DUSE_PROJECTION_EXTERNAL"

open_project -reset [hls_prepare_project subband_q610_realtime_sv_gsu_full_proj_ext_csim_hls subband_realtime_hls_tb.cpp]
set_top SubbandRealtimeTopQ610Ip
hls_add_core_and_tb

open_solution -reset solution1 -flow_target vivado
set_part {xc7z020clg400-1}
create_clock -period 10 -name default
config_interface -m_axi_addr64=false -m_axi_num_read_outstanding=1 -m_axi_num_write_outstanding=1

csim_design
exit
