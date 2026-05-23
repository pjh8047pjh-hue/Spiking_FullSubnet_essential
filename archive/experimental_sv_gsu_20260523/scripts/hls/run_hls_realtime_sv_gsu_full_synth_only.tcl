source [file join [file dirname [file normalize [info script]]] common_hls_paths.tcl]
catch {unset ::env(DEBUG)}
# §3.1 step 2: projection SV blackbox crash 우회를 위해 HLS C projection 경로 사용
# -DUSE_SV_GSU_FULL_HLS_PROJECTION을 켜면 RunRealtimeProjectionBandRowCachedPackedFixedQ610 분기 활성화
set ::env(HLS_EXTRA_CFLAGS) "-DUSE_SV_GSU_FULL -DUSE_SV_GSU_FULL_HLS_PROJECTION"

open_project -reset [hls_prepare_project subband_q610_realtime_sv_gsu_full_hls subband_realtime_hls_tb.cpp]
set_top SubbandRealtimeTopQ610Ip
hls_add_core_and_tb
add_files -blackbox [file join $hls_repo_dir rtl gsu gsu_layer_full_tiles_bb.json]
# projection_dot_scalar_bb.json은 USE_SV_GSU_FULL_HLS_PROJECTION 분기에서 사용 안 함 (§3.1 step 2)

open_solution -reset solution1 -flow_target vivado
set_part {xc7z020clg400-1}
create_clock -period 10 -name default
config_interface -m_axi_addr64=false -m_axi_num_read_outstanding=1 -m_axi_num_write_outstanding=1

csynth_design
exit
