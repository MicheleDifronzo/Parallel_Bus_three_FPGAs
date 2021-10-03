----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/01/2019 02:52:17 PM
-- Design Name: 
-- Module Name: MasterTopLevel - Behavioral
-- Project Name: MULTI FPGA SYSTEM LEVEL HIL SIMULATOR
-- Author: MICHELE DIFRONZO
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------
--LEGEND:
--------
--SE = single ended
--DDR=dual data rate
--LVDS = low voltage differential standard
--FSM = finite state machine
--clk = clock
--CE = clock enable
--CDC = Clock Domain Crossing





library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;
library xil_defaultlib;

entity FPGA2 is  --old name was "MasterTopLevel
		Port ( 
		--Ultrascale+ board system reference clock
		SYSCLK1_300_P	: in std_logic;	
		SYSCLK1_300_N	: in std_logic;			
		-- ----  AURORA 64 INTERFACE

		-- FMCP_HSPC_PG_M2C_LS: in STD_LOGIC;  --POWER GOOD SIGNAL "pulled High on S14" (manual of FM-S14 , page 9)
		-- FMCP_HSPC_H_PRSNT_M2C_B_LS: in STD_LOGIC; 		--Module Present    S14 asserts PRSNT_M2C_L  
		
		-- --GTY TRANSCEIVER OF BANK (QUAD) 121
		-- -- Channel 0                       
		-- FMCP_HSPC_LA17_CC_N	: in std_logic;	 --tx_fault	 input to indicate SFP+ TX diode is at fault
		-- FMCP_HSPC_LA17_CC_P	: out std_logic; --tx_disable	 output to disable SFP+ TX diode
		-- FMCP_HSPC_LA15_P	: out std_logic; --rate_sel	 output to select reduced/full bandwidth on SFP+
		-- FMCP_HSPC_LA14_N	: in std_logic;	 --los       input to indicate SFP+ is not receiving a RX signal
		-- -- Channel 1                      
		-- FMCP_HSPC_LA14_P	: in std_logic;	 
		-- FMCP_HSPC_LA13_N	: out std_logic; 
		-- FMCP_HSPC_LA11_N	: out std_logic; 
		-- FMCP_HSPC_LA11_P	: in std_logic;	 
		-- -- Channel 2for SFP+ connection through QSFP1 port                       
		-- FMCP_HSPC_LA10_N	: in std_logic;	 
		-- FMCP_HSPC_LA10_P	: out std_logic; 
		-- FMCP_HSPC_LA08_P    : out std_logic; 
		-- FMCP_HSPC_LA07_N    : in std_logic;	 
		
		
		-- -- Channel 3: for SFP+ connection through FMS14 card                     
		-- FMCP_HSPC_LA07_P	: in std_logic;	 
		-- FMCP_HSPC_LA06_N	: out std_logic; 
		-- FMCP_HSPC_LA04_N	: out std_logic; 
		-- FMCP_HSPC_LA04_P	: in std_logic;
		
		-- FMCP_HSPC_DP0_M2C_P  : in STD_LOGIC;	     --rxp_in 
		-- FMCP_HSPC_DP0_M2C_N  : in STD_LOGIC;	     --rxn_in 
		-- FMCP_HSPC_DP0_C2M_P  : out STD_LOGIC;	     --txp_out  in its name from constraint file which is MGTYTXN0_120  you can see the letters "TX" means transmitting so it is an output
		-- FMCP_HSPC_DP0_C2M_N  : out STD_LOGIC;        --txn_out

		-- --Aurora GTY reference clock: U40 ICS85411A clock buffer
		-- FMCP_HSPC_GBT0_0_N:in STD_LOGIC;--MGTREFCLK0N_121
		-- FMCP_HSPC_GBT0_0_P:in STD_LOGIC; --MGTREFCLK0P_121
		-- --Ultrascale+ board blinking leds for debug
		-- GPIO_LED0 : out STD_LOGIC;
		-- GPIO_LED1 : out STD_LOGIC;
		-- GPIO_LED2 : out STD_LOGIC; --soft_err
		-- GPIO_LED3 : out STD_LOGIC; --hard_err
		-- GPIO_LED4 : out STD_LOGIC; --mmc_not_locked_out
		-- GPIO_LED5 : out STD_LOGIC; --s_axi_tx_tready
		-- GPIO_LED6 : out STD_LOGIC; --channel_up
		-- GPIO_LED7 : out STD_LOGIC; --lane_up
-------------------------------------------------------------------------------------------
--				PARALLEL BUS
-------------------------------------------------------------------------------------------
		--on the Master this 2 ports are connected to the system clock (300MHz)
		USER_SMA_CLOCK_P : in std_logic;--<-- gahters the reference clock signal from the Clock Generator (external device) through SMA port
		USER_SMA_CLOCK_N : in std_logic;--<-- gahters the reference state signal from the Clock Generator (external device) through SMA port					
	
		FMC_HPC1_LA00_CC_P : in STD_LOGIC;    
		FMC_HPC1_LA01_CC_P : in STD_LOGIC; 	
		FMC_HPC1_LA02_P    : in STD_LOGIC; 	
		FMC_HPC1_LA03_P    : in STD_LOGIC; 	
		FMC_HPC1_LA04_P    : in STD_LOGIC; 				
		FMC_HPC1_LA05_P    : in STD_LOGIC; 				
		FMC_HPC1_LA06_P    : in STD_LOGIC; 
		FMC_HPC1_LA07_P    : in STD_LOGIC; 
		FMC_HPC1_LA08_P    : in STD_LOGIC; 	
		FMC_HPC1_LA09_P    : in STD_LOGIC; 
		FMC_HPC1_LA10_P    : in STD_LOGIC; 
		FMC_HPC1_LA11_P    : in STD_LOGIC; 		
		FMC_HPC1_LA12_P    : in STD_LOGIC; 
		FMC_HPC1_LA13_P    : in STD_LOGIC; 
		FMC_HPC1_LA14_P    : in STD_LOGIC; 
		FMC_HPC1_LA15_P    : in STD_LOGIC; 
		FMC_HPC1_LA16_P    : in STD_LOGIC; 
		FMC_HPC1_LA17_CC_P : out STD_LOGIC; 
		FMC_HPC1_LA18_CC_P : out STD_LOGIC;
		FMC_HPC1_LA19_P    : out STD_LOGIC; 
		FMC_HPC1_LA20_P    : out STD_LOGIC;	
		FMC_HPC1_LA21_P    : out STD_LOGIC; 	
		FMC_HPC1_LA22_P    : out STD_LOGIC;
		FMC_HPC1_LA23_P    : out STD_LOGIC;
		FMC_HPC1_LA24_P    : out STD_LOGIC;
		FMC_HPC1_LA25_P    : out STD_LOGIC;
		FMC_HPC1_LA26_P    : out STD_LOGIC;
		FMC_HPC1_LA27_P    : out STD_LOGIC;
		FMC_HPC1_LA28_P    : out STD_LOGIC;	
		FMC_HPC1_LA29_P    : out STD_LOGIC;
		FMC_HPC1_LA30_P	   : out STD_LOGIC;
		FMC_HPC1_LA31_P    : out STD_LOGIC;
		FMC_HPC1_LA32_P    : out STD_LOGIC;
		FMC_HPC1_LA33_P    : out STD_LOGIC;
		
		FMC_HPC1_LA00_CC_N : in STD_LOGIC; 
		FMC_HPC1_LA01_CC_N : in STD_LOGIC; 	
		FMC_HPC1_LA02_N    : in STD_LOGIC; 	
		FMC_HPC1_LA03_N    : in STD_LOGIC; 	
		FMC_HPC1_LA04_N    : in STD_LOGIC; 				
		FMC_HPC1_LA05_N    : in STD_LOGIC; 				
		FMC_HPC1_LA06_N    : in STD_LOGIC; 
		FMC_HPC1_LA07_N    : in STD_LOGIC; 
		FMC_HPC1_LA08_N    : in STD_LOGIC; 	
		FMC_HPC1_LA09_N    : in STD_LOGIC; 
		FMC_HPC1_LA10_N    : in STD_LOGIC; 
		FMC_HPC1_LA11_N    : in STD_LOGIC; 		
		FMC_HPC1_LA12_N    : in STD_LOGIC; 
		FMC_HPC1_LA13_N    : in STD_LOGIC; 
		FMC_HPC1_LA14_N    : in STD_LOGIC; 
		FMC_HPC1_LA15_N    : in STD_LOGIC; 
		FMC_HPC1_LA16_N    : in STD_LOGIC; 
		FMC_HPC1_LA17_CC_N : out STD_LOGIC;
		FMC_HPC1_LA18_CC_N : out STD_LOGIC;
		FMC_HPC1_LA19_N    : out STD_LOGIC;
		FMC_HPC1_LA20_N    : out STD_LOGIC;
		FMC_HPC1_LA21_N    : out STD_LOGIC;
		FMC_HPC1_LA22_N    : out STD_LOGIC;
		FMC_HPC1_LA23_N    : out STD_LOGIC;
		FMC_HPC1_LA24_N    : out STD_LOGIC;
		FMC_HPC1_LA25_N    : out STD_LOGIC;
		FMC_HPC1_LA26_N    : out STD_LOGIC;
		FMC_HPC1_LA27_N    : out STD_LOGIC;
		FMC_HPC1_LA28_N    : out STD_LOGIC;
		FMC_HPC1_LA29_N    : out STD_LOGIC;
		FMC_HPC1_LA30_N	   : out STD_LOGIC;
		FMC_HPC1_LA31_N    : out STD_LOGIC;
		FMC_HPC1_LA32_N    : out STD_LOGIC;
		FMC_HPC1_LA33_N    : out STD_LOGIC;
		-----Push Buttons
		GPIO_SW_N: in std_logic;	
		GPIO_SW_C:	in std_logic					
			);
end FPGA2;


---------------------------------------------------------------------------------------------------
architecture Behavioral of FPGA2 is
---------------------------------------------------------------------------------------------------
component MasterClockManager
port
 (
  data_clk_0deg          : out    std_logic;
  data_clk_90deg          : out    std_logic;
  sim_clk          : out    std_logic;
 -- Aurora_Init_clk          : out    std_logic;
  clk_in1           : in     std_logic
 );
end component;


component SecondaryClockManager
port
(
	AuroraInitclk    : out    std_logic;
	clk_in1_p         : in     std_logic;
	clk_in1_n         : in     std_logic
);
end component;

