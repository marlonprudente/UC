library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity proto_uc is
	port(
		data_in	: in unsigned(6 downto 0);
		data_out: out unsigned(6 downto 0)
	);
end entity;

architecture a_proto_uc of proto_uc is
	begin
	data_out <= data_in + "0000001";
end architecture;