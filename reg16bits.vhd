library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg16bits is
	port(	clock		:	in std_logic;
			reset		:	in std_logic;
			wr_enable	:	in std_logic;
			data_in		:	in unsigned(15 downto 0);
			data_out	:	out unsigned (15 downto 0)
	);
end entity;

architecture a_reg16bits of reg16bits is
	signal registro:	unsigned(15 downto 0);

begin
	process(clock,reset,wr_enable)
	begin
		if reset='1' then
			registro <= "0000000000000000";
		elsif wr_enable='1' then
			if	rising_edge(clock) then
				registro <= data_in;
			end if;			
		end if;
	end process;

	data_out <= registro;
end architecture;