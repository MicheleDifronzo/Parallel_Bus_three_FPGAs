
--THIS DESIGN WRAPS TOGHETER THE FPGA1 AND FPGA2 TOP LEVEL TO HAVE THEM BOTH INTERACTING DURING 
--POST-SYNTHESIS AND POST-IMPLEMENTATION SIMUALTIONS 
--
--AUTHOR: MICHELE DIFRONZO



LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
-- use IEEE.FIXED_PKG.ALL;
-- use IEEE.MATH_REAL.ALL;


	-- entity declaration for your TestBenchFPGA1FPGA2.Dont declare any ports here
ENTITY WrapFpga1and2 IS
Port(
		USER_SMA_CLOCK_in : in std_logic;--<-- gahters the reference clock signal from the Clock Generator (external device) through SMA port
		USER_SMA_STATE_in : in std_logic;--<-- gahters the reference state signal from the Clock Generator (external device) through SMA port					
		FPGA1_ERROR_COUNTER_BIT_0 : out STD_LOGIC;
		FPGA1_ERROR_COUNTER_BIT_1 : out STD_LOGIC;
		FPGA1_ERROR_COUNTER_BIT_2 : out STD_LOGIC;
		FPGA1_ERROR_COUNTER_BIT_3 : out STD_LOGIC;
		FPGA1_ERROR_COUNTER_BIT_4 : out STD_LOGIC;
		FPGA1_ERROR_COUNTER_BIT_5 : out STD_LOGIC;
		FPGA1_ERROR_COUNTER_BIT_6 : out STD_LOGIC;
		FPGA1_ERROR_COUNTER_BIT_7 : out STD_LOGIC;
		FPGA2_ERROR_COUNTER_BIT_0 : out STD_LOGIC;
		FPGA2_ERROR_COUNTER_BIT_1 : out STD_LOGIC;
		FPGA2_ERROR_COUNTER_BIT_2 : out STD_LOGIC;
		FPGA2_ERROR_COUNTER_BIT_3 : out STD_LOGIC;
		FPGA2_ERROR_COUNTER_BIT_4 : out STD_LOGIC;
		FPGA2_ERROR_COUNTER_BIT_5 : out STD_LOGIC;
		FPGA2_ERROR_COUNTER_BIT_6 : out STD_LOGIC;
		FPGA2_ERROR_COUNTER_BIT_7 : out STD_LOGIC
	);
END WrapFpga1and2;