component IncomingClockManager  
	Port
	(  
		--Clock in ports
		clk_out1:  out std_logic;    --< the clock manager induces 0deg on this signal since this signal has already been phase shifted on the other fpga
		--Clock in ports
		clk_in1_p: in std_logic;         --name in virtex: sys_data_clk_90deg_p
		clk_in1_n: in std_logic          --name in virtex: sys_data_clk_90deg_n
	);	
end component;
	
component ParallelBusInterface
port
(
	--reset	
	reset_from_device       : in std_logic; --! reset for parallel bus interface
	
	--sender side from device	
	data_clk_0_from_device  : in std_logic; --! data clock (0deg) for sending data
	data_clk_90_from_device : in std_logic; --! data clock (90deg) to forward to another device (source synchronous)	
	data_to_send_from_device : in std_logic_vector(89 downto 0);--(89 downto 0); --! data to send from device to another device
	start_send_from_device   : in std_logic;                     --! pulsed start flag to trigger sending data from device to another device	
	--sender side to I/O	
	oddr_input_send_to_io  : out std_logic_vector(29 downto 0);--(29 downto 0); --! sent data packet bus to be sent to another device, going to input of an I/O output register for sender
	ce_oddr_send_to_io     : out std_logic;                     --! Clock enable going to CE of an I/O output register for sender
	data_clk_90_send_to_io : out std_logic;                     --! forwarded 90deg data clock to be sent to another device, going to clock of an I/O output register for sender
	incoming_send_to_io    : out std_logic;                     --! sent data incoming flag to be sent to another device, going to input of an I/O output register for sender
	READY: out std_logic;
	--receiver side to/from I/O	
	ce_iddr_recv_to_io : out std_logic;                               --! Clock enable going to CE of I/O input register for receiver
	iddr_output_recv_from_io      : in std_logic_vector(29 downto 0);--(29 downto 0); --! received data packet bus from another device, coming from output of an I/O input register for receiver
	incoming_recv_from_io         : in std_logic;                     --! received data incoming flag from another device, coming from output of an I/O input buffer for receiver
	data_clk_forward_recv_from_io : in std_logic;                     --! received forwarded (90deg+delay) data clock from another device, coming from output of an I/O input (clock capable) buffer for receiver
	--receiver side to device
	data_recv_to_device             : out std_logic_vector(89 downto 0);--(89 downto 0); --! data received from another device
	data_valid_recv_to_device       : out std_logic;                     --! data valid flag indicating received data is valid to read
	data_clk_forward_recv_to_device : out std_logic                     --! forwarded data clock (90deg+delay) from another device
     
);
end component;

---------------------------------------------------------------------------------------------------------

component IDDR_2b
port
(
	data_in_from_pins_p     : in  std_logic_vector(0 downto 0);
	data_in_from_pins_n     : in  std_logic_vector(0 downto 0);
	data_in_to_device       : out std_logic_vector(1 downto 0);
	-- Clock and reset signals
	clk_in                  : in  std_logic;                    -- Fast clock from PLL/MMCM 
	clk_en                  : in  std_logic;    
	io_reset                : in  std_logic                   -- Reset signal for IO circuit	
);
end component;

component IDDR_4b
port
(
	data_in_from_pins_p     : in  std_logic_vector(14 downto 0);
	data_in_from_pins_n     : in  std_logic_vector(14 downto 0);
	data_in_to_device       : out std_logic_vector(29 downto 0);
	-- Clock and reset signals
	clk_in                  : in  std_logic;                    -- Fast clock from PLL/MMCM 
	clk_en                  : in  std_logic;    
	io_reset                : in  std_logic                   -- Reset signal for IO circuit
);
end component;
---------------------------------------------------------------------------------------------------------

component ODDR_2b
port
(
	data_out_from_device : in STD_LOGIC_VECTOR ( 1 downto 0 );
	data_out_to_pins_p : out STD_LOGIC_VECTOR ( 0 to 0 );
	data_out_to_pins_n : out STD_LOGIC_VECTOR ( 0 to 0 );
	clk_in : in STD_LOGIC;
	clk_en : in STD_LOGIC;
	io_reset : in STD_LOGIC	
);
end component;


component ODDR_4b 
    port ( 
			data_out_from_device : in STD_LOGIC_VECTOR ( 29 downto 0 );
			data_out_to_pins_p : out STD_LOGIC_VECTOR ( 14 downto 0 );
			data_out_to_pins_n : out STD_LOGIC_VECTOR ( 14 downto 0 );
			clk_in : in STD_LOGIC;
			clk_en : in STD_LOGIC;
			io_reset : in STD_LOGIC			
	);
end component;






component AutoReset
port
(
			CLOCK 		: IN  std_logic;
			RESET  : OUT  std_logic   
);
end component;
---------------------------------------------------------------------------------------------------------

component SimulationEngine 
    port ( 
			  clk_in 		: in STD_LOGIC; --simulation clock 50ns			  
			  ref_clk_in 	: in STD_LOGIC; --ref clock 5ns			  
			  start 		: in STD_LOGIC;			  
			  ready 		: out STD_LOGIC;			  
			  data_in 		: in STD_LOGIC_VECTOR ( 89 downto 0 );--4bits counter		  		  
			  data_out 		   : out STD_LOGIC_VECTOR ( 89 downto 0 );		  
			  data_out_past 		   : out STD_LOGIC_VECTOR ( 89 downto 0 );	
			  ErrorDetector: out STD_LOGIC;
			  ErrorCounter: out STD_LOGIC_VECTOR ( 7 downto 0 )		 );
end component;


component toplevel_core_A 
    port ( 
			ap_clk : IN STD_LOGIC;
			ap_rst : IN STD_LOGIC;
			ap_start : IN STD_LOGIC;
			ap_done : OUT STD_LOGIC;
			ap_idle : OUT STD_LOGIC;
			ap_ready : OUT STD_LOGIC;
			x_out_a_0_V : OUT STD_LOGIC_VECTOR (71 downto 0);
			i_in_port_model_of_bc_V : IN STD_LOGIC_VECTOR (71 downto 0);
			i_out_port_model_to_b_V : OUT STD_LOGIC_VECTOR (71 downto 0)
		);
end component;



COMPONENT TWO_STAGES_SYNCHRONIZER 
    Port ( 

			DESTINATION_CLOCK  : IN  STD_LOGIC;     		
			INPUT_DATA  : IN  STD_LOGIC_VECTOR(89 downto 0);     		
			OUTPUT_DATA  : OUT  STD_LOGIC_VECTOR(89 downto 0)     		
	);
END COMPONENT;


COMPONENT TWO_STAGES_SYNCHRONIZER_32bit
    Port ( 

			DESTINATION_CLOCK  : IN  STD_LOGIC;     		
			INPUT_DATA  : IN  STD_LOGIC_VECTOR(31 downto 0);     		
			OUTPUT_DATA  : OUT  STD_LOGIC_VECTOR(31 downto 0)     		
	);
END COMPONENT;

