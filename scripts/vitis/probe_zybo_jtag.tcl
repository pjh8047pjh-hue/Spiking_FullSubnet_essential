connect
puts "=== XSCT TARGETS ==="
set target_text [targets]
if {$target_text eq ""} {
  error "No JTAG targets detected. Check Zybo power, USB-JTAG cable, and Digilent driver."
}
