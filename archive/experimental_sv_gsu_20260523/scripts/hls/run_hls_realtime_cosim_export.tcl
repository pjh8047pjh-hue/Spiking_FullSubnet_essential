source [file join [file dirname [file normalize [info script]]] common_hls_paths.tcl]
catch {unset ::env(DEBUG)}

open_project -reset [hls_prepare_project subband_q610_realtime_hls subband_realtime_hls_tb.cpp]
set_top SubbandRealtimeTopQ610Ip
# Inline hls_add_core_and_tb so we can attach -DSUBBAND_TB_CHUNK4_ONLY to the TB only.
add_files $hls_core_file -cflags "-std=c++14"
add_files -tb $hls_tb_file -cflags "-std=c++14 -DSUBBAND_TB_CHUNK4_ONLY"

open_solution -reset solution1 -flow_target vivado
set_part {xc7z020clg400-1}
create_clock -period 10 -name default
config_interface -m_axi_addr64=false

csim_design
csynth_design
puts "===== Cosim start: [clock seconds] ====="
cosim_design -rtl verilog -disable_deadlock_detection -enable_dataflow_profiling
puts "===== Cosim end:   [clock seconds] ====="
export_design -format ip_catalog -rtl verilog
exit