-- COMPONENT Aurora64_FMC_Interface 
	-- Port 
	-- (
			-- INIT_CLK : in     std_logic;
			-- AURORA_USER_CLK_OUT : OUT     std_logic;
			
			-- --HANDSHAKING
			-- VALID_TX : OUT     std_logic;
			-- READY_TX : OUT     std_logic;
			-- VALID_RX : OUT     std_logic;
	
		-- -- INPUTS COMING FROM TO THE SIMULATION ENGINE (AND SENT OUTSIDE OF THIS FPGA)
			-- FLOAT_OUT_1		: IN STD_LOGIC_VECTOR (31 downto 0);  --data going to  Opal	
			-- FLOAT_OUT_2		: IN STD_LOGIC_VECTOR (31 downto 0);  
			-- FLOAT_OUT_3		: IN STD_LOGIC_VECTOR (31 downto 0);  
			-- FLOAT_OUT_4		: IN STD_LOGIC_VECTOR (31 downto 0);  
			-- FLOAT_OUT_5		: IN STD_LOGIC_VECTOR (31 downto 0);  
			-- FLOAT_OUT_6		: IN STD_LOGIC_VECTOR (31 downto 0);  
			-- FLOAT_OUT_7		: IN STD_LOGIC_VECTOR (31 downto 0);  
			-- FLOAT_OUT_8		: IN STD_LOGIC_VECTOR (31 downto 0);  
			-- FLOAT_OUT_9		: IN STD_LOGIC_VECTOR (31 downto 0);  
			-- FLOAT_OUT_10	: IN STD_LOGIC_VECTOR (31 downto 0);  
			-- FLOAT_OUT_11	: IN STD_LOGIC_VECTOR (31 downto 0);  
			-- FLOAT_OUT_12	: IN STD_LOGIC_VECTOR (31 downto 0);  
			-- FLOAT_OUT_13	: IN STD_LOGIC_VECTOR (31 downto 0);  
			-- FLOAT_OUT_14	: IN STD_LOGIC_VECTOR (31 downto 0);  
			-- FLOAT_OUT_15	: IN STD_LOGIC_VECTOR (31 downto 0);  
			-- FLOAT_OUT_16	: IN STD_LOGIC_VECTOR (31 downto 0);  
			-- FLOAT_OUT_17	: IN STD_LOGIC_VECTOR (31 downto 0);  
			-- FLOAT_OUT_18	: IN STD_LOGIC_VECTOR (31 downto 0);  
			-- FLOAT_OUT_19	: IN STD_LOGIC_VECTOR (31 downto 0);  
			-- FLOAT_OUT_20	: IN STD_LOGIC_VECTOR (31 downto 0);  
			-- FLOAT_OUT_21	: IN STD_LOGIC_VECTOR (31 downto 0);  
			-- FLOAT_OUT_22	: IN STD_LOGIC_VECTOR (31 downto 0);  
			-- FLOAT_OUT_23	: IN STD_LOGIC_VECTOR (31 downto 0);  
			-- FLOAT_OUT_24	: IN STD_LOGIC_VECTOR (31 downto 0);  
			-- FLOAT_OUT_25	: IN STD_LOGIC_VECTOR (31 downto 0);  
			-- FLOAT_OUT_26	: IN STD_LOGIC_VECTOR (31 downto 0);  
			-- FLOAT_OUT_27	: IN STD_LOGIC_VECTOR (31 downto 0);  
			-- FLOAT_OUT_28	: IN STD_LOGIC_VECTOR (31 downto 0);  
			-- FLOAT_OUT_29	: IN STD_LOGIC_VECTOR (31 downto 0);  
			-- FLOAT_OUT_30	: IN STD_LOGIC_VECTOR (31 downto 0);  
			-- FLOAT_OUT_31	: IN STD_LOGIC_VECTOR (31 downto 0);  
			-- FLOAT_OUT_32	: IN STD_LOGIC_VECTOR (31 downto 0);  

		-- -- WORK IN PROGRESS:  the following have to be connected and testeed to the internal RX-FSM
	
			-- FLOAT_IN_0		: OUT STD_LOGIC_VECTOR (31 downto 0);  --CONSTANT HEADER OF THE RX FRAME FROM OPAL
			-- FLOAT_IN_1		: OUT STD_LOGIC_VECTOR (31 downto 0);  
			-- FLOAT_IN_2		: OUT STD_LOGIC_VECTOR (31 downto 0);  
			-- FLOAT_IN_3		: OUT STD_LOGIC_VECTOR (31 downto 0);  
			-- FLOAT_IN_4		: OUT STD_LOGIC_VECTOR (31 downto 0);  
			-- FLOAT_IN_5		: OUT STD_LOGIC_VECTOR (31 downto 0);  
			-- FLOAT_IN_6		: OUT STD_LOGIC_VECTOR (31 downto 0);  
			-- FLOAT_IN_7		: OUT STD_LOGIC_VECTOR (31 downto 0);  
			-- FLOAT_IN_8		: OUT STD_LOGIC_VECTOR (31 downto 0);  
			-- FLOAT_IN_9		: OUT STD_LOGIC_VECTOR (31 downto 0);  
			-- FLOAT_IN_10		: OUT STD_LOGIC_VECTOR (31 downto 0);  
			-- FLOAT_IN_11		: OUT STD_LOGIC_VECTOR (31 downto 0);  
			-- FLOAT_IN_12		: OUT STD_LOGIC_VECTOR (31 downto 0);  
			-- FLOAT_IN_13		: OUT STD_LOGIC_VECTOR (31 downto 0);  
			-- FLOAT_IN_14		: OUT STD_LOGIC_VECTOR (31 downto 0);  
			-- FLOAT_IN_15		: OUT STD_LOGIC_VECTOR (31 downto 0);  
			-- FLOAT_IN_16		: OUT STD_LOGIC_VECTOR (31 downto 0);  
			-- FLOAT_IN_17		: OUT STD_LOGIC_VECTOR (31 downto 0);  
			-- FLOAT_IN_18		: OUT STD_LOGIC_VECTOR (31 downto 0);  
			-- FLOAT_IN_19		: OUT STD_LOGIC_VECTOR (31 downto 0);  
			-- FLOAT_IN_20		: OUT STD_LOGIC_VECTOR (31 downto 0);  
			-- FLOAT_IN_21		: OUT STD_LOGIC_VECTOR (31 downto 0);  
			-- FLOAT_IN_22		: OUT STD_LOGIC_VECTOR (31 downto 0);  
			-- FLOAT_IN_23		: OUT STD_LOGIC_VECTOR (31 downto 0);  
			-- FLOAT_IN_24		: OUT STD_LOGIC_VECTOR (31 downto 0);  
			-- FLOAT_IN_25		: OUT STD_LOGIC_VECTOR (31 downto 0);  
			-- FLOAT_IN_26		: OUT STD_LOGIC_VECTOR (31 downto 0);  
			-- FLOAT_IN_27		: OUT STD_LOGIC_VECTOR (31 downto 0);  
			-- FLOAT_IN_28		: OUT STD_LOGIC_VECTOR (31 downto 0);  
			-- FLOAT_IN_29		: OUT STD_LOGIC_VECTOR (31 downto 0);  
			-- FLOAT_IN_30		: OUT STD_LOGIC_VECTOR (31 downto 0);  
			-- FLOAT_IN_31		: OUT STD_LOGIC_VECTOR (31 downto 0);  

	
		-- --Ultrascale+ board blinking leds for debug
		-- GPIO_LED0 : out STD_LOGIC;
		-- GPIO_LED1 : out STD_LOGIC;
		-- GPIO_LED2 : out STD_LOGIC; --soft_err
		-- GPIO_LED3 : out STD_LOGIC; --hard_err
		-- GPIO_LED4 : out STD_LOGIC; --mmc_not_locked_out
		-- GPIO_LED5 : out STD_LOGIC; --s_axi_tx_tready
		-- GPIO_LED6 : out STD_LOGIC; --channel_up
		-- GPIO_LED7 : out STD_LOGIC; --lane_up


		-- --==================================================================================================================
		-- --						FMC-SFP+ Card FM-S14 pins (Channels 0 to 3):
		-- --==================================================================================================================
		
		-- FMCP_HSPC_PG_M2C_LS: in STD_LOGIC;  --POWER GOOD SIGNAL "pulled High on S14" (manual of FM-S14 , page 9)
		-- FMCP_HSPC_H_PRSNT_M2C_B_LS: in STD_LOGIC; 		--Module Present    S14 asserts PRSNT_M2C_L  
		
		-- --GTY TRANSCEIVER OF BANK (QUAD) 121
		-- -- Channel 0                       
		-- FMCP_HSPC_LA17_CC_N	: in std_logic;	 --tx_fault	 input to indicate SFP+ TX diode is at fault
		-- FMCP_HSPC_LA17_CC_P	: out std_logic; --tx_disable	 output to disable SFP+ TX diode
		-- FMCP_HSPC_LA15_P	: out std_logic; --rate_sel	 output to select reduced/full bandwidth on SFP+
		-- FMCP_HSPC_LA14_N	: in std_logic;	 --los       input to indicate SFP+ is not receiving a RX signal
		-- -- Channel 1                      
		-- FMCP_HSPC_LA14_P	: in std_logic;	 
		-- FMCP_HSPC_LA13_N	: out std_logic; 
		-- FMCP_HSPC_LA11_N	: out std_logic; 
		-- FMCP_HSPC_LA11_P	: in std_logic;	 
		-- -- Channel 2for SFP+ connection through QSFP1 port                       
		-- FMCP_HSPC_LA10_N	: in std_logic;	 
		-- FMCP_HSPC_LA10_P	: out std_logic; 
		-- FMCP_HSPC_LA08_P    : out std_logic; 
		-- FMCP_HSPC_LA07_N    : in std_logic;	 
		
		
		-- -- Channel 3: for SFP+ connection through FMS14 card                     
		-- FMCP_HSPC_LA07_P	: in std_logic;	 
		-- FMCP_HSPC_LA06_N	: out std_logic; 
		-- FMCP_HSPC_LA04_N	: out std_logic; 
		-- FMCP_HSPC_LA04_P	: in std_logic;
		
		-- FMCP_HSPC_DP0_M2C_P  : in STD_LOGIC;	     --rxp_in 
		-- FMCP_HSPC_DP0_M2C_N  : in STD_LOGIC;	     --rxn_in 
		-- FMCP_HSPC_DP0_C2M_P  : out STD_LOGIC;	     --txp_out  in its name from constraint file which is MGTYTXN0_120  you can see the letters "TX" means transmitting so it is an output
		-- FMCP_HSPC_DP0_C2M_N  : out STD_LOGIC;        --txn_out

		-- --Aurora GTY reference clock: U40 ICS85411A clock buffer
		-- FMCP_HSPC_GBT0_0_N:in STD_LOGIC;--MGTREFCLK0N_121
		-- FMCP_HSPC_GBT0_0_P:in STD_LOGIC; --MGTREFCLK0P_121
	
		-- RESET_EXT: in STD_LOGIC  --push button for GT reset
	-- );
-- END COMPONENT;


COMPONENT FIFO_90bit
  PORT (
			rst : IN STD_LOGIC;
			wr_clk : IN STD_LOGIC;
			rd_clk : IN STD_LOGIC;
			din : IN STD_LOGIC_VECTOR(89 DOWNTO 0);
			wr_en : IN STD_LOGIC;
			rd_en : IN STD_LOGIC;
			dout : OUT STD_LOGIC_VECTOR(89 DOWNTO 0);
			full : OUT STD_LOGIC;
			empty : OUT STD_LOGIC;
			valid : OUT STD_LOGIC;
			wr_rst_busy : OUT STD_LOGIC;
			rd_rst_busy : OUT STD_LOGIC
  );
END COMPONENT;

COMPONENT ila_0

PORT (
	clk : IN STD_LOGIC;



	probe0 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
	probe1 : IN STD_LOGIC_VECTOR(89 downto 0); 
	probe2 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
	probe3 : IN STD_LOGIC_VECTOR(89 downto 0); 
	probe4 : IN STD_LOGIC_VECTOR(89 downto 0); 
	probe5 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
	probe6 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	probe7 : IN STD_LOGIC_VECTOR(0 DOWNTO 0)
);
END COMPONENT  ;

COMPONENT ila_3

PORT (
	clk : IN STD_LOGIC;



	probe0 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
	probe1 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
	probe2 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
	probe3 : IN STD_LOGIC_VECTOR(89 DOWNTO 0)
);
END COMPONENT  ;


COMPONENT ila_4

PORT (
	clk : IN STD_LOGIC;



	probe0 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
	probe1 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
	probe2 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
	probe3 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
	probe4 : IN STD_LOGIC_VECTOR(89 DOWNTO 0)
);
END COMPONENT  ;
-------------------------------------------------------------------------------------

signal flag_in_packet_vec       :  std_logic_vector(1 downto 0);
signal start_send     : std_logic:= '0'; 


signal sim_clk     : std_logic:= '0'; -- forwarded clock to slave board used as a system clock for it
signal clk_0deg    : std_logic:= '0'; -- user clock signal from clock manager to clock buffer
signal clk_90deg   : std_logic:= '0'; -- slave clock signal from clock manager to clock buffer
signal clk_90deg_packet   : std_logic:= '0'; -- slave clock signal from clock manager to clock buffer
signal clk_90deg_p : std_logic:= '0';
signal clk_90deg_n : std_logic:= '0';

signal clk_90deg_in   : std_logic:= '0'; -- slave clock signal from clock manager to clock buffer
signal clk_90deg_in_packet   : std_logic:= '0'; -- slave clock signal from clock manager to clock buffer
signal clk_90deg_in_from_fmc   : std_logic:= '0'; -- slave clock signal from clock manager to clock buffer
signal clk_90deg_in_p : std_logic:= '0';
signal clk_90deg_in_n : std_logic:= '0';

