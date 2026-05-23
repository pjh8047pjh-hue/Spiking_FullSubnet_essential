source [file join [file dirname [file normalize [info script]]] common_hls_paths.tcl]
catch {unset ::env(DEBUG)}
set ::env(HLS_EXTRA_CFLAGS) "-DUSE_SV_GSU_FULL -DUSE_SV_GSU_FULL_HLS_PROJECTION -DUSE_SV_GSU_FULL_USE_HLS_PROJECTION"

open_project -reset [hls_prepare_project subband_q610_realtime_sv_gsu_full_gsu_only_csim_hls subband_realtime_hls_tb.cpp]
set_top SubbandRealtimeTopQ610Ip
hls_add_core_and_tb
add_files -blackbox [file join $hls_repo_dir rtl gsu gsu_layer_full_tiles_bb.json]

open_solution -reset solution1 -flow_target vivado
set_part {xc7z020clg400-1}
create_clock -period 10 -name default

csim_design
exit
