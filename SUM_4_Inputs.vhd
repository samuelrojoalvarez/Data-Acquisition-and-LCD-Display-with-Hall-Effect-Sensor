----------------------------------------------------------------------------------
-- Module Name:    SUM_4_Inputs - Behavioral 
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

entity SUM_4_Inputs is
    Port ( A : in  STD_LOGIC_VECTOR (11 downto 0);
           B : in  STD_LOGIC_VECTOR (11 downto 0);
           C : in  STD_LOGIC_VECTOR (11 downto 0);
           D : in  STD_LOGIC_VECTOR (11 downto 0);
           SUM : out  STD_LOGIC_VECTOR (13 downto 0));
end SUM_4_Inputs;

architecture Behavioral of SUM_4_Inputs is

signal A_int, B_int, C_int, D_int:STD_LOGIC_VECTOR (13 downto 0);
begin
			A_int <= "00" & A;
			B_int <= "00" & B;
			C_int <= "00" & C;
			D_int <= "00" & D;
			SUM   <= A_int + B_int + C_int + D_int;


end Behavioral;

