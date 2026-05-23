set script_dir [file dirname [file normalize [info script]]]
set repo_dir [file normalize [file join $script_dir .. ..]]
cd $repo_dir
set proj_name vivado_realtime_dma_zybo_z7_20
if {[info exists ::env(VIVADO_PROJ_NAME)] && $::env(VIVADO_PROJ_NAME) ne ""} {
  set proj_name $::env(VIVADO_PROJ_NAME)
}
set proj_dir [file join $repo_dir build vivado $proj_name]
set bd_name realtime_dma_bd
if {[info exists ::env(VIVADO_BD_NAME)] && $::env(VIVADO_BD_NAME) ne ""} {
  set bd_name $::env(VIVADO_BD_NAME)
}
set reports_dir [file join $proj_dir reports]
set hls_ip_repo [file join $repo_dir build hls subband_q610_realtime_hls solution1 impl ip]
if {[info exists ::env(VIVADO_HLS_IP_REPO)] && $::env(VIVADO_HLS_IP_REPO) ne ""} {
  set hls_ip_repo [file normalize $::env(VIVADO_HLS_IP_REPO)]
}
set max_threads 6
if {[info exists ::env(VIVADO_MAX_THREADS)] && $::env(VIVADO_MAX_THREADS) ne ""} {
  set max_threads $::env(VIVADO_MAX_THREADS)
}
set_param general.maxThreads $max_threads
puts "INFO: Vivado general.maxThreads set to $max_threads."

proc warn_msg {msg} {
  puts "WARNING: $msg"
}

proc set_config_if_exists {cell key value} {
  if {[catch {set_property CONFIG.$key $value $cell} msg]} {
    warn_msg "Could not set CONFIG.$key on [get_property NAME $cell]: $msg"
  }
}

proc require_intf_pin {candidates} {
  foreach candidate $candidates {
    set pin [get_bd_intf_pins -quiet $candidate]
    if {[llength $pin] > 0} {
      return $pin
    }
  }
  error "None of these interface pins exist: $candidates"
}

proc connect_pin_if_exists {net cell pin_name} {
  set pin [get_bd_pins -quiet "$cell/$pin_name"]
  if {[llength $pin] > 0} {
    connect_bd_net $net $pin
  }
}

if {![file exists $hls_ip_repo]} {
  error "HLS IP repo was not found: $hls_ip_repo"
}

file mkdir $reports_dir
create_project -force $proj_name $proj_dir -part xc7z020clg400-1
set_property ip_repo_paths [list [file normalize $hls_ip_repo]] [current_project]
update_ip_catalog

create_bd_design $bd_name

set ps7 [create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 ps7_0]
set_config_if_exists $ps7 PCW_USE_M_AXI_GP0 1
set_config_if_exists $ps7 PCW_USE_S_AXI_HP0 1
set_config_if_exists $ps7 PCW_EN_CLK0_PORT 1
set_config_if_exists $ps7 PCW_FPGA0_PERIPHERAL_FREQMHZ 100.0
set_config_if_exists $ps7 PCW_QSPI_PERIPHERAL_ENABLE 0
set_config_if_exists $ps7 PCW_SD0_PERIPHERAL_ENABLE 0
if {[catch {apply_bd_automation -rule xilinx.com:bd_rule:processing_system7 -config {make_external "FIXED_IO, DDR"} $ps7} msg]} {
  warn_msg "PS7 automation failed; exporting DDR/FIXED_IO manually: $msg"
  make_bd_intf_pins_external [get_bd_intf_pins $ps7/DDR]
  make_bd_intf_pins_external [get_bd_intf_pins $ps7/FIXED_IO]
}
set_config_if_exists $ps7 PCW_USE_M_AXI_GP0 1
set_config_if_exists $ps7 PCW_USE_S_AXI_HP0 1
set_config_if_exists $ps7 PCW_EN_CLK0_PORT 1
set_config_if_exists $ps7 PCW_FPGA0_PERIPHERAL_FREQMHZ 100.0

set hls_defs [get_ipdefs -all *SubbandRealtimeTopQ610Ip*]
if {[llength $hls_defs] == 0} {
  error "SubbandRealtimeTopQ610Ip IP was not found in IP catalog path: $hls_ip_repo"
}
set hls_ip [create_bd_cell -type ip -vlnv [lindex $hls_defs 0] subband_realtime_0]

set dma0 [create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dma:7.1 axi_dma0]
set dma1 [create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dma:7.1 axi_dma1]
foreach dma [list $dma0 $dma1] {
  set_config_if_exists $dma c_include_sg 0
  set_config_if_exists $dma c_addr_width 32
  set_config_if_exists $dma c_m_axis_mm2s_tdata_width 16
  set_config_if_exists $dma c_s_axis_s2mm_tdata_width 16
}
set_config_if_exists $dma0 c_include_mm2s 1
set_config_if_exists $dma0 c_include_s2mm 1
set_config_if_exists $dma1 c_include_mm2s 1
set_config_if_exists $dma1 c_include_s2mm 0

set ctrl_smc [create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 axi_smc_ctrl]
set_property -dict [list CONFIG.NUM_SI {1} CONFIG.NUM_MI {3}] $ctrl_smc
set mem_smc [create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 axi_smc_mem]
set_property -dict [list CONFIG.NUM_SI {4} CONFIG.NUM_MI {1}] $mem_smc

