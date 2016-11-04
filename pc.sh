ghdl -a proto_uc.vhd
ghdl -e proto_uc
ghdl -a proto_uc_tb.vhd
ghdl -e proto_uc_tb
ghdl -a pc.vhd
ghdl -e pc
ghdl -a pc_tb.vhd
ghdl -e pc_tb
ghdl -r pc_tb --stop-time=6000ns --wave=pc_tb.ghw
gtkwave pc_tb.ghw