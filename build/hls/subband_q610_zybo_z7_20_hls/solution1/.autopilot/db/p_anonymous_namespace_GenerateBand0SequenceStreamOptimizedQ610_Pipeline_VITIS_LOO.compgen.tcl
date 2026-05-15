# This script segment is generated automatically by AutoPilot

set id 89
set name SubbandBand0TopQ610_ama_addmuladd_5ns_3ns_12ns_12ns_17_4_1
set corename simcore_ama
set op ama
set stage_num 4
set clk_width 1
set clk_signed 0
set reset_width 1
set reset_signed 0
set in0_width 5
set in0_signed 0
set in1_width 3
set in1_signed 0
set in2_width 12
set in2_signed 0
set in3_width 12
set in3_signed 0
set ce_width 1
set ce_signed 0
set out_width 17
set arg_lists {i0 {5 0 +} i1 {3 0 +} s {5 0 +} i2 {12 0 +} m {17 1 +} i3 {12 0 +} p {17 0 +} c_expval {c} c_reg {1} rnd {0} acc {0} }
set TrueReset 0
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {all} IMPL {dsp_slice} LATENCY 3 ALLOW_PRAGMA 1
}


set op ama
set corename DSP48
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_dsp48] == "::AESL_LIB_VIRTEX::xil_gen_dsp48"} {
eval "::AESL_LIB_VIRTEX::xil_gen_dsp48 { \
    id ${id} \
    name ${name} \
    corename ${corename} \
    op ${op} \
    reset_level 1 \
    sync_rst true \
    true_reset ${TrueReset} \
    stage_num ${stage_num} \
    clk_width ${clk_width} \
    clk_signed ${clk_signed} \
    reset_width ${reset_width} \
    reset_signed ${reset_signed} \
    in0_width ${in0_width} \
    in0_signed ${in0_signed} \
    in1_width ${in1_width} \
    in1_signed ${in1_signed} \
    in2_width ${in2_width} \
    in2_signed ${in2_signed} \
    in3_width ${in3_width} \
    in3_signed ${in3_signed} \
    ce_width ${ce_width} \
    ce_signed ${ce_signed} \
    out_width ${out_width} \
    arg_lists {${arg_lists}} \
}"
} else {
puts "@W \[IMPL-101\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_dsp48, check your platform lib"
}
}


# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 91 \
    name shl_ln \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_shl_ln \
    op interface \
    ports { shl_ln { I 5 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 92 \
    name zext_ln1798 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_zext_ln1798 \
    op interface \
    ports { zext_ln1798 { I 12 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 93 \
    name fb_output_q610 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_fb_output_q610 \
    op interface \
    ports { fb_output_q610 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 94 \
    name gmem_in \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_gmem_in \
    op interface \
    ports { m_axi_gmem_in_AWVALID { O 1 bit } m_axi_gmem_in_AWREADY { I 1 bit } m_axi_gmem_in_AWADDR { O 32 vector } m_axi_gmem_in_AWID { O 1 vector } m_axi_gmem_in_AWLEN { O 32 vector } m_axi_gmem_in_AWSIZE { O 3 vector } m_axi_gmem_in_AWBURST { O 2 vector } m_axi_gmem_in_AWLOCK { O 2 vector } m_axi_gmem_in_AWCACHE { O 4 vector } m_axi_gmem_in_AWPROT { O 3 vector } m_axi_gmem_in_AWQOS { O 4 vector } m_axi_gmem_in_AWREGION { O 4 vector } m_axi_gmem_in_AWUSER { O 1 vector } m_axi_gmem_in_WVALID { O 1 bit } m_axi_gmem_in_WREADY { I 1 bit } m_axi_gmem_in_WDATA { O 16 vector } m_axi_gmem_in_WSTRB { O 2 vector } m_axi_gmem_in_WLAST { O 1 bit } m_axi_gmem_in_WID { O 1 vector } m_axi_gmem_in_WUSER { O 1 vector } m_axi_gmem_in_ARVALID { O 1 bit } m_axi_gmem_in_ARREADY { I 1 bit } m_axi_gmem_in_ARADDR { O 32 vector } m_axi_gmem_in_ARID { O 1 vector } m_axi_gmem_in_ARLEN { O 32 vector } m_axi_gmem_in_ARSIZE { O 3 vector } m_axi_gmem_in_ARBURST { O 2 vector } m_axi_gmem_in_ARLOCK { O 2 vector } m_axi_gmem_in_ARCACHE { O 4 vector } m_axi_gmem_in_ARPROT { O 3 vector } m_axi_gmem_in_ARQOS { O 4 vector } m_axi_gmem_in_ARREGION { O 4 vector } m_axi_gmem_in_ARUSER { O 1 vector } m_axi_gmem_in_RVALID { I 1 bit } m_axi_gmem_in_RREADY { O 1 bit } m_axi_gmem_in_RDATA { I 16 vector } m_axi_gmem_in_RLAST { I 1 bit } m_axi_gmem_in_RID { I 1 vector } m_axi_gmem_in_RFIFONUM { I 6 vector } m_axi_gmem_in_RUSER { I 1 vector } m_axi_gmem_in_RRESP { I 2 vector } m_axi_gmem_in_BVALID { I 1 bit } m_axi_gmem_in_BREADY { O 1 bit } m_axi_gmem_in_BRESP { I 2 vector } m_axi_gmem_in_BID { I 1 vector } m_axi_gmem_in_BUSER { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 95 \
    name sequence_stream \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_sequence_stream \
    op interface \
    ports { sequence_stream_din { O 16 vector } sequence_stream_num_data_valid { I 8 vector } sequence_stream_fifo_cap { I 8 vector } sequence_stream_full_n { I 1 bit } sequence_stream_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 1 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -2 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -3 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


# flow_control definition:
set InstName SubbandBand0TopQ610_flow_control_loop_pipe_sequential_init_U
set CompName SubbandBand0TopQ610_flow_control_loop_pipe_sequential_init
set name flow_control_loop_pipe_sequential_init
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control] == "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control"} {
eval "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control { \
    name ${name} \
    prefix SubbandBand0TopQ610_ \
}"
} else {
puts "@W \[IMPL-107\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $CompName BINDTYPE interface TYPE internal_upc_flow_control INSTNAME $InstName
}