ARCHITECTURE ARCH OF WrapFpga1and2 IS	

		-- Component Declaration for the Unit(s) Under Test (UUT)
	component FPGA1 is
    Port ( 
	
		--on the Master this 2 ports are connected to the system clock (300MHz)
				USER_SMA_CLOCK : in std_logic;--<-- gahters the reference clock signal from the Clock Generator (external device) through SMA port
				USER_SMA_STATE : in std_logic;--<-- gahters the reference state signal from the Clock Generator (external device) through SMA port					
				--Leds or PMOD pins
				--Leds_driver0 : out STD_LOGIC;
				--Leds_driver1 : out STD_LOGIC;
				--Leds_driver2 : out STD_LOGIC;
				--Leds_driver3 : out STD_LOGIC;
				--Leds_driver4 : out STD_LOGIC;
				--Leds_driver5 : out STD_LOGIC;
				--Leds_driver6 : out STD_LOGIC;
				--Leds_driver7 : out STD_LOGIC;
				----Leds or PMOD pins
				--PMOD_0 : out STD_LOGIC;
				--PMOD_1 : out STD_LOGIC;				
				--PMOD_2 : out STD_LOGIC;				
				--PMOD_3 : out STD_LOGIC;				
				--PMOD_4 : out STD_LOGIC;				
				--PMOD_5 : out STD_LOGIC;				
				--PMOD_6 : out STD_LOGIC;				
				--LVDS I/O FMC PORTS	
				FMC_HPC1_LA00_CC_P : out STD_LOGIC;    
				FMC_HPC1_LA01_CC_P : out STD_LOGIC; 	
				FMC_HPC1_LA02_P    : out STD_LOGIC; 	
				--FMC_HPC1_LA03_P    : out STD_LOGIC; 	
				--FMC_HPC1_LA04_P    : out STD_LOGIC; 				
				--FMC_HPC1_LA05_P    : out STD_LOGIC; 				
				--FMC_HPC1_LA06_P    : out STD_LOGIC; 
				--FMC_HPC1_LA07_P    : out STD_LOGIC; 
				--FMC_HPC1_LA08_P    : out STD_LOGIC; 	
				--FMC_HPC1_LA09_P    : out STD_LOGIC; 
				--FMC_HPC1_LA10_P    : out STD_LOGIC; 
				--FMC_HPC1_LA11_P    : out STD_LOGIC; 		
				--FMC_HPC1_LA12_P    : out STD_LOGIC; 
				--FMC_HPC1_LA13_P    : out STD_LOGIC; 
				--FMC_HPC1_LA14_P    : out STD_LOGIC; 
				--FMC_HPC1_LA15_P    : out STD_LOGIC; 
				--FMC_HPC1_LA16_P    : out STD_LOGIC; 
				FMC_HPC1_LA17_CC_P : in STD_LOGIC; 
				FMC_HPC1_LA18_CC_P : in STD_LOGIC;
				FMC_HPC1_LA19_P    : in STD_LOGIC; 
				--FMC_HPC1_LA20_P    : in STD_LOGIC;	
				--FMC_HPC1_LA21_P    : in STD_LOGIC; 	
				--FMC_HPC1_LA22_P    : in STD_LOGIC;
				--FMC_HPC1_LA23_P    : in STD_LOGIC;
				--FMC_HPC1_LA24_P    : in STD_LOGIC;
				--FMC_HPC1_LA25_P    : in STD_LOGIC;
				--FMC_HPC1_LA26_P    : in STD_LOGIC;
				--FMC_HPC1_LA27_P    : in STD_LOGIC;
				--FMC_HPC1_LA28_P    : in STD_LOGIC;	
				--FMC_HPC1_LA29_P    : in STD_LOGIC;
				--FMC_HPC1_LA30_P	   : in STD_LOGIC;
				--FMC_HPC1_LA31_P    : in STD_LOGIC;
				--FMC_HPC1_LA32_P    : in STD_LOGIC;
				--FMC_HPC1_LA33_P    : in STD_LOGIC;
				
				FMC_HPC1_LA00_CC_N : out STD_LOGIC; 
				FMC_HPC1_LA01_CC_N : out STD_LOGIC; 	
				FMC_HPC1_LA02_N    : out STD_LOGIC; 	
				--FMC_HPC1_LA03_N    : out STD_LOGIC; 	
				--FMC_HPC1_LA04_N    : out STD_LOGIC; 				
				--FMC_HPC1_LA05_N    : out STD_LOGIC; 				
				--FMC_HPC1_LA06_N    : out STD_LOGIC; 
				--FMC_HPC1_LA07_N    : out STD_LOGIC; 
				--FMC_HPC1_LA08_N    : out STD_LOGIC; 	
				--FMC_HPC1_LA09_N    : out STD_LOGIC; 
				--FMC_HPC1_LA10_N    : out STD_LOGIC; 
				--FMC_HPC1_LA11_N    : out STD_LOGIC; 		
				--FMC_HPC1_LA12_N    : out STD_LOGIC; 
				--FMC_HPC1_LA13_N    : out STD_LOGIC; 
				--FMC_HPC1_LA14_N    : out STD_LOGIC; 
				--FMC_HPC1_LA15_N    : out STD_LOGIC; 
				--FMC_HPC1_LA16_N    : out STD_LOGIC; 
				FMC_HPC1_LA17_CC_N : in STD_LOGIC; 
				FMC_HPC1_LA18_CC_N : in STD_LOGIC;
				FMC_HPC1_LA19_N    : in STD_LOGIC; 
				--FMC_HPC1_LA20_N    : in STD_LOGIC;	
				--FMC_HPC1_LA21_N    : in STD_LOGIC; 	
				--FMC_HPC1_LA22_N    : in STD_LOGIC;
				--FMC_HPC1_LA23_N    : in STD_LOGIC;
				--FMC_HPC1_LA24_N    : in STD_LOGIC;
				--FMC_HPC1_LA25_N    : in STD_LOGIC;
				--FMC_HPC1_LA26_N    : in STD_LOGIC;
				--FMC_HPC1_LA27_N    : in STD_LOGIC;
				--FMC_HPC1_LA28_N    : in STD_LOGIC;	
				--FMC_HPC1_LA29_N    : in STD_LOGIC;
				--FMC_HPC1_LA30_N	   : in STD_LOGIC;
				--FMC_HPC1_LA31_N    : in STD_LOGIC;
				--FMC_HPC1_LA32_N    : in STD_LOGIC;
				--FMC_HPC1_LA33_N    : in STD_LOGIC;	
				--Push Buttons
				GPIO_SW_N: in std_logic;	
				GPIO_SW_C:	in std_logic		
	);
	end component;

	component FPGA2 is
    Port ( 		
		--on the Master this 2 ports are connected to the system clock (300MHz)
				USER_SMA_CLOCK : in std_logic;--<-- gahters the reference clock signal from the Clock Generator (external device) through SMA port
				USER_SMA_STATE : in std_logic;--<-- gahters the reference state signal from the Clock Generator (external device) through SMA port					
				--Leds or PMOD pins
				--Leds_driver0 : out STD_LOGIC;
				--Leds_driver1 : out STD_LOGIC;
				--Leds_driver2 : out STD_LOGIC;
				--Leds_driver3 : out STD_LOGIC;
				--Leds_driver4 : out STD_LOGIC;
				--Leds_driver5 : out STD_LOGIC;
				--Leds_driver6 : out STD_LOGIC;
				--Leds_driver7 : out STD_LOGIC;
				----Leds or PMOD pins
				--PMOD_0 : out STD_LOGIC;
				--PMOD_1 : out STD_LOGIC;				
				--PMOD_2 : out STD_LOGIC;				
				--PMOD_3 : out STD_LOGIC;				
				--PMOD_4 : out STD_LOGIC;				
				--PMOD_5 : out STD_LOGIC;				
				--PMOD_6 : out STD_LOGIC;				
				--LVDS I/O FMC PORTS	
				FMC_HPC1_LA00_CC_P : in STD_LOGIC;    
				FMC_HPC1_LA01_CC_P : in STD_LOGIC; 	
				FMC_HPC1_LA02_P    : in STD_LOGIC; 	
				--FMC_HPC1_LA03_P    : in STD_LOGIC; 	
				--FMC_HPC1_LA04_P    : in STD_LOGIC; 				
				--FMC_HPC1_LA05_P    : in STD_LOGIC; 				
				--FMC_HPC1_LA06_P    : in STD_LOGIC; 
				--FMC_HPC1_LA07_P    : in STD_LOGIC; 
				--FMC_HPC1_LA08_P    : in STD_LOGIC; 	
				--FMC_HPC1_LA09_P    : in STD_LOGIC; 
				--FMC_HPC1_LA10_P    : in STD_LOGIC; 
				--FMC_HPC1_LA11_P    : in STD_LOGIC; 		
				--FMC_HPC1_LA12_P    : in STD_LOGIC; 
				--FMC_HPC1_LA13_P    : in STD_LOGIC; 
				--FMC_HPC1_LA14_P    : in STD_LOGIC; 
				--FMC_HPC1_LA15_P    : in STD_LOGIC; 
				--FMC_HPC1_LA16_P    : in STD_LOGIC; 
				FMC_HPC1_LA17_CC_P : out STD_LOGIC; 
				FMC_HPC1_LA18_CC_P : out STD_LOGIC;
				FMC_HPC1_LA19_P    : out STD_LOGIC; 
				--FMC_HPC1_LA20_P    : out STD_LOGIC;	
				--FMC_HPC1_LA21_P    : out STD_LOGIC; 	
				--FMC_HPC1_LA22_P    : out STD_LOGIC;
				--FMC_HPC1_LA23_P    : out STD_LOGIC;
				--FMC_HPC1_LA24_P    : out STD_LOGIC;
				--FMC_HPC1_LA25_P    : out STD_LOGIC;
				--FMC_HPC1_LA26_P    : out STD_LOGIC;
				--FMC_HPC1_LA27_P    : out STD_LOGIC;
				--FMC_HPC1_LA28_P    : out STD_LOGIC;	
				--FMC_HPC1_LA29_P    : out STD_LOGIC;
				--FMC_HPC1_LA30_P	   : out STD_LOGIC;
				--FMC_HPC1_LA31_P    : out STD_LOGIC;
				--FMC_HPC1_LA32_P    : out STD_LOGIC;
				--FMC_HPC1_LA33_P    : out STD_LOGIC;
				
				FMC_HPC1_LA00_CC_N : in STD_LOGIC; 
				FMC_HPC1_LA01_CC_N : in STD_LOGIC; 	
				FMC_HPC1_LA02_N    : in STD_LOGIC; 	
				--FMC_HPC1_LA03_N    : in STD_LOGIC; 	
				--FMC_HPC1_LA04_N    : in STD_LOGIC; 				
				--FMC_HPC1_LA05_N    : in STD_LOGIC; 				
				--FMC_HPC1_LA06_N    : in STD_LOGIC; 
				--FMC_HPC1_LA07_N    : in STD_LOGIC; 
				--FMC_HPC1_LA08_N    : in STD_LOGIC; 	
				--FMC_HPC1_LA09_N    : in STD_LOGIC; 
				--FMC_HPC1_LA10_N    : in STD_LOGIC; 
				--FMC_HPC1_LA11_N    : in STD_LOGIC; 		
				--FMC_HPC1_LA12_N    : in STD_LOGIC; 
				--FMC_HPC1_LA13_N    : in STD_LOGIC; 
				--FMC_HPC1_LA14_N    : in STD_LOGIC; 
				--FMC_HPC1_LA15_N    : in STD_LOGIC; 
				--FMC_HPC1_LA16_N    : in STD_LOGIC; 
				FMC_HPC1_LA17_CC_N : out STD_LOGIC;
				FMC_HPC1_LA18_CC_N : out STD_LOGIC;
				FMC_HPC1_LA19_N    : out STD_LOGIC;
				--FMC_HPC1_LA20_N    : out STD_LOGIC;
				--FMC_HPC1_LA21_N    : out STD_LOGIC;
				--FMC_HPC1_LA22_N    : out STD_LOGIC;
				--FMC_HPC1_LA23_N    : out STD_LOGIC;
				--FMC_HPC1_LA24_N    : out STD_LOGIC;
				--FMC_HPC1_LA25_N    : out STD_LOGIC;
				--FMC_HPC1_LA26_N    : out STD_LOGIC;
				--FMC_HPC1_LA27_N    : out STD_LOGIC;
				--FMC_HPC1_LA28_N    : out STD_LOGIC;
				--FMC_HPC1_LA29_N    : out STD_LOGIC;
				--FMC_HPC1_LA30_N	   : out STD_LOGIC;
				--FMC_HPC1_LA31_N    : out STD_LOGIC;
				--FMC_HPC1_LA32_N    : out STD_LOGIC;
				--FMC_HPC1_LA33_N    : out STD_LOGIC;
				--Push Buttons
				GPIO_SW_N: in std_logic;	
				GPIO_SW_C:	in std_logic	
	);
	end component;
	
	attribute keep_hierarchy: string;
	attribute keep_hierarchy of FPGA1_inst: label is "yes"; 
	attribute keep_hierarchy of FPGA2_inst: label is "yes"; 
	
	constant CABLE_DELAY : time := 5 ns;--1200 ps; --! delay of parallel cable between FPGA designs

	
		--declare inputs and initialize them
	signal sim_clk : std_logic := '1';
    signal ref_clk : std_logic := '1';

	signal Button_Start: std_logic:='0'; --signal relative to GPIO_SW_N
	signal Button_Reset: std_logic:='0'; --signal relative to GPIO_SW_C

	signal state_i: std_logic:='0'; 
	
	signal fmc_00_p : std_logic:='0'; 
	signal fmc_01_p : std_logic:='0'; 
	signal fmc_02_p : std_logic:='0'; 
	signal fmc_03_p : std_logic:='0'; 
	signal fmc_04_p : std_logic:='0'; 
	signal fmc_05_p : std_logic:='0'; 
	signal fmc_06_p : std_logic:='0'; 
	signal fmc_07_p : std_logic:='0'; 
	signal fmc_08_p : std_logic:='0'; 
	signal fmc_09_p : std_logic:='0'; 
	signal fmc_10_p : std_logic:='0'; 
	signal fmc_11_p : std_logic:='0'; 
	signal fmc_12_p : std_logic:='0'; 
	signal fmc_13_p : std_logic:='0'; 
	signal fmc_14_p : std_logic:='0'; 
	signal fmc_15_p : std_logic:='0'; 
	signal fmc_16_p : std_logic:='0'; 
	signal fmc_17_p : std_logic:='0'; 
	signal fmc_18_p : std_logic:='0'; 
	signal fmc_19_p : std_logic:='0'; 
	signal fmc_20_p : std_logic:='0'; 
	signal fmc_21_p : std_logic:='0'; 
	signal fmc_22_p : std_logic:='0'; 
	signal fmc_23_p : std_logic:='0'; 
	signal fmc_24_p : std_logic:='0'; 
	signal fmc_25_p : std_logic:='0'; 
	signal fmc_26_p : std_logic:='0'; 
	signal fmc_27_p : std_logic:='0'; 
	signal fmc_28_p : std_logic:='0'; 
	signal fmc_29_p : std_logic:='0'; 
	signal fmc_30_p : std_logic:='0'; 
	signal fmc_31_p : std_logic:='0'; 
	signal fmc_32_p : std_logic:='0'; 
	signal fmc_33_p : std_logic:='0'; 
	

	signal fmc_00_n : std_logic:='0'; 
	signal fmc_01_n : std_logic:='0'; 
	signal fmc_02_n : std_logic:='0'; 
	signal fmc_03_n : std_logic:='0'; 
	signal fmc_04_n : std_logic:='0'; 
	signal fmc_05_n : std_logic:='0'; 
	signal fmc_06_n : std_logic:='0'; 
	signal fmc_07_n : std_logic:='0'; 
	signal fmc_08_n : std_logic:='0'; 
	signal fmc_09_n : std_logic:='0'; 
	signal fmc_10_n : std_logic:='0'; 
	signal fmc_11_n : std_logic:='0'; 
	signal fmc_12_n : std_logic:='0'; 
	signal fmc_13_n : std_logic:='0'; 
	signal fmc_14_n : std_logic:='0'; 
	signal fmc_15_n : std_logic:='0'; 
	signal fmc_16_n : std_logic:='0'; 
	signal fmc_17_n : std_logic:='0'; 
	signal fmc_18_n : std_logic:='0'; 
	signal fmc_19_n : std_logic:='0'; 
	signal fmc_20_n : std_logic:='0'; 
	signal fmc_21_n : std_logic:='0'; 
	signal fmc_22_n : std_logic:='0'; 
	signal fmc_23_n : std_logic:='0'; 
	signal fmc_24_n : std_logic:='0'; 
	signal fmc_25_n : std_logic:='0'; 
	signal fmc_26_n : std_logic:='0'; 
	signal fmc_27_n : std_logic:='0'; 
	signal fmc_28_n : std_logic:='0'; 
	signal fmc_29_n : std_logic:='0'; 
	signal fmc_30_n : std_logic:='0'; 
	signal fmc_31_n : std_logic:='0'; 
	signal fmc_32_n : std_logic:='0'; 
	signal fmc_33_n : std_logic:='0'; 
	
	-- signal paths that will have delays in them to debug actual FPGA operation
	signal FMC_HPC1_LA00_CC_P_DELAYED : STD_LOGIC;    
	signal FMC_HPC1_LA01_CC_P_DELAYED : STD_LOGIC; 	
	signal FMC_HPC1_LA02_P_DELAYED    : STD_LOGIC; 	
	signal FMC_HPC1_LA03_P_DELAYED    : STD_LOGIC; 	
	signal FMC_HPC1_LA04_P_DELAYED    : STD_LOGIC; 				
	signal FMC_HPC1_LA05_P_DELAYED    : STD_LOGIC; 				
	signal FMC_HPC1_LA06_P_DELAYED    : STD_LOGIC; 
	signal FMC_HPC1_LA07_P_DELAYED    : STD_LOGIC; 
	signal FMC_HPC1_LA08_P_DELAYED    : STD_LOGIC; 	
	signal FMC_HPC1_LA09_P_DELAYED    : STD_LOGIC; 
	signal FMC_HPC1_LA10_P_DELAYED    : STD_LOGIC; 
	signal FMC_HPC1_LA11_P_DELAYED    : STD_LOGIC; 		
	signal FMC_HPC1_LA12_P_DELAYED    : STD_LOGIC; 
	signal FMC_HPC1_LA13_P_DELAYED    : STD_LOGIC; 
	signal FMC_HPC1_LA14_P_DELAYED    : STD_LOGIC; 
	signal FMC_HPC1_LA15_P_DELAYED    : STD_LOGIC; 
	signal FMC_HPC1_LA16_P_DELAYED    : STD_LOGIC; 
	signal FMC_HPC1_LA17_CC_P_DELAYED : STD_LOGIC; 
	signal FMC_HPC1_LA18_CC_P_DELAYED : STD_LOGIC;
	signal FMC_HPC1_LA19_P_DELAYED    : STD_LOGIC; 
	signal FMC_HPC1_LA20_P_DELAYED    : STD_LOGIC;	
	signal FMC_HPC1_LA21_P_DELAYED    : STD_LOGIC; 	
	signal FMC_HPC1_LA22_P_DELAYED    : STD_LOGIC;
	signal FMC_HPC1_LA23_P_DELAYED    : STD_LOGIC;
	signal FMC_HPC1_LA24_P_DELAYED    : STD_LOGIC;
	signal FMC_HPC1_LA25_P_DELAYED    : STD_LOGIC;
	signal FMC_HPC1_LA26_P_DELAYED    : STD_LOGIC;
	signal FMC_HPC1_LA27_P_DELAYED    : STD_LOGIC;
	signal FMC_HPC1_LA28_P_DELAYED    : STD_LOGIC;	
	signal FMC_HPC1_LA29_P_DELAYED    : STD_LOGIC;
	signal FMC_HPC1_LA30_P_DELAYED	  : STD_LOGIC;
	signal FMC_HPC1_LA31_P_DELAYED    : STD_LOGIC;
	signal FMC_HPC1_LA32_P_DELAYED    : STD_LOGIC;
	signal FMC_HPC1_LA33_P_DELAYED    : STD_LOGIC;			
	signal FMC_HPC1_LA00_CC_N_DELAYED : STD_LOGIC; 
	signal FMC_HPC1_LA01_CC_N_DELAYED : STD_LOGIC; 	
	signal FMC_HPC1_LA02_N_DELAYED    : STD_LOGIC; 	
	signal FMC_HPC1_LA03_N_DELAYED    : STD_LOGIC; 	
	signal FMC_HPC1_LA04_N_DELAYED    : STD_LOGIC; 				
	signal FMC_HPC1_LA05_N_DELAYED    : STD_LOGIC; 				
	signal FMC_HPC1_LA06_N_DELAYED    : STD_LOGIC; 
	signal FMC_HPC1_LA07_N_DELAYED    : STD_LOGIC; 
	signal FMC_HPC1_LA08_N_DELAYED    : STD_LOGIC; 	
	signal FMC_HPC1_LA09_N_DELAYED    : STD_LOGIC; 
	signal FMC_HPC1_LA10_N_DELAYED    : STD_LOGIC; 
	signal FMC_HPC1_LA11_N_DELAYED    : STD_LOGIC; 		
	signal FMC_HPC1_LA12_N_DELAYED    : STD_LOGIC; 
	signal FMC_HPC1_LA13_N_DELAYED    : STD_LOGIC; 
	signal FMC_HPC1_LA14_N_DELAYED    : STD_LOGIC; 
	signal FMC_HPC1_LA15_N_DELAYED    : STD_LOGIC; 
	signal FMC_HPC1_LA16_N_DELAYED    : STD_LOGIC; 
	signal FMC_HPC1_LA17_CC_N_DELAYED : STD_LOGIC; 
	signal FMC_HPC1_LA18_CC_N_DELAYED : STD_LOGIC;
	signal FMC_HPC1_LA19_N_DELAYED    : STD_LOGIC; 
	signal FMC_HPC1_LA20_N_DELAYED    : STD_LOGIC;	
	signal FMC_HPC1_LA21_N_DELAYED    : STD_LOGIC; 	
	signal FMC_HPC1_LA22_N_DELAYED    : STD_LOGIC;
	signal FMC_HPC1_LA23_N_DELAYED    : STD_LOGIC;
	signal FMC_HPC1_LA24_N_DELAYED    : STD_LOGIC;
	signal FMC_HPC1_LA25_N_DELAYED    : STD_LOGIC;
	signal FMC_HPC1_LA26_N_DELAYED    : STD_LOGIC;
	signal FMC_HPC1_LA27_N_DELAYED    : STD_LOGIC;
	signal FMC_HPC1_LA28_N_DELAYED    : STD_LOGIC;	
	signal FMC_HPC1_LA29_N_DELAYED    : STD_LOGIC;
	signal FMC_HPC1_LA30_N_DELAYED	  : STD_LOGIC;
	signal FMC_HPC1_LA31_N_DELAYED    : STD_LOGIC;
	signal FMC_HPC1_LA32_N_DELAYED    : STD_LOGIC;
	signal FMC_HPC1_LA33_N_DELAYED    : STD_LOGIC;	
	
	
	signal FPGA1_ERROR_COUNTER_BIT_0_i : STD_LOGIC;
	signal FPGA1_ERROR_COUNTER_BIT_1_i : STD_LOGIC;
	signal FPGA1_ERROR_COUNTER_BIT_2_i : STD_LOGIC;
	signal FPGA1_ERROR_COUNTER_BIT_3_i : STD_LOGIC;
	signal FPGA1_ERROR_COUNTER_BIT_4_i : STD_LOGIC;
	signal FPGA1_ERROR_COUNTER_BIT_5_i : STD_LOGIC;
	signal FPGA1_ERROR_COUNTER_BIT_6_i : STD_LOGIC;
	signal FPGA1_ERROR_COUNTER_BIT_7_i : STD_LOGIC;
	signal FPGA2_ERROR_COUNTER_BIT_0_i : STD_LOGIC;
	signal FPGA2_ERROR_COUNTER_BIT_1_i : STD_LOGIC;
	signal FPGA2_ERROR_COUNTER_BIT_2_i : STD_LOGIC;
	signal FPGA2_ERROR_COUNTER_BIT_3_i : STD_LOGIC;
	signal FPGA2_ERROR_COUNTER_BIT_4_i : STD_LOGIC;
	signal FPGA2_ERROR_COUNTER_BIT_5_i : STD_LOGIC;
	signal FPGA2_ERROR_COUNTER_BIT_6_i : STD_LOGIC;
	signal FPGA2_ERROR_COUNTER_BIT_7_i : STD_LOGIC;
	
	
	--signal Led_on_Slave_7 : std_logic;
   
		-- Clock period definitions
	constant clk_period : time := 5 ns; -- 200.0MHz: clock freq from the clock distributor (Virtex-7)