signal data_out  : std_logic_vector( 89 downto 0):=(others=>'0');

signal data_out_past  : std_logic_vector( 89 downto 0):=(others=>'0');
signal data_out_packet  : std_logic_vector( 29 downto 0):=(others=>'0');
signal data_out_p: std_logic_vector ( 14 downto 0):=(others=>'0');
signal data_out_n: std_logic_vector ( 14 downto 0):=(others=>'0');

signal data_in   : std_logic_vector( 89 downto 0):=(others=>'0');

---  CLOCK DOMAIN TWO STAGES SYNCHRONIZER SIGNALS 
-------------------------------------------------------------------------------
signal data_out_cdc  : std_logic_vector( 89 downto 0);
signal data_in_cdc   : std_logic_vector( 89 downto 0);
signal pbus_tx_fsm_ready: std_logic:= '0';
------------------------------------------------------------------------------

signal data_in_packet  : std_logic_vector( 29 downto 0):=(others=>'0');
signal data_in_p: std_logic_vector ( 14 downto 0);
signal data_in_n: std_logic_vector ( 14 downto 0):=(others=>'0');
signal data_valid_in: std_logic:= '0';

signal flag_out  : std_logic:= '0';
signal flag_out_packet  : std_logic:= '0';
signal flag_out_p: std_logic:= '0';
signal flag_out_n: std_logic:= '0';


signal flag_in   : std_logic:= '0';
signal flag_in_packet  : std_logic:= '0';
signal flag_in_packet_i  : std_logic:= '0';
signal flag_in_packet_debug  : std_logic_vector ( 0 downto 0);
signal flag_in_p : std_logic:= '0';
signal flag_in_n : std_logic:= '0';
signal clock_enable : std_logic:= '1';

signal CE_oddr : std_logic:= '0';
signal CE_iddr : std_logic;
--Signals for button debouncing

signal start       : std_logic := '0'; --! internal start signal for user logic
signal reset : std_logic := '0'; -- reset signal for logic              : std_logic := '0'; --! internal start signal for user logic
signal start_i           : std_logic := '0'; 
signal reset_i : std_logic := '0'; 



signal data_in_debug   : std_logic_vector( 89 downto 0):=(others=>'0');
signal data_valid_in_debug: std_logic_vector( 0 downto 0);
signal user_sma_state_debug: std_logic_vector( 0 downto 0);
signal data_out_debug  : std_logic_vector( 89 downto 0);
signal data_out_cdc_debug  : std_logic_vector( 89 downto 0);
signal data_out_pbus_debug  : std_logic_vector( 89 downto 0);
signal pbus_tx_fsm_ready_debug  : std_logic_vector( 0 downto 0):=(others=>'0');
signal data_out_past_debug  : std_logic_vector( 89 downto 0):=(others=>'0');


signal data_in_polished : STD_LOGIC;
signal nc : STD_LOGIC;



----  AURORA 64 SIGNALS
  -----------------------------------------------------------
--   DATA-CONVERTER SIGNALS
-----------------------------------------------------------
  signal float_in : STD_LOGIC_VECTOR (31 downto 0);
  signal fixed_out_V : STD_LOGIC_VECTOR (71 downto 0);
  signal fixed_in_V : STD_LOGIC_VECTOR (71 downto 0);
  signal float_out : STD_LOGIC_VECTOR (31 downto 0) ;


  signal ap_rst_dataconv   : std_logic;
  signal ap_start_dataconv : std_logic;
  signal ap_done_dataconv  : std_logic;
  signal ap_idle_dataconv  : std_logic;
  signal ap_ready_dataconv : std_logic;  

  
 ----AURORA TRANSMITTED LOGIC PACKETS
  signal float_out_1		:  std_logic_vector (31 downto 0);  --data going to  opal	
  signal float_out_2		:  std_logic_vector (31 downto 0);  
  signal float_out_3		:  std_logic_vector (31 downto 0);  
  signal float_out_4		:  std_logic_vector (31 downto 0);  
  signal float_out_5		:  std_logic_vector (31 downto 0);  
  signal float_out_6		:  std_logic_vector (31 downto 0);  
  signal float_out_7		:  std_logic_vector (31 downto 0);  
  signal float_out_8		:  std_logic_vector (31 downto 0);  
  signal float_out_9		:  std_logic_vector (31 downto 0);  
  signal float_out_10	:  std_logic_vector (31 downto 0);  
  signal float_out_11	:  std_logic_vector (31 downto 0);  
  signal float_out_12	:  std_logic_vector (31 downto 0);  
  signal float_out_13	:  std_logic_vector (31 downto 0);  
  signal float_out_14	:  std_logic_vector (31 downto 0);  
  signal float_out_15	:  std_logic_vector (31 downto 0);  
  signal float_out_16	:  std_logic_vector (31 downto 0);  
  signal float_out_17	:  std_logic_vector (31 downto 0);  
  signal float_out_18	:  std_logic_vector (31 downto 0);  
  signal float_out_19	:  std_logic_vector (31 downto 0);  
  signal float_out_20	:  std_logic_vector (31 downto 0);  
  signal float_out_21	:  std_logic_vector (31 downto 0);  
  signal float_out_22	:  std_logic_vector (31 downto 0);  
  signal float_out_23	:  std_logic_vector (31 downto 0);  
  signal float_out_24	:  std_logic_vector (31 downto 0);  
  signal float_out_25	:  std_logic_vector (31 downto 0);  
  signal float_out_26	:  std_logic_vector (31 downto 0);  
  signal float_out_27	:  std_logic_vector (31 downto 0);  
  signal float_out_28	:  std_logic_vector (31 downto 0);  
  signal float_out_29	:  std_logic_vector (31 downto 0);  
  signal float_out_30	:  std_logic_vector (31 downto 0);  
  signal float_out_31	:  std_logic_vector (31 downto 0);  
  signal float_out_32	:  std_logic_vector (31 downto 0);  
 ----AURORA RECEVING LOGIC PACKETS
  signal float_in_0  : STD_LOGIC_VECTOR (31 downto 0);
  signal float_in_1  : STD_LOGIC_VECTOR (31 downto 0);
  signal float_in_2  : STD_LOGIC_VECTOR (31 downto 0);
  signal float_in_3  : STD_LOGIC_VECTOR (31 downto 0);
  signal float_in_4  : STD_LOGIC_VECTOR (31 downto 0);
  signal float_in_5  : STD_LOGIC_VECTOR (31 downto 0);
  signal float_in_6  : STD_LOGIC_VECTOR (31 downto 0);
  signal float_in_7  : STD_LOGIC_VECTOR (31 downto 0);
  signal float_in_8  : STD_LOGIC_VECTOR (31 downto 0);
  signal float_in_9  : STD_LOGIC_VECTOR (31 downto 0);
  signal float_in_10 : STD_LOGIC_VECTOR (31 downto 0);
  signal float_in_11 : STD_LOGIC_VECTOR (31 downto 0);
  signal float_in_12 : STD_LOGIC_VECTOR (31 downto 0);
  signal float_in_13 : STD_LOGIC_VECTOR (31 downto 0);
  signal float_in_14 : STD_LOGIC_VECTOR (31 downto 0);
  signal float_in_15 : STD_LOGIC_VECTOR (31 downto 0);
  signal float_in_16 : STD_LOGIC_VECTOR (31 downto 0);
  signal float_in_17 : STD_LOGIC_VECTOR (31 downto 0);
  signal float_in_18 : STD_LOGIC_VECTOR (31 downto 0);
  signal float_in_19 : STD_LOGIC_VECTOR (31 downto 0);
  signal float_in_20 : STD_LOGIC_VECTOR (31 downto 0);
  signal float_in_21 : STD_LOGIC_VECTOR (31 downto 0);
  signal float_in_22 : STD_LOGIC_VECTOR (31 downto 0);
  signal float_in_23 : STD_LOGIC_VECTOR (31 downto 0);
  signal float_in_24 : STD_LOGIC_VECTOR (31 downto 0);
  signal float_in_25 : STD_LOGIC_VECTOR (31 downto 0);
  signal float_in_26 : STD_LOGIC_VECTOR (31 downto 0);
  signal float_in_27 : STD_LOGIC_VECTOR (31 downto 0);
  signal float_in_28 : STD_LOGIC_VECTOR (31 downto 0);
  signal float_in_29 : STD_LOGIC_VECTOR (31 downto 0);
  signal float_in_30 : STD_LOGIC_VECTOR (31 downto 0);
  signal float_in_31 : STD_LOGIC_VECTOR (31 downto 0);
----AURORA RECEVING LOGIC PACKETS FOR ILA DEBUG CORES
  signal float_in_0_debug  : STD_LOGIC_VECTOR (31 downto 0);
  signal float_in_1_debug  : STD_LOGIC_VECTOR (31 downto 0);
  signal float_in_2_debug  : STD_LOGIC_VECTOR (31 downto 0);
  signal float_in_3_debug  : STD_LOGIC_VECTOR (31 downto 0);
  signal float_in_4_debug  : STD_LOGIC_VECTOR (31 downto 0);
  signal float_in_5_debug  : STD_LOGIC_VECTOR (31 downto 0);
  signal float_in_6_debug  : STD_LOGIC_VECTOR (31 downto 0);
  signal float_in_7_debug  : STD_LOGIC_VECTOR (31 downto 0);
  signal float_in_8_debug  : STD_LOGIC_VECTOR (31 downto 0);
  signal float_in_9_debug  : STD_LOGIC_VECTOR (31 downto 0);
  signal float_in_10_debug : STD_LOGIC_VECTOR (31 downto 0);
  signal float_in_11_debug : STD_LOGIC_VECTOR (31 downto 0);
  signal float_in_12_debug : STD_LOGIC_VECTOR (31 downto 0);
  signal float_in_13_debug : STD_LOGIC_VECTOR (31 downto 0);
  signal float_in_14_debug : STD_LOGIC_VECTOR (31 downto 0);
  signal float_in_15_debug : STD_LOGIC_VECTOR (31 downto 0);
  signal float_in_16_debug : STD_LOGIC_VECTOR (31 downto 0);
  signal float_in_17_debug : STD_LOGIC_VECTOR (31 downto 0);
  signal float_in_18_debug : STD_LOGIC_VECTOR (31 downto 0);
  signal float_in_19_debug : STD_LOGIC_VECTOR (31 downto 0);
  signal float_in_20_debug : STD_LOGIC_VECTOR (31 downto 0);
  signal float_in_21_debug : STD_LOGIC_VECTOR (31 downto 0);
  signal float_in_22_debug : STD_LOGIC_VECTOR (31 downto 0);
  signal float_in_23_debug : STD_LOGIC_VECTOR (31 downto 0);
  signal float_in_24_debug : STD_LOGIC_VECTOR (31 downto 0);
  signal float_in_25_debug : STD_LOGIC_VECTOR (31 downto 0);
  signal float_in_26_debug : STD_LOGIC_VECTOR (31 downto 0);
  signal float_in_27_debug : STD_LOGIC_VECTOR (31 downto 0);
  signal float_in_28_debug : STD_LOGIC_VECTOR (31 downto 0);
  signal float_in_29_debug : STD_LOGIC_VECTOR (31 downto 0);
  signal float_in_30_debug : STD_LOGIC_VECTOR (31 downto 0);
  signal float_in_31_debug : STD_LOGIC_VECTOR (31 downto 0);




  signal valid_tx:  STD_LOGIC;
  signal ready_tx:  STD_LOGIC;
  signal valid_rx:  STD_LOGIC;	
