# D-3: projection_axis_adapter (내부에 projection_dot_scalar 인스턴스 포함)를
# 단일 Vivado IP로 packaging. 결과는 build/vivado/projection_axis_ip/.
set script_dir [file dirname [file normalize [info script]]]
set repo_dir [file normalize [file join $script_dir .. ..]]
set ip_dir [file join $repo_dir build vivado projection_axis_ip]
set proj_dir [file join $repo_dir build vivado projection_axis_ip_proj]

set max_threads 4
if {[info exists ::env(VIVADO_MAX_THREADS)] && $::env(VIVADO_MAX_THREADS) ne ""} {
  set max_threads $::env(VIVADO_MAX_THREADS)
}
set_param general.maxThreads $max_threads

file delete -force $ip_dir
file delete -force $proj_dir
file mkdir $ip_dir

# IP packaging 작업용 임시 project 생성
create_project projection_axis_ip_proj $proj_dir -part xc7z020clg400-1 -force
set_property target_language Verilog [current_project]

# RTL 소스 추가 (의존 순서)
add_files -norecurse [list \
    [file join $repo_dir rtl gsu gsu_q610_pkg.sv] \
    [file join $repo_dir rtl gsu projection_dot_scalar_bb.sv] \
    [file join $repo_dir rtl gsu projection_axis_adapter.sv] \
]
update_compile_order -fileset sources_1
set_property top projection_axis_adapter [current_fileset]
update_compile_order -fileset sources_1

# 현재 project를 IP로 packaging
ipx::package_project -root_dir $ip_dir -vendor user.org -library subband \
    -taxonomy /UserIP -import_files -force

set core [ipx::current_core]
set_property name projection_axis_adapter $core
set_property display_name "Projection AXIS Adapter (with internal projection_dot_scalar)" $core
set_property description "AXIS slave (16-bit, 448 word) -> projection_dot_scalar -> AXIS master (16-bit, 3 word). Q6.10 dot product, 224 hidden lanes." $core
set_property vendor_display_name "user.org" $core
set_property company_url "https://github.com/example" $core
set_property version 1.0 $core
set_property core_revision 1 $core

# AXIS 인터페이스를 명시적으로 정의 (자동 추론은 일부 신호 누락 + 방향 오인식 발생)
# s_axis_req: slave AXIS, m_axis_resp: master AXIS, 둘 다 16-bit TDATA + TVALID/TREADY/TLAST
proc define_axis_interface {core bif_name mode prefix} {
  set bif [ipx::add_bus_interface $bif_name $core]
  set_property abstraction_type_vlnv xilinx.com:interface:axis_rtl:1.0 $bif
  set_property bus_type_vlnv xilinx.com:interface:axis:1.0 $bif
  set_property interface_mode $mode $bif
  foreach {logical physical} [list TDATA ${prefix}_tdata TVALID ${prefix}_tvalid TREADY ${prefix}_tready TLAST ${prefix}_tlast] {
    set pm [ipx::add_port_map $logical $bif]
    set_property physical_name $physical $pm
  }
}

define_axis_interface $core s_axis_req slave s_axis_req
define_axis_interface $core m_axis_resp master m_axis_resp

# Clock에 reset/freq 파라미터 명시
ipx::associate_bus_interfaces -busif s_axis_req -clock ap_clk $core
ipx::associate_bus_interfaces -busif m_axis_resp -clock ap_clk $core

set clock_bif [ipx::get_bus_interfaces ap_clk -of_objects $core]
if {[llength $clock_bif] > 0} {
  set freq_param [ipx::get_bus_parameters -of_objects $clock_bif FREQ_HZ]
  if {[llength $freq_param] == 0} {
    set freq_param [ipx::add_bus_parameter FREQ_HZ $clock_bif]
  }
  set_property value 100000000 $freq_param
  set reset_param [ipx::get_bus_parameters -of_objects $clock_bif ASSOCIATED_RESET]
  if {[llength $reset_param] == 0} {
    set reset_param [ipx::add_bus_parameter ASSOCIATED_RESET $clock_bif]
  }
  set_property value ap_rst $reset_param
}

set rst_bif [ipx::get_bus_interfaces ap_rst -of_objects $core]
if {[llength $rst_bif] > 0} {
  set polarity_param [ipx::get_bus_parameters -of_objects $rst_bif POLARITY]
  if {[llength $polarity_param] == 0} {
    set polarity_param [ipx::add_bus_parameter POLARITY $rst_bif]
  }
  set_property value ACTIVE_HIGH $polarity_param
}

# 파일 그룹 / synthesis flow 등록
ipx::create_xgui_files $core
ipx::update_checksums $core
ipx::check_integrity $core
ipx::save_core $core
ipx::archive_core [file join $ip_dir projection_axis_adapter_1.0.zip] $core
close_project

# packaging project 정리
close_project -delete -quiet

puts "INFO: D-3 IP packaging complete: $ip_dir"
exit
