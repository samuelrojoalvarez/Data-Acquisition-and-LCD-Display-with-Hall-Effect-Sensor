----------------------------------------------------------------------------------
-- Module Name:    TOP - Behavioral 
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

entity TOP is
    Port ( CLK : in  STD_LOGIC;
           RESET : in  STD_LOGIC;
           SDATA : in  STD_LOGIC; 
           JA : inout  STD_LOGIC_VECTOR (7 downto 0);
           JB : inout  STD_LOGIC_VECTOR (6 downto 4);
           an : out  STD_LOGIC_VECTOR (3 downto 0);
           seg : out  STD_LOGIC_VECTOR (6 downto 0);
           CS : out  STD_LOGIC;
           dp : out  STD_LOGIC;
--           LED : inout  STD_LOGIC_VECTOR (0 downto 0);
           SCLK_20KHz : out  STD_LOGIC);
end TOP; 

architecture Behavioral of TOP is

	COMPONENT ReadingAD
	PORT( 
		RESET : IN std_logic;
		CLK : IN std_logic;
		SDATA : IN std_logic;          
		CS : OUT std_logic;
		SCLK_20KHz : OUT std_logic;
		OUTPUT : OUT std_logic_vector(11 downto 0);
		AVERAGE_OK : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT ROM
	  PORT (
		 a : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
		 spo : OUT STD_LOGIC_VECTOR(11 DOWNTO 0)
	  );
	END COMPONENT;

	COMPONENT Divider_244Hz
	PORT(
		CLK : IN std_logic;          
		CLK_244Hz : OUT std_logic
		);
	END COMPONENT;

	COMPONENT BIN_BCD
	PORT(
		b : IN std_logic_vector(11 downto 0);          
		p : OUT std_logic_vector(15 downto 0)
		);
	END COMPONENT;

	COMPONENT decod7seg
	PORT(
		x : IN std_logic_vector(15 downto 0);
		CLR : IN std_logic;
		CLK : IN std_logic;
		CE : IN std_logic;          
		a_to_g : OUT std_logic_vector(6 downto 0);
		dp : OUT std_logic;
		an : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
--	COMPONENT PmodCLP
--	PORT(
--		btnr : IN std_logic;
--		clk : IN std_logic;          
--		JA : OUT std_logic_vector(7 downto 0);
--		JB : OUT std_logic_vector(6 downto 4)
--		);
--	END COMPONENT;
	
	COMPONENT PmodCLP_Demo
	PORT(
		btnr : IN std_logic;
		clk : IN std_logic;
		DATE_DISTANCE : IN std_logic_vector(11 downto 0);          
		JA : OUT std_logic_vector(7 downto 0);
		JB : OUT std_logic_vector(6 downto 4)
		);
	END COMPONENT;


signal DIGITAL_VOLTAGE: std_logic_vector (15 downto 0);
signal CLK244Hz_aux, AVERAGE_OK_aux: std_logic;
signal Output_aux: std_logic_vector (11 downto 0);
signal Output_ROM: std_logic_vector (11 downto 0);

begin

	Inst_ReadingAD: ReadingAD PORT MAP(
		RESET => RESET,
		CLK => CLK,
		SDATA => SDATA,
		CS => CS,
		SCLK_20KHz => SCLK_20KHz,
		OUTPUT => Output_aux,
		AVERAGE_OK => AVERAGE_OK_aux
	);

	Inst_Divider_244Hz: Divider_244Hz PORT MAP(
		CLK => CLK,
		CLK_244Hz => CLK244Hz_aux 
	);

	Inst_BIN_BCD: BIN_BCD PORT MAP(
		b => Output_aux,
		p => DIGITAL_VOLTAGE
	);
	
	Inst_decod7seg: decod7seg PORT MAP(
		x => DIGITAL_VOLTAGE,
		CLR => RESET,
		CLK => CLK,
		CE => CLK244Hz_aux,
		a_to_g => seg,
		dp => dp,
		an => an 
	);

	your_instance_name : ROM
	  PORT MAP (
		 a => Output_aux, 
		 spo => Output_ROM
	  );


--	Inst_PmodCLP: PmodCLP PORT MAP(
--		btnr => RESET,
--		clk => CLK,
--		JA => JA ,
--		DATE_DISTANCE => Output_ROM,
--		JB => JB 
--	);

	Inst_PmodCLP_Demo: PmodCLP_Demo PORT MAP(
		btnr => RESET,
		clk => CLK,
		JA => JA,
		DATE_DISTANCE => Output_ROM,
		JB => JB
	);





end Behavioral;

