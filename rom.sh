ghdl -a rom.vhd
ghdl -e rom
ghdl -a rom_tb.vhd
ghdl -e rom_tb
ghdl -r rom_tb --stop-time=3000ns --wave=rom_tb.ghw
gtkwave rom_tb.ghw