set script_dir [file dirname [file normalize [info script]]]
set repo_dir [file normalize [file join $script_dir .. ..]]
set ws_dir [file normalize [file join $repo_dir build vitis realtime_dma_selftest_ws]]
set xsa_path [file normalize [file join $repo_dir release rtl_engine_board_candidate_20260523 fpga realtime_dma_zybo_z7_20.xsa]]
set src_dir [file normalize [file join $repo_dir sw realtime_dma_selftest src]]

if {![file exists $xsa_path]} {
  error "XSA not found: $xsa_path"
}
if {![file exists [file join $src_dir realtime_dma_selftest.c]]} {
  error "Self-test source not found: $src_dir"
}

file delete -force $ws_dir
setws $ws_dir
platform create -name rtdma_rtl_platform -hw $xsa_path -proc ps7_cortexa9_0 -os standalone -arch 32-bit
platform generate
app create -name realtime_dma_selftest -platform rtdma_rtl_platform -domain standalone_domain -template {Empty Application(C)}
importsources -name realtime_dma_selftest -path $src_dir
app build -name realtime_dma_selftest
