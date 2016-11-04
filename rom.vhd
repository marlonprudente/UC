library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity rom is
	port( 
		clk		: in std_logic;
		endereco: in unsigned(7 downto 0);
		dado	: out unsigned(16 downto 0)
	);
end entity;

architecture a_rom of rom is
	type mem is array (0 to 127) of unsigned(16 downto 0);
	constant conteudo_rom : mem := (
		0  => "01000001000000010",
		1  => "00010100000100000",
		2  => "00100000000100000",
		3  => "00100110000100000",
		4  => "00110100000100000",
		5  => "00100000010000010",
		6  => "00100111100000011",
		7  => "00100000010110010",
		8  => "01111000000001010",
		9  => "00000001100000000",
		10 => "00001000000001100",
		
		others => (others=>'0')
	);
	
begin
	process(clk)
	begin
		if(rising_edge(clk)) then
			dado <= conteudo_rom(to_integer(endereco));
		end if;
	end process;
end architecture;

