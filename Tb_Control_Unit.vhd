--------------------------------------------------------------------------------
-- Module Name:   C:/BASYS_2_Project/TOP/TOP/Tb_Control_Unit.vhd
-- Project Name:  Tb_Control_Unit
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Tb_Control_Unit IS
END Tb_Control_Unit;
 
ARCHITECTURE behavior OF Tb_Control_Unit IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Control_Unit
    PORT(
         CLK : IN  std_logic;
         NEW_SAMPLE : IN  std_logic;
         PULSE_16 : IN  std_logic;
         RESET : IN  std_logic;
         CS : OUT  std_logic;
         ENABLED : OUT  std_logic;
         ENABLEM : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal NEW_SAMPLE : std_logic := '0';
   signal PULSE_16 : std_logic := '0';
   signal RESET : std_logic := '0';

 	--Outputs
   signal CS : std_logic;
   signal ENABLED : std_logic;
   signal ENABLEM : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Control_Unit PORT MAP (
          CLK => CLK,
          NEW_SAMPLE => NEW_SAMPLE,
          PULSE_16 => PULSE_16,
          RESET => RESET,
          CS => CS,
          ENABLED => ENABLED,
          ENABLEM => ENABLEM
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
      wait for 100 ns;	
		RESET<='0';
      wait for clk_period;
		RESET<='0';
      wait for clk_period;
		PULSE_16<='1';
      wait for clk_period;
		PULSE_16<='0';
      wait for clk_period;
		NEW_SAMPLE<='1';
      wait for clk_period;
		NEW_SAMPLE<='0';
      wait for clk_period*4;
		RESET<='0';
      wait for clk_period*4;
		RESET<='1';
      wait for clk_period;
      -- insert stimulus here 

      wait;
   end process;

END;