BEGIN

	ref_clk <= USER_SMA_CLOCK_in;
	state_i <= USER_SMA_STATE_in;
	
	FPGA1_ERROR_COUNTER_BIT_0 <= FPGA1_ERROR_COUNTER_BIT_0_i;
	FPGA1_ERROR_COUNTER_BIT_1 <= FPGA1_ERROR_COUNTER_BIT_1_i;
	FPGA1_ERROR_COUNTER_BIT_2 <= FPGA1_ERROR_COUNTER_BIT_2_i;
	FPGA1_ERROR_COUNTER_BIT_3 <= FPGA1_ERROR_COUNTER_BIT_3_i;
	FPGA1_ERROR_COUNTER_BIT_4 <= FPGA1_ERROR_COUNTER_BIT_4_i;
	FPGA1_ERROR_COUNTER_BIT_5 <= FPGA1_ERROR_COUNTER_BIT_5_i;
	FPGA1_ERROR_COUNTER_BIT_6 <= FPGA1_ERROR_COUNTER_BIT_6_i;
	FPGA1_ERROR_COUNTER_BIT_7 <= FPGA1_ERROR_COUNTER_BIT_7_i;
	FPGA2_ERROR_COUNTER_BIT_0 <= FPGA2_ERROR_COUNTER_BIT_0_i;
	FPGA2_ERROR_COUNTER_BIT_1 <= FPGA2_ERROR_COUNTER_BIT_1_i;
	FPGA2_ERROR_COUNTER_BIT_2 <= FPGA2_ERROR_COUNTER_BIT_2_i;
	FPGA2_ERROR_COUNTER_BIT_3 <= FPGA2_ERROR_COUNTER_BIT_3_i;
	FPGA2_ERROR_COUNTER_BIT_4 <= FPGA2_ERROR_COUNTER_BIT_4_i;
	FPGA2_ERROR_COUNTER_BIT_5 <= FPGA2_ERROR_COUNTER_BIT_5_i;
	FPGA2_ERROR_COUNTER_BIT_6 <= FPGA2_ERROR_COUNTER_BIT_6_i;
	FPGA2_ERROR_COUNTER_BIT_7 <= FPGA2_ERROR_COUNTER_BIT_7_i;
	
	
	
	
	
	
	

		-- Instantiate the Unit Under Test (UUT)
	FPGA1_inst: FPGA1
    Port map ( 
				--on the Master this 2 ports are connected to the system clock (300MHz)
				USER_SMA_CLOCK => ref_clk,
				USER_SMA_STATE => state_i,	
		
				--Leds or PMOD pins
				-- Leds_driver0 => FPGA1_ERROR_COUNTER_BIT_0_i,
				-- Leds_driver1 => FPGA1_ERROR_COUNTER_BIT_1_i,
				-- Leds_driver2 => FPGA1_ERROR_COUNTER_BIT_2_i,
				-- Leds_driver3 => FPGA1_ERROR_COUNTER_BIT_3_i,
				-- Leds_driver4 => FPGA1_ERROR_COUNTER_BIT_4_i,
				-- Leds_driver5 => FPGA1_ERROR_COUNTER_BIT_5_i,
				-- Leds_driver6 => FPGA1_ERROR_COUNTER_BIT_6_i,
				-- Leds_driver7 => FPGA1_ERROR_COUNTER_BIT_7_i,
				-- --Leds or PMOD pins
				-- PMOD_0 => open,
				-- PMOD_1 => open,				
				-- PMOD_2 => open,				
				-- PMOD_3 => open,				
				-- PMOD_4 => open,				
				-- PMOD_5 => open,				
				-- PMOD_6 => open,				
				-- --LVDS I/O FMC PORTS	
				FMC_HPC1_LA00_CC_P => fmc_00_p,   
				FMC_HPC1_LA01_CC_P => fmc_01_p,	
				FMC_HPC1_LA02_P    => fmc_02_p,	
				-- FMC_HPC1_LA03_P    => fmc_03_p,	
				-- FMC_HPC1_LA04_P    => fmc_04_p,				
				-- FMC_HPC1_LA05_P    => fmc_05_p,				
				-- FMC_HPC1_LA06_P    => fmc_06_p,
				-- FMC_HPC1_LA07_P    => fmc_07_p,
				-- FMC_HPC1_LA08_P    => fmc_08_p,	
				-- FMC_HPC1_LA09_P    => fmc_09_p,
				-- FMC_HPC1_LA10_P    => fmc_10_p,
				-- FMC_HPC1_LA11_P    => fmc_11_p,		
				-- FMC_HPC1_LA12_P    => fmc_12_p,
				-- FMC_HPC1_LA13_P    => fmc_13_p,  
				-- FMC_HPC1_LA14_P    => fmc_14_p,
				-- FMC_HPC1_LA15_P    => fmc_15_p,
				-- FMC_HPC1_LA16_P    => fmc_16_p,
				
				FMC_HPC1_LA17_CC_P => fmc_17_p,--FMC_HPC1_LA17_CC_P_DELAYED,-- 
				FMC_HPC1_LA18_CC_P => fmc_18_p,--FMC_HPC1_LA18_CC_P_DELAYED,-- 
				FMC_HPC1_LA19_P    => fmc_19_p,--FMC_HPC1_LA19_P_DELAYED   ,-- 
				-- FMC_HPC1_LA20_P    => fmc_20_p,--FMC_HPC1_LA20_P_DELAYED   ,--  
				-- FMC_HPC1_LA21_P    => fmc_21_p,--FMC_HPC1_LA21_P_DELAYED   ,-- 	
				-- FMC_HPC1_LA22_P    => fmc_22_p,--FMC_HPC1_LA22_P_DELAYED   ,-- 
				-- FMC_HPC1_LA23_P    => fmc_23_p,--FMC_HPC1_LA23_P_DELAYED   ,-- 
				-- FMC_HPC1_LA24_P    => fmc_24_p,--FMC_HPC1_LA24_P_DELAYED   ,-- 
				-- FMC_HPC1_LA25_P    => fmc_25_p,--FMC_HPC1_LA25_P_DELAYED   ,-- 
				-- FMC_HPC1_LA26_P    => fmc_26_p,--FMC_HPC1_LA26_P_DELAYED   ,-- 
				-- FMC_HPC1_LA27_P    => fmc_27_p,--FMC_HPC1_LA27_P_DELAYED   ,-- 
				-- FMC_HPC1_LA28_P    => fmc_28_p,--FMC_HPC1_LA28_P_DELAYED   ,--  
				-- FMC_HPC1_LA29_P    => fmc_29_p,--FMC_HPC1_LA29_P_DELAYED   ,-- 
				-- FMC_HPC1_LA30_P	   => fmc_30_p,--FMC_HPC1_LA30_P_DELAYED	,-- 
				-- FMC_HPC1_LA31_P    => fmc_31_p,--FMC_HPC1_LA31_P_DELAYED   ,-- 
				-- FMC_HPC1_LA32_P    => fmc_32_p,--FMC_HPC1_LA32_P_DELAYED   ,-- 
				-- FMC_HPC1_LA33_P    => fmc_33_p,--FMC_HPC1_LA33_P_DELAYED   ,--	
				
				FMC_HPC1_LA00_CC_N => fmc_00_n, 
				FMC_HPC1_LA01_CC_N => fmc_01_n, 	
				FMC_HPC1_LA02_N    => fmc_02_n, 	
				-- FMC_HPC1_LA03_N    => fmc_03_n, 	
				-- FMC_HPC1_LA04_N    => fmc_04_n, 				
				-- FMC_HPC1_LA05_N    => fmc_05_n, 				
				-- FMC_HPC1_LA06_N    => fmc_06_n, 
				-- FMC_HPC1_LA07_N    => fmc_07_n, 
				-- FMC_HPC1_LA08_N    => fmc_08_n, 	
				-- FMC_HPC1_LA09_N    => fmc_09_n, 
				-- FMC_HPC1_LA10_N    => fmc_10_n, 
				-- FMC_HPC1_LA11_N    => fmc_11_n, 		
				-- FMC_HPC1_LA12_N    => fmc_12_n, 
				-- FMC_HPC1_LA13_N    => fmc_13_n,   
				-- FMC_HPC1_LA14_N    => fmc_14_n, 
				-- FMC_HPC1_LA15_N    => fmc_15_n, 
				-- FMC_HPC1_LA16_N    => fmc_16_n, 
				                      
				FMC_HPC1_LA17_CC_N => fmc_17_n, --FMC_HPC1_LA17_CC_N_DELAYED,-- 
				FMC_HPC1_LA18_CC_N => fmc_18_n, --FMC_HPC1_LA18_CC_N_DELAYED,-- 
				FMC_HPC1_LA19_N    => fmc_19_n, --FMC_HPC1_LA19_N_DELAYED   ,-- 
				-- FMC_HPC1_LA20_N    => fmc_20_n, --FMC_HPC1_LA20_N_DELAYED   ,-- 
				-- FMC_HPC1_LA21_N    => fmc_21_n, --FMC_HPC1_LA21_N_DELAYED   ,-- 	
				-- FMC_HPC1_LA22_N    => fmc_22_n, --FMC_HPC1_LA22_N_DELAYED   ,-- 
				-- FMC_HPC1_LA23_N    => fmc_23_n, --FMC_HPC1_LA23_N_DELAYED   ,-- 
				-- FMC_HPC1_LA24_N    => fmc_24_n, --FMC_HPC1_LA24_N_DELAYED   ,-- 
				-- FMC_HPC1_LA25_N    => fmc_25_n, --FMC_HPC1_LA25_N_DELAYED   ,-- 
				-- FMC_HPC1_LA26_N    => fmc_26_n, --FMC_HPC1_LA26_N_DELAYED   ,-- 
				-- FMC_HPC1_LA27_N    => fmc_27_n, --FMC_HPC1_LA27_N_DELAYED   ,-- 
				-- FMC_HPC1_LA28_N    => fmc_28_n, --FMC_HPC1_LA28_N_DELAYED   ,-- 
				-- FMC_HPC1_LA29_N    => fmc_29_n, --FMC_HPC1_LA29_N_DELAYED   ,-- 
				-- FMC_HPC1_LA30_N	   => fmc_30_n, --FMC_HPC1_LA30_N_DELAYED	,-- 
				-- FMC_HPC1_LA31_N    => fmc_31_n, --FMC_HPC1_LA31_N_DELAYED   ,-- 
				-- FMC_HPC1_LA32_N    => fmc_32_n, --FMC_HPC1_LA32_N_DELAYED   ,-- 
				-- FMC_HPC1_LA33_N    => fmc_33_n, --FMC_HPC1_LA33_N_DELAYED   ,--	 
		--Push Buttons						
				GPIO_SW_N=>	Button_Start,
				GPIO_SW_C=>	Button_Reset
			);
			
	FPGA2_inst: FPGA2
    Port map ( 
				--on the Master this 2 ports are connected to the system clock (300MHz)
				USER_SMA_CLOCK => ref_clk,
				USER_SMA_STATE => state_i,	
		
				-- --Leds or PMOD pins
				-- Leds_driver0 => FPGA2_ERROR_COUNTER_BIT_0_i,
				-- Leds_driver1 => FPGA2_ERROR_COUNTER_BIT_1_i,
				-- Leds_driver2 => FPGA2_ERROR_COUNTER_BIT_2_i,
				-- Leds_driver3 => FPGA2_ERROR_COUNTER_BIT_3_i,
				-- Leds_driver4 => FPGA2_ERROR_COUNTER_BIT_4_i,
				-- Leds_driver5 => FPGA2_ERROR_COUNTER_BIT_5_i,
				-- Leds_driver6 => FPGA2_ERROR_COUNTER_BIT_6_i,
				-- Leds_driver7 => FPGA2_ERROR_COUNTER_BIT_7_i,
				-- --Leds or PMOD pins
				-- PMOD_0 => open,
				-- PMOD_1 => open,				
				-- PMOD_2 => open,				
				-- PMOD_3 => open,				
				-- PMOD_4 => open,				
				-- PMOD_5 => open,				
				-- PMOD_6 => open,				
				--LVDS I/O FMC PORTS	
				FMC_HPC1_LA00_CC_P => fmc_00_p, --FMC_HPC1_LA00_CC_P_DELAYED, --   
				FMC_HPC1_LA01_CC_P => fmc_01_p, --FMC_HPC1_LA01_CC_P_DELAYED, --	
				FMC_HPC1_LA02_P    => fmc_02_p, --FMC_HPC1_LA02_P_DELAYED   , --	
				-- FMC_HPC1_LA03_P    => fmc_03_p, --FMC_HPC1_LA03_P_DELAYED   , --	
				-- FMC_HPC1_LA04_P    => fmc_04_p, --FMC_HPC1_LA04_P_DELAYED   , --				
				-- FMC_HPC1_LA05_P    => fmc_05_p, --FMC_HPC1_LA05_P_DELAYED   , --				
				-- FMC_HPC1_LA06_P    => fmc_06_p, --FMC_HPC1_LA06_P_DELAYED   , --
				-- FMC_HPC1_LA07_P    => fmc_07_p, --FMC_HPC1_LA07_P_DELAYED   , --
				-- FMC_HPC1_LA08_P    => fmc_08_p, --FMC_HPC1_LA08_P_DELAYED   , --	
				-- FMC_HPC1_LA09_P    => fmc_09_p, --FMC_HPC1_LA09_P_DELAYED   , --
				-- FMC_HPC1_LA10_P    => fmc_10_p, --FMC_HPC1_LA10_P_DELAYED   , --
				-- FMC_HPC1_LA11_P    => fmc_11_p, --FMC_HPC1_LA11_P_DELAYED   , --		
				-- FMC_HPC1_LA12_P    => fmc_12_p, --FMC_HPC1_LA12_P_DELAYED   , --
				-- FMC_HPC1_LA13_P    => fmc_13_p, --FMC_HPC1_LA13_P_DELAYED   , --  
				-- FMC_HPC1_LA14_P    => fmc_14_p, --FMC_HPC1_LA14_P_DELAYED   , --
				-- FMC_HPC1_LA15_P    => fmc_15_p, --FMC_HPC1_LA15_P_DELAYED   , --
				-- FMC_HPC1_LA16_P    => fmc_16_p, --FMC_HPC1_LA16_P_DELAYED   , --
				
				FMC_HPC1_LA17_CC_P => fmc_17_p,
				FMC_HPC1_LA18_CC_P => fmc_18_p,
				FMC_HPC1_LA19_P    => fmc_19_p,
				-- FMC_HPC1_LA20_P    => fmc_20_p, 
				-- FMC_HPC1_LA21_P    => fmc_21_p,	
				-- FMC_HPC1_LA22_P    => fmc_22_p,
				-- FMC_HPC1_LA23_P    => fmc_23_p,
				-- FMC_HPC1_LA24_P    => fmc_24_p,
				-- FMC_HPC1_LA25_P    => fmc_25_p,
				-- FMC_HPC1_LA26_P    => fmc_26_p,
				-- FMC_HPC1_LA27_P    => fmc_27_p,
				-- FMC_HPC1_LA28_P    => fmc_28_p, 
				-- FMC_HPC1_LA29_P    => fmc_29_p,
				-- FMC_HPC1_LA30_P	   => fmc_30_p,
				-- FMC_HPC1_LA31_P    => fmc_31_p,
				-- FMC_HPC1_LA32_P    => fmc_32_p,
				-- FMC_HPC1_LA33_P    => fmc_33_p,
				
				FMC_HPC1_LA00_CC_N => fmc_00_n, --FMC_HPC1_LA00_CC_N_DELAYED,-- 
				FMC_HPC1_LA01_CC_N => fmc_01_n, --FMC_HPC1_LA01_CC_N_DELAYED,--		
				FMC_HPC1_LA02_N    => fmc_02_n, --FMC_HPC1_LA02_N_DELAYED   ,--		
				-- FMC_HPC1_LA03_N    => fmc_03_n, --FMC_HPC1_LA03_N_DELAYED   ,--		
				-- FMC_HPC1_LA04_N    => fmc_04_n, --FMC_HPC1_LA04_N_DELAYED   ,--					
				-- FMC_HPC1_LA05_N    => fmc_05_n, --FMC_HPC1_LA05_N_DELAYED   ,--					
				-- FMC_HPC1_LA06_N    => fmc_06_n, --FMC_HPC1_LA06_N_DELAYED   ,-- 
				-- FMC_HPC1_LA07_N    => fmc_07_n, --FMC_HPC1_LA07_N_DELAYED   ,-- 
				-- FMC_HPC1_LA08_N    => fmc_08_n, --FMC_HPC1_LA08_N_DELAYED   ,--		
				-- FMC_HPC1_LA09_N    => fmc_09_n, --FMC_HPC1_LA09_N_DELAYED   ,-- 
				-- FMC_HPC1_LA10_N    => fmc_10_n, --FMC_HPC1_LA10_N_DELAYED   ,-- 
				-- FMC_HPC1_LA11_N    => fmc_11_n, --FMC_HPC1_LA11_N_DELAYED   ,--			
				-- FMC_HPC1_LA12_N    => fmc_12_n, --FMC_HPC1_LA12_N_DELAYED   ,-- 
				-- FMC_HPC1_LA13_N    => fmc_13_n, --FMC_HPC1_LA13_N_DELAYED   ,--   
				-- FMC_HPC1_LA14_N    => fmc_14_n, --FMC_HPC1_LA14_N_DELAYED   ,-- 
				-- FMC_HPC1_LA15_N    => fmc_15_n, --FMC_HPC1_LA15_N_DELAYED   ,-- 
				-- FMC_HPC1_LA16_N    => fmc_16_n, --FMC_HPC1_LA16_N_DELAYED   ,-- 
				                      
				FMC_HPC1_LA17_CC_N => fmc_17_n,
				FMC_HPC1_LA18_CC_N => fmc_18_n,
				FMC_HPC1_LA19_N    => fmc_19_n,
				-- FMC_HPC1_LA20_N    => fmc_20_n,
				-- FMC_HPC1_LA21_N    => fmc_21_n,	
				-- FMC_HPC1_LA22_N    => fmc_22_n,
				-- FMC_HPC1_LA23_N    => fmc_23_n,
				-- FMC_HPC1_LA24_N    => fmc_24_n,
				-- FMC_HPC1_LA25_N    => fmc_25_n,
				-- FMC_HPC1_LA26_N    => fmc_26_n,
				-- FMC_HPC1_LA27_N    => fmc_27_n,
				-- FMC_HPC1_LA28_N    => fmc_28_n,
				-- FMC_HPC1_LA29_N    => fmc_29_n,
				-- FMC_HPC1_LA30_N	   => fmc_30_n,
				-- FMC_HPC1_LA31_N    => fmc_31_n,
				-- FMC_HPC1_LA32_N    => fmc_32_n,
				-- FMC_HPC1_LA33_N    => fmc_33_n, 
		--Push Buttons						
				GPIO_SW_N=>	Button_Start,
				GPIO_SW_C=>	Button_Reset
			);	


