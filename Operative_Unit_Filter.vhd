----------------------------------------------------------------------------------
-- Module Name:    Operative_Unit_Filter - Behavioral 
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

entity Operative_Unit_Filter is
    Port ( CLK : in  STD_LOGIC;
           RESET : in  STD_LOGIC;
           ENABLEM : in  STD_LOGIC;
           ENABLED : in  STD_LOGIC;
           SDATA : in  STD_LOGIC;
           NEW_SAMPLE : out  STD_LOGIC;
           PULSE_16 : out  STD_LOGIC;
           SCLK_20KHz : out  STD_LOGIC;
           OUTPUT : out  STD_LOGIC_VECTOR (11 downto 0):=(OTHERS=>'0');
           AVERAGE_OK : out  STD_LOGIC);
end Operative_Unit_Filter;

architecture Behavioral of Operative_Unit_Filter is

	COMPONENT DIVIDER_20KHz
	PORT(
		CLK : IN std_logic;
		RESET : IN std_logic;
		ENABLED : IN std_logic;          
		RISE_EDGE : OUT std_logic;
		PULSE_16 : OUT std_logic;
		SCLK_20KHz : OUT std_logic
		);
	END COMPONENT;

	COMPONENT DETECTOR_FALLING_EDGE
	PORT(
		CLK : IN std_logic;
		RESET : IN std_logic;
		SCLK_20KHz : IN std_logic;          
		FALL_EDGE : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT DIVIDER_4Hz
	PORT(
		CLK : IN std_logic;
		ENABLEM : IN std_logic;          
		NEW_SAMPLE : OUT std_logic
		);
	END COMPONENT;

	COMPONENT SHIFT_REGISTER
	PORT(
		CE : IN std_logic;
		CLK : IN std_logic;
		RESET : IN std_logic;
		SDATA : IN std_logic;          
		OUTPUT : OUT std_logic_vector(15 downto 0)
		);
	END COMPONENT;

	COMPONENT Average_Filter
	PORT(
		INPUT : IN std_logic_vector(11 downto 0);
		CE : IN std_logic;
		CLK : IN std_logic;
		RESET : IN std_logic;          
		OUTPUT : OUT std_logic_vector(11 downto 0);
		AVERAGE_OK : OUT std_logic
		);
	END COMPONENT;

signal SCLK20kHz_int: std_logic; 
signal FALL_EDGE_int, RISE_EDGE_int: std_logic;
signal saux: std_logic_vector (15 downto 0);
signal New_Sample_Aux: std_logic;	

begin

	Inst_DIVIDER_20KHz: DIVIDER_20KHz PORT MAP(
		CLK => CLK,
		RESET => RESET,
		ENABLED => ENABLED,
		RISE_EDGE => RISE_EDGE_int,
		PULSE_16 => PULSE_16,
		SCLK_20KHz => SCLK20kHz_int
	);
		SCLK_20KHz <= SCLK20kHz_int;

	Inst_DETECTOR_FALLING_EDGE: DETECTOR_FALLING_EDGE PORT MAP(
		CLK => CLK,
		RESET => RESET,
		SCLK_20KHz => SCLK20kHz_int,
		FALL_EDGE => FALL_EDGE_int
	);

	Inst_DIVIDER_4Hz: DIVIDER_4Hz PORT MAP(
		CLK => CLK,
		ENABLEM => ENABLEM,
		NEW_SAMPLE => New_Sample_Aux  
	);
	NEW_SAMPLE <= New_Sample_Aux;

	Inst_SHIFT_REGISTER: SHIFT_REGISTER PORT MAP(
		CE => FALL_EDGE_int,
		CLK => CLK,
		RESET => RISE_EDGE_int,
		SDATA => SDATA,
		OUTPUT => saux
	);

	Inst_Average_Filter: Average_Filter PORT MAP(
		INPUT => saux(11 downto 0),
		CE => New_Sample_Aux,
		CLK => CLK,
		RESET => RESET,
		OUTPUT => OUTPUT,
		AVERAGE_OK => AVERAGE_OK
	);

end Behavioral;
