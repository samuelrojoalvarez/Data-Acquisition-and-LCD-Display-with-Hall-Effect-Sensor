----------------------------------------------------------------------------------
-- Module Name:    DETECTOR_FALLING_EDGE - Behavioral 
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

entity DETECTOR_FALLING_EDGE is
    Port ( CLK : in  STD_LOGIC;
           RESET : in  STD_LOGIC;
           SCLK_20KHz : in  STD_LOGIC;
           FALL_EDGE : out  STD_LOGIC);
end DETECTOR_FALLING_EDGE;

architecture Behavioral of DETECTOR_FALLING_EDGE is

signal Qprevious, Qt: std_logic;
begin

	process(CLK, RESET)
	begin
		if RESET = '1' then
			Qt <= '0';
			Qprevious<='0';
		elsif CLK'event and CLK = '1' then
			Qt <= SCLK_20KHZ;
			Qprevious <= Qt;
		end if;
	end process;

	FALL_EDGE <= Qprevious and (not (Qt));


end Behavioral;

