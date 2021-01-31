----------------------------------------------------------------------------------
-- Module Name:    ReadingAD - Behavioral 
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

entity ReadingAD is
    Port ( RESET : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           SDATA : in  STD_LOGIC;
           CS : out  STD_LOGIC;
           SCLK_20KHz : out  STD_LOGIC;
           OUTPUT : out  STD_LOGIC_VECTOR (11 downto 0):=(others=>'0');
           AVERAGE_OK : out  STD_LOGIC);
end ReadingAD;

architecture Behavioral of ReadingAD is

	COMPONENT Operative_Unit_Filter
	PORT(
		CLK : IN std_logic;
		RESET : IN std_logic;
		ENABLEM : IN std_logic;
		ENABLED : IN std_logic;
		SDATA : IN std_logic;          
		NEW_SAMPLE : OUT std_logic;
		PULSE_16 : OUT std_logic;
		SCLK_20KHz : OUT std_logic;
		OUTPUT : OUT std_logic_vector(11 downto 0);
		AVERAGE_OK : OUT std_logic
		);
	END COMPONENT;

	COMPONENT Control_Unit
	PORT(
		CLK : IN std_logic;
		NEW_SAMPLE : IN std_logic;
		PULSE_16 : IN std_logic;
		RESET : IN std_logic;          
		CS : OUT std_logic;
		ENABLED : OUT std_logic;
		ENABLEM : OUT std_logic
		);
	END COMPONENT;


signal ENABLED_aux, ENABLEM_aux, PULSE_16_aux, NEW_SAMPLE_aux: std_logic;

begin

	Inst_Operative_Unit_Filter: Operative_Unit_Filter PORT MAP(
		CLK => CLK,
		RESET => RESET,
		ENABLEM => ENABLEM_aux,
		ENABLED => ENABLED_aux,
		SDATA => SDATA,
		NEW_SAMPLE => NEW_SAMPLE_aux,
		PULSE_16 => PULSE_16_aux,
		SCLK_20KHz => SCLK_20KHz,
		OUTPUT => OUTPUT,
		AVERAGE_OK => AVERAGE_OK
	);

	Inst_Control_Unit: Control_Unit PORT MAP(
		CLK => CLK,
		NEW_SAMPLE => NEW_SAMPLE_aux,
		PULSE_16 => PULSE_16_aux,
		RESET => RESET,
		CS => CS,
		ENABLED => ENABLED_aux,
		ENABLEM => ENABLEM_aux
	);



end Behavioral;