-- DATA TYPE CONVERTER SIGNALS
signal Opal_to_Sim :  std_logic_vector(31 downto 0);	
signal Sim_to_Opal :  std_logic_vector(31 downto 0);

---  CLOCK DOMAIN FIFOS SIGNALS 
signal wr_en_a_u_1:  STD_LOGIC;
signal rd_en_a_u_1:  STD_LOGIC;
signal full_a_u_1:  STD_LOGIC;
signal empty_a_u_1:  STD_LOGIC;

signal wr_en_u_a_1:  STD_LOGIC;
signal full_u_a_1:  STD_LOGIC;
signal empty_u_a_1:  STD_LOGIC;
signal ap_ready_sim:  STD_LOGIC;
signal rd_en_u_a_1:  STD_LOGIC;





--ILA SIGNALS
signal wr_en_a_u_1_debug:  STD_LOGIC_vector(0 downto 0);
signal rd_en_a_u_1_debug:  STD_LOGIC_vector(0 downto 0);

signal full_a_u_1_debug:  STD_LOGIC_vector(0 downto 0);
signal empty_a_u_1_debug:  STD_LOGIC_vector(0 downto 0);

signal wr_en_u_a_1_debug:  STD_LOGIC_vector(0 downto 0);
signal rd_en_u_a_1_debug:  STD_LOGIC_vector(0 downto 0);
signal full_u_a_1_debug:  STD_LOGIC_vector(0 downto 0);
signal empty_u_a_1_debug:  STD_LOGIC_vector(0 downto 0);


  signal din :  STD_LOGIC_VECTOR(31 DOWNTO 0);
signal init_clk:  STD_LOGIC;
signal user_clk_out:  STD_LOGIC;


  signal wr_en_a_to_u :  STD_LOGIC;--
  signal wr_en_u_to_a :  STD_LOGIC;---
  signal rd_en_u_to_a :  STD_LOGIC;--
  signal rd_en_a_to_u :  STD_LOGIC;--


  signal full_a_to_u :  STD_LOGIC;--
  signal full_u_to_a :  STD_LOGIC;--

  signal empty :  STD_LOGIC;--
  signal empty_a_to_u :  STD_LOGIC;--
  signal valid :  STD_LOGIC;--
  signal valid_1 :  STD_LOGIC;--

  signal wr_rst_busy :  STD_LOGIC;--
  signal wr_rst_busy_1 :  STD_LOGIC;
  signal rd_rst_busy :  STD_LOGIC;---
  signal rd_rst_busy_1 :  STD_LOGIC;
  
  
  signal reset_aurora :  STD_LOGIC;

-------------------------------------------------------------------------------------
---- 									SHIP ZONAL SYSTEM SIMULATION ENGINE  
-------------------------------------------------------------------------------------
signal Zone1_Load_V_to_Opal:  STD_LOGIC_VECTOR (31 downto 0);
signal ITM_current_to_Opal :  STD_LOGIC_VECTOR (31 downto 0);
signal V1out_dab1_to_Opal 	:  STD_LOGIC_VECTOR (31 downto 0);
signal V2out_dab1_to_Opal 	:  STD_LOGIC_VECTOR (31 downto 0);
signal I1out_dab1_to_Opal 	:  STD_LOGIC_VECTOR (31 downto 0);
signal I2out_dab1_to_Opal 	:  STD_LOGIC_VECTOR (31 downto 0);
signal I3out_dab1_to_Opal 	:  STD_LOGIC_VECTOR (31 downto 0);
signal Vpout_dab1_to_Opal 	:  STD_LOGIC_VECTOR (31 downto 0);
signal Vsout_dab1_to_Opal 	:  STD_LOGIC_VECTOR (31 downto 0);
signal v_itm_in 			:  STD_LOGIC_VECTOR (31 downto 0);

----  for CDC
signal Zone1_Load_V_to_Opal_cdc:  STD_LOGIC_VECTOR (31 downto 0);
signal ITM_current_to_Opal_cdc :  STD_LOGIC_VECTOR (31 downto 0);
signal V1out_dab1_to_Opal_cdc 	:  STD_LOGIC_VECTOR (31 downto 0);
signal V2out_dab1_to_Opal_cdc 	:  STD_LOGIC_VECTOR (31 downto 0);
signal I1out_dab1_to_Opal_cdc 	:  STD_LOGIC_VECTOR (31 downto 0);
signal I2out_dab1_to_Opal_cdc 	:  STD_LOGIC_VECTOR (31 downto 0);
signal I3out_dab1_to_Opal_cdc 	:  STD_LOGIC_VECTOR (31 downto 0);
signal Vpout_dab1_to_Opal_cdc 	:  STD_LOGIC_VECTOR (31 downto 0);
signal Vsout_dab1_to_Opal_cdc 	:  STD_LOGIC_VECTOR (31 downto 0);
signal v_itm_in_cdc 			:  STD_LOGIC_VECTOR (31 downto 0);

signal din_current_injection_TX : STD_LOGIC_VECTOR (71 downto 0);
signal current_inject_from_cdc   : std_logic_vector( 71 downto 0);
signal zeros   : std_logic_vector( 17 downto 0);
signal concat_inj_tx   : std_logic_vector( 89 downto 0);
signal concat_inj_rx   : std_logic_vector( 89 downto 0);


--CDC_SIM_TO_PBUS
signal wr_en_s_p :  STD_LOGIC;
signal rd_en_s_p :  STD_LOGIC;
signal full_s_p :  STD_LOGIC;
signal empty_s_p :  STD_LOGIC;
signal valid_s_p :  STD_LOGIC;

signal wr_en_s_p_debug: STD_LOGIC_VECTOR (0 downto 0); 
signal full_s_p_debug: STD_LOGIC_VECTOR (0 downto 0); 
signal ap_ready_sim_debug: STD_LOGIC_VECTOR (0 downto 0); 
signal concat_inj_tx_debug: std_logic_vector( 89 downto 0);

signal rd_en_s_p_debug: STD_LOGIC_VECTOR (0 downto 0); 
signal empty_s_p_debug: STD_LOGIC_VECTOR (0 downto 0); 
signal valid_s_p_debug: STD_LOGIC_VECTOR (0 downto 0); 



signal ErrorDetector:  STD_LOGIC;
signal ErrorCounter:  STD_LOGIC_VECTOR ( 7 downto 0 );

signal ErrorDetector_debug:  STD_LOGIC_VECTOR ( 0 downto 0 );
signal ErrorCounter_debug:  STD_LOGIC_VECTOR ( 7 downto 0 );



-- attribute mark_debug : string;
-- attribute mark_debug of wr_en_s_p_debug: signal is "true";	
-- attribute mark_debug of full_s_p_debug: signal is "true";	
-- attribute mark_debug of ap_ready_sim_debug: signal is "true";	
-- attribute mark_debug of concat_inj_tx_debug: signal is "true";	


-- attribute mark_debug of rd_en_s_p_debug: signal is "true";	
-- attribute mark_debug of empty_s_p_debug: signal is "true";	
-- attribute mark_debug of valid_s_p_debug: signal is "true";	
-- attribute mark_debug of pbus_tx_fsm_ready_debug: signal is "true";	



-- attribute mark_debug of user_sma_state_debug : signal is "true";
-- attribute mark_debug of data_in_debug 		: signal is "true";	
-- attribute mark_debug of data_valid_in_debug : signal is "true";
-- attribute mark_debug of data_out_cdc_debug 	: signal is "true";	 
-- attribute mark_debug of data_out_past_debug : signal is "true";	
-- attribute mark_debug of ErrorDetector_debug : signal is "true";
-- attribute mark_debug of ErrorCounter_debug	: signal is "true";
-- attribute mark_debug of flag_in_packet_debug: signal is "true";






BEGIN
    --GENERATE THE CLOCK SIGNALS FROM EXTERNAL CLOCK MANAGER SIGNAL
	MasterClockManager_inst: MasterClockManager  
	Port map
	(  
		data_clk_0deg => clk_0deg,  --clock 100MHz  0deg
		data_clk_90deg => clk_90deg,  --clock 100MHz  90deg
		sim_clk=>sim_clk,
		--Aurora_Init_clk => init_clk,
		--Clock in ports
		clk_in1 => USER_SMA_CLOCK_P      --name in virtex: sys_data_clk_90deg_n
	);


	Aurora_init_clk_mmcm : SecondaryClockManager
	port map 
	( 
		-- Clock out ports  
		AuroraInitclk => init_clk,

		clk_in1_p => SYSCLK1_300_P,
		clk_in1_n => SYSCLK1_300_N
	);

RegisterStartState: process(clk_0deg, USER_SMA_CLOCK_N)
variable start_i : std_logic := '0';  
begin
	if(rising_edge(clk_0deg)) then
		start_send<= not USER_SMA_CLOCK_N;
	end if;
