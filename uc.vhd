library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity uc is
	port(clk, rst, wr_en: in std_logic;
			dado		: out unsigned(16 downto 0)
	);
end entity;

architecture a_uc of uc is

	signal data_in_pc,data_out_pc: unsigned(6 downto 0);
	signal estado, wr_en_pc, jump_en:	std_logic;
	signal instruction: unsigned(16 downto 0);
	signal opcode: unsigned(2 downto 0);

	component rom is
		port ( 	clk		 : in std_logic;
				endereco : in unsigned(6 downto 0);
				dado     : out unsigned(16 downto 0)
			);
	end component;
	
	component pc is
		port( 	clk:		in std_logic;
				rst:		in std_logic;
				wr_en:	in std_logic;
				data_in:	in unsigned(6 downto 0);
				data_out:	out unsigned(6 downto 0)
	);
	end component;
	
	component proto_uc is
		port(
		data_in	: in unsigned(6 downto 0);
		data_out: out unsigned(6 downto 0)
	);
	end component;
	
	component maquina_estados is
		port( clk : in std_logic;
				rst : in std_logic;
				estado: out std_logic
		);
	end component;
	
	begin

	pc0 : pc port map (
			clk      => clk_pc,
			rst      => rst,
			wr_en    => wr_en_pc,
			data_in  => pc_in,
			data_out => pc_out
			);
	rom0 : rom port map (
			clk      => clk_rom,
			endereco => endereco,
			dado     => rom_o
			);

	me0 : maquina_estados port map (
					clk      => clk,
					rst      => rst,
					estado => estado
					);

	opcode <= instruction(16 downto 13);
	
		-- nop : 0000
		-- jump : 1111
		
		jump_end <= instruction(6 downto 0) when opcode = "1111" else
					  1 + data_in_pc;

end architecture;