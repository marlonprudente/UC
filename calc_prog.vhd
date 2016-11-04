library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity calc_prog is
	port(	clk,rst	: 	in std_logic;
			pc 		: 	out unsigned(16 downto 0);
			rom_out :	out unsigned(16 downto 0);
			regis1 	:	out unsigned(3 downto 0);
			regis2 	:	out unsigned(3 downto 0);
			ula_out :	out unsigned(16 downto 0);
			estado	: 	out unsigned(1 downto 0)
		);
end entity;

architecture a_calc_prog of calc_prog is

	signal clk,rst,wr_en : in std_logic;
	signal rom_out, ula_out, readdata1, readdata2 : out unsigned(16 downto 0);
	signal regis1,regis2 : in unsigned(2 downto 0);
	signal estado : out unsigned(1 downto 0);

	component rom is
		port ( 	clk		 : in std_logic;
				endereco : in unsigned(7 downto 0);
				dado     : out unsigned(16 downto 0)
			);
	end component;
	
	component pc is
		port( 	clk:		in std_logic;
				rst:		in std_logic;
				wr_en:		in std_logic;
				data_in:	in unsigned(16 downto 0);
				data_out:	out unsigned(16 downto 0)
	);
	end component;
	
	component proto_uc is
		port(
				data_in	: in unsigned(16 downto 0);
				data_out: out unsigned(16 downto 0)
	);
	end component;
	
	component maq_estados is
		port( 	clk : in std_logic;
				rst : in std_logic;
				estado: out unsigned(1 downto 0)
		);
	end component;

	component uc is
		port(	clk, rst, wr_en: in std_logic;			
				dado	: out unsigned(16 downto 0)
		);
	end component;

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


	begin

	uc0	: 	uc port map(
			clk => clk;
			rst => rst;
			wr_en => wr_en;
			dado => dado
		);

	maq0 : 	maq_estados port map(
			clk => clk;
			rst => rst;
			estado => estado

		);

	pc0	:	pc port map(
			clk => clk;
			rst => rst;
			wr_en => wr_en;
			data_in => data_in;
			data_out => data_out
		);

	ula0 : 	ula port map(
		x,y => data_in;
		op => op;
		soma, quoc, subtracao, maior => operacoes;
		saida => data_out
		);

	br0 : 	bancoreg16bits port map(
		readreg1 => regis1;
		readreg2 => regis2;
		wr_en => wr_en;
		clk => clk;
		rst => rst;
		wr_data => wr_data;
		readdata1 => readdata1;
		readdata2 => readdata2
		)

end architecture ; -- arch