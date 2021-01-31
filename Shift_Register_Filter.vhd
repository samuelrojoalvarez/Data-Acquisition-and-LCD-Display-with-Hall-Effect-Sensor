----------------------------------------------------------------------------------
-- Module Name:    Shift_Register_Filter - Behavioral 
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

entity Shift_Register_Filter is
    Port ( INPUT : in  STD_LOGIC_VECTOR (11 downto 0);
           OUTPUT : out  STD_LOGIC_VECTOR (47 downto 0);
           CLK : in  STD_LOGIC;
           CE : in  STD_LOGIC;
           RESET : in  STD_LOGIC;
           AVERAGE_OK : out  STD_LOGIC);
end Shift_Register_Filter;

architecture Behavioral of Shift_Register_Filter is

signal aux: STD_LOGIC_VECTOR (47 downto 0);
signal count: STD_LOGIC_VECTOR (1 downto 0);

begin

	process(CLK, RESET)
	begin
		if RESET='1' then 
			aux   <= (others=>'0');
			count <= (others=>'1');
		elsif CLK'event and CLK='1' then
			if CE='1' then 
				aux(11 downto 0) <= INPUT;
				aux(47 downto 12)<= aux(35 downto 0);
				count <= count + 1;
			end if;
		end if;
	end process;

			OUTPUT <= aux;
			AVERAGE_OK<='1' when count = "11" else '0';


end Behavioral;

