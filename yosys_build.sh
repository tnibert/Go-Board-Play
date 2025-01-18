#! /bin/bash

# yosys command
# in shell script because Make doesn't love heredoc

yosys <<EOF
read_verilog top.v
read_verilog led_toggle.v
read_verilog debounce.v
synth_ice40
write_json design.json
EOF
