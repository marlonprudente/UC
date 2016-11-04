library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity uc_tb is
end entity;

architecture a_uc_tb of uc_tb is
	component uc
	port(clk, rst, wr_en: in std_logic;
			dado		: out unsigned(7 downto 0)
	);
	end component;
	
	signal clk, rst, wr_en: std_logic;
	signal dado: unsigned(7 downto 0);
	
begin
	uut: uc port map(clk=>clk, rst=>rst, wr_en=>wr_en, dado=>dado);
	
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
		wait for 50 ns;
		rst <= '0';
		wait;
	end process;
	
	process
	begin
		wr_en <= '0';
		wait for 50 ns;
		wr_en <= '1';
		wait for 50 ns;
		wait;
	end process;
end architecture;