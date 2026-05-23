set script_dir [file normalize [file dirname [info script]]]

open_project -reset [file join $script_dir subband_q610_zybo_z7_20_hls]
set_top SubbandBand0TopQ610

add_files [file join $script_dir subband_ref_q610_opt_stage4_latency_stepL2.cpp] -cflags "-std=c++14"
add_files -tb [file join $script_dir subband_q610_hls_tb.cpp] -cflags "-std=c++14"

open_solution -reset solution1 -flow_target vivado
set_part {xc7z020clg400-1}
create_clock -period 10 -name default
config_interface -m_axi_addr64=false -m_axi_num_read_outstanding=1 -m_axi_num_write_outstanding=1

csim_design
csynth_design
cosim_design -rtl verilog

exit

