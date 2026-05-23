set hls_common_dir [file dirname [file normalize [info script]]]
set hls_repo_dir [file normalize [file join $hls_common_dir .. ..]]
if {[info exists ::env(HLS_REPO_DIR)]} {
  set hls_repo_dir $::env(HLS_REPO_DIR)
}

set hls_build_root [file join $hls_repo_dir build hls]
if {[info exists ::env(HLS_BUILD_DIR)]} {
  set hls_build_root $::env(HLS_BUILD_DIR)
}

proc hls_prepare_project {project_name tb_file} {
  global hls_repo_dir hls_build_root hls_project_dir hls_core_file hls_tb_file

  set source_dir $hls_repo_dir
  set hls_project_dir [file join $hls_build_root $project_name]
  set hls_core_file [file join $source_dir subband_ref_q610_opt_stage4_latency_stepL2.cpp]
  set hls_tb_file [file join $source_dir testbench $tb_file]

  if {![info exists ::env(HLS_REPO_DIR)] && [string first " " $hls_repo_dir] >= 0} {
    set temp_root C:/hls_subband
    if {[info exists ::env(HLS_TEMP_ROOT)]} {
      set temp_root $::env(HLS_TEMP_ROOT)
    }
    set temp_src [file join $temp_root src]
    file mkdir $temp_src
    file copy -force [file join $hls_repo_dir subband_ref_q610.hpp] \
                     [file join $temp_src subband_ref_q610.hpp]
    file copy -force [file join $hls_repo_dir subband_ref_q610_opt_stage4_latency_stepL2.cpp] \
                     [file join $temp_src subband_ref_q610_opt_stage4_latency_stepL2.cpp]
    file copy -force [file join $hls_repo_dir testbench $tb_file] \
                     [file join $temp_src $tb_file]
    set hls_core_file [file join $temp_src subband_ref_q610_opt_stage4_latency_stepL2.cpp]
    set hls_tb_file [file join $temp_src $tb_file]
    if {![info exists ::env(HLS_BUILD_DIR)]} {
      set hls_project_dir [file join $temp_root $project_name]
    }
  }

  return $hls_project_dir
}

proc hls_add_core_and_tb {} {
  global hls_core_file hls_tb_file
  set hls_include_dir [file dirname $hls_core_file]
  set hls_cflags "-std=c++14 -I$hls_include_dir"
  if {[info exists ::env(HLS_EXTRA_CFLAGS)] && $::env(HLS_EXTRA_CFLAGS) ne ""} {
    append hls_cflags " " $::env(HLS_EXTRA_CFLAGS)
  }
  add_files $hls_core_file -cflags $hls_cflags
  add_files -tb $hls_tb_file -cflags $hls_cflags
}
