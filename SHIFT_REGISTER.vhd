----------------------------------------------------------------------------------
-- Module Name:    SHIFT_REGISTER - Behavioral 
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

entity SHIFT_REGISTER is
    Port ( CE : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           RESET : in  STD_LOGIC;
           SDATA : in  STD_LOGIC;
           OUTPUT : out  STD_LOGIC_VECTOR (15 downto 0));
end SHIFT_REGISTER;

architecture Behavioral of SHIFT_REGISTER is

signal s_aux: std_logic_vector (15 downto 0):=(others=>'0');
begin

	process(RESET, CLK)
	begin
		if RESET='1' then
			s_aux <= (others=>'0');
		elsif CLK'event and CLK='1' then
			if CE='1' then
				s_aux(0) <= SDATA;
				s_aux(15 downto 1) <= s_aux(14 downto 0);
			end if;
		end if;
	end process; 
	
	OUTPUT <= s_aux;


end Behavioral;

