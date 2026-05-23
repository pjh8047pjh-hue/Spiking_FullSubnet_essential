source [file join [file dirname [file normalize [info script]]] common_hls_paths.tcl]
catch {unset ::env(DEBUG)}
set ::env(HLS_EXTRA_CFLAGS) "-DUSE_SV_GSU_FULL -DUSE_SV_GSU_FULL_HLS_PROJECTION -DUSE_SV_GSU_FULL_USE_HLS_PROJECTION"

if {![info exists ::env(ALLOW_UNSTABLE_HLS_BB)] || $::env(ALLOW_UNSTABLE_HLS_BB) ne "1"} {
  error "Refusing to run USE_SV_GSU_FULL csynth on this Windows host by default. Recent runs reached RunRealtimeSingleGsuLayerSvFullQ610 binding and triggered system-level instability/reboot. Set ALLOW_UNSTABLE_HLS_BB=1 only if you intentionally accept that risk."
}

open_project -reset [hls_prepare_project subband_q610_realtime_sv_gsu_full_gsu_only_hls subband_realtime_hls_tb.cpp]
set_top SubbandRealtimeTopQ610Ip
hls_add_core_and_tb
add_files -blackbox [file join $hls_repo_dir rtl gsu gsu_layer_full_tiles_bb.json]

open_solution -reset solution1 -flow_target vivado
set_part {xc7z020clg400-1}
create_clock -period 10 -name default
config_interface -m_axi_addr64=false -m_axi_num_read_outstanding=1 -m_axi_num_write_outstanding=1

csynth_design
exit
