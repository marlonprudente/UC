library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ula_reg_mux_tb is
end entity;

architecture a_ula_reg_mux_tb of ula_reg_mux_tb is
	component ula_reg_mux is
	port(	
		clockurm		:	in std_logic;
		reseturm		:	in std_logic;
		wr_enurm		:	in std_logic;
		readreg1urm		:	in unsigned(2 downto 0);	
		readreg2urm		:	in unsigned(2 downto 0);
		saida_ula	:	out unsigned(15 downto 0);
		cte			:	in unsigned(15 downto 0)

	);
	end component;

	signal clkurm,rsturm,wr_enurm:	std_logic;
	signal rreg1,rreg2 	:	unsigned(2 downto 0);
	signal cte	:	unsigned(15 downto 0);
	signal datain,dataout1,dataout2: unsigned(15 downto 0);

	begin
	uut: ula_reg_mux port map(
		readreg1urm=>rreg1,
		readreg2urm=>rreg2,
		--wr_data=>datain,
		--readdata1=>dataout1,
		--readdata2=>dataout2,
		clockurm=>clkurm,
		cte=>cte,
		reseturm=>rsturm,
		wr_enurm=>wr_enurm
		);

		process
	begin
		clkurm <='0';
		wait for 50 ns;
		clkurm <= '1';
		wait for 50 ns;	--ficará em loop
	end process;

	process
	begin
		rsturm <= '1';
		wait for 100 ns;
		rsturm <= '0';
		wait;		--não ficará em loop
	end process;

	process
	begin
		wait for 100 ns;
		wr_enurm <='1';
		rreg1 <= "000";
		datain <= "1111000011111111";
		wait for 100 ns;
		wr_enurm <='0';
		datain <= "1111111111111111";
		wait for 100 ns;
		wr_enurm <='1';
		rreg1 <= "001";
		datain <= "1111000011111111";
		wait for 100 ns;
		wr_enurm <='0';
		datain <= "1111111111111111";
		wait for 100 ns;
		wr_enurm <='1';
		rreg1 <= "010";
		datain <= "1111000011111111";
		wait for 100 ns;
		wr_enurm <='0';
		datain <= "1111111111111111";
		wait for 100 ns;
		wr_enurm <='1';
		rreg1 <= "011";
		datain <= "1111000011111111";
		wait;
	end process;

		process
	begin
		wait for 100 ns;
		wr_enurm <='1';
		rreg2 <= "000";
		datain <= "1111000011111111";
		wait for 100 ns;
		wr_enurm <='0';
		datain <= "1111111111111111";
		wait for 100 ns;
		wr_enurm <='1';
		rreg2 <= "001";
		datain <= "1111000011111111";
		wait for 100 ns;
		wr_enurm <='0';
		datain <= "1111111111111111";
		wait for 100 ns;
		wr_enurm <='1';
		rreg2 <= "010";
		datain <= "1111000011111111";
		wait for 100 ns;
		wr_enurm <='0';
		datain <= "1111111111111111";
		wait for 100 ns;
		wr_enurm <='1';
		rreg2 <= "011";
		datain <= "1111000011111111";
		wait;
	end process;

end architecture;