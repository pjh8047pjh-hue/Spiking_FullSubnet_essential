source [file join [file dirname [file normalize [info script]]] common_hls_paths.tcl]
catch {unset ::env(DEBUG)}
# C단계: USE_SV_GSU_LAYER + USE_PROJECTION_EXTERNAL csynth
# 핵심 LUT 절감 측정 빌드. projection dot product를 외부 IP로 위임 → ProjectionDotProductRealtimePackedTilesRtlDspQ610가 합성 안 됨 → 36K LUT 절감 기대.
set ::env(HLS_EXTRA_CFLAGS) "-DUSE_SV_GSU_LAYER -DUSE_PROJECTION_EXTERNAL"

open_project -reset [hls_prepare_project subband_q610_realtime_sv_gsu_blackbox_proj_ext_hls subband_realtime_hls_tb.cpp]
set_top SubbandRealtimeTopQ610Ip
hls_add_core_and_tb
add_files -blackbox [file join $hls_repo_dir rtl gsu gsu_hidden_group_packed_bb.json]

open_solution -reset solution1 -flow_target vivado
set_part {xc7z020clg400-1}
create_clock -period 10 -name default
config_interface -m_axi_addr64=false -m_axi_num_read_outstanding=1 -m_axi_num_write_outstanding=1

csynth_design
exit
