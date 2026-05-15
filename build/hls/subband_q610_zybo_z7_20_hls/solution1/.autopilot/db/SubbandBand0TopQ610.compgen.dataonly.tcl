# This script segment is generated automatically by AutoPilot

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


