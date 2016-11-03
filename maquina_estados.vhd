library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity maquina_estados is
	port(clk		: in  std_logic;
		 rst 	: in  std_logic;
		 estado	: out std_logic
 );
end entity;
	
architecture a_maquina_estados of maquina_estados is
	signal estado_sinal: std_logic;
	begin
		process(clk,rst)
		begin
			if rst='1' then
				estado_sinal <= '0';
			elsif rising_edge(clk) then
				estado_sinal <= not estado_sinal;
			end if;
		end process;
	estado <= estado_sinal;
end architecture;
