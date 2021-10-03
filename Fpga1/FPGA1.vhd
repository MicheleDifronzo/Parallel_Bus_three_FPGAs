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





library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;
library xil_defaultlib;

entity FPGA1 is  --old name was "MasterTopLevel
		Port ( 
		--on the Master this 2 ports are connected to the system clock (300MHz)
				USER_SMA_CLOCK_P : in std_logic;--<-- gahters the reference clock signal from the Clock Generator (external device) through SMA port
				USER_SMA_CLOCK_N : in std_logic;--<-- gahters the reference state signal from the Clock Generator (external device) through SMA port									
				
				
			-----LVDS I/O FMC PORTS	:
				
				-----PARALLEL BUS CONNECTION TO SUBSYTEM "A" ON EXTERNAL FPGA 2
				FMC_HPC1_LA00_CC_P : out STD_LOGIC;    
				FMC_HPC1_LA01_CC_P : out STD_LOGIC; 	
				FMC_HPC1_LA02_P    : out STD_LOGIC; 	
				FMC_HPC1_LA03_P    : out STD_LOGIC; 	
				FMC_HPC1_LA04_P    : out STD_LOGIC; 				
				FMC_HPC1_LA05_P    : out STD_LOGIC; 				
				FMC_HPC1_LA06_P    : out STD_LOGIC; 
				FMC_HPC1_LA07_P    : out STD_LOGIC; 
				FMC_HPC1_LA08_P    : out STD_LOGIC; 	
				FMC_HPC1_LA09_P    : out STD_LOGIC; 
				FMC_HPC1_LA10_P    : out STD_LOGIC; 
				FMC_HPC1_LA11_P    : out STD_LOGIC; 		
				FMC_HPC1_LA12_P    : out STD_LOGIC; 
				FMC_HPC1_LA13_P    : out STD_LOGIC; 
				FMC_HPC1_LA14_P    : out STD_LOGIC; 
				FMC_HPC1_LA15_P    : out STD_LOGIC; 
				FMC_HPC1_LA16_P    : out STD_LOGIC; 
				FMC_HPC1_LA17_CC_P : in STD_LOGIC; 
				FMC_HPC1_LA18_CC_P : in STD_LOGIC;
				FMC_HPC1_LA19_P    : in STD_LOGIC; 
				FMC_HPC1_LA20_P    : in STD_LOGIC;	
				FMC_HPC1_LA21_P    : in STD_LOGIC; 	
				FMC_HPC1_LA22_P    : in STD_LOGIC;
				FMC_HPC1_LA23_P    : in STD_LOGIC;
				FMC_HPC1_LA24_P    : in STD_LOGIC;
				FMC_HPC1_LA25_P    : in STD_LOGIC;
				FMC_HPC1_LA26_P    : in STD_LOGIC;
				FMC_HPC1_LA27_P    : in STD_LOGIC;
				FMC_HPC1_LA28_P    : in STD_LOGIC;	
				FMC_HPC1_LA29_P    : in STD_LOGIC;
				FMC_HPC1_LA30_P	   : in STD_LOGIC;
				FMC_HPC1_LA31_P    : in STD_LOGIC;
				FMC_HPC1_LA32_P    : in STD_LOGIC;
				FMC_HPC1_LA33_P    : in STD_LOGIC;
				
				FMC_HPC1_LA00_CC_N : out STD_LOGIC; 
				FMC_HPC1_LA01_CC_N : out STD_LOGIC; 	
				FMC_HPC1_LA02_N    : out STD_LOGIC; 	
				FMC_HPC1_LA03_N    : out STD_LOGIC; 	
				FMC_HPC1_LA04_N    : out STD_LOGIC; 				
				FMC_HPC1_LA05_N    : out STD_LOGIC; 				
				FMC_HPC1_LA06_N    : out STD_LOGIC; 
				FMC_HPC1_LA07_N    : out STD_LOGIC; 
				FMC_HPC1_LA08_N    : out STD_LOGIC; 	
				FMC_HPC1_LA09_N    : out STD_LOGIC; 
				FMC_HPC1_LA10_N    : out STD_LOGIC; 
				FMC_HPC1_LA11_N    : out STD_LOGIC; 		
				FMC_HPC1_LA12_N    : out STD_LOGIC; 
				FMC_HPC1_LA13_N    : out STD_LOGIC; 
				FMC_HPC1_LA14_N    : out STD_LOGIC; 
				FMC_HPC1_LA15_N    : out STD_LOGIC; 
				FMC_HPC1_LA16_N    : out STD_LOGIC; 
				FMC_HPC1_LA17_CC_N : in STD_LOGIC; 
				FMC_HPC1_LA18_CC_N : in STD_LOGIC;
				FMC_HPC1_LA19_N    : in STD_LOGIC; 
				FMC_HPC1_LA20_N    : in STD_LOGIC;	
				FMC_HPC1_LA21_N    : in STD_LOGIC; 	
				FMC_HPC1_LA22_N    : in STD_LOGIC;
				FMC_HPC1_LA23_N    : in STD_LOGIC;
				FMC_HPC1_LA24_N    : in STD_LOGIC;
				FMC_HPC1_LA25_N    : in STD_LOGIC;
				FMC_HPC1_LA26_N    : in STD_LOGIC;
				FMC_HPC1_LA27_N    : in STD_LOGIC;
				FMC_HPC1_LA28_N    : in STD_LOGIC;	
				FMC_HPC1_LA29_N    : in STD_LOGIC;
				FMC_HPC1_LA30_N	   : in STD_LOGIC;
				FMC_HPC1_LA31_N    : in STD_LOGIC;
				FMC_HPC1_LA32_N    : in STD_LOGIC;
				FMC_HPC1_LA33_N    : in STD_LOGIC;	
				
				---------------------------------------------------------------
				--PARALLEL BUS CONNECTION TO SUBSYTEM "B" ON EXTERNAL FPGA 3
				---------------------------------------------------------------
				FMCP_HSPC_LA00_CC_P : out STD_LOGIC;    
				FMCP_HSPC_LA01_CC_P : out STD_LOGIC; 	
				FMCP_HSPC_LA02_P    : out STD_LOGIC; 	
				FMCP_HSPC_LA03_P    : out STD_LOGIC; 	
				FMCP_HSPC_LA04_P    : out STD_LOGIC; 				
				FMCP_HSPC_LA05_P    : out STD_LOGIC; 				
				FMCP_HSPC_LA06_P    : out STD_LOGIC; 
				FMCP_HSPC_LA07_P    : out STD_LOGIC; 
				FMCP_HSPC_LA08_P    : out STD_LOGIC; 	
				FMCP_HSPC_LA09_P    : out STD_LOGIC; 
				FMCP_HSPC_LA10_P    : out STD_LOGIC; 
				FMCP_HSPC_LA11_P    : out STD_LOGIC; 		
				FMCP_HSPC_LA12_P    : out STD_LOGIC; 
				FMCP_HSPC_LA13_P    : out STD_LOGIC; 
				FMCP_HSPC_LA14_P    : out STD_LOGIC; 
				FMCP_HSPC_LA15_P    : out STD_LOGIC; 
				FMCP_HSPC_LA16_P    : out STD_LOGIC; 
				FMCP_HSPC_LA17_CC_P : in STD_LOGIC; 
				FMCP_HSPC_LA18_CC_P : in STD_LOGIC;
				FMCP_HSPC_LA19_P    : in STD_LOGIC; 
				FMCP_HSPC_LA20_P    : in STD_LOGIC;	
				FMCP_HSPC_LA21_P    : in STD_LOGIC; 	
				FMCP_HSPC_LA22_P    : in STD_LOGIC;
				FMCP_HSPC_LA23_P    : in STD_LOGIC;
				FMCP_HSPC_LA24_P    : in STD_LOGIC;
				FMCP_HSPC_LA25_P    : in STD_LOGIC;
				FMCP_HSPC_LA26_P    : in STD_LOGIC;
				FMCP_HSPC_LA27_P    : in STD_LOGIC;
				FMCP_HSPC_LA28_P    : in STD_LOGIC;	
				FMCP_HSPC_LA29_P    : in STD_LOGIC;
				FMCP_HSPC_LA30_P	: in STD_LOGIC;
				FMCP_HSPC_LA31_P    : in STD_LOGIC;
				FMCP_HSPC_LA32_P    : in STD_LOGIC;
				FMCP_HSPC_LA33_P    : in STD_LOGIC;
				
				FMCP_HSPC_LA00_CC_N : out STD_LOGIC; 
				FMCP_HSPC_LA01_CC_N : out STD_LOGIC; 	
				FMCP_HSPC_LA02_N    : out STD_LOGIC; 	
				FMCP_HSPC_LA03_N    : out STD_LOGIC; 	
				FMCP_HSPC_LA04_N    : out STD_LOGIC; 				
				FMCP_HSPC_LA05_N    : out STD_LOGIC; 				
				FMCP_HSPC_LA06_N    : out STD_LOGIC; 
				FMCP_HSPC_LA07_N    : out STD_LOGIC; 
				FMCP_HSPC_LA08_N    : out STD_LOGIC; 	
				FMCP_HSPC_LA09_N    : out STD_LOGIC; 
				FMCP_HSPC_LA10_N    : out STD_LOGIC; 
				FMCP_HSPC_LA11_N    : out STD_LOGIC; 		
				FMCP_HSPC_LA12_N    : out STD_LOGIC; 
				FMCP_HSPC_LA13_N    : out STD_LOGIC; 
				FMCP_HSPC_LA14_N    : out STD_LOGIC; 
				FMCP_HSPC_LA15_N    : out STD_LOGIC; 
				FMCP_HSPC_LA16_N    : out STD_LOGIC; 
				FMCP_HSPC_LA17_CC_N : in STD_LOGIC; 
				FMCP_HSPC_LA18_CC_N : in STD_LOGIC;
				FMCP_HSPC_LA19_N    : in STD_LOGIC; 
				FMCP_HSPC_LA20_N    : in STD_LOGIC;	
				FMCP_HSPC_LA21_N    : in STD_LOGIC; 	
				FMCP_HSPC_LA22_N    : in STD_LOGIC;
				FMCP_HSPC_LA23_N    : in STD_LOGIC;
				FMCP_HSPC_LA24_N    : in STD_LOGIC;
				FMCP_HSPC_LA25_N    : in STD_LOGIC;
				FMCP_HSPC_LA26_N    : in STD_LOGIC;
				FMCP_HSPC_LA27_N    : in STD_LOGIC;
				FMCP_HSPC_LA28_N    : in STD_LOGIC;	
				FMCP_HSPC_LA29_N    : in STD_LOGIC;
				FMCP_HSPC_LA30_N	   : in STD_LOGIC;
				FMCP_HSPC_LA31_N    : in STD_LOGIC;
				FMCP_HSPC_LA32_N    : in STD_LOGIC;
				FMCP_HSPC_LA33_N    : in STD_LOGIC;
				-------Push Buttons
				GPIO_SW_N: in std_logic;	
				GPIO_SW_C:	in std_logic					
			);
