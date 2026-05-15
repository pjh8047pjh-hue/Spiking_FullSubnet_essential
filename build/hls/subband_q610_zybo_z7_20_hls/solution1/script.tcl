############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
## Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
############################################################
open_project subband_q610_zybo_z7_20_hls
set_top SubbandBand0TopQ610
add_files subband_ref_q610_opt_stage4_latency_stepL2.cpp -cflags "-std=c++14"
add_files -tb subband_q610_hls_tb.cpp -cflags "-std=c++14 -Wno-unknown-pragmas"
open_solution "solution1" -flow_target vivado
set_part {xc7z020-clg400-1}
create_clock -period 10 -name default
config_cosim -tool xsim
source "./subband_q610_zybo_z7_20_hls/solution1/directives.tcl"
csim_design
csynth_design
cosim_design -tool xsim
export_design -format ip_catalog
