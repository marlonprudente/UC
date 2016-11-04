library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ula_reg_mux is
	port(	
		clockurm		:	in std_logic;
		reseturm		:	in std_logic;
		wr_enurm		:	in std_logic;
		readreg1urm		:	in unsigned(2 downto 0);	
		readreg2urm		:	in unsigned(2 downto 0);
		saida_ula	:	out unsigned(15 downto 0);
		cte			:	in unsigned(15 downto 0)

	);
end entity;

architecture a_ula_reg_mux of ula_reg_mux is
	component bancoreg16bits is
	port(	readreg1	:	in unsigned(2 downto 0);
			readreg2	:	in unsigned(2 downto 0);
			wr_en		:	in std_logic;
			clk			:	in std_logic;
			rst			:	in std_logic;
			wr_data		:	in unsigned(15 downto 0);
			readdata1	:	out unsigned(15 downto 0);
			readdata2	:	out unsigned(15 downto 0)
	);
	end component;

	component ula is
		port(	
			x,y	:	in unsigned(15 downto 0);
			op	:	in unsigned(1 downto 0);
			soma,quoc, subtracao, maior	: inout unsigned(15 downto 0);
			saida	:	out unsigned(15 downto 0)
		);
	end component;

	component mux16bits is
	port(	entr0	:	in unsigned(15 downto 0);
			entr1	:	in unsigned(15 downto 0);
			op		: 	in std_logic;
			saida	:	out unsigned(15 downto 0)
	);
	end component;

	signal ula_banco,banco_mux,mux_ula,banco_ula	:	unsigned(15 downto 0);

	begin
	ula1: ula port map(x=>banco_ula,y=>mux_ula,op=>"00",saida=>ula_banco);
	banco: bancoreg16bits port map(readreg1=>readreg1urm,readreg2=>readreg2urm,wr_en=>wr_enurm,clk=>clockurm,rst=>reseturm,wr_data=>ula_banco,readdata1=>banco_ula,readdata2=>banco_mux);
	mux: mux16bits port map(entr0=>banco_mux,entr1=>cte,op=>'0',saida=>mux_ula);
	saida_ula<=ula_banco;

end architecture;
