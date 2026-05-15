# This script segment is generated automatically by AutoPilot

if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler SubbandBand0TopQ610_SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_pcA BINDTYPE {storage} TYPE {ram_2p} IMPL {bram} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler SubbandBand0TopQ610_SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_rcU BINDTYPE {storage} TYPE {ram_2p} IMPL {bram} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler SubbandBand0TopQ610_SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_tde BINDTYPE {storage} TYPE {ram} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler SubbandBand0TopQ610_SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_vdy BINDTYPE {storage} TYPE {ram} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler SubbandBand0TopQ610_SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_JfO BINDTYPE {storage} TYPE {ram_2p} IMPL {bram} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler SubbandBand0TopQ610_proj_bias_local_RAM_AUTO_1R1W BINDTYPE {storage} TYPE {ram} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler SubbandBand0TopQ610_gmem_in_m_axi BINDTYPE {interface} TYPE {adapter} IMPL {m_axi}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler SubbandBand0TopQ610_weights_m_axi BINDTYPE {interface} TYPE {adapter} IMPL {m_axi}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler SubbandBand0TopQ610_gmem_out_m_axi BINDTYPE {interface} TYPE {adapter} IMPL {m_axi}
}


# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

set axilite_register_dict [dict create]
set port_control {
noisy_input_q610 { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 16
	offset_end 23
}
fb_output_q610 { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 24
	offset_end 31
}
layer0_weight_ih_q610 { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 32
	offset_end 39
}
layer0_weight_hh_q610 { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 40
	offset_end 47
}
layer0_bias_ih_q610 { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 48
	offset_end 55
}
layer0_bn_mul_q610 { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 56
	offset_end 63
}
layer0_bn_add_q610 { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 64
	offset_end 71
}
layer1_weight_ih_q610 { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 72
	offset_end 79
}
layer1_weight_hh_q610 { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 80
	offset_end 87
}
layer1_bias_ih_q610 { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 88
	offset_end 95
}
layer1_bn_mul_q610 { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 96
	offset_end 103
}
layer1_bn_add_q610 { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 104
	offset_end 111
}
proj_weight_q610 { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 112
	offset_end 119
}
proj_bias_q610 { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 120
	offset_end 127
}
df_coef_q610 { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 128
	offset_end 135
}
ap_start { }
ap_done { }
ap_ready { }
ap_idle { }
interrupt {
}
}
dict set axilite_register_dict control $port_control


# Native S_AXILite:
if {${::AESL::PGuard_simmodel_gen}} {
	if {[info proc ::AESL_LIB_XILADAPTER::s_axilite_gen] == "::AESL_LIB_XILADAPTER::s_axilite_gen"} {
		eval "::AESL_LIB_XILADAPTER::s_axilite_gen { \
			id 5896 \
			corename subband_q610::SubbandBand0TopQ610_control_axilite \
			name SubbandBand0TopQ610_control_s_axi \
			ports {$port_control} \
			op interface \
			interrupt_clear_mode TOW \
			interrupt_trigger_type default \
			is_flushable 0 \
			is_datawidth64 0 \
			is_addrwidth64 0 \
		} "
	} else {
		puts "@W \[IMPL-110\] Cannot find AXI Lite interface model in the library. Ignored generation of AXI Lite  interface for 'control'"
	}
}

if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler SubbandBand0TopQ610_control_s_axi BINDTYPE interface TYPE interface_s_axilite
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -1 \
    name ${PortName} \
    reset_level 0 \
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
set PortName ap_rst_n
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -2 \
    name ${PortName} \
    reset_level 0 \
    sync_rst true \
    corename apif_ap_rst_n \
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


