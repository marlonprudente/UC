library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ula_tb is
end entity;

architecture a_ula_tb of ula_tb is
	component ula is
		port ( x,y : in unsigned(15 downto 0);
		   op : in unsigned(1 downto 0);
		   soma, subtracao, quoc : inout unsigned(15 downto 0);
		   maior 	: inout unsigned(15 downto 0);
		   saida : out unsigned(15 downto 0)
		);
	end component;

	signal num_a,num_b,somar,subtrair,maior_ou_igual,quociente,sai: unsigned(15 downto 0);
	signal seleciona: unsigned(1 downto 0);
	 
	begin
		uut: ula port map(
			x=>num_a,
			y=>num_b,
			op=>seleciona,
			soma=>somar,
			subtracao=>subtrair,
			maior=>maior_ou_igual,
			quoc=>quociente,
			saida=>sai
		);
	
	process
		begin
			seleciona <= "00";
			num_a <= "0000000000000001";
			num_b <= "0000000000000001";
			wait for 50 ns;
			seleciona <= "01";
			wait for 50 ns;
			seleciona <= "10";
			wait for 50 ns;
			seleciona <= "11";
			wait for 50 ns;
			seleciona <= "00";
			wait for 50 ns;
			seleciona <= "00";
			num_a <= "1111111111111111";
			num_b <= "0000000000000001";
			wait for 50 ns;
			seleciona <= "01";
			wait for 50 ns;
			seleciona <= "10";
			wait for 50 ns;
			seleciona <= "11";
			wait for 50 ns;
			seleciona <= "00";
			wait for 50 ns;
			num_a <= "0000000000000001";
			num_b <= "1111111111111111";
			wait for 50 ns;
			seleciona <= "01";
			wait for 50 ns;
			seleciona <= "10";
			wait for 50 ns;
			seleciona <= "11";
			wait for 50 ns;
			seleciona <= "00";
			wait for 50 ns;
			num_a <= "1110101001100000";
			num_b <= "0010011100010000";
			wait for 50 ns;
			seleciona <= "01";
			wait for 50 ns;
			seleciona <= "10";
			wait for 50 ns;
			seleciona <= "11";
			wait for 50 ns;
			seleciona <= "00";
			wait for 50 ns;
			
		wait;
			
	end process;
		
end architecture;