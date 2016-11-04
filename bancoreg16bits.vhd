library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bancoreg16bits is
	port(	readreg1	:	in unsigned(2 downto 0);
			readreg2	:	in unsigned(2 downto 0);
			wr_en		:	in std_logic;
			clk			:	in std_logic;
			rst			:	in std_logic;
			wr_data		:	in unsigned(15 downto 0);
			readdata1	:	out unsigned(15 downto 0);
			readdata2	:	out unsigned(15 downto 0)

	);
end entity;

architecture a_bancoreg16bits of bancoreg16bits is
	component reg16bits is
		port(	clock		:	in std_logic;
				reset		:	in std_logic;
				wr_enable	:	in std_logic;
				data_in		:	in unsigned(15 downto 0);
				data_out	:	out unsigned (15 downto 0)
	);
	end component;

--signal clk,rst, wr_enable : std_logic;
signal wr_en0,wr_en1,wr_en2,wr_en3,wr_en4,wr_en5,wr_en6,wr_en7	:	std_logic;
signal data_out0,data_out1,data_out2,data_out3,data_out4,data_out5,data_out6,data_out7,data_in	:	unsigned(15 downto 0);
begin 
	wr_en0<=wr_en when readreg1="000" or readreg2="000";
	wr_en1<=wr_en when readreg1="001" or readreg2="001";
	wr_en2<=wr_en when readreg1="010" or readreg2="010";
	wr_en3<=wr_en when readreg1="011" or readreg2="011";
	wr_en4<=wr_en when readreg1="100" or readreg2="100";
	wr_en5<=wr_en when readreg1="101" or readreg2="101";
	wr_en6<=wr_en when readreg1="110" or readreg2="110";
	wr_en7<=wr_en when readreg1="111" or readreg2="111";


	reg0: reg16bits	port map(clock=>clk,reset=>rst,wr_enable=>wr_en0,data_in=> data_in,data_out=>data_out0);
	reg1: reg16bits port map(clock=>clk,reset=>rst,wr_enable=>wr_en1,data_in=> data_in,data_out=> data_out1);
	reg2: reg16bits port map(clock=>clk,reset=>rst,wr_enable=>wr_en2,data_in=> data_in,data_out=> data_out2);
	reg3: reg16bits port map(clock=>clk,reset=>rst,wr_enable=>wr_en3,data_in=> data_in,data_out=> data_out3);
	reg4: reg16bits port map(clock=>clk,reset=>rst,wr_enable=>wr_en4,data_in=> data_in,data_out=> data_out4);
	reg5: reg16bits port map(clock=>clk,reset=>rst,wr_enable=>wr_en5,data_in=> data_in,data_out=> data_out5);
	reg6: reg16bits port map(clock=>clk,reset=>rst,wr_enable=>wr_en6,data_in=> data_in,data_out=> data_out6);
	reg7: reg16bits port map(clock=>clk,reset=>rst,wr_enable=>wr_en7,data_in=> data_in,data_out=> data_out7);

	data_out0 <= "0000000000000000";

	process(clk)
	begin
		if rising_edge(clk) then
			case readreg1 is
					when "000" => readdata1 <= data_out0;
					when "001" => readdata1 <= data_out1;
					when "010" => readdata1 <= data_out2;
					when "011" => readdata1 <= data_out3;
					when "100" => readdata1 <= data_out4;
					when "101" => readdata1 <= data_out5;
					when "110" => readdata1 <= data_out6;
					when "111" => readdata1 <= data_out7;
					when others => readdata1 <= "0000000000000000";
			end case;

			case readreg2 is
					when "000" => readdata2 <= data_out0;
					when "001" => readdata2 <= data_out1;
					when "010" => readdata2 <= data_out2;
					when "011" => readdata2 <= data_out3;
					when "100" => readdata2 <= data_out4;
					when "101" => readdata2 <= data_out5;
					when "110" => readdata2 <= data_out6;
					when "111" => readdata2 <= data_out7;
					when others => readdata2 <= "0000000000000000";
			end case;
		end if;
	end process;

end architecture;