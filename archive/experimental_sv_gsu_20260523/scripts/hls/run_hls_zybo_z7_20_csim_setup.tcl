source [file join [file dirname [file normalize [info script]]] common_hls_paths.tcl]

open_project -reset [hls_prepare_project subband_q610_zybo_z7_20_hls subband_q610_hls_tb.cpp]
set_top SubbandBand0TopQ610

hls_add_core_and_tb

open_solution -reset solution1 -flow_target vivado
set_part {xc7z020clg400-1}
create_clock -period 10 -name default
config_interface -m_axi_addr64=false -m_axi_num_read_outstanding=1 -m_axi_num_write_outstanding=1

csim_design -setup

exit
