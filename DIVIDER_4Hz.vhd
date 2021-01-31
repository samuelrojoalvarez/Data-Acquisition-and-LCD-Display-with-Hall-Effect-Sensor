----------------------------------------------------------------------------------
-- Module Name:    DIVIDER_4Hz - Behavioral 
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

entity DIVIDER_4Hz is
    Port ( CLK : in  STD_LOGIC;--50MHz that we get from the Board Basys 2
           ENABLEM : in  STD_LOGIC;
           NEW_SAMPLE : out  STD_LOGIC);
end DIVIDER_4Hz;

architecture Behavioral of DIVIDER_4Hz is

signal count: std_logic_vector (23 downto 0):=(others=>'0');
begin

	process (CLK) 
	begin
		if CLK'event and CLK='1' then
			if ENABLEM='1' then
				count <= count+1;
					if count = x"BEBC20" then --50E6Mhz/4Hz = 12.500.000 
						count <= (others=>'0');
					end if;
			end if;
		end if;
	end process;
	
	NEW_SAMPLE<='1' when count = x"BEBC20" else '0';--12.500.000 


end Behavioral;