----------------------------------------------------------------------------------------------------
--		INTRODUCING TRANSPORT DELAY BETWEEN MASTER AND SLAVE TO REPRODUCE FMC RIBBON CABLE EFFECT
----------------------------------------------------------------------------------------------------
	 -- FMC_HPC1_LA00_CC_P_DELAYED <= TRANSPORT fmc_00_p AFTER CABLE_DELAY;  
	 -- FMC_HPC1_LA01_CC_P_DELAYED	<= TRANSPORT fmc_01_p AFTER CABLE_DELAY;
	 -- FMC_HPC1_LA02_P_DELAYED   	<= TRANSPORT fmc_02_p AFTER CABLE_DELAY;
	 -- FMC_HPC1_LA03_P_DELAYED   	<= TRANSPORT fmc_03_p AFTER CABLE_DELAY;
	 -- FMC_HPC1_LA04_P_DELAYED   	<= TRANSPORT fmc_04_p AFTER CABLE_DELAY;			
	 -- FMC_HPC1_LA05_P_DELAYED   	<= TRANSPORT fmc_05_p AFTER CABLE_DELAY;			
	 -- FMC_HPC1_LA06_P_DELAYED    <= TRANSPORT fmc_06_p AFTER CABLE_DELAY;
	 -- FMC_HPC1_LA07_P_DELAYED    <= TRANSPORT fmc_07_p AFTER CABLE_DELAY;
	 -- FMC_HPC1_LA08_P_DELAYED   	<= TRANSPORT fmc_08_p AFTER CABLE_DELAY;
	 -- FMC_HPC1_LA09_P_DELAYED    <= TRANSPORT fmc_09_p AFTER CABLE_DELAY;
	 -- FMC_HPC1_LA10_P_DELAYED    <= TRANSPORT fmc_10_p AFTER CABLE_DELAY;
	 -- FMC_HPC1_LA11_P_DELAYED   	<= TRANSPORT fmc_11_p AFTER CABLE_DELAY;	
	 -- FMC_HPC1_LA12_P_DELAYED    <= TRANSPORT fmc_12_p AFTER CABLE_DELAY;
	 -- FMC_HPC1_LA13_P_DELAYED    <= TRANSPORT fmc_13_p AFTER CABLE_DELAY;
	 -- FMC_HPC1_LA14_P_DELAYED    <= TRANSPORT fmc_14_p AFTER CABLE_DELAY;
	 -- FMC_HPC1_LA15_P_DELAYED    <= TRANSPORT fmc_15_p AFTER CABLE_DELAY;
	 -- FMC_HPC1_LA16_P_DELAYED    <= TRANSPORT fmc_16_p AFTER CABLE_DELAY;
	 -- FMC_HPC1_LA17_CC_P_DELAYED <= TRANSPORT fmc_17_p AFTER CABLE_DELAY;
	 -- FMC_HPC1_LA18_CC_P_DELAYED <= TRANSPORT fmc_18_p AFTER CABLE_DELAY;
	 -- FMC_HPC1_LA19_P_DELAYED    <= TRANSPORT fmc_19_p AFTER CABLE_DELAY;
	 -- FMC_HPC1_LA20_P_DELAYED    <= TRANSPORT fmc_20_p AFTER CABLE_DELAY;
	 -- FMC_HPC1_LA21_P_DELAYED    <= TRANSPORT fmc_21_p AFTER CABLE_DELAY;
	 -- FMC_HPC1_LA22_P_DELAYED    <= TRANSPORT fmc_22_p AFTER CABLE_DELAY;
	 -- FMC_HPC1_LA23_P_DELAYED    <= TRANSPORT fmc_23_p AFTER CABLE_DELAY;
	 -- FMC_HPC1_LA24_P_DELAYED    <= TRANSPORT fmc_24_p AFTER CABLE_DELAY;
	 -- FMC_HPC1_LA25_P_DELAYED    <= TRANSPORT fmc_25_p AFTER CABLE_DELAY;
	 -- FMC_HPC1_LA26_P_DELAYED    <= TRANSPORT fmc_26_p AFTER CABLE_DELAY;
	 -- FMC_HPC1_LA27_P_DELAYED    <= TRANSPORT fmc_27_p AFTER CABLE_DELAY;
	 -- FMC_HPC1_LA28_P_DELAYED    <= TRANSPORT fmc_28_p AFTER CABLE_DELAY;
	 -- FMC_HPC1_LA29_P_DELAYED    <= TRANSPORT fmc_29_p AFTER CABLE_DELAY;
	 -- FMC_HPC1_LA30_P_DELAYED	<= TRANSPORT fmc_30_p AFTER CABLE_DELAY;
	 -- FMC_HPC1_LA31_P_DELAYED    <= TRANSPORT fmc_31_p AFTER CABLE_DELAY;
	 -- FMC_HPC1_LA32_P_DELAYED    <= TRANSPORT fmc_32_p AFTER CABLE_DELAY;
	 -- FMC_HPC1_LA33_P_DELAYED   	<= TRANSPORT fmc_33_p AFTER CABLE_DELAY;	
	 
	 -- FMC_HPC1_LA00_CC_N_DELAYED <= TRANSPORT fmc_00_n AFTER CABLE_DELAY;  
	 -- FMC_HPC1_LA01_CC_N_DELAYED	<= TRANSPORT fmc_01_n AFTER CABLE_DELAY;
	 -- FMC_HPC1_LA02_N_DELAYED   	<= TRANSPORT fmc_02_n AFTER CABLE_DELAY;
	 -- FMC_HPC1_LA03_N_DELAYED   	<= TRANSPORT fmc_03_n AFTER CABLE_DELAY;
	 -- FMC_HPC1_LA04_N_DELAYED   	<= TRANSPORT fmc_04_n AFTER CABLE_DELAY;			
	 -- FMC_HPC1_LA05_N_DELAYED   	<= TRANSPORT fmc_05_n AFTER CABLE_DELAY;			
	 -- FMC_HPC1_LA06_N_DELAYED    <= TRANSPORT fmc_06_n AFTER CABLE_DELAY;
	 -- FMC_HPC1_LA07_N_DELAYED    <= TRANSPORT fmc_07_n AFTER CABLE_DELAY;
	 -- FMC_HPC1_LA08_N_DELAYED   	<= TRANSPORT fmc_08_n AFTER CABLE_DELAY;
	 -- FMC_HPC1_LA09_N_DELAYED    <= TRANSPORT fmc_09_n AFTER CABLE_DELAY;
	 -- FMC_HPC1_LA10_N_DELAYED    <= TRANSPORT fmc_10_n AFTER CABLE_DELAY;
	 -- FMC_HPC1_LA11_N_DELAYED   	<= TRANSPORT fmc_11_n AFTER CABLE_DELAY;	
	 -- FMC_HPC1_LA12_N_DELAYED    <= TRANSPORT fmc_12_n AFTER CABLE_DELAY;
	 -- FMC_HPC1_LA13_N_DELAYED    <= TRANSPORT fmc_13_n AFTER CABLE_DELAY;
	 -- FMC_HPC1_LA14_N_DELAYED    <= TRANSPORT fmc_14_n AFTER CABLE_DELAY;
	 -- FMC_HPC1_LA15_N_DELAYED    <= TRANSPORT fmc_15_n AFTER CABLE_DELAY;
	 -- FMC_HPC1_LA16_N_DELAYED    <= TRANSPORT fmc_16_n AFTER CABLE_DELAY;
	 -- FMC_HPC1_LA17_CC_N_DELAYED <= TRANSPORT fmc_17_n AFTER CABLE_DELAY;
	 -- FMC_HPC1_LA18_CC_N_DELAYED <= TRANSPORT fmc_18_n AFTER CABLE_DELAY;
	 -- FMC_HPC1_LA19_N_DELAYED    <= TRANSPORT fmc_19_n AFTER CABLE_DELAY;
	 -- FMC_HPC1_LA20_N_DELAYED    <= TRANSPORT fmc_20_n AFTER CABLE_DELAY;
	 -- FMC_HPC1_LA21_N_DELAYED    <= TRANSPORT fmc_21_n AFTER CABLE_DELAY;
	 -- FMC_HPC1_LA22_N_DELAYED    <= TRANSPORT fmc_22_n AFTER CABLE_DELAY;
	 -- FMC_HPC1_LA23_N_DELAYED    <= TRANSPORT fmc_23_n AFTER CABLE_DELAY;
	 -- FMC_HPC1_LA24_N_DELAYED    <= TRANSPORT fmc_24_n AFTER CABLE_DELAY;
	 -- FMC_HPC1_LA25_N_DELAYED    <= TRANSPORT fmc_25_n AFTER CABLE_DELAY;
	 -- FMC_HPC1_LA26_N_DELAYED    <= TRANSPORT fmc_26_n AFTER CABLE_DELAY;
	 -- FMC_HPC1_LA27_N_DELAYED    <= TRANSPORT fmc_27_n AFTER CABLE_DELAY;
	 -- FMC_HPC1_LA28_N_DELAYED    <= TRANSPORT fmc_28_n AFTER CABLE_DELAY;
	 -- FMC_HPC1_LA29_N_DELAYED    <= TRANSPORT fmc_29_n AFTER CABLE_DELAY;
	 -- FMC_HPC1_LA30_N_DELAYED	<= TRANSPORT fmc_30_n AFTER CABLE_DELAY;
	 -- FMC_HPC1_LA31_N_DELAYED    <= TRANSPORT fmc_31_n AFTER CABLE_DELAY;
	 -- FMC_HPC1_LA32_N_DELAYED    <= TRANSPORT fmc_32_n AFTER CABLE_DELAY;
	 -- FMC_HPC1_LA33_N_DELAYED   	<= TRANSPORT fmc_33_n AFTER CABLE_DELAY;	

			


END ARCH;