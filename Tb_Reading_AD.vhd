--------------------------------------------------------------------------------
-- Module Name:   C:/BASYS_2_Project/TOP/TOP/Tb_Reading_AD.vhd
-- Project Name:  Tb_Reading_AD
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Tb_Reading_AD IS
END Tb_Reading_AD;
 
ARCHITECTURE behavior OF Tb_Reading_AD IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ReadingAD
    PORT(
         RESET : IN  std_logic;
         CLK : IN  std_logic;
         SDATA : IN  std_logic;
         CS : OUT  std_logic;
         SCLK_20KHz : OUT  std_logic;
         OUTPUT : OUT  std_logic_vector(11 downto 0);
         AVERAGE_OK : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal RESET : std_logic := '0';
   signal CLK : std_logic := '0';
   signal SDATA : std_logic := '0';

 	--Outputs
   signal CS : std_logic;
   signal SCLK_20KHz : std_logic;
   signal OUTPUT : std_logic_vector(11 downto 0);
   signal AVERAGE_OK : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ReadingAD PORT MAP (
          RESET => RESET,
          CLK => CLK,
          SDATA => SDATA,
          CS => CS,
          SCLK_20KHz => SCLK_20KHz,
          OUTPUT => OUTPUT,
          AVERAGE_OK => AVERAGE_OK
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		RESET<='1';
		wait for CLK_period;
		RESET<='0';
		wait for CLK_period;
		SDATA<='0';
		wait for 50 us;
		SDATA<='0';
		wait for 50 us;
		SDATA<='0';
		wait for 50 us;
		SDATA<='0';
		wait for 50 us;
		SDATA<='1';
		wait for 50 us;
		SDATA<='0';
		wait for 50 us;
		SDATA<='1';
		wait for 50 us;
		SDATA<='0';
		wait for 50 us;
		SDATA<='1';
		wait for 50 us;
		SDATA<='0';
		wait for 50 us;
		SDATA<='1';
		wait for 50 us;
		SDATA<='0';
		wait for 50 us;
		SDATA<='1';
		wait for 50 us;
		SDATA<='0';
		wait for 50 us;
		SDATA<='1';
		wait for 50 us;
		SDATA<='0';
		wait for CLK_period;
		RESET<='1';
		wait for CLK_period;
		RESET<='0';
      -- insert stimulus here 

      wait;
   end process;

END;
