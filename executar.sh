ghdl -a maquina_estados.vhd
ghdl -e maquina_estados
ghdl -a maquina_estados_tb.vhd
ghdl -e maquina_estados_tb
ghdl -a rom.vhd
ghdl -e rom
ghdl -a rom_tb.vhd
ghdl -e rom_tb
ghdl -a pc.vhd
ghdl -e pc
ghdl -a pc_tb.vhd
ghdl -e pc_tb
ghdl -a proto_uc.vhd
ghdl -e proto_uc
ghdl -a proto_uc_tb.vhd
ghdl -e proto_uc_tb
ghdl -a uc.vhd
ghdl -e uc
ghdl -a uc_tb.vhd
ghdl -e uc_tb
ghdl -r uc_tb --stop-time=3000ns --wave=uc_tb.ghw
gtkwave uc_tb.ghw
