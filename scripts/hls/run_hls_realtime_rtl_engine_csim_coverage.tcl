source [file join [file dirname [file normalize [info script]]] common_hls_paths.tcl]
catch {unset ::env(DEBUG)}
set ::env(HLS_EXTRA_CFLAGS) "-DUSE_RTL_BAND_ENGINE"

open_project -reset [hls_prepare_project subband_q610_realtime_rtl_engine_coverage_hls subband_realtime_hls_coverage_tb.cpp]
set_top SubbandRealtimeTopQ610Ip
hls_add_core_and_tb

open_solution -reset solution1 -flow_target vivado
set_part {xc7z020clg400-1}
create_clock -period 10 -name default
config_interface -m_axi_addr64=false -m_axi_num_read_outstanding=1 -m_axi_num_write_outstanding=1

csim_design
exit