set rst [create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_ps7_100m]

set clk [get_bd_pins $ps7/FCLK_CLK0]
set rstn [get_bd_pins $rst/peripheral_aresetn]
connect_bd_net $clk [get_bd_pins $rst/slowest_sync_clk]
connect_bd_net [get_bd_pins $ps7/FCLK_RESET0_N] [get_bd_pins $rst/ext_reset_in]
connect_bd_net $clk [get_bd_pins $ps7/M_AXI_GP0_ACLK]
connect_bd_net $clk [get_bd_pins $ps7/S_AXI_HP0_ACLK]
connect_bd_net $clk [get_bd_pins $hls_ip/ap_clk]
connect_bd_net $rstn [get_bd_pins $hls_ip/ap_rst_n]
connect_bd_net $clk [get_bd_pins $ctrl_smc/aclk]
connect_bd_net $rstn [get_bd_pins $ctrl_smc/aresetn]
connect_bd_net $clk [get_bd_pins $mem_smc/aclk]
connect_bd_net $rstn [get_bd_pins $mem_smc/aresetn]

foreach dma [list $dma0 $dma1] {
  connect_pin_if_exists $clk $dma s_axi_lite_aclk
  connect_pin_if_exists $clk $dma m_axi_mm2s_aclk
  connect_pin_if_exists $clk $dma m_axi_s2mm_aclk
  connect_pin_if_exists $rstn $dma axi_resetn
}

connect_bd_intf_net [get_bd_intf_pins $ps7/M_AXI_GP0] [get_bd_intf_pins $ctrl_smc/S00_AXI]
connect_bd_intf_net [get_bd_intf_pins $ctrl_smc/M00_AXI] [require_intf_pin [list $hls_ip/s_axi_control]]
connect_bd_intf_net [get_bd_intf_pins $ctrl_smc/M01_AXI] [get_bd_intf_pins $dma0/S_AXI_LITE]
connect_bd_intf_net [get_bd_intf_pins $ctrl_smc/M02_AXI] [get_bd_intf_pins $dma1/S_AXI_LITE]

connect_bd_intf_net [get_bd_intf_pins $dma0/M_AXI_MM2S] [get_bd_intf_pins $mem_smc/S00_AXI]
connect_bd_intf_net [get_bd_intf_pins $dma0/M_AXI_S2MM] [get_bd_intf_pins $mem_smc/S01_AXI]
connect_bd_intf_net [get_bd_intf_pins $dma1/M_AXI_MM2S] [get_bd_intf_pins $mem_smc/S02_AXI]
connect_bd_intf_net [require_intf_pin [list $hls_ip/m_axi_weights $hls_ip/weights]] [get_bd_intf_pins $mem_smc/S03_AXI]
connect_bd_intf_net [get_bd_intf_pins $mem_smc/M00_AXI] [get_bd_intf_pins $ps7/S_AXI_HP0]

connect_bd_intf_net [get_bd_intf_pins $dma0/M_AXIS_MM2S] [require_intf_pin [list $hls_ip/noisy_fft_stream $hls_ip/noisy_fft_stream_V]]
connect_bd_intf_net [get_bd_intf_pins $dma1/M_AXIS_MM2S] [require_intf_pin [list $hls_ip/fb_fft_stream $hls_ip/fb_fft_stream_V]]
connect_bd_intf_net [require_intf_pin [list $hls_ip/df_coef_stream $hls_ip/df_coef_stream_V]] [get_bd_intf_pins $dma0/S_AXIS_S2MM]

assign_bd_address
validate_bd_design
save_bd_design

set bd_file [get_files [file join $proj_dir $proj_name.srcs sources_1 bd $bd_name ${bd_name}.bd]]
set_property synth_checkpoint_mode None $bd_file
generate_target all $bd_file
make_wrapper -files $bd_file -top
add_files -norecurse [file join $proj_dir $proj_name.gen sources_1 bd $bd_name hdl ${bd_name}_wrapper.v]
set_property top ${bd_name}_wrapper [current_fileset]
update_compile_order -fileset sources_1

synth_design -top ${bd_name}_wrapper -part xc7z020clg400-1
report_utilization -file [file join $reports_dir post_synth_util.rpt]

opt_design
place_design
route_design
write_checkpoint -force [file join $proj_dir realtime_dma_zybo_z7_20_routed.dcp]
report_timing_summary -file [file join $reports_dir post_route_timing_summary.rpt]
report_utilization -file [file join $reports_dir post_route_util.rpt]
report_power -file [file join $reports_dir post_route_power.rpt]
report_drc -file [file join $reports_dir drc.rpt]

set bit_path [file join $proj_dir realtime_dma_zybo_z7_20.bit]
set xsa_path [file join $proj_dir realtime_dma_zybo_z7_20.xsa]
write_bitstream -force $bit_path
if {[catch {write_hw_platform -fixed -include_bit -force $xsa_path} msg]} {
  warn_msg "write_hw_platform -include_bit failed: $msg"
  warn_msg "Writing XSA without embedded bitstream. The standalone bitstream is: $bit_path"
  write_hw_platform -fixed -force $xsa_path
}
close_project
