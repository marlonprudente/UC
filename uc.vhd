library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity uc is
	port(clk, rst, wr_en: in std_logic;
			dado		: out unsigned(7 downto 0)
	);
end entity;

architecture a_uc of uc is

	signal data_in_pc,data_out_pc: unsigned(7 downto 0);
	signal endereco :  unsigned(7 downto 0);
	signal estado, wr_en_pc, jump_en:	std_logic;
	signal instruction: unsigned(16 downto 0);
	signal opcode: unsigned(2 downto 0);

	component rom is
		port ( 	clk		 : in std_logic;
				endereco : in unsigned(7 downto 0);
				dado     : out unsigned(16 downto 0)
			);
	end component;

	component proto_uc is
		port(
			data_in : in unsigned(7 downto 0);
			data_out : out unsigned (7 downto 0)
			);
	end component;
	
	component pc is
		port( 	clk:		in std_logic;
				rst:		in std_logic;
				wr_en:		in std_logic;
				data_in:	in unsigned(7 downto 0);
				data_out:	out unsigned(7 downto 0)
	);
	end component;
	
	component maquina_estados is
		port( clk : in std_logic;
				rst : in std_logic;
				estado: out std_logic
		);
	end component;
	
	begin

	proto_uc0 : proto_uc port map(
				data_in => data_out_pc,
				data_out => data_in_pc
		);

	pc0 : pc port map (
			clk      => clk,
			rst      => rst,
			wr_en    => wr_en_pc,
			data_in  => data_in_pc,
			data_out => data_out_pc
			);
	
	rom0 : rom port map (
			clk      => clk,
			endereco => data_out_pc,
			dado     => instruction
			);

	me0 : maquina_estados port map (
					clk     => clk,
					rst     => rst,
					estado 	=> estado
					);

	data_in_pc <= 	data_out_pc + 1 when wr_en_pc = '1' and jump_en = '0' else
		endereco(7 downto 0) when wr_en_pc = '1' and jump_en = '1'
		else "00000000";

	wr_en_pc <= '1' when estado = '1' else '0' when estado = '0' else '0';

	opcode <= instruction(16 downto 14);
	
		-- nop : 0000
		-- jump : 1111
		
	jump_en <= '1' when opcode = "111" else '0';

	dado <= data_out_pc;
end architecture;