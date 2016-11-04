library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux16bits is
	port(	entr0	:	in unsigned(15 downto 0);
			entr1	:	in unsigned(15 downto 0);
			op		: 	in std_logic;
			saida	:	out unsigned(15 downto 0)

	);
end entity;

architecture a_mux16bits of mux16bits is
	begin
		saida <=entr0 when op='0' else
				entr1 when op='1' else
				"0000000000000000";
end architecture;
