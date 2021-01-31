----------------------------------------------------------------------------------
-- Module Name:    decod7seg - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity decod7seg is
    Port ( x : in  STD_LOGIC_VECTOR (15 downto 0);
           CLR : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
			  CE : in STD_LOGIC;
           a_to_g : out  STD_LOGIC_VECTOR (6 downto 0);
           dp : out  STD_LOGIC;
           an : out  STD_LOGIC_VECTOR (3 downto 0));
end decod7seg;

architecture Behavioral of decod7seg is

signal digit: std_logic_vector(3 downto 0);
signal s: std_logic_vector(1 downto 0);

begin

process (CLK, CLR) --ctr2bit
begin
	if CLR='1' then
		s<="00";
	elsif CLK'event and CLK='1' then
		if CE='1' then
			s<=s+1;
		end if;
	end if;
end process;

process (s, x) --Mux44
begin
	case s is
		when "00"=>
			digit<=x(3 downto 0);
		when "01"=>
			digit<=x(7 downto 4);
		when "10"=>
			digit<=x(11 downto 8);
		when others=>
			digit<=x(15 downto 12);
	end case;
end process;

process (s) --Ancode
begin
	case s is
		when "00"=>
			an<="1110";
		when "01"=>
			an<="1101";
		when "10"=>
			an<="1011";
		when others=>
			an<="0111";
	end case;
end process;

process (digit) --Hex7seg
begin
	case digit is
		when X"0" => a_to_g <= "1000000"; --0
      when X"1" => a_to_g <= "1111001"; --1
      when X"2" => a_to_g <= "0100100"; --2
      when X"3" => a_to_g <= "0110000"; --3
      when X"4" => a_to_g <= "0011001"; --4
      when X"5" => a_to_g <= "0010010"; --5
      when X"6" => a_to_g <= "0000010"; --6
      when X"7" => a_to_g <= "1111000"; --7
      when X"8" => a_to_g <= "0000000"; --8
      when X"9" => a_to_g <= "0011000"; --9
      when X"A" => a_to_g <= "0001000"; --A
      when X"B" => a_to_g <= "0000011"; --b
		when X"C" => a_to_g <= "1000110"; --C
      when X"D" => a_to_g <= "0100001"; --d
      when X"E" => a_to_g <= "0000110"; --E
      when others => a_to_g <= "0001110"; --F
    end case;
end process;

dp<='1';

end Behavioral;

