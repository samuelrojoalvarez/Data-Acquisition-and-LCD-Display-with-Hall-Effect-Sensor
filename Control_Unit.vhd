----------------------------------------------------------------------------------
-- Module Name:    Control_Unit - Behavioral 
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

entity Control_Unit is
    Port ( CLK : in  STD_LOGIC;
           NEW_SAMPLE : in  STD_LOGIC;
           PULSE_16 : in  STD_LOGIC;
           RESET : in  STD_LOGIC;
           CS : out  STD_LOGIC;
           ENABLED : out  STD_LOGIC;
           ENABLEM : out  STD_LOGIC);
end Control_Unit;

architecture Behavioral of Control_Unit is

	type type_state is (E0,E1,E2);
	signal actual_state: type_state;
	signal next_state: type_state;
	
begin

		process(CLK, RESET)
		begin
			if RESET = '1' then 
				actual_state <= E0;
			elsif clk'event and clk = '1' then 
				actual_state <= next_state;
			end if;
		end process;

		process(RESET, PULSE_16, NEW_SAMPLE, actual_state)
		begin
			case actual_state is
				when E0=> if RESET = '0' then 
								next_state <= E1; 
							 else 
								next_state <= E0; 
							 end if;
							 
				when E1=> if PULSE_16 = '1' then 
								next_state <= E2; 
							 else 
								next_state <= E1; 
							 end if;
				when E2=> if NEW_SAMPLE = '1' then
								next_state <= E0; 
							 else 
								next_state <= E2; 
							end if;
				when others=> next_state <= E0;
			end case;
		end process;
 
CS<='0' 		 when actual_state = E1 else '1';
ENABLED<='1' when actual_state = E1 else '0';
ENABLEM<='1' when actual_state = E1 or actual_state = E2 else '0';



end Behavioral;

