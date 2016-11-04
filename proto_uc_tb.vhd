library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity proto_uc_tb is
end;

architecture a_proto_uc_tb of proto_uc_tb is
	component proto_uc
		port(
			data_in	: in unsigned(7 downto 0);
			data_out: out unsigned(7 downto 0)
		);
	end component;
	signal data_in,data_out: unsigned(7 downto 0);
begin
	uut : proto_uc port map(data_in => data_in,data_out => data_out);
	process
	begin
		data_in <= "00000000";
		wait for 50 ns;
		data_in <= "00000001";
		wait for 50 ns;
		data_in <= "00001100";
		wait for 50 ns;
		data_in <= "00011111";
		wait for 50 ns;
		data_in <= "01111100";
		wait;
		
	end process;
end architecture;