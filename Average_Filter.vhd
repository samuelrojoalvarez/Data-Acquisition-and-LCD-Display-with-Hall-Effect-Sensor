----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:03:33 07/11/2018 
-- Design Name: 
-- Module Name:    Average_Filter - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Average_Filter is
    Port (INPUT : in  STD_LOGIC_VECTOR (11 downto 0);
           CE : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           RESET : in  STD_LOGIC;
           OUTPUT : out  STD_LOGIC_VECTOR (11 downto 0);
           AVERAGE_OK : out  STD_LOGIC);
end Average_Filter;

architecture Behavioral of Average_Filter is

	COMPONENT SUM_4_Inputs
	PORT(
		A : IN std_logic_vector(11 downto 0);
		B : IN std_logic_vector(11 downto 0);
		C : IN std_logic_vector(11 downto 0);
		D : IN std_logic_vector(11 downto 0);          
		SUM : OUT std_logic_vector(13 downto 0)
		);
	END COMPONENT;

	COMPONENT Shift_Register_Filter
	PORT(
		INPUT : IN std_logic_vector(11 downto 0);
		CLK : IN std_logic;
		CE : IN std_logic;
		RESET : IN std_logic;          
		OUTPUT : OUT std_logic_vector(47 downto 0);
		AVERAGE_OK : OUT std_logic
		);
	END COMPONENT;

signal OUTPUT_int: std_logic_vector(47 downto 0);
signal AVERAGE_OK_int, Qt, Qprevious: std_logic;
signal SUM_int: std_logic_vector(13 downto 0);

begin

	Inst_SUM_4_Inputs: SUM_4_Inputs PORT MAP(
		A => OUTPUT_int(11 downto 0),
		B => OUTPUT_int(23 downto 12),
		C => OUTPUT_int(35 downto 24),
		D => OUTPUT_int(47 downto 36),
		SUM => SUM_int
	);

	Inst_Shift_Register_Filter: Shift_Register_Filter PORT MAP(
		INPUT => INPUT,
		OUTPUT => OUTPUT_int,
		CLK => CLK,
		CE => CE,
		RESET => RESET,
		AVERAGE_OK => AVERAGE_OK_int
	);

	process(CLK)
	begin
		if CLK'event and CLK='1' then
			if AVERAGE_OK_int = '1' then  
				OUTPUT <=SUM_int (13 downto 2);
			end if;
		end if;
	end process;
	
	process(CLK)
	begin
		if CLK'event and CLK='1' then
			Qt <= AVERAGE_OK_int;
			Qprevious <= Qt;
		end if;
	end process;
	AVERAGE_OK <= not(Qprevious) and Qt;



end Behavioral;

