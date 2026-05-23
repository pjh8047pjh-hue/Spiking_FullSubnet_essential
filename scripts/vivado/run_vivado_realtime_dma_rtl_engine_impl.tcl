set script_dir [file dirname [file normalize [info script]]]
set repo_dir [file normalize [file join $script_dir .. ..]]

set ::env(VIVADO_PROJ_NAME) rtdma_rtl
set ::env(VIVADO_BD_NAME) bd
set ::env(VIVADO_HLS_IP_REPO) [file normalize [file join $repo_dir build hls subband_q610_realtime_rtl_engine_hls solution1 impl ip]]
if {![info exists ::env(VIVADO_MAX_THREADS)] || $::env(VIVADO_MAX_THREADS) eq ""} {
  set ::env(VIVADO_MAX_THREADS) 2
}

source [file join $script_dir run_vivado_realtime_dma_impl.tcl]
