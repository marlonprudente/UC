
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity rom_tb is
end entity;

architecture arom_tb of rom_tb is
	component rom is
		port ( clk		: in std_logic;
			   endereco : in unsigned(16 downto 0);
			   dado		: out unsigned(16 downto 0)
		);
	end component;
	
	signal clk,wr_en 	: std_logic;
	signal endereco : unsigned(16 downto 0);
	signal dado		: unsigned(16 downto 0);
	 
	begin
		uut: rom port map(
			clk => clk,
			endereco => endereco,
			dado => dado
		);
		
	process
		begin
			clk<='0';
			wait for 25 ns;
			clk<='1';
			wait for 25 ns;
		end process;
		
	process
		begin
			endereco<="00000000000000000";
			wait for 100 ns;
			endereco<="00000000000000001";
			wait for 100 ns;
			endereco<="00000000000000010";
			wait for 100 ns;
			endereco<="00000000000000011";
			wait for 100 ns;
			endereco<="00000000000000100";
			wait for 100 ns;
			endereco<="00000000000000101";
			wait for 100 ns;
			endereco<="00000000000000110";
			wait for 100 ns;
			endereco<="00000000000000111";
			wait for 100 ns;
			endereco<="00000000000001000";
			wait for 100 ns;
			endereco<="00000000000001001";
			wait for 100 ns;
			endereco<="00000000000001010";
			wait for 100 ns;
						
	end process;
		
end architecture;
