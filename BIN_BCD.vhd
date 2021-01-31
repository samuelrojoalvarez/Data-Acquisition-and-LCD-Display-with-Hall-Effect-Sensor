----------------------------------------------------------------------------------
-- Module Name:    BIN_BCD - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity BIN_BCD is
    Port ( b : in  STD_LOGIC_VECTOR (11 downto 0);
           p : out  STD_LOGIC_VECTOR (15 downto 0));
end BIN_BCD;

architecture Behavioral of BIN_BCD is

begin

process (b)
variable z: std_logic_vector(27 downto 0);
begin

	for i in 0 to 27 loop
		z(i):='0';
	end loop;
	z(14 downto 3):=b;
	
	for i in 0 to 8 loop
		if z(15 downto 12)>4 then
			z(15 downto 12):=z(15 downto 12)+3;
		end if;
		if z(19 downto 16)>4 then
			z(19 downto 16):=z(19 downto 16)+3;
		end if;
		if z(23 downto 20)>4 then
			z(23 downto 20):=z(23 downto 20)+3;
		end if;
		if z(27 downto 24)>4 then
			z(27 downto 24):=z(27 downto 24)+3;
		end if;
		z(27 downto 1):=z(26 downto 0);
	end loop;
	p<=z(27 downto 12);
	
end process;

end Behavioral;