end process;				
-------------------------------------------------------------------------------------------------					
	
	ParallelBusInterface_inst: ParallelBusInterface
	Port map
	( 
		--reset	
		reset_from_device => '0', --: in std_logic; --! reset for parallel bus interface
		
		--sender side from device	
		data_clk_0_from_device   => clk_0deg, --  : in std_logic; --! data clock (0deg) for sending data
		data_clk_90_from_device  => clk_90deg, --: in std_logic; --! data clock (90deg) to forward to another device (source synchronous)	
		data_to_send_from_device => data_out,--"1011",--data_out, --: in std_logic_vector(89 downto 0); --! data to send from device to another device
		start_send_from_device   => start_send,--flag_out, -- : in std_logic;                     --! pulsed start flag to trigger sending data from device to another device	
		--sender side to I/O	
		oddr_input_send_to_io   => data_out_packet, --: out std_logic_vector(29 downto 0); --! sent data packet bus to be sent to another device, going to input of an I/O output register for sender
		ce_oddr_send_to_io      => CE_oddr, --: out std_logic;   --! Clock enable going to CE of an I/O output register for sender
		data_clk_90_send_to_io  => clk_90deg_packet, --: out std_logic;   --! forwarded 90deg data clock to be sent to another device, going to clock of an I/O output register for sender
		incoming_send_to_io     => flag_out_packet, --: out std_logic;   --! sent data incoming flag to be sent to another device, going to input of an I/O output register for sender
		READY => pbus_tx_fsm_ready,
		--receiver side to/from I/O	
		ce_iddr_recv_to_io             => CE_iddr, --: out std_logic;   --! Clock enable going to CE of I/O input register for receiver
		iddr_output_recv_from_io       => data_in_packet, --: in std_logic_vector(29 downto 0); --! received data packet bus from another device, coming from output of an I/O input register for receiver
		incoming_recv_from_io          => flag_in_packet, --: in std_logic;       --! received data incoming flag from another device, coming from output of an I/O input buffer for receiver
		data_clk_forward_recv_from_io  => clk_90deg_in_packet, --: in std_logic;       --! received forwarded (90deg+delay) data clock from another device, coming from output of an I/O input (clock capable) buffer for receiver
		--receiver side to device
		data_recv_to_device              => data_in, --: out std_logic_vector(89 downto 0); --! data received from another device
		data_valid_recv_to_device        => data_valid_in, --: out std_logic;    --! data valid flag indicating received data is valid to read
		data_clk_forward_recv_to_device  => clk_90deg_in --: out std_logic      --! forwarded data clock (90deg+delay) from another device 
	);	

-----------------------------------------------------------------------------------------------------------------------------------------------------------------		
--						SENDING SIDE	
-----------------------------------------------------------------------------------------------------------------------------------------------------------------		
-- AutoReset_for_ODDR: AutoReset 
    -- Port map ( 
			-- CLOCK 	 => clk_0deg,  --clk_0deg and clk_90deg_packet are related since coming from same MMCM
			-- RESET   =>  reset_oddr	
	-- );



	ODDR_clk: ODDR_2b  --forwards the 90deg clock to the other device 
	Port map
	(  
		data_out_from_device=>"10", --"01" is the same of: data_out_from_device(0)=>'0',data_out_from_device(1)=>'1'
		data_out_to_pins_p(0)  => clk_90deg_p, --out STD_LOGIC_VECTOR ( 0 to 0 );
		data_out_to_pins_n(0)  => clk_90deg_n, --out STD_LOGIC_VECTOR ( 0 to 0 );
		clk_in => clk_90deg_packet, 
		clk_en => '1',--CE_oddr,
		io_reset => '0'
	);
	
	ODDR_flag: ODDR_2b   
	Port map
	(  
		data_out_from_device(0)=>flag_out_packet, 
		data_out_from_device(1)=>flag_out_packet, 
		data_out_to_pins_p(0)  => flag_out_p, 
		data_out_to_pins_n(0)  => flag_out_n, 
		clk_in => clk_0deg, 
		clk_en => '1',--CE_oddr, 
		io_reset => '0'
	);
	
	ODDR_data: ODDR_4b 
    port map 
	( 
		data_out_from_device =>data_out_packet,--: in STD_LOGIC_VECTOR ( 29 downto 0 );
		data_out_to_pins_p   =>data_out_p,--: out STD_LOGIC_VECTOR ( 14 downto 0 );
		data_out_to_pins_n   =>data_out_n,--: out STD_LOGIC_VECTOR ( 14 downto 0 );
		clk_in   => clk_0deg,--: in STD_LOGIC;
		clk_en   =>'1',--CE_oddr, --: in STD_LOGIC;
		io_reset => '0'--: in STD_LOGIC			
	);
	
	
-----------------------------------------------------------------------------------------------------------------------------------------------------------------		
--						RECEIVING SIDE	
-----------------------------------------------------------------------------------------------------------------------------------------------------------------		
	    --HANDLES THE INCOMING differential  90DEG CLOCK SIGNALS  (clk_90deg_in_p and clk_90deg_in_n) FROM FPGA2  generating 

	

	
   IBUFDS_incoming_clock : IBUFDS
   generic map (
      DQS_BIAS => "FALSE"  -- (FALSE, TRUE)
   )
   port map (
      O => clk_90deg_in_from_fmc,   -- 1-bit output: Buffer output
      I => clk_90deg_in_p,   -- 1-bit input: Diff_p buffer input (connect directly to top-level port)
      IB => clk_90deg_in_n  -- 1-bit input: Diff_n buffer input (connect directly to top-level port)
   );	
	
	
   BUFG_inst : BUFG
   port map (
      O => clk_90deg_in_packet, -- 1-bit output: Clock output
      I => clk_90deg_in_from_fmc  -- 1-bit input: Clock input
   );	
	
	
	


	
	IDDR_data: IDDR_4b
	Port map
	(
		data_in_from_pins_p     =>data_in_p,--: in  std_logic_vector(14 downto 0);
		data_in_from_pins_n     =>data_in_n,--: in  std_logic_vector(14 downto 0);
		data_in_to_device   => data_in_packet,--: out std_logic_vector(29 downto 0);
		-- Clock and reset signals
		clk_in                  =>clk_90deg_in,--: in  std_logic;                    -- Fast clock from PLL/MMCM 
		clk_en                  =>'1',--CE_iddr--: in  std_logic;    
		io_reset                =>'0'--: in  std_logic                   -- Reset signal for IO circuit
	);


	
	IDDR_incoming_flag: IDDR_2b
	Port map
	(
		data_in_from_pins_p(0)     =>flag_in_p,-- 1-bit input: Diff_p buffer input 
		data_in_from_pins_n(0)     =>flag_in_n,
		data_in_to_device   => flag_in_packet_vec,--: out 
		-- Clock and reset signals
		clk_in                  =>clk_90deg_in,--: in  std_logic;                    -- Fast clock from PLL/MMCM 
		clk_en                  =>'1',--: in  std_logic;    
		io_reset                =>'0'--: in  std_logic                   -- Reset signal for IO circuit
	);		
	flag_in_packet <= flag_in_packet_vec(0) ;

	
----------------------------------------------------------
--					CDC
----------------------------------------------------------
zeros <= (others=>'0')   ; 
concat_inj_tx <= zeros & din_current_injection_TX;
concat_inj_rx <= zeros & current_inject_from_cdc;

	CDC_PBUS_TO_SIM: Two_Stages_Synchronizer
		Port map ( 
	
				DESTINATION_CLOCK  => sim_clk,     		
				INPUT_DATA   => 	data_in,	
				OUTPUT_DATA =>  concat_inj_rx 	--data_in_cdc--		
		);

	-- CDC_SIM_TO_PBUS: Two_Stages_Synchronizer
		-- Port map ( 
	
				-- DESTINATION_CLOCK  => clk_0deg,     		
				-- INPUT_DATA   => concat_inj_tx	,	
				-- OUTPUT_DATA =>  data_out    		
		-- );
		
CDC_SIM_TO_PBUS : FIFO_90BIT
  PORT MAP (
    rst => reset_i,
    wr_clk => sim_clk,
    rd_clk => clk_0deg,
    din => concat_inj_tx,--data_out_cdc, --
    wr_en => wr_en_s_p,
    rd_en => rd_en_s_p,
    dout => data_out,
    full => full_s_p,
    empty => empty_s_p,
    valid => valid_s_p,
    wr_rst_busy => open,
    rd_rst_busy => open
  );
		
wr_en_s_p <= ap_ready_sim and not full_s_p;		
rd_en_s_p <= valid_s_p and pbus_tx_fsm_ready;	


AutoReset_for_FIFO: AutoReset 
    Port map ( 
			CLOCK 	 => sim_clk,  --clk_0deg and clk_90deg_packet are related since coming from same MMCM
			RESET   =>  reset_i	
	);



-- ILA_SIMULATION_ENGINE : ila_0
-- PORT MAP (
	-- clk => sim_clk,



	-- probe0 => USER_SMA_STATE_debug,  --start signal from System Manager
	-- probe1 => data_in_debug, 
	-- probe2 => data_valid_in_debug, -- valid estabilished by the RX FSM
	-- probe3 => data_out_cdc_debug, 
	-- probe4 => data_out_past_debug, 
	-- probe5 => ErrorDetector_debug,
	-- probe6 => ErrorCounter_debug,
	-- probe7 => flag_in_packet_debug   --incoming valid flag from the other FPGA
-- );

	-- ILA_SIMULATION_ENGINE_REGISTER : process
									-- (
										-- sim_clk,
										-- USER_SMA_CLOCK_N,  --start signal from System Manager
										-- data_in_cdc, 
										-- data_valid_in, 
										-- data_out_cdc, 
										-- data_out_past, 
										-- ErrorDetector,
										-- ErrorCounter,
										-- flag_in_packet
									-- ) is
	-- begin	
		-- if(rising_edge(sim_clk)) then

									-- user_sma_state_debug(0) <=	 USER_SMA_CLOCK_N;  --start signal from System Manager
									-- data_in_debug 			<=	 data_in_cdc; 
									-- data_valid_in_debug(0)  <=	 data_valid_in; 
									-- data_out_cdc_debug 			<= 	 data_out_cdc; 
									-- data_out_past_debug 	<= 	 data_out_past; 
									-- ErrorDetector_debug(0)<=	 ErrorDetector;
									-- ErrorCounter_debug	<=	 ErrorCounter;	
									-- flag_in_packet_debug(0)	<=	 flag_in_packet;	
		-- end if;	
	-- end process;



