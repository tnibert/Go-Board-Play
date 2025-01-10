#! /bin/bash

# this is just a shell script that does what the Makefile does
# just a reference

set -e

#iverilog top.v
#yosys -q -p 'synth_ice40 -top top -json design.json' $in
yosys <<EOF
read_verilog top.v
synth_ice40
write_json design.json
EOF

nextpnr-ice40 --hx1k --freq 25 --pcf constraints.pcf --json design.json --package vq100 --asc bitstream.txt
icepack bitstream.txt bitstream.bin

#iceprog bitstream.bin
