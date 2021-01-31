----------------------------------------------------------------------------------
-- Module Name:    DIVIDER_20KHz - Behavioral 
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

entity DIVIDER_20KHz is
    Port ( CLK : in  STD_LOGIC;
			  RESET : in  STD_LOGIC;
           ENABLED : in  STD_LOGIC;
			  RISE_EDGE: out  STD_LOGIC;
           PULSE_16 : out  STD_LOGIC;
           SCLK_20KHz : out  STD_LOGIC);
end DIVIDER_20KHz;

architecture Behavioral of DIVIDER_20KHz is

signal count: integer range 0 to 1249:=0;
signal CLK20kHz_aux: std_logic:='1'; --In order to begin in the fallin edge														
--signal contador_pulsos: integer range 0 to 32:=0;
signal counter_pulses: std_logic_vector (4 downto 0):=(others=>'0');
signal pulse_16_aux: std_logic:='0';
signal Qprevious, Qt: std_logic;

begin

	process(CLK, RESET)
	begin
		if Reset = '1' then
			Qt<='0';
			Qprevious<='0';
		elsif CLK'event and CLK='1' then
			if ENABLED='1' then
				Qt<=ENABLED;
				Qprevious<=Qt;
				
				count <= count + 1;	-- Counter that count 1249 counts for get the accurate frequency of 20kHz			
				if count = 1249 then
					CLK20kHz_aux <= not(CLK20kHz_aux);
					count <= 0; --Start another time the count of 1249																	
					counter_pulses <= counter_pulses + 1; --In order to control that we have 16 pulses of SCLK20KHz
					--if counter_pulses=31 then we check If has 16 pulses																
					if counter_pulses = "11111" then
						pulse_16_aux <= '1';
						--counter_pulses<=0; --Restart the counter of pulses when we reach the 16 pulses that we need		
						counter_pulses <= "00000";
					end if;
				end if;
			else --When isn't enebled the generate of pulses, we start the variables 											
				pulse_16_aux <= '0';
				CLK20kHz_aux <= '0';
			end if; 
		end if;
	end process;
	RISE_EDGE <= not(Qprevious) and Qt;
	SCLK_20KHZ <= CLK20kHz_aux;
	PULSE_16 <= pulse_16_aux;

end Behavioral;

