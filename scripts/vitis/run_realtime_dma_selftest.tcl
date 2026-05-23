set script_dir [file dirname [file normalize [info script]]]
set repo_dir [file normalize [file join $script_dir .. ..]]
set release_dir [file normalize [file join $repo_dir release rtl_engine_board_candidate_20260523]]
set bit_path [file normalize [file join $release_dir fpga realtime_dma_zybo_z7_20.bit]]
set elf_path [file normalize [file join $release_dir software realtime_dma_selftest.elf]]
set result_addr 0x1FE00000

if {![file exists $bit_path]} {
  error "Bitstream not found: $bit_path"
}
if {![file exists $elf_path]} {
  error "ELF not found: $elf_path"
}

connect
puts "=== XSCT TARGETS BEFORE RUN ==="
set target_text [targets]
if {$target_text eq ""} {
  error "No JTAG targets detected. Check Zybo power, USB-JTAG cable, and Digilent driver."
}

targets -set -filter {name =~ "APU*"}
rst -system
after 1000

fpga -file $bit_path
after 1000

targets -set -filter {name =~ "Cortex-A9 #0"}
dow $elf_path
con
after 5000
stop

puts "=== SELFTEST RESULT MEMORY ==="
mrd -force $result_addr 18
puts "Expected result word[0]=0x51563130 magic and word[1]=0x00000000 PASS."