end FPGA1;


---------------------------------------------------------------------------------------------------
architecture Behavioral of FPGA1 is
---------------------------------------------------------------------------------------------------
component MasterClockManager
port
(
	data_clk_0deg:  out std_logic;  
	data_clk_90deg:  out std_logic;  
	sim_clk:  out std_logic;  
	--Clock in ports
	clk_in1: in std_logic 
);
end component;

component Incoming_Clock_Manager
   port
    (-- Clock in ports
     -- Clock out ports
     clk_out1          : out    std_logic;
     clk_in1        : in     std_logic

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
			  CLK_IN 		: IN STD_LOGIC; --SIMULATION CLOCK 50NS			  
			  REF_CLK_IN 	: IN STD_LOGIC; --REF CLOCK 5NS			  
			  START 		: IN STD_LOGIC;	
			  READY 		: OUT STD_LOGIC;		  
			  DATA_IN_FROM_A 		: IN STD_LOGIC_VECTOR ( 89 downto 0 );--4BITS COUNTER		  		  
			  DATA_IN_FROM_C 		: IN STD_LOGIC_VECTOR ( 89 downto 0 );--4BITS COUNTER		  		  
			  DATA_OUT_TO_A 		   : OUT STD_LOGIC_VECTOR ( 89 downto 0 );		  
			  DATA_OUT_TO_C 		   : OUT STD_LOGIC_VECTOR ( 89 downto 0 );		  		  
			  DATA_OUT_PAST 		   : OUT STD_LOGIC_VECTOR ( 89 downto 0 );		  
			  ERRORDETECTOR: OUT STD_LOGIC;
			  ERRORCOUNTER: OUT STD_LOGIC_VECTOR ( 7 DOWNTO 0 )	 
		);
end component;

component toplevel_core_B
		Port( 
				ap_clk : IN STD_LOGIC;
				ap_rst : IN STD_LOGIC;
				ap_start : IN STD_LOGIC;
				ap_done : OUT STD_LOGIC;
				ap_idle : OUT STD_LOGIC;
				ap_ready : OUT STD_LOGIC;
				x_out_b_0_V : OUT STD_LOGIC_VECTOR (71 downto 0);
				x_out_b_1_V : OUT STD_LOGIC_VECTOR (71 downto 0);
				x_out_b_2_V : OUT STD_LOGIC_VECTOR (71 downto 0);
				V1_dab1_V : OUT STD_LOGIC_VECTOR (71 downto 0);
				V2_dab1_V : OUT STD_LOGIC_VECTOR (71 downto 0);
				I1_dab1_V : OUT STD_LOGIC_VECTOR (71 downto 0);
				I2_dab1_V : OUT STD_LOGIC_VECTOR (71 downto 0);
				I3_dab1_V : OUT STD_LOGIC_VECTOR (71 downto 0);
				Vp_dab1_V : OUT STD_LOGIC_VECTOR (71 downto 0);
				Vs_dab1_V : OUT STD_LOGIC_VECTOR (71 downto 0);
				i_in_port_model_of_a_V : IN STD_LOGIC_VECTOR (71 downto 0);
				i_in_port_model_of_c_V : IN STD_LOGIC_VECTOR (71 downto 0);
				i_out_port_model_to_a_V : OUT STD_LOGIC_VECTOR (71 downto 0);
				i_out_port_model_to_c_V : OUT STD_LOGIC_VECTOR (71 downto 0)	
			);
end component;


COMPONENT TWO_STAGES_SYNCHRONIZER 
    Port ( 

			DESTINATION_CLOCK  : IN  STD_LOGIC;     		
			INPUT_DATA  : IN  STD_LOGIC_VECTOR(89 downto 0);     		
			OUTPUT_DATA  : OUT  STD_LOGIC_VECTOR(89 downto 0)     		
	);
END COMPONENT;

COMPONENT TWO_STAGES_SYNCHRONIZER_16b 
    Port ( 

			DESTINATION_CLOCK  : IN  STD_LOGIC;     		
			INPUT_DATA  : IN  STD_LOGIC_VECTOR(15 downto 0);     		
			OUTPUT_DATA  : OUT  STD_LOGIC_VECTOR(15 downto 0)     		
	);
END COMPONENT;

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

component DAC34H84Interface is
    Port ( 
		if_reset : in STD_LOGIC;	--! active high reset for interface; does NOT affect the DAC board
		
		a_from_device : in STD_LOGIC_VECTOR (15 downto 0);	--! channel A data from device; 2's complement or offset binary
		b_from_device : in STD_LOGIC_VECTOR (15 downto 0);	--! channel B data from device; 2's complement or offset binary
		c_from_device : in STD_LOGIC_VECTOR (15 downto 0);	--! channel C data from device; 2's complement or offset binary
		d_from_device : in STD_LOGIC_VECTOR (15 downto 0);	--! channel D data from device; 2's complement or offset binary
		
		dac_clk_to_device_p : in STD_LOGIC;	--! clock sourced from DAC board (LVDS)
		dac_clk_to_device_n : in STD_LOGIC;	--! clock sourced from DAC board (LVDS)
		dac_clk_to_device : out STD_LOGIC;	--! clock sourced from DAC board (Single Ended)
		data_clk_to_dac_p : out STD_LOGIC;	--! clock to DAC board to clock in data (LVDS)
		data_clk_to_dac_n : out STD_LOGIC;	--! clock to DAC board to clock in data (LVDS)
		data_clk_to_dac_e : out STD_LOGIC;	--! clock to DAC board to clock in data (Single Ended)
		
		ab_to_dac_p : out STD_LOGIC_VECTOR (15 downto 0);	--! channel AB data to DAC (DDR, LVDS)
		ab_to_dac_n : out STD_LOGIC_VECTOR (15 downto 0);	--! channel AB data to DAC (DDR, LVDS)
		cd_to_dac_p : out STD_LOGIC_VECTOR (15 downto 0);	--! channel CD data to DAC (DDR, LVDS)
		cd_to_dac_n : out STD_LOGIC_VECTOR (15 downto 0)	--! channel CD data to DAC (DDR, LVDS)
	);
end component;





COMPONENT ila_0

