# This script segment is generated automatically by AutoPilot

set axilite_register_dict [dict create]
set port_control {
weights_q610 { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 16
	offset_end 23
}
num_frames { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 24
	offset_end 31
}
reset_state { 
	dir I
	width 1
	depth 1
	mode ap_none
	offset 32
	offset_end 39
}
ap_start { }
ap_done { }
ap_ready { }
ap_idle { }
interrupt {
}
}
dict set axilite_register_dict control $port_control


