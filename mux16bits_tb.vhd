library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux16bits_tb is
end entity;

architecture a_mux16bits_tb of mux16bits_tb is
	component mux16bits is
		port(
			entr0	:	in unsigned(15 downto 0);
			entr1	:	in unsigned(15 downto 0);
			op		: 	in std_logic;
			saida	:	out unsigned(15 downto 0)
			);
	end component;

	signal entr0,entr1,saida:	unsigned(15 downto 0);
	signal op:	std_logic;

	begin
		utt: mux16bits port map(
			entr0=>entr0,
			entr1=>entr1,
			op=>op,
			saida=>saida
			);

	process
		begin
			op<='0';
			wait for 90 ns;
			entr0<="0000000000000001";
			op<='1';
			wait for 90 ns;
			entr1<="0000000000000011";
			op<='0';
			wait for 90 ns;
			entr0<="0000000000000001";
			op<='1';
			wait for 90 ns;
			entr1<="0000000000000001";
			op<='0';
			wait for 90 ns;
			entr0<="0000000000000001";
			op<='1';
			wait for 90 ns;
			entr1<="0000000000000001";
			op<='0';
			wait for 90 ns;
			entr1<="0000000000000001";
			op<='1';
			wait for 90 ns;

		wait;

	end process;

end architecture;