-- ILA_CDC_SIM : ila_3
-- PORT MAP (
	-- clk => sim_clk,

	-- probe0 => wr_en_s_p_debug, 
	-- probe1 => full_s_p_debug, 
	-- probe2 => ap_ready_sim_debug,
	-- probe3 => concat_inj_tx_debug
-- );

	-- ILA_CDC_SIM_REGISTER : process
								-- (
									-- sim_clk,
								
									-- wr_en_s_p, 
									-- full_s_p, 
									-- ap_ready_sim,
									-- concat_inj_tx
								-- ) is
	
	-- begin
	
		-- if(rising_edge(sim_clk)) then

									-- wr_en_s_p_debug(0)    <= wr_en_s_p; 
									-- full_s_p_debug(0)     <= full_s_p; 
									-- ap_ready_sim_debug(0) <= ap_ready_sim;
									-- concat_inj_tx_debug   <= concat_inj_tx;		
		-- end if;
	
	-- end process;

	
-- ILA_CDC_PBUS : ila_4
-- PORT MAP (
	-- clk => clk_0deg,

	-- probe0 => rd_en_s_p_debug, 
	-- probe1 => empty_s_p_debug, 
	-- probe2 => valid_s_p_debug,
	-- probe3 => pbus_tx_fsm_ready_debug,
	-- probe4 => data_out_pbus_debug
-- );

	-- ILA_CDC_PBUS_REGISTER : process
								-- (
									-- clk_0deg,
								
									-- rd_en_s_p, 
									-- empty_s_p, 
									-- valid_s_p,
									-- pbus_tx_fsm_ready,
									-- data_out
								-- ) is
	
	-- begin
	
		-- if(rising_edge(clk_0deg)) then

									-- rd_en_s_p_debug(0)    <= rd_en_s_p; 
									-- empty_s_p_debug(0)     <= empty_s_p; 
									-- valid_s_p_debug(0) <= valid_s_p;
									-- pbus_tx_fsm_ready_debug(0) <= pbus_tx_fsm_ready;
									-- data_out_pbus_debug   <= data_out;		
		-- end if;
	
	-- end process;	
	
	
	
	-------------------------------------------------------------------------------------------------
    --   SIMULATION ENGINE
	-------------------------------------------------------------------------------------------------
		
 Subsystem_A_SimEng : toplevel_core_A
  PORT MAP 
  (
	ap_clk => sim_clk,
	ap_rst => reset,
	ap_start  => USER_SMA_CLOCK_N,
	ap_done  => open,
	ap_idle  => open,
	ap_ready  => ap_ready_sim,

    x_out_a_0_V => open,
 	
	---- CURRENT INTJECTIONS
	i_in_port_model_of_bc_V => current_inject_from_cdc(71 downto 0),--data_in(71 downto 0),-- : IN STD_LOGIC_VECTOR (71 downto 0);
	i_out_port_model_to_b_V => din_current_injection_TX(71 downto 0)--: IN STD_LOGIC_VECTOR (71 downto 0);

  ); 
  
  
 -- DataConverter : SFPTOFIXEDCONVERTER
  -- PORT MAP 
  -- (

    -- ap_clk => sim_clk,
    -- ap_rst => reset,
    -- ap_start  => USER_SMA_CLOCK_N,
    -- ap_done => ap_done_dataconv,
    -- ap_idle => ap_idle_dataconv,
    -- ap_ready => ap_ready_dataconv,
    -- float_in => float_in,--: IN STD_LOGIC_VECTOR (31 downto 0);
	-- --- connected to the Parallel bus
	-- fixed_out_V   =>  data_out_cdc,  --to Parallel bus
	-- fixed_in_V  =>  data_in_cdc,   -- from Parallel bus
	-- float_out  => din	
  -- ); 
  
  	-- Counter_inst: SimulationEngine 
    -- port map ( 
				-- clk_in => sim_clk,--clk_0deg,--sim_clk,
			    -- ref_clk_in => nc,
				-- start => USER_SMA_CLOCK_N,
				-- ready => ap_ready_sim,
				-- data_in  => data_in_cdc,--data_in, 
				-- data_out  => data_out_cdc,
				-- data_out_past  => data_out_past,
				-- ErrorDetector => ErrorDetector,
				-- ErrorCounter => ErrorCounter				
			  -- );
			  
			  
--------------------------------------------------------------------------
--							CDC
---------------------------------------------------------------------------
	

-- ------------------	CDC FROM  SIMULATION ENGINE TO OPAL ------------------------	
	-- CDC_USER_TO_AURORA_TX_frame_word_1_and_2: Two_Stages_Synchronizer_32bit
		-- Port map ( 
	
				-- DESTINATION_CLOCK  => user_clk_out,     		
				-- INPUT_DATA   	   => ITM_current_to_Opal,	
				-- OUTPUT_DATA 	   => ITM_current_to_Opal_cdc    		
		-- );
		
	-- CDC_USER_TO_AURORA_TX_frame_word_3: Two_Stages_Synchronizer_32bit
		-- Port map ( 
	
				-- DESTINATION_CLOCK  => user_clk_out,     		
				-- INPUT_DATA   	   => Vpout_dab1_to_Opal,	
				-- OUTPUT_DATA 	   => Vpout_dab1_to_Opal_cdc    		
		-- );		

	-- CDC_USER_TO_AURORA_TX_frame_word_4: Two_Stages_Synchronizer_32bit
		-- Port map ( 
	
				-- DESTINATION_CLOCK  => user_clk_out,     		
				-- INPUT_DATA   	   => Vsout_dab1_to_Opal,	
				-- OUTPUT_DATA 	   => Vsout_dab1_to_Opal_cdc    		
		-- );			
		
	-- CDC_USER_TO_AURORA_TX_frame_word_5: Two_Stages_Synchronizer_32bit
		-- Port map ( 
	
				-- DESTINATION_CLOCK  => user_clk_out,     		
				-- INPUT_DATA   	   => Zone1_Load_V_to_Opal,	
				-- OUTPUT_DATA 	   => Zone1_Load_V_to_Opal_cdc    		
		-- );	
	
-- ------------------	CDC FROM  OPAL TO SIMULATION ENGINE ------------------------		
	-- CDC_AURORA_TO_USER_RX_frame_word_4 : Two_Stages_Synchronizer_32bit
		-- Port map ( 
	
				-- DESTINATION_CLOCK  => sim_clk,     		
				-- INPUT_DATA   	   => float_in_3,	
				-- OUTPUT_DATA 	   => v_itm_in    		
		-- );	

