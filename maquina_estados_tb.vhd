library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity maquina_estados_tb is
end entity;

architecture a_maquina_estados_tb of maquina_estados_tb is
	component maquina_estados
		port(	clk : in std_logic; --clock
				rst : in std_logic; --reset
				estado: out std_logic
	);
	end component;
	
	signal clk, rst, estado: std_logic;
	
begin
	uut: maquina_estados port map (clk=>clk,rst=>rst, estado=>estado);
	
	process
	begin
	clk <= '0';
		wait for 50 ns;
		clk <= '1';
		wait for 50 ns;
	end process;
	
	process
	begin
		rst <= '1';
		wait for 100 ns;
		rst <= '0';
		wait;
	end process;
end architecture;