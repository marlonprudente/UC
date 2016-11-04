library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pc_tb is
end entity;

architecture a_pc_tb of pc_tb is
	component pc
		port( 	clk:		in std_logic;
				rst:		in std_logic;
				wr_en:	in std_logic;
				data_in:	in unsigned(7 downto 0);
				data_out:	out unsigned(7 downto 0)
	);
	end component;
	
	signal clk, rst, wr_en: std_logic;
	signal data_in, data_out: unsigned(7 downto 0);
	
begin
	uut: pc port map(clk=>clk, rst=>rst, wr_en=>wr_en, data_in=>data_in, data_out=>data_out);
	
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
		data_in <= "00000000";
		wait for 50 ns;
		data_in <= "00000010";
		wait for 50 ns;
		data_in <= "00001000";
		wait for 50 ns;
		data_in <= "00111100";
		wait for 50 ns;
		data_in <= "01011101";
		wait for 50 ns;
		data_in <= "11100000";
		wait for 50 ns;
		data_in <= "00000110";
		wait;
	end process;
end architecture;