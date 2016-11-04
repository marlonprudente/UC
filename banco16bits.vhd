library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity banco16bits is
	port(	readreg1	:	in unsigned(2 downto 0);
			readreg2	:	in unsigned(2 downto 0);
			wr_en 		:	in std_logic;
			clock		:	in std_logic;
			rst			:	in std_logic;
			wr_data		:	in unsigned(15 downto 0);
			readdata1	:	out unsigned(15 downto 0);
			readdata2	:	out unsigned(15 downto 0)
	);
end entity;

architecture a_banco16bits of banco16bits is
	component reg16bits is
		port(	clock		:	in std_logic;
				reset		:	in std_logic;
				wr_enable	:	in std_logic;
				data_in		:	in unsigned(15 downto 0);
				data_out	:	out unsigned (15 downto 0)
	);
	end component;

signal clk,rst, wr_enable : std_logic;
signal wr_en0,wr_en1,wr_en2,wr_en3,wr_en4,wr_en5,wr_en6,wr_en7	:	std_logic;

begin 
	wr_en0<=wr_en when readreg1="000" or readreg2="000";
	wr_en1<=wr_en when readreg1="001" or readreg2="001";
	wr_en2<=wr_en when readreg1="010" or readreg2="010";
	wr_en3<=wr_en when readreg1="011" or readreg2="011";
	wr_en4<=wr_en when readreg1="100" or readreg2="100";
	wr_en5<=wr_en when readreg1="101" or readreg2="101";
	wr_en6<=wr_en when readreg1="110" or readreg2="110";
	wr_en7<=wr_en when readreg1="111" or readreg2="111";

	reg0: reg16bits	port map(clock=>clk,reset=>rst,wr_enable=>wr_en0,data_in=> data_in,data_out=>data_out);
	reg1: reg16bits port map(clock=>clk,reset=>rst,wr_enable=>wr_en1,data_in=> data_in,data_out=> data_out);
	reg2: reg16bits port map(clock=>clk,reset=>rst,wr_enable=>wr_en2,data_in=> data_in,data_out=> data_out);
	reg3: reg16bits port map(clock=>clk,reset=>rst,wr_enable=>wr_en3,data_in=> data_in,data_out=> data_out);
	reg4: reg16bits port map(clock=>clk,reset=>rst,wr_enable=>wr_en4,data_in=> data_in,data_out=> data_out);
	reg5: reg16bits port map(clock=>clk,reset=>rst,wr_enable=>wr_en5,data_in=> data_in,data_out=> data_out);
	reg6: reg16bits port map(clock=>clk,reset=>rst,wr_enable=>wr_en6,data_in=> data_in,data_out=> data_out);
	reg7: reg16bits port map(clock=>clk,reset=>rst,wr_enable=>wr_en7,data_in=> data_in,data_out=> data_out);

	data_out0 <= "0000000000000000" when readreg1="000";