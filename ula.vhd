library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ula is
	port(	
			x,y	:	in unsigned(15 downto 0);
			op	:	in unsigned(1 downto 0);
			soma,quoc, subtracao, maior	: inout unsigned(15 downto 0);
			saida	:	out unsigned(15 downto 0)
	);
end entity;

architecture a_ula of ula is
begin
	soma <= x+y;
	subtracao <= x-y;

	if(y='0') then quoc = 0
	else
		quoc <= x/y ;
		
	end if;

	maior <= "0000000000000001" when x>y else
			 "0000000000000000" when x<=y else
			 "0000000000000000";
			 
	saida <= soma when op = "00"else
		subtracao when op = "01" else
		maior when op = "10" else
		quoc when op = "11" else
		"0000000000000000";

end architecture;
