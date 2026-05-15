set script_dir [file dirname [file normalize [info script]]]
set repo_dir [file normalize [file join $script_dir .. ..]]
set proj_dir [file join $repo_dir build vivado vivado_realtime_dma_zybo_z7_20]
set proj_file [file join $proj_dir vivado_realtime_dma_zybo_z7_20.xpr]
set xsa_path [file join $proj_dir realtime_dma_zybo_z7_20.xsa]

if {![file exists $proj_file]} {
  error "Vivado project was not found: $proj_file"
}

open_project $proj_file
write_hw_platform -fixed -force $xsa_path
close_project
exit
