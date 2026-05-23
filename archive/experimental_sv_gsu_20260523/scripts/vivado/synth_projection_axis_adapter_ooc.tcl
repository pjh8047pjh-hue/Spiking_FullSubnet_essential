# D-2: projection_axis_adapter Out-of-Context 합성 검증
# 어댑터 + 내부 projection_dot_scalar 인스턴스를 함께 합성해 LUT/timing 측정.
set script_dir [file dirname [file normalize [info script]]]
set repo_dir [file normalize [file join $script_dir .. ..]]
set out_dir [file join $repo_dir build vivado projection_adapter_ooc]
file mkdir $out_dir

set max_threads 4
if {[info exists ::env(VIVADO_MAX_THREADS)] && $::env(VIVADO_MAX_THREADS) ne ""} {
  set max_threads $::env(VIVADO_MAX_THREADS)
}
set_param general.maxThreads $max_threads
puts "INFO: Vivado general.maxThreads = $max_threads"

# 임시 in-memory project (디스크 cache 최소화)
create_project -in_memory -part xc7z020clg400-1

# RTL 소스 추가 (의존 순서)
read_verilog -sv [file join $repo_dir rtl gsu gsu_q610_pkg.sv]
read_verilog -sv [file join $repo_dir rtl gsu projection_dot_scalar_bb.sv]
read_verilog -sv [file join $repo_dir rtl gsu projection_axis_adapter.sv]

# OOC synth - 100 MHz target
synth_design -top projection_axis_adapter -mode out_of_context -part xc7z020clg400-1

# Synth 완료된 design에 clock 제약 적용 후 timing 분석
create_clock -period 10.0 -name ap_clk [get_ports ap_clk]

report_utilization -file [file join $out_dir post_synth_util.rpt]
report_timing_summary -file [file join $out_dir post_synth_timing.rpt]
report_drc -file [file join $out_dir post_synth_drc.rpt]
write_checkpoint -force [file join $out_dir post_synth.dcp]

puts "INFO: D-2 OOC synth complete. Reports in $out_dir"
exit
