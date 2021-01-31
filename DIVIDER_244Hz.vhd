----------------------------------------------------------------------------------
-- Module Name:    Divider_244Hz - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Divider_244Hz is
    Port ( CLK : in  STD_LOGIC;
           CLK_244Hz : out  STD_LOGIC);
end Divider_244Hz;

architecture Behavioral of Divider_244Hz is
signal count: std_logic_vector (17 downto 0):=(others=>'0');
signal Qt_244, Qprevious_244: STD_LOGIC;

begin

	process (CLK)
	begin
		if CLK'event and CLK='1' then
			count <= count+1;
		end if;
	end process;

--Signal with frequency 244 Hz
	process(CLK)
	begin
		if CLK'event and CLK='1' then
				Qt_244 <= count(17);
				Qprevious_244 <= Qt_244;
		end if;
	end process;

	CLK_244Hz <= not (Qprevious_244) and Qt_244;
	
end Behavioral;

