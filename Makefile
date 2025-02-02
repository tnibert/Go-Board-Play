PROJ = test
PIN_DEF = constraints.pcf
DEVICE = hx1k

all: $(PROJ).bin

dependencies:
	pacman -Sy yosys iverilog
	# icestorm
	# nextpnr

simulate:
	iverilog '-Wall' '-g2012' debounce.v debounce_testbench.v 
	# && unbuffer vvp a.out

%.bin:
	# todo: incorporate yosys into Makefile properly
	./yosys_build.sh
	nextpnr-ice40 --$(DEVICE) --freq 25 --pcf $(PIN_DEF) --json design.json --package vq100 --asc bitstream.txt --pcf-allow-unconstrained
	icepack bitstream.txt $(PROJ).bin

prog: $(PROJ).bin
	iceprog $(PROJ).bin

clean:
	rm -f bitstream.txt $(PROJ).bin design.json a.out

.PHONY: all prog clean