-----------------------------------------------------------------------
--				AURORA INTERFACES
------------------------------------------------------------------------		
-- Aurora64_Interface_inst: Aurora64_FMC_Interface 
	-- Port map
	-- (
			-- INIT_CLK => init_clk,
			-- AURORA_USER_CLK_OUT => user_clk_out,

			-- VALID_TX => valid_tx,
			-- READY_TX => ready_tx,
			-- VALID_RX => valid_rx,		
		-- -- INPUTS COMING FROM TO THE SIMULATION ENGINE (AND SENT OUTSIDE OF THIS FPGA)
			-- FLOAT_OUT_1		=> ITM_current_to_Opal_cdc,--<--  test value.   Previous was: ,  --data going to  Opal	
			-- FLOAT_OUT_2		=> ITM_current_to_Opal_cdc	,  
			-- FLOAT_OUT_3		=> Vpout_dab1_to_Opal_cdc	,
			-- FLOAT_OUT_4		=> Vsout_dab1_to_Opal_cdc	,
			-- FLOAT_OUT_5		=> Zone1_Load_V_to_Opal_cdc	,
			-- FLOAT_OUT_6		=> float_out_6	,
			-- FLOAT_OUT_7		=> float_out_7	,
			-- FLOAT_OUT_8		=> float_out_8	,
			-- FLOAT_OUT_9		=> float_out_9	,
			-- FLOAT_OUT_10	=> float_out_10,
			-- FLOAT_OUT_11	=> float_out_11,
			-- FLOAT_OUT_12	=> float_out_12,
			-- FLOAT_OUT_13	=> float_out_13,
			-- FLOAT_OUT_14	=> float_out_14,
			-- FLOAT_OUT_15	=> float_out_15,
			-- FLOAT_OUT_16	=> float_out_16,
			-- FLOAT_OUT_17	=> float_out_17,
			-- FLOAT_OUT_18	=> float_out_18,
			-- FLOAT_OUT_19	=> float_out_19,
			-- FLOAT_OUT_20	=> float_out_20,
			-- FLOAT_OUT_21	=> float_out_21,
			-- FLOAT_OUT_22	=> float_out_22,
			-- FLOAT_OUT_23	=> float_out_23,
			-- FLOAT_OUT_24	=> float_out_24,
			-- FLOAT_OUT_25	=> float_out_25,
			-- FLOAT_OUT_26	=> float_out_26,
			-- FLOAT_OUT_27	=> float_out_27,
			-- FLOAT_OUT_28	=> float_out_28,
			-- FLOAT_OUT_29	=> float_out_29,
			-- FLOAT_OUT_30	=> float_out_30,
			-- FLOAT_OUT_31	=> float_out_31,
			-- FLOAT_OUT_32	=> float_out_32,
	
			-- FLOAT_IN_0		=> open,  --CONSTANT HEADER OF THE RX FRAME FROM OPAL
			-- FLOAT_IN_1		=> open,  --CONSTANT HEADER OF THE RX FRAME FROM OPAL
			-- FLOAT_IN_2		=> open,  
			-- FLOAT_IN_3		=> float_in_3,  --< COUNTER FROM OPAL
			-- FLOAT_IN_4		=> open,  
			-- FLOAT_IN_5		=> open,  
			-- FLOAT_IN_6		=> open,  
			-- FLOAT_IN_7		=> open,  
			-- FLOAT_IN_8		=> open,  
			-- FLOAT_IN_9		=> open,  
			-- FLOAT_IN_10		=> open,  
			-- FLOAT_IN_11		=> open,  
			-- FLOAT_IN_12		=> open,  
			-- FLOAT_IN_13		=> open,  
			-- FLOAT_IN_14		=> open,  
			-- FLOAT_IN_15		=> open,  
			-- FLOAT_IN_16		=> open,  
			-- FLOAT_IN_17		=> open,  
			-- FLOAT_IN_18		=> open,  
			-- FLOAT_IN_19		=> open,  
			-- FLOAT_IN_20		=> open,  
			-- FLOAT_IN_21		=> open,  
			-- FLOAT_IN_22		=> open,  
			-- FLOAT_IN_23		=> open,  
			-- FLOAT_IN_24		=> open,  
			-- FLOAT_IN_25		=> open,  
			-- FLOAT_IN_26		=> open,  
			-- FLOAT_IN_27		=> open,  
			-- FLOAT_IN_28		=> open,  
			-- FLOAT_IN_29		=> open,  
			-- FLOAT_IN_30		=> open,  
			-- FLOAT_IN_31		=> open,  

		-- GPIO_LED0 => GPIO_LED0,
		-- GPIO_LED1 => GPIO_LED1,
		-- GPIO_LED2 => GPIO_LED2,
		-- GPIO_LED3 => GPIO_LED3,
		-- GPIO_LED4 => GPIO_LED4,
		-- GPIO_LED5 => GPIO_LED5,
		-- GPIO_LED6 => GPIO_LED6,
		-- GPIO_LED7 => GPIO_LED7,

		-- --==================================================================================================================
		-- --						FMC-SFP+ Card FM-S14 pins (Channels 0 to 3):
		-- --==================================================================================================================
		
		-- FMCP_HSPC_PG_M2C_LS => FMCP_HSPC_PG_M2C_LS,  --POWER GOOD SIGNAL "pulled High on S14" (manual of FM-S14 , page 9)
		-- FMCP_HSPC_H_PRSNT_M2C_B_LS => FMCP_HSPC_H_PRSNT_M2C_B_LS, 		--Module Present    S14 asserts PRSNT_M2C_L  
		
		-- --GTY TRANSCEIVER OF BANK (QUAD) 121
		-- -- Channel 0                       
		-- FMCP_HSPC_LA17_CC_N	=> FMCP_HSPC_LA17_CC_N, --tx_fault	 input to indicate SFP+ TX diode is at fault
		-- FMCP_HSPC_LA17_CC_P	=> FMCP_HSPC_LA17_CC_P, --tx_disable	 output to disable SFP+ TX diode
		-- FMCP_HSPC_LA15_P	=> FMCP_HSPC_LA15_P	 ,--rate_sel	 output to select reduced/full bandwidth on SFP+
		-- FMCP_HSPC_LA14_N	=> FMCP_HSPC_LA14_N	 ,--los       input to indicate SFP+ is not receiving a RX signal
		-- -- Channel 1                      
		-- FMCP_HSPC_LA14_P	=> FMCP_HSPC_LA14_P,
		-- FMCP_HSPC_LA13_N	=> FMCP_HSPC_LA13_N,
		-- FMCP_HSPC_LA11_N	=> FMCP_HSPC_LA11_N,
		-- FMCP_HSPC_LA11_P	=> FMCP_HSPC_LA11_P,
		-- -- Channel 2for SFP+ connection through QSFP1 port                       
		-- FMCP_HSPC_LA10_N  => FMCP_HSPC_LA10_N,
		-- FMCP_HSPC_LA10_P  => FMCP_HSPC_LA10_P,
		-- FMCP_HSPC_LA08_P  => FMCP_HSPC_LA08_P, 
		-- FMCP_HSPC_LA07_N  => FMCP_HSPC_LA07_N, 
		
		
		-- -- Channel 3: for SFP+ connection through FMS14 card                     
		-- FMCP_HSPC_LA07_P	=> FMCP_HSPC_LA07_P,
		-- FMCP_HSPC_LA06_N	=> FMCP_HSPC_LA06_N,
		-- FMCP_HSPC_LA04_N	=> FMCP_HSPC_LA04_N,
		-- FMCP_HSPC_LA04_P	=> FMCP_HSPC_LA04_P,
		
		-- FMCP_HSPC_DP0_M2C_P => FMCP_HSPC_DP0_M2C_P,     --rxp_in 
		-- FMCP_HSPC_DP0_M2C_N => FMCP_HSPC_DP0_M2C_N,     --rxn_in 
		-- FMCP_HSPC_DP0_C2M_P => FMCP_HSPC_DP0_C2M_P,     --txp_out  in its name from constraint file which is MGTYTXN0_120  you can see the letters "TX" means transmitting so it is an output
		-- FMCP_HSPC_DP0_C2M_N => FMCP_HSPC_DP0_C2M_N,     --txn_out

		-- --Aurora GTY reference clock: U40 ICS85411A clock buffer
		-- FMCP_HSPC_GBT0_0_N => FMCP_HSPC_GBT0_0_N,--MGTREFCLK0N_121
		-- FMCP_HSPC_GBT0_0_P => FMCP_HSPC_GBT0_0_P, --MGTREFCLK0P_121
	
		-- RESET_EXT=> reset_aurora --push button for GT reset
	-- );
		
-- -- Reset_the_Aurora_interface: process(init_clk, USER_SMA_CLOCK_N)
-- -- -- variable start_i : std_logic := '0';  
-- -- begin
	-- -- if(rising_edge(init_clk)) then
		-- -- reset_aurora<= not USER_SMA_CLOCK_N;
	-- -- end if;
-- -- end process;


		
-- -- AutoReset_for_Aurora: AutoReset 
    -- -- Port map ( 
			-- -- CLOCK 	 => init_clk,  --clk_0deg and clk_90deg_packet are related since coming from same MMCM
			-- -- RESET   =>  reset_aurora
	-- -- );		
	
		
		
-------------------------------------------------------------------------
--		PARALLEL BUS FMC INTERFACE
-------------------------------------------------------------------------
	--Output
	FMC_HPC1_LA17_CC_P <= clk_90deg_p;   
	FMC_HPC1_LA18_CC_P <= flag_out_p;	     -- <-- this clock was not adeguate for clock forwarding: read more about it (in the pinout has only acronym "QBC" rather than "GC" (means Global Clock capable pin))
	FMC_HPC1_LA19_P    <= data_out_p(0);	
	FMC_HPC1_LA20_P    <= data_out_p(1);	
	FMC_HPC1_LA21_P    <= data_out_p(2);				
	FMC_HPC1_LA22_P    <= data_out_p(3);				
	FMC_HPC1_LA23_P    <= data_out_p(4);
	FMC_HPC1_LA24_P    <= data_out_p(5);
	FMC_HPC1_LA25_P    <= data_out_p(6);	
	FMC_HPC1_LA26_P    <= data_out_p(7);
	FMC_HPC1_LA27_P    <= data_out_p(8);
	FMC_HPC1_LA28_P    <= data_out_p(9);		
	FMC_HPC1_LA29_P    <= data_out_p(10);
	FMC_HPC1_LA30_P	   <= data_out_p(11);
	FMC_HPC1_LA31_P    <= data_out_p(12);
	FMC_HPC1_LA32_P    <= data_out_p(13);
	FMC_HPC1_LA33_P    <= data_out_p(14);
	
	FMC_HPC1_LA17_CC_N <= clk_90deg_n;   
	FMC_HPC1_LA18_CC_N <= flag_out_n;	
	FMC_HPC1_LA19_N    <= data_out_n(0);	
	FMC_HPC1_LA20_N    <= data_out_n(1);	
	FMC_HPC1_LA21_N    <= data_out_n(2);				
	FMC_HPC1_LA22_N    <= data_out_n(3);				
	FMC_HPC1_LA23_N    <= data_out_n(4);
	FMC_HPC1_LA24_N    <= data_out_n(5);
	FMC_HPC1_LA25_N    <= data_out_n(6);	
	FMC_HPC1_LA26_N    <= data_out_n(7);
	FMC_HPC1_LA27_N    <= data_out_n(8);
	FMC_HPC1_LA28_N    <= data_out_n(9);		
	FMC_HPC1_LA29_N    <= data_out_n(10);
	FMC_HPC1_LA30_N	  <= data_out_n(11);
	FMC_HPC1_LA31_N    <= data_out_n(12);
	FMC_HPC1_LA32_N    <= data_out_n(13);
	FMC_HPC1_LA33_N    <= data_out_n(14);
	
	--INPUTS
	clk_90deg_in_p      <= FMC_HPC1_LA00_CC_P ; 
	flag_in_p 	        <= FMC_HPC1_LA01_CC_P ; -- <-- this clock was not adeguate for clock forwarding: read more about it
	data_in_p(0)	    <= FMC_HPC1_LA02_P    ; 
	data_in_p(1)	    <= FMC_HPC1_LA03_P    ;	
	data_in_p(2)	    <= FMC_HPC1_LA04_P    ; 	
	data_in_p(3)	    <= FMC_HPC1_LA05_P    ;
	data_in_p(4)        <= FMC_HPC1_LA06_P    ;
	data_in_p(5)        <= FMC_HPC1_LA07_P    ;
	data_in_p(6)	    <= FMC_HPC1_LA08_P    ;
	data_in_p(7)        <= FMC_HPC1_LA09_P    ;
	data_in_p(8)        <= FMC_HPC1_LA10_P    ;
	data_in_p(9)	    <= FMC_HPC1_LA11_P    ;	
	data_in_p(10)       <= FMC_HPC1_LA12_P    ;
	data_in_p(11)       <= FMC_HPC1_LA13_P    ;
	data_in_p(12)       <= FMC_HPC1_LA14_P    ;
	data_in_p(13)       <= FMC_HPC1_LA15_P    ;
	data_in_p(14)       <= FMC_HPC1_LA16_P    ;
	                       
	clk_90deg_in_n      <= FMC_HPC1_LA00_CC_N ; 
	flag_in_n 	        <= FMC_HPC1_LA01_CC_N ;
	data_in_n(0) 	    <= FMC_HPC1_LA02_N    ; 
	data_in_n(1) 	    <= FMC_HPC1_LA03_N    ;	
	data_in_n(2) 	    <= FMC_HPC1_LA04_N    ; 	
	data_in_n(3) 	    <= FMC_HPC1_LA05_N    ;
	data_in_n(4)        <= FMC_HPC1_LA06_N    ;
	data_in_n(5)        <= FMC_HPC1_LA07_N    ;
	data_in_n(6) 	    <= FMC_HPC1_LA08_N    ;
	data_in_n(7)        <= FMC_HPC1_LA09_N    ;
	data_in_n(8)        <= FMC_HPC1_LA10_N    ;
	data_in_n(9) 	    <= FMC_HPC1_LA11_N    ;	
	data_in_n(10)       <= FMC_HPC1_LA12_N    ;
	data_in_n(11)       <= FMC_HPC1_LA13_N    ;
	data_in_n(12)       <= FMC_HPC1_LA14_N    ;
	data_in_n(13)       <= FMC_HPC1_LA15_N    ;
	data_in_n(14)       <= FMC_HPC1_LA16_N    ;
	
end Behavioral;
