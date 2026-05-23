source [file join [file dirname [file normalize [info script]]] common_hls_paths.tcl]
catch {unset ::env(DEBUG)}
set ::env(HLS_EXTRA_CFLAGS) "-DUSE_RTL_BAND_ENGINE"

set project_dir [file join $hls_build_root subband_q610_realtime_rtl_engine_hls]
if {![file exists $project_dir]} {
  error "RTL-engine HLS project was not found: $project_dir"
}

open_project $project_dir
open_solution solution1 -flow_target vivado
cosim_design -rtl verilog -tool xsim
exit
