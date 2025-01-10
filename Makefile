PROJ = test
PIN_DEF = constraints.pcf
DEVICE = hx1k

all: $(PROJ).bin

dependencies:
	pacman -Sy yosys
	# icestorm
	# nextpnr

%.bin:
	# todo: incorporate yosys into Makefile properly
	./yosys_build.sh
	nextpnr-ice40 --$(DEVICE) --freq 25 --pcf $(PIN_DEF) --json design.json --package vq100 --asc bitstream.txt
	icepack bitstream.txt $(PROJ).bin

prog: $(PROJ).bin
	iceprog $(PROJ).bin

clean:
	rm -f bitstream.txt $(PROJ).bin design.json

.PHONY: all prog clean