PORT (
	clk : IN STD_LOGIC;



	probe0 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
	probe1 : IN STD_LOGIC_VECTOR(89 downto 0); 
	probe2 : IN STD_LOGIC_VECTOR(89 DOWNTO 0); 
	probe3 : IN STD_LOGIC_VECTOR(0 downto 0); 
	probe4 : IN STD_LOGIC_VECTOR(7 downto 0);
	probe5 : IN STD_LOGIC_VECTOR(89 downto 0);
	probe6 : IN STD_LOGIC_VECTOR(0 downto 0);
	probe7 : IN STD_LOGIC_VECTOR(0 downto 0)

);
END COMPONENT  ;

COMPONENT ila_1

PORT (
	clk : IN STD_LOGIC;

	probe0 : IN STD_LOGIC_VECTOR(89 DOWNTO 0); 
	probe1 : IN STD_LOGIC_VECTOR(0 downto 0)

);
END COMPONENT  ;


COMPONENT  ila_2
PORT 
(
	clk: in STD_LOGIC;

	probe0: in STD_LOGIC_VECTOR (89 downto 0); --data_out_to_c_debug, 
	probe1: in STD_LOGIC_VECTOR(0 downto 0);-- valid_s_p_B_debug,  --declare
	probe2: in STD_LOGIC_VECTOR(0 downto 0);--  rd_en_s_p_B_debug,  --declare
	probe3: in STD_LOGIC_VECTOR(0 downto 0);--  pbus_tx_fsm_ready_B_debug,  --declare
	probe4: in STD_LOGIC_VECTOR (29 downto 0) --  data_out_packet_B_debug,  --declare
);
END COMPONENT;
-------------------------------------------------------------------------------------
signal ready_simeng_debug       :  std_logic_vector(0 downto 0);
signal wr_en_to_fpga3_debug       :  std_logic_vector(0 downto 0);


signal flag_in_packet_vec_A       :  std_logic_vector(1 downto 0);
signal flag_in_packet_vec_B       :  std_logic_vector(1 downto 0);

signal state     : std_logic:= '0'; 
signal notstate     : std_logic:= '0'; 
signal notstate_i     : std_logic:= '0'; 
signal reset_oddr     : std_logic:= '0'; 
signal reset_iddr     : std_logic:= '0'; 


signal start_send     : std_logic:= '0'; 

signal sim_clk     : std_logic:= '0'; -- forwarded clock to slave board used as a system clock for it
signal clk_0deg    : std_logic:= '0'; -- user clock signal from clock manager to clock buffer
signal clk_90deg   : std_logic:= '0'; -- slave clock signal from clock manager to clock buffer
signal clk_90deg_packet_A   : std_logic:= '0'; -- slave clock signal from clock manager to clock buffer
signal clk_90deg_packet_B   : std_logic:= '0'; -- slave clock signal from clock manager to clock buffer
signal clk_90deg_p_A : std_logic:= '0';
signal clk_90deg_n_A : std_logic:= '0';
signal clk_90deg_p_B : std_logic:= '0';
signal clk_90deg_n_B : std_logic:= '0';

signal clk_90deg_in_A   : std_logic:= '0'; -- slave clock signal from clock manager to clock buffer
signal clk_90deg_in_B   : std_logic:= '0'; -- slave clock signal from clock manager to clock buffer
signal clk_90deg_in_packet_A   : std_logic:= '0'; -- slave clock signal from clock manager to clock buffer
signal clk_90deg_in_packet_B   : std_logic:= '0'; -- slave clock signal from clock manager to clock buffer
signal clk_90deg_bufgce_B   : std_logic:= '0'; -- slave clock signal from clock manager to clock buffer
signal clk_90deg_in_from_fmc_A   : std_logic:= '0'; -- slave clock signal from clock manager to clock buffer
signal clk_90deg_in_from_fmc_B   : std_logic:= '0'; -- slave clock signal from clock manager to clock buffer
signal clk_90deg_in_p_A : std_logic:= '0';
signal clk_90deg_in_n_A : std_logic:= '0';
signal clk_90deg_in_p_B : std_logic:= '0';
signal clk_90deg_in_n_B : std_logic:= '0';
signal data_out_A  : std_logic_vector( 89 downto 0):=(others=>'0');
signal data_out_B  : std_logic_vector( 89 downto 0):=(others=>'0');
signal data_out_packet_A  : std_logic_vector( 29 downto 0):=(others=>'0');
signal data_out_packet_B  : std_logic_vector( 29 downto 0):=(others=>'0');

signal data_out_past  : std_logic_vector( 89 downto 0):=(others=>'0');
signal data_out_packet  : std_logic_vector( 29 downto 0):=(others=>'0');
signal data_out_p_A: std_logic_vector ( 14 downto 0):=(others=>'0');
signal data_out_n_A: std_logic_vector ( 14 downto 0):=(others=>'0');
signal data_out_p_B: std_logic_vector ( 14 downto 0):=(others=>'0');
signal data_out_n_B: std_logic_vector ( 14 downto 0):=(others=>'0');
signal data_in_A   : std_logic_vector( 89 downto 0):=(others=>'0');
signal data_in_B   : std_logic_vector( 89 downto 0):=(others=>'0');
signal data_in_cdc   : std_logic_vector( 89 downto 0):=(others=>'0');
signal data_in_hold   : std_logic_vector( 29 downto 0):=(others=>'0');
signal data_in_packet_A  : std_logic_vector( 29 downto 0):=(others=>'0');
signal data_in_packet_B  : std_logic_vector( 29 downto 0):=(others=>'0');
signal data_in_p_A: std_logic_vector ( 14 downto 0);
signal data_in_n_A: std_logic_vector ( 14 downto 0):=(others=>'0');
signal data_in_p_B: std_logic_vector ( 14 downto 0);
signal data_in_n_B: std_logic_vector ( 14 downto 0):=(others=>'0');
signal data_valid_in_A: std_logic:= '0';
signal data_valid_in_B: std_logic:= '0';

signal flag_out  : std_logic:= '0';
signal flag_out_packet_A  : std_logic:= '0';
signal flag_out_packet_B  : std_logic:= '0';
signal flag_out_p_A: std_logic:= '0';
signal flag_out_n_A: std_logic:= '0';
signal flag_out_p_B: std_logic:= '0';
signal flag_out_n_B: std_logic:= '0';
signal flag_in   : std_logic:= '0';
signal flag_in_packet_A  : std_logic:= '0';
signal flag_in_packet_B  : std_logic:= '0';
signal flag_in_packet_i  : std_logic:= '0';
signal flag_in_packet_debug  : std_logic_vector ( 0 downto 0);
signal flag_in_p_A : std_logic:= '0';
signal flag_in_n_A : std_logic:= '0';
signal flag_in_p_B : std_logic:= '0';
signal flag_in_n_B : std_logic:= '0';
signal clock_enable : std_logic:= '1';

signal CE_oddr : std_logic:= '0';
signal CE_iddr : std_logic;
--Signals for button debouncing
signal begin_run   : std_logic := '0'; --! triggers logic to run
signal begin_run_p : std_logic := '0';
signal begin_run_n : std_logic := '0';
signal start       : std_logic := '0'; --! internal start signal for user logic
signal reset : std_logic := '0'; -- reset signal for logic              : std_logic := '0'; --! internal start signal for user logic
signal start_i           : std_logic := '0'; 
signal reset_i : std_logic := '0'; 

signal ErrorDetector_i : std_logic := '0'; 
signal ErrorCounter_i : std_logic_vector (7 downto 0) := (others=>'0'); 

signal data_in_from_a_debug   : std_logic_vector( 89 downto 0):=(others=>'0');
signal data_in_from_a_cdc_debug   : std_logic_vector( 89 downto 0):=(others=>'0');
signal data_valid_in_debug: std_logic_vector( 0 downto 0);
signal user_sma_state_debug: std_logic_vector( 0 downto 0);
signal data_in_from_c_debug  : std_logic_vector( 89 downto 0):=(others=>'0');
signal data_in_from_c_cdc_debug  : std_logic_vector( 89 downto 0):=(others=>'0');
signal data_out_past_debug  : std_logic_vector( 89 downto 0):=(others=>'0');


signal ErrorDetector_i_debug : std_logic_vector( 0 downto 0);
signal ErrorCounter_i_debug : std_logic_vector (7 downto 0) := (others=>'0'); 

signal data_in_polished : STD_LOGIC;
signal nc : STD_LOGIC;

signal ErrorDetector:  STD_LOGIC;
signal ErrorCounter:  STD_LOGIC_VECTOR ( 7 downto 0 );

signal ErrorDetector_debug:  STD_LOGIC_VECTOR ( 0 downto 0 );
signal ErrorCounter_debug:  STD_LOGIC_VECTOR ( 7 downto 0 );

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


signal pbus_tx_fsm_ready_A: std_logic:= '0';
signal pbus_tx_fsm_ready_B: std_logic:= '0';


signal data_in_from_a : std_logic_vector ( 89 downto 0 );--4bits counter		  		  
signal data_in_from_c : std_logic_vector ( 89 downto 0 );--4bits counter		  		  
signal data_out_to_a  :  std_logic_vector ( 89 downto 0 );		  
signal data_out_to_c  :  std_logic_vector ( 89 downto 0 );	
signal data_in_from_a_cdc : std_logic_vector ( 89 downto 0 );--4bits counter		  		  
signal data_in_from_c_cdc : std_logic_vector ( 89 downto 0 );--4bits counter		  		  
signal data_out_to_a_cdc  :  std_logic_vector ( 89 downto 0 );		  
signal data_out_to_c_cdc  :  std_logic_vector ( 89 downto 0 );		  		  


signal data_out_to_c_debug  :  std_logic_vector ( 89 downto 0 );	
signal data_out_to_c_cdc_debug  :  std_logic_vector ( 89 downto 0 );
	
signal flag_in_packet_B_debug  :  std_logic_vector ( 0 downto 0 );	

------------------------------------------------------
-- 			TI_DAC
-------------------------------------------------------
signal a_from_device : STD_LOGIC_VECTOR (15 downto 0);
signal b_from_device : STD_LOGIC_VECTOR (15 downto 0);
signal c_from_device : STD_LOGIC_VECTOR (15 downto 0);
signal d_from_device : STD_LOGIC_VECTOR (15 downto 0);

signal ab_to_dac_p : STD_LOGIC_VECTOR (15 downto 0);
signal ab_to_dac_n : STD_LOGIC_VECTOR (15 downto 0);
signal cd_to_dac_p : STD_LOGIC_VECTOR (15 downto 0);
signal cd_to_dac_n : STD_LOGIC_VECTOR (15 downto 0);

signal dac_clk_to_device_p : STD_LOGIC;
signal dac_clk_to_device_n : STD_LOGIC;
signal dac_clk_to_device : STD_LOGIC;
signal data_clk_to_dac_p : STD_LOGIC;
signal data_clk_to_dac_n : STD_LOGIC;


signal a_out: STD_LOGIC_VECTOR (15 downto 0);
signal b_out: STD_LOGIC_VECTOR (15 downto 0);
signal c_out: STD_LOGIC_VECTOR (15 downto 0);
signal d_out: STD_LOGIC_VECTOR (15 downto 0);

signal a_out_to_dac: STD_LOGIC_VECTOR (15 downto 0);
signal b_out_to_dac: STD_LOGIC_VECTOR (15 downto 0);
signal c_out_to_dac: STD_LOGIC_VECTOR (15 downto 0);
signal d_out_to_dac: STD_LOGIC_VECTOR (15 downto 0);

signal zeros   : std_logic_vector( 17 downto 0);
signal concat_inj_tx_A   : std_logic_vector( 89 downto 0);
signal concat_inj_rx_A   : std_logic_vector( 89 downto 0);
signal concat_inj_tx_B   : std_logic_vector( 89 downto 0);
signal concat_inj_rx_B   : std_logic_vector( 89 downto 0);
signal din_current_injection_TX_A : STD_LOGIC_VECTOR (71 downto 0);
signal current_inject_from_cdc_A   : std_logic_vector( 71 downto 0);

signal din_current_injection_TX_B : STD_LOGIC_VECTOR (71 downto 0);
signal current_inject_from_cdc_B   : std_logic_vector( 71 downto 0);

--CDC_SIM_TO_PBUS
signal wr_en_s_p_A :  STD_LOGIC;
signal rd_en_s_p_A :  STD_LOGIC;
signal full_s_p_A :  STD_LOGIC;
signal empty_s_p_A :  STD_LOGIC;
signal valid_s_p_A :  STD_LOGIC;

signal wr_en_s_p_B :  STD_LOGIC;
signal rd_en_s_p_B :  STD_LOGIC;
signal full_s_p_B :  STD_LOGIC;
signal empty_s_p_B :  STD_LOGIC;
signal valid_s_p_B :  STD_LOGIC;



signal i_in_port_model_of_c_V :  STD_LOGIC_VECTOR (71 downto 0);
signal i_out_port_model_to_c_V :  STD_LOGIC_VECTOR (71 downto 0) ;




signal valid_s_p_B_debug:  STD_LOGIC_VECTOR (0 downto 0);
signal rd_en_s_p_B_debug:  STD_LOGIC_VECTOR (0 downto 0);
signal pbus_tx_fsm_ready_B_debug:  STD_LOGIC_VECTOR (0 downto 0);
signal data_out_packet_B_debug:  STD_LOGIC_VECTOR (29 downto 0);
-------------------------------------------------------------------------------------

-- attribute mark_debug : string;

-- attribute mark_debug of user_sma_state_debug 	: signal is "true";
-- attribute mark_debug of data_in_from_a_cdc_debug: signal is "true";
-- attribute mark_debug of data_in_from_c_cdc_debug: signal is "true";
-- attribute mark_debug of ErrorDetector_debug	    : signal is "true";
-- attribute mark_debug of ErrorCounter_debug		: signal is "true";
-- attribute mark_debug of data_out_to_c_cdc_debug	: signal is "true";
-- attribute mark_debug of ready_simeng_debug	    : signal is "true";
-- attribute mark_debug of wr_en_to_fpga3_debug	: signal is "true";
-- attribute mark_debug of data_in_from_c_debug	: signal is "true";
-- attribute mark_debug of flag_in_packet_B_debug	: signal is "true";
-- attribute mark_debug of data_out_to_c_debug 	: signal is "true";
-- attribute mark_debug of valid_s_p_B_debug          : signal is "true";
-- attribute mark_debug of rd_en_s_p_B_debug          : signal is "true";
-- attribute mark_debug of pbus_tx_fsm_ready_B_debug  : signal is "true";
-- attribute mark_debug of data_out_packet_B_debug    : signal is "true";


begin


    --GENERATE THE CLOCK SIGNALS FROM EXTERNAL CLOCK MANAGER SIGNAL
	MasterClockManager_inst: MasterClockManager  
	Port map
	(  
		data_clk_0deg => clk_0deg,  --clock 100MHz  0deg
		data_clk_90deg => clk_90deg,  --clock 100MHz  90deg
		sim_clk=>sim_clk,
		--Clock in ports
		clk_in1 => USER_SMA_CLOCK_P      --name in virtex: sys_data_clk_90deg_n
	);





	--start             <= GPIO_SW_N;
	--reset             <= GPIO_SW_C;
-------------------------------------------------------------------------------------------------		

-- DEBOUNCING THE START BUTTON	
--Debouncer_inst: Debouncer     --<-- to activate the Parallel bus push the button "start" such that "reset" has to stay equal to zero
--	Port map( 
--			  clk_in =>clk_0deg,
--			  start =>GPIO_SW_N,
--			  reset =>	GPIO_SW_C,	
--			  begin_run =>	begin_run
--			);
-------------------------------------------------------------------------------------------------					

RegisterStartState: process(clk_0deg, USER_SMA_CLOCK_N)
variable start_i : std_logic := '0';  
begin
	if(rising_edge(clk_0deg)) then
		start_send<= not USER_SMA_CLOCK_N;
	end if;
end process;				
-------------------------------------------------------------------------------------------------					
	--notstate <= not state;
	--notstate <= not USER_SMA_CLOCK_N;
	
	
	
	--reset_i <= not begin_run;
	
	ParallelBusInterface_with_FPGA_2: ParallelBusInterface   --ParallelBusInterface_A
	Port map
	( 
		--reset	
		reset_from_device => '0', --: in std_logic; --! reset for parallel bus interface
		
		--sender side from device	
		data_clk_0_from_device   => clk_0deg, --  from System Manager --! data clock (0deg) for sending data
		data_clk_90_from_device  => clk_90deg, --from System Manage --! data clock (90deg) to forward to another device (source synchronous)	
		data_to_send_from_device => data_out_A,--data_out_to_a,--"1011",--data_out, --: in std_logic_vector(89 downto 0); --! data to send from device to another device
		start_send_from_device   => start_send,--flag_out, -- : in std_logic;                     --! pulsed start flag to trigger sending data from device to another device	
		--sender side to I/O	
		oddr_input_send_to_io   => data_out_packet_A, --: out std_logic_vector(29 downto 0); --! sent data packet bus to be sent to another device, going to input of an I/O output register for sender
		ce_oddr_send_to_io      => open, --CE_oddr, --: out std_logic;   --! Clock enable going to CE of an I/O output register for sender
		data_clk_90_send_to_io  => clk_90deg_packet_A, --: out std_logic;   --! forwarded 90deg data clock to be sent to another device, going to clock of an I/O output register for sender
		incoming_send_to_io     => flag_out_packet_A, --: out std_logic;   --! sent data incoming flag to be sent to another device, going to input of an I/O output register for sender
		READY => pbus_tx_fsm_ready_A,
		--receiver side to/from I/O	
		ce_iddr_recv_to_io             => open, --CE_iddr, --: out std_logic;   --! Clock enable going to CE of I/O input register for receiver
		iddr_output_recv_from_io       => data_in_packet_A, --: in std_logic_vector(29 downto 0); --! received data packet bus from another device, coming from output of an I/O input register for receiver
		incoming_recv_from_io          => flag_in_packet_A, --: in std_logic;       --! received data incoming flag from another device, coming from output of an I/O input buffer for receiver
		data_clk_forward_recv_from_io  => clk_90deg_in_packet_A, --: in std_logic;       --! received forwarded (90deg+delay) data clock from another device, coming from output of an I/O input (clock capable) buffer for receiver
		--receiver side to device
		data_recv_to_device              =>data_in_A, -- data_in_from_a, --: out std_logic_vector(89 downto 0); --! data received from another device
		data_valid_recv_to_device        => data_valid_in_A, --: out std_logic;    --! data valid flag indicating received data is valid to read
		data_clk_forward_recv_to_device  => clk_90deg_in_A --: out std_logic      --! forwarded data clock (90deg+delay) from another device 
	);	

	ParallelBusInterface_with_FPGA_3: ParallelBusInterface --ParallelBusInterface_B
	Port map
	( 
		--reset	
		reset_from_device => '0', --: in std_logic; --! reset for parallel bus interface
		
		--sender side from device	
		data_clk_0_from_device   => clk_0deg, --  from System Manager --! data clock (0deg) for sending data
		data_clk_90_from_device  => clk_90deg, --from System Manage --! data clock (90deg) to forward to another device (source synchronous)	
		data_to_send_from_device => data_out_B,--data_out_to_c,--"1011",--data_out, --: in std_logic_vector(89 downto 0); --! data to send from device to another device
		start_send_from_device   => start_send,--flag_out, -- : in std_logic;                     --! pulsed start flag to trigger sending data from device to another device	
		--sender side to I/O	
		oddr_input_send_to_io   => data_out_packet_B, --: out std_logic_vector(29 downto 0); --! sent data packet bus to be sent to another device, going to input of an I/O output register for sender
		ce_oddr_send_to_io      => open, --CE_oddr, --: out std_logic;   --! Clock enable going to CE of an I/O output register for sender
		data_clk_90_send_to_io  => clk_90deg_packet_B, --: out std_logic;   --! forwarded 90deg data clock to be sent to another device, going to clock of an I/O output register for sender
		incoming_send_to_io     => flag_out_packet_B, --: out std_logic;   --! sent data incoming flag to be sent to another device, going to input of an I/O output register for sender
		READY => pbus_tx_fsm_ready_B,
		--receiver side to/from I/O	
		ce_iddr_recv_to_io             => open, --CE_iddr, --: out std_logic;   --! Clock enable going to CE of I/O input register for receiver
		iddr_output_recv_from_io       => data_in_packet_B, --: in std_logic_vector(29 downto 0); --! received data packet bus from another device, coming from output of an I/O input register for receiver
		incoming_recv_from_io          => flag_in_packet_B, --: in std_logic;       --! received data incoming flag from another device, coming from output of an I/O input buffer for receiver
		data_clk_forward_recv_from_io  => clk_90deg_in_packet_B, --: in std_logic;       --! received forwarded (90deg+delay) data clock from another device, coming from output of an I/O input (clock capable) buffer for receiver
		--receiver side to device
		data_recv_to_device              => data_in_B, --data_in_from_c, --: out std_logic_vector(89 downto 0); --! data received from another device
		data_valid_recv_to_device        => data_valid_in_B, --: out std_logic;    --! data valid flag indicating received data is valid to read
		data_clk_forward_recv_to_device  => clk_90deg_in_B --: out std_logic      --! forwarded data clock (90deg+delay) from another device 
	);	


-----------------------------------------------------------------------------------------------------------------------------------------------------------------		
--						SENDING SIDE PBUS "A"
-----------------------------------------------------------------------------------------------------------------------------------------------------------------		
-- AutoReset_for_ODDR: AutoReset 
    -- Port map ( 
			-- CLOCK 	 => clk_0deg,  --clk_0deg and clk_90deg_packet are related since coming from same MMCM
			-- RESET   =>  reset_oddr	
	-- );



	ODDR_clk_A: ODDR_2b  --forwards the 90deg clock to the other device 
	Port map
	(  
		data_out_from_device=>"10", --"01" is the same of: data_out_from_device(0)=>'0',data_out_from_device(1)=>'1'
		data_out_to_pins_p(0)  => clk_90deg_p_A, --out STD_LOGIC_VECTOR ( 0 to 0 );
		data_out_to_pins_n(0)  => clk_90deg_n_A, --out STD_LOGIC_VECTOR ( 0 to 0 );
		clk_in => clk_90deg_packet_A, 
		clk_en => '1',--CE_oddr,
		io_reset => '0'
	);
	
	ODDR_flag_A: ODDR_2b   
	Port map
	(  
		data_out_from_device(0)=>flag_out_packet_A, 
		data_out_from_device(1)=>flag_out_packet_A, 
		data_out_to_pins_p(0)  => flag_out_p_A, 
		data_out_to_pins_n(0)  => flag_out_n_A, 
		clk_in => clk_0deg, 
		clk_en => '1',--CE_oddr, 
		io_reset => '0'
	);
	
	ODDR_data_A: ODDR_4b 
    port map 
	( 
		data_out_from_device =>data_out_packet_A,--: in STD_LOGIC_VECTOR ( 29 downto 0 );
		data_out_to_pins_p   =>data_out_p_A,--: out STD_LOGIC_VECTOR ( 14 downto 0 );
		data_out_to_pins_n   =>data_out_n_A,--: out STD_LOGIC_VECTOR ( 14 downto 0 );
		clk_in   => clk_0deg,--: in STD_LOGIC;
		clk_en   =>'1',--CE_oddr, --: in STD_LOGIC;
		io_reset => '0'--: in STD_LOGIC			
	);
	
-----------------------------------------------------------------------------------------------------------------------------------------------------------------		
--						SENDING SIDE PBUS "B"
-----------------------------------------------------------------------------------------------------------------------------------------------------------------		
	ODDR_clk_B: ODDR_2b  --forwards the 90deg clock to the other device 
	Port map
	(  
		data_out_from_device=>"10", --"01" is the same of: data_out_from_device(0)=>'0',data_out_from_device(1)=>'1'
		data_out_to_pins_p(0)  => clk_90deg_p_B, --out STD_LOGIC_VECTOR ( 0 to 0 );
		data_out_to_pins_n(0)  => clk_90deg_n_B, --out STD_LOGIC_VECTOR ( 0 to 0 );
		clk_in => clk_90deg_packet_B, 
		clk_en => '1',--CE_oddr,
		io_reset => '0'
	);
	
	ODDR_flag_B: ODDR_2b   
	Port map
	(  
		data_out_from_device(0)=>flag_out_packet_B, 
		data_out_from_device(1)=>flag_out_packet_B, 
		data_out_to_pins_p(0)  => flag_out_p_B, 
		data_out_to_pins_n(0)  => flag_out_n_B, 
		clk_in => clk_0deg, 
		clk_en => '1',--CE_oddr, 
		io_reset => '0'
	);
	
	ODDR_data_B: ODDR_4b 
    port map 
	( 
		data_out_from_device =>data_out_packet_B,--: in STD_LOGIC_VECTOR ( 29 downto 0 );
		data_out_to_pins_p   =>data_out_p_B,--: out STD_LOGIC_VECTOR ( 14 downto 0 );
		data_out_to_pins_n   =>data_out_n_B,--: out STD_LOGIC_VECTOR ( 14 downto 0 );
		clk_in   => clk_0deg,--: in STD_LOGIC;
		clk_en   =>'1',--CE_oddr, --: in STD_LOGIC;
		io_reset => '0'--: in STD_LOGIC			
	);
	
	
-----------------------------------------------------------------------------------------------------------------------------------------------------------------		
--						RECEIVING SIDE	PARALLEL BUS "A"
-----------------------------------------------------------------------------------------------------------------------------------------------------------------		

   IBUFDS_incoming_clock_A : IBUFDS
   generic map (
      DQS_BIAS => "FALSE"  -- (FALSE, TRUE)
   )
   port map (
      O => clk_90deg_in_from_fmc_A,   -- 1-bit output: Buffer output
      I => clk_90deg_in_p_A,   -- 1-bit input: Diff_p buffer input (connect directly to top-level port)
      IB => clk_90deg_in_n_A  -- 1-bit input: Diff_n buffer input (connect directly to top-level port)
   );	
	
	
   BUFG_inst_A : BUFG
   port map (
      O => clk_90deg_in_packet_A, -- 1-bit output: Clock output
      I => clk_90deg_in_from_fmc_A  -- 1-bit input: Clock input
   );	
	


	
	IDDR_data_A: IDDR_4b
	Port map
	(
		data_in_from_pins_p     =>data_in_p_A,--: in  std_logic_vector(14 downto 0);
		data_in_from_pins_n     =>data_in_n_A,--: in  std_logic_vector(14 downto 0);
		data_in_to_device   => data_in_packet_A,--: out std_logic_vector(29 downto 0);
		-- Clock and reset signals
		clk_in                  =>clk_90deg_in_A,--: in  std_logic;                    -- Fast clock from PLL/MMCM 
		clk_en                  =>'1',--CE_iddr--: in  std_logic;    
		io_reset                =>'0'--: in  std_logic                   -- Reset signal for IO circuit
	);


	
	IDDR_incoming_flag_A: IDDR_2b
	Port map
	(
		data_in_from_pins_p(0)     =>flag_in_p_A,-- 1-bit input: Diff_p buffer input 
		data_in_from_pins_n(0)     =>flag_in_n_A,
		data_in_to_device   => flag_in_packet_vec_A,--: out 
		-- Clock and reset signals
		clk_in                  =>clk_90deg_in_A,--: in  std_logic;                    -- Fast clock from PLL/MMCM 
		clk_en                  =>'1',--: in  std_logic;    
		io_reset                =>'0'--: in  std_logic                   -- Reset signal for IO circuit
	);		
	flag_in_packet_A <= flag_in_packet_vec_A(0) ;





zeros <= (others=>'0')   ; 
concat_inj_tx_A <= zeros & din_current_injection_TX_A;
concat_inj_rx_A <= zeros & current_inject_from_cdc_A;

	CDC_PBUS_TO_SIM_A: Two_Stages_Synchronizer
		Port map ( 
	
				DESTINATION_CLOCK  => sim_clk,     		
				INPUT_DATA   => 	data_in_A,	--data_in_from_a,--
				OUTPUT_DATA =>  concat_inj_rx_A 		--data_in_from_a_cdc --	
		);

	-- CDC_SIM_TO_PBUS: Two_Stages_Synchronizer
		-- Port map ( 
	
				-- DESTINATION_CLOCK  => clk_0deg,     		
				-- INPUT_DATA   => concat_inj_tx_A	,	
				-- OUTPUT_DATA =>  data_out    		
		-- );
		
CDC_SIM_TO_PBUS_A : FIFO_90BIT
  PORT MAP (
    rst => reset_i,
    wr_clk => sim_clk,
    rd_clk => clk_0deg,
    din => concat_inj_tx_A, --data_out_to_a_cdc, --
    wr_en => wr_en_s_p_A,
    rd_en => rd_en_s_p_A,
    dout => data_out_A, --data_out_to_a, --
    full => full_s_p_A,
    empty => empty_s_p_A,
    valid => valid_s_p_A,
    wr_rst_busy => open,
    rd_rst_busy => open
  );
		
wr_en_s_p_A <= ap_ready_sim and not full_s_p_A;		
rd_en_s_p_A <= valid_s_p_A and pbus_tx_fsm_ready_A;

AutoReset_for_FIFO: AutoReset 
    Port map ( 
			CLOCK 	 => sim_clk,  --clk_0deg and clk_90deg_packet are related since coming from same MMCM
			RESET   =>  reset_i	
	);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------		
--						RECEIVING SIDE	PARALLEL BUS "B"
-----------------------------------------------------------------------------------------------------------------------------------------------------------------		

   IBUFDS_incoming_clock_B : IBUFDS
   generic map (
      DQS_BIAS => "FALSE"  -- (FALSE, TRUE)
   )
   port map (
      O => clk_90deg_in_from_fmc_B,   -- 1-bit output: Buffer output
      I => clk_90deg_in_p_B,   -- 1-bit input: Diff_p buffer input (connect directly to top-level port)
      IB => clk_90deg_in_n_B  -- 1-bit input: Diff_n buffer input (connect directly to top-level port)
   );	
	
	
   BUFG_inst_B : BUFG
   port map (
      O => clk_90deg_in_packet_B,--clk_90deg_bufgce_B, -- 1-bit output: Clock output
      I => clk_90deg_in_from_fmc_B  -- 1-bit input: Clock input
   );	
	


--Incoming_Clock_Manager_Pbus_B : Incoming_Clock_Manager
--   port map ( 
--  -- Clock out ports  
--   clk_out1 => clk_90deg_in_packet_B,
--   -- Clock in ports
--   clk_in1 => clk_90deg_bufgce_B

-- );


	
	IDDR_data_B: IDDR_4b
	Port map
	(
		data_in_from_pins_p     =>data_in_p_B,--: in  std_logic_vector(14 downto 0);
		data_in_from_pins_n     =>data_in_n_B,--: in  std_logic_vector(14 downto 0);
		data_in_to_device   => data_in_packet_B,--: out std_logic_vector(29 downto 0);
		-- Clock and reset signals
		clk_in                  =>clk_90deg_in_B,--: in  std_logic;                    -- Fast clock from PLL/MMCM 
		clk_en                  =>'1',--CE_iddr--: in  std_logic;    
		io_reset                =>'0'--: in  std_logic                   -- Reset signal for IO circuit
	);


	
	IDDR_incoming_flag_B: IDDR_2b
	Port map
	(
		data_in_from_pins_p(0)     =>flag_in_p_B,-- 1-bit input: Diff_p buffer input 
		data_in_from_pins_n(0)     =>flag_in_n_B,
		data_in_to_device   => flag_in_packet_vec_B,--: out 
		-- Clock and reset signals
		clk_in                  =>clk_90deg_in_B,--: in  std_logic;                    -- Fast clock from PLL/MMCM 
		clk_en                  =>'1',--: in  std_logic;    
		io_reset                =>'0'--: in  std_logic                   -- Reset signal for IO circuit
	);		
	flag_in_packet_B <= flag_in_packet_vec_B(0) ;





zeros <= (others=>'0')   ; 
concat_inj_tx_B <= zeros & din_current_injection_TX_B;
concat_inj_rx_B <= zeros & current_inject_from_cdc_B;

	CDC_PBUS_TO_SIM_B: Two_Stages_Synchronizer
		Port map ( 
	
				DESTINATION_CLOCK  => sim_clk,     		
				INPUT_DATA   => data_in_B,	--data_in_from_c,--data_in_B,	
				OUTPUT_DATA =>  concat_inj_rx_B --data_in_from_c_cdc --			
		);


		
CDC_SIM_TO_PBUS_B : FIFO_90BIT
  PORT MAP (
    rst => reset_i,
    wr_clk => sim_clk,
    rd_clk => clk_0deg,
    din => concat_inj_tx_B, --data_out_to_c_cdc, --
    wr_en => wr_en_s_p_B,
    rd_en => rd_en_s_p_B,
    dout => data_out_B,-- data_out_to_c, --
    full => full_s_p_B,
    empty => empty_s_p_B,
    valid => valid_s_p_B,
    wr_rst_busy => open,
    rd_rst_busy => open
  );
		
wr_en_s_p_B <= ap_ready_sim and not full_s_p_B;		
rd_en_s_p_B <= valid_s_p_B and pbus_tx_fsm_ready_B;

	-------------------------------------------------------------------------------------------------
    --   SIMULATION ENGINE
	-------------------------------------------------------------------------------------------------
	
	
	--ROUTING DATA BETWEEN  SUBSYSTEM A(FPGA 2) AND C(FPGA 3)
	--data_out_to_a_cdc <= data_in_from_c_cdc;
	--data_out_to_c_cdc <= data_in_from_a_cdc;
	
	
	--LOOP-BACKS:
	--data_out_to_a_cdc <= data_in_from_a_cdc;
	--data_out_to_c_cdc <= data_in_from_c_cdc;	
	
	
  	-- Counter_inst: SimulationEngine 
    -- port map ( 
				-- clk_in => sim_clk,--clk_0deg,--sim_clk,
			    -- ref_clk_in => nc,
				-- start => USER_SMA_CLOCK_N,
				-- ready => ap_ready_sim,
				
				-- data_in_from_a  => data_in_from_a_cdc, 
				-- data_in_from_c  => data_in_from_c_cdc, 
				-- data_out_to_a  => data_out_to_a_cdc, 
				-- data_out_to_c  => data_out_to_c_cdc, 

				-- data_out_past  => data_out_past,				
				-- ErrorDetector => ErrorDetector,
				-- ErrorCounter => ErrorCounter				
			  -- );
	
	SubsystemB: toplevel_core_B 
    port map ( 
				ap_clk => sim_clk,
				ap_rst => GPIO_SW_C,
				ap_start => USER_SMA_CLOCK_N,
				ap_done => open,
				ap_idle => open,
				ap_ready => ap_ready_sim,			
				

				x_out_b_0_V => open,
				x_out_b_1_V => open,
				x_out_b_2_V => open,

				V1_dab1_V => open,
				V2_dab1_V => open,
				I1_dab1_V => open,
				I2_dab1_V => open,
				I3_dab1_V => open,
				Vp_dab1_V => open,
				Vs_dab1_V => open,

				i_in_port_model_of_a_V => current_inject_from_cdc_A(71 downto 0),--data_in(71 downto 0), --RX							
	
				i_in_port_model_of_c_V => current_inject_from_cdc_B(71 downto 0),
	
				i_out_port_model_to_a_V  => din_current_injection_TX_A(71 downto 0), --TX

				i_out_port_model_to_c_V => din_current_injection_TX_B(71 downto 0)
				
			  );			  


	
-- ILA_SIMULATION_ENGINE : ila_0
-- PORT MAP (
	-- clk => sim_clk,



	-- probe0 => USER_SMA_STATE_debug,  --start signal from System Manager
	-- probe1 => data_in_from_a_cdc_debug, 
	-- probe2 => data_in_from_c_cdc_debug, 
	-- probe3 => ErrorDetector_debug,
	-- probe4 => ErrorCounter_debug,
	-- probe5 => data_out_to_c_cdc_debug,
	-- probe6 => ready_simeng_debug,
	-- probe7 => wr_en_to_fpga3_debug
-- );

	-- ILA_SIMULATION_ENGINE_REGISTER : process
									-- (
										-- sim_clk,
										-- USER_SMA_CLOCK_N,  --start signal from System Manager
										-- data_in_from_a_cdc, 
										-- data_in_from_c_cdc,
										-- ErrorDetector,
										-- ErrorCounter,
										-- data_out_to_c_cdc,
										-- ap_ready_sim,
										-- wr_en_s_p_B

									-- ) is
	-- begin	
		-- if(rising_edge(sim_clk)) then

									-- user_sma_state_debug(0) <=	 USER_SMA_CLOCK_N;  --start signal from System Manager
									-- data_in_from_a_cdc_debug 	<=	 data_in_from_a_cdc; 
									-- data_in_from_c_cdc_debug 	<= 	 data_in_from_c_cdc; 
									-- ErrorDetector_debug(0)	<=	 ErrorDetector;
									-- ErrorCounter_debug		<=	 ErrorCounter;	
									-- data_out_to_c_cdc_debug		<=	 data_out_to_c_cdc;										
									-- ready_simeng_debug(0)	<=	 ap_ready_sim;										
									-- wr_en_to_fpga3_debug(0)	<=	 wr_en_s_p_B;	 --CDC_SIM_TO_PBUS_B							

		-- end if;	
	-- end process;


	-- ILA_PBUS_from_FPGA3 : ila_1
	-- PORT MAP 
	-- (
		-- clk => clk_90deg_in_packet_B,
	
		-- probe0 => data_in_from_c_debug,   -- declare signal 
		-- probe1 => flag_in_packet_B_debug  --declare signal
	-- );

	-- ILA_PBUS_FROM_FPGA3_REGISTER : process
								-- (
									-- clk_90deg_in_packet_B,
									-- data_in_from_c,
									-- flag_in_packet_B

								-- ) is
	-- begin	
		-- if(rising_edge(clk_90deg_in_packet_B)) then

			-- data_in_from_c_debug <=	 data_in_from_c;  --start signal from System Manager
			-- flag_in_packet_B_debug(0) 	<=	 flag_in_packet_B; 
							
		-- end if;	
	-- end process;


	-- ILA_PBUS_to_FPGA3 : ila_2
	-- PORT MAP 
	-- (
		-- clk => clk_0deg,
	
		-- probe0 => data_out_to_c_debug, 
		-- probe1 => valid_s_p_B_debug,  
		-- probe2 => rd_en_s_p_B_debug,  
		-- probe3 => pbus_tx_fsm_ready_B_debug,  
		-- probe4 => data_out_packet_B_debug  
	-- );

	-- ILA_PBUS_to_FPGA3_REGISTER : process
								-- (
									-- clk_0deg,
								
									-- data_out_to_c, 
									-- valid_s_p_B,  
									-- rd_en_s_p_B,  
									-- pbus_tx_fsm_ready_B,  
									-- data_out_packet_B  

								-- ) is
	-- begin	
		-- if(rising_edge(clk_0deg)) then

			-- data_out_to_c_debug 		<= data_out_to_c; 
			-- valid_s_p_B_debug(0)        <= valid_s_p_B;  
			-- rd_en_s_p_B_debug(0)        <= rd_en_s_p_B;  
			-- pbus_tx_fsm_ready_B_debug(0)<= pbus_tx_fsm_ready_B;
			-- data_out_packet_B_debug     <= data_out_packet_B;  
							
		-- end if;	
	-- end process;
	-----------------------------------------------------------------
	--   PARALLEL BUS "A" CONNECTION TO I/O PORTS 
	-----------------------------------------------------------------

	--Output
	FMC_HPC1_LA00_CC_P <= clk_90deg_p_A;   
	FMC_HPC1_LA01_CC_P <= flag_out_p_A;	     -- <-- this clock was not adeguate for clock forwarding: read more about it (in the pinout has only acronym "QBC" rather than "GC" (means Global Clock capable pin))
	FMC_HPC1_LA02_P    <= data_out_p_A(0);	
	FMC_HPC1_LA03_P    <= data_out_p_A(1);	
	FMC_HPC1_LA04_P    <= data_out_p_A(2);				
	FMC_HPC1_LA05_P    <= data_out_p_A(3);				
	FMC_HPC1_LA06_P    <= data_out_p_A(4);
	FMC_HPC1_LA07_P    <= data_out_p_A(5);
	FMC_HPC1_LA08_P    <= data_out_p_A(6);	
	FMC_HPC1_LA09_P    <= data_out_p_A(7);
	FMC_HPC1_LA10_P    <= data_out_p_A(8);
	FMC_HPC1_LA11_P    <= data_out_p_A(9);		
	FMC_HPC1_LA12_P    <= data_out_p_A(10);
	FMC_HPC1_LA13_P    <= data_out_p_A(11);
	FMC_HPC1_LA14_P    <= data_out_p_A(12);
	FMC_HPC1_LA15_P    <= data_out_p_A(13);
	FMC_HPC1_LA16_P    <= data_out_p_A(14);
	
	FMC_HPC1_LA00_CC_N <= clk_90deg_n_A;   
	FMC_HPC1_LA01_CC_N <= flag_out_n_A;	
	FMC_HPC1_LA02_N    <= data_out_n_A(0);	
	FMC_HPC1_LA03_N    <= data_out_n_A(1);	
	FMC_HPC1_LA04_N    <= data_out_n_A(2);				
	FMC_HPC1_LA05_N    <= data_out_n_A(3);				
	FMC_HPC1_LA06_N    <= data_out_n_A(4);
	FMC_HPC1_LA07_N    <= data_out_n_A(5);
	FMC_HPC1_LA08_N    <= data_out_n_A(6);	
	FMC_HPC1_LA09_N    <= data_out_n_A(7);
	FMC_HPC1_LA10_N    <= data_out_n_A(8);
	FMC_HPC1_LA11_N    <= data_out_n_A(9);		
	FMC_HPC1_LA12_N    <= data_out_n_A(10);
	FMC_HPC1_LA13_N    <= data_out_n_A(11);
	FMC_HPC1_LA14_N    <= data_out_n_A(12);
	FMC_HPC1_LA15_N    <= data_out_n_A(13);
	FMC_HPC1_LA16_N    <= data_out_n_A(14);
	
	--INPUTS
	clk_90deg_in_p_A    <= FMC_HPC1_LA17_CC_P ; 
	flag_in_p_A 	    <= FMC_HPC1_LA18_CC_P ; -- <-- this clock was not adeguate for clock forwarding: read more about it
	data_in_p_A(0)	    <= FMC_HPC1_LA19_P    ; 
	data_in_p_A(1)	    <= FMC_HPC1_LA20_P    ;	
	data_in_p_A(2)	    <= FMC_HPC1_LA21_P    ; 	
	data_in_p_A(3)	    <= FMC_HPC1_LA22_P    ;
	data_in_p_A(4)      <= FMC_HPC1_LA23_P    ;
	data_in_p_A(5)      <= FMC_HPC1_LA24_P    ;
	data_in_p_A(6)	    <= FMC_HPC1_LA25_P    ;
	data_in_p_A(7)      <= FMC_HPC1_LA26_P    ;
	data_in_p_A(8)      <= FMC_HPC1_LA27_P    ;
	data_in_p_A(9)	    <= FMC_HPC1_LA28_P    ;	
	data_in_p_A(10)     <= FMC_HPC1_LA29_P    ;
	data_in_p_A(11)     <= FMC_HPC1_LA30_P	  ;
	data_in_p_A(12)     <= FMC_HPC1_LA31_P    ;
	data_in_p_A(13)     <= FMC_HPC1_LA32_P    ;
	data_in_p_A(14)     <= FMC_HPC1_LA33_P    ;
	   
	clk_90deg_in_n_A    <= FMC_HPC1_LA17_CC_N ; 
	flag_in_n_A 	    <= FMC_HPC1_LA18_CC_N ;
	data_in_n_A(0) 	    <= FMC_HPC1_LA19_N    ; 
	data_in_n_A(1) 	    <= FMC_HPC1_LA20_N    ;	
	data_in_n_A(2) 	    <= FMC_HPC1_LA21_N    ; 	
	data_in_n_A(3) 	    <= FMC_HPC1_LA22_N    ;
	data_in_n_A(4)      <= FMC_HPC1_LA23_N    ;
	data_in_n_A(5)      <= FMC_HPC1_LA24_N    ;
	data_in_n_A(6) 	    <= FMC_HPC1_LA25_N    ;
	data_in_n_A(7)      <= FMC_HPC1_LA26_N    ;
	data_in_n_A(8)      <= FMC_HPC1_LA27_N    ;
	data_in_n_A(9) 	    <= FMC_HPC1_LA28_N    ;	
	data_in_n_A(10)     <= FMC_HPC1_LA29_N    ;
	data_in_n_A(11)     <= FMC_HPC1_LA30_N	  ;
	data_in_n_A(12)     <= FMC_HPC1_LA31_N    ;
	data_in_n_A(13)     <= FMC_HPC1_LA32_N    ;
	data_in_n_A(14)     <= FMC_HPC1_LA33_N    ;
	
	
	
	-----------------------------------------------------------------
	--   PARALLEL BUS "B" CONNECTION TO I/O PORTS 
	-----------------------------------------------------------------

	--Output
	FMCP_HSPC_LA00_CC_P <= clk_90deg_p_B;   
	FMCP_HSPC_LA01_CC_P <= flag_out_p_B;	     -- <-- this clock was not adeguate for clock forwarding: read more about it (in the pinout has only acronym "QBC" rather than "GC" (means Global Clock capable pin))
	FMCP_HSPC_LA02_P    <= data_out_p_B(0);	
	FMCP_HSPC_LA03_P    <= data_out_p_B(1);	
	FMCP_HSPC_LA04_P    <= data_out_p_B(2);				
	FMCP_HSPC_LA05_P    <= data_out_p_B(3);				
	FMCP_HSPC_LA06_P    <= data_out_p_B(4);
	FMCP_HSPC_LA07_P    <= data_out_p_B(5);
	FMCP_HSPC_LA08_P    <= data_out_p_B(6);	
	FMCP_HSPC_LA09_P    <= data_out_p_B(7);
	FMCP_HSPC_LA10_P    <= data_out_p_B(8);
	FMCP_HSPC_LA11_P    <= data_out_p_B(9);		
	FMCP_HSPC_LA12_P    <= data_out_p_B(10);
	FMCP_HSPC_LA13_P    <= data_out_p_B(11);
	FMCP_HSPC_LA14_P    <= data_out_p_B(12);
	FMCP_HSPC_LA15_P    <= data_out_p_B(13);
	FMCP_HSPC_LA16_P    <= data_out_p_B(14);
	
	FMCP_HSPC_LA00_CC_N <= clk_90deg_n_B;   
	FMCP_HSPC_LA01_CC_N <= flag_out_n_B;	
	FMCP_HSPC_LA02_N    <= data_out_n_B(0);	
	FMCP_HSPC_LA03_N    <= data_out_n_B(1);	
	FMCP_HSPC_LA04_N    <= data_out_n_B(2);				
	FMCP_HSPC_LA05_N    <= data_out_n_B(3);				
	FMCP_HSPC_LA06_N    <= data_out_n_B(4);
	FMCP_HSPC_LA07_N    <= data_out_n_B(5);
	FMCP_HSPC_LA08_N    <= data_out_n_B(6);	
	FMCP_HSPC_LA09_N    <= data_out_n_B(7);
	FMCP_HSPC_LA10_N    <= data_out_n_B(8);
	FMCP_HSPC_LA11_N    <= data_out_n_B(9);		
	FMCP_HSPC_LA12_N    <= data_out_n_B(10);
	FMCP_HSPC_LA13_N    <= data_out_n_B(11);
	FMCP_HSPC_LA14_N    <= data_out_n_B(12);
	FMCP_HSPC_LA15_N    <= data_out_n_B(13);
	FMCP_HSPC_LA16_N    <= data_out_n_B(14);
	
	--INPUTS
	clk_90deg_in_p_B    <= FMCP_HSPC_LA17_CC_P ; 
	flag_in_p_B 	    <= FMCP_HSPC_LA18_CC_P ; -- <-- this clock was not adeguate for clock forwarding: read more about it
	data_in_p_B(0)	    <= FMCP_HSPC_LA19_P    ; 
	data_in_p_B(1)	    <= FMCP_HSPC_LA20_P    ;	
	data_in_p_B(2)	    <= FMCP_HSPC_LA21_P    ; 	
	data_in_p_B(3)	    <= FMCP_HSPC_LA22_P    ;
	data_in_p_B(4)      <= FMCP_HSPC_LA23_P    ;
	data_in_p_B(5)      <= FMCP_HSPC_LA24_P    ;
	data_in_p_B(6)	    <= FMCP_HSPC_LA25_P    ;
	data_in_p_B(7)      <= FMCP_HSPC_LA26_P    ;
	data_in_p_B(8)      <= FMCP_HSPC_LA27_P    ;
	data_in_p_B(9)	    <= FMCP_HSPC_LA28_P    ;	
	data_in_p_B(10)     <= FMCP_HSPC_LA29_P    ;
	data_in_p_B(11)     <= FMCP_HSPC_LA30_P	  ;
	data_in_p_B(12)     <= FMCP_HSPC_LA31_P    ;
	data_in_p_B(13)     <= FMCP_HSPC_LA32_P    ;
	data_in_p_B(14)     <= FMCP_HSPC_LA33_P    ;
	   
	clk_90deg_in_n_B    <= FMCP_HSPC_LA17_CC_N ; 
	flag_in_n_B 	    <= FMCP_HSPC_LA18_CC_N ;
	data_in_n_B(0) 	    <= FMCP_HSPC_LA19_N    ; 
	data_in_n_B(1) 	    <= FMCP_HSPC_LA20_N    ;	
	data_in_n_B(2) 	    <= FMCP_HSPC_LA21_N    ; 	
	data_in_n_B(3) 	    <= FMCP_HSPC_LA22_N    ;
	data_in_n_B(4)      <= FMCP_HSPC_LA23_N    ;
	data_in_n_B(5)      <= FMCP_HSPC_LA24_N    ;
	data_in_n_B(6) 	    <= FMCP_HSPC_LA25_N    ;
	data_in_n_B(7)      <= FMCP_HSPC_LA26_N    ;
	data_in_n_B(8)      <= FMCP_HSPC_LA27_N    ;
	data_in_n_B(9) 	    <= FMCP_HSPC_LA28_N    ;	
	data_in_n_B(10)     <= FMCP_HSPC_LA29_N    ;
	data_in_n_B(11)     <= FMCP_HSPC_LA30_N	  ;
	data_in_n_B(12)     <= FMCP_HSPC_LA31_N    ;
	data_in_n_B(13)     <= FMCP_HSPC_LA32_N    ;
	data_in_n_B(14)     <= FMCP_HSPC_LA33_N    ;	
	
	
	
	
end Behavioral;
