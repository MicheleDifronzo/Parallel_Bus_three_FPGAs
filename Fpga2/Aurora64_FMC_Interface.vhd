----------------------------------------------------------------------------------
-- Company: 
-- Engineer/AUTHOR:  MICHELE DIFRONZO 
-- 
-- Create Date: 12/05/2019 10:34:07 AM
-- Design Name: 
-- Module Name: Aurora64 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: This is an Aurora64 Interface for QSFP connection
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;
library xil_defaultlib;

entity Aurora64_FMC_Interface is
	Port 
	(
			INIT_CLK : in     std_logic;
			AURORA_USER_CLK_OUT : OUT     std_logic;
			
			--HANDSHAKING
			VALID_TX : OUT     std_logic;
			READY_TX : OUT     std_logic;
			VALID_RX : OUT     std_logic;
	
		-- INPUTS COMING FROM TO THE SIMULATION ENGINE (AND SENT OUTSIDE OF THIS FPGA)
			FLOAT_OUT_1		: IN STD_LOGIC_VECTOR (31 downto 0);  --data going to  Opal	
			FLOAT_OUT_2		: IN STD_LOGIC_VECTOR (31 downto 0);  
			FLOAT_OUT_3		: IN STD_LOGIC_VECTOR (31 downto 0);  
			FLOAT_OUT_4		: IN STD_LOGIC_VECTOR (31 downto 0);  
			FLOAT_OUT_5		: IN STD_LOGIC_VECTOR (31 downto 0);  
			FLOAT_OUT_6		: IN STD_LOGIC_VECTOR (31 downto 0);  
			FLOAT_OUT_7		: IN STD_LOGIC_VECTOR (31 downto 0);  
			FLOAT_OUT_8		: IN STD_LOGIC_VECTOR (31 downto 0);  
			FLOAT_OUT_9		: IN STD_LOGIC_VECTOR (31 downto 0);  
			FLOAT_OUT_10	: IN STD_LOGIC_VECTOR (31 downto 0);  
			FLOAT_OUT_11	: IN STD_LOGIC_VECTOR (31 downto 0);  
			FLOAT_OUT_12	: IN STD_LOGIC_VECTOR (31 downto 0);  
			FLOAT_OUT_13	: IN STD_LOGIC_VECTOR (31 downto 0);  
			FLOAT_OUT_14	: IN STD_LOGIC_VECTOR (31 downto 0);  
			FLOAT_OUT_15	: IN STD_LOGIC_VECTOR (31 downto 0);  
			FLOAT_OUT_16	: IN STD_LOGIC_VECTOR (31 downto 0);  
			FLOAT_OUT_17	: IN STD_LOGIC_VECTOR (31 downto 0);  
			FLOAT_OUT_18	: IN STD_LOGIC_VECTOR (31 downto 0);  
			FLOAT_OUT_19	: IN STD_LOGIC_VECTOR (31 downto 0);  
			FLOAT_OUT_20	: IN STD_LOGIC_VECTOR (31 downto 0);  
			FLOAT_OUT_21	: IN STD_LOGIC_VECTOR (31 downto 0);  
			FLOAT_OUT_22	: IN STD_LOGIC_VECTOR (31 downto 0);  
			FLOAT_OUT_23	: IN STD_LOGIC_VECTOR (31 downto 0);  
			FLOAT_OUT_24	: IN STD_LOGIC_VECTOR (31 downto 0);  
			FLOAT_OUT_25	: IN STD_LOGIC_VECTOR (31 downto 0);  
			FLOAT_OUT_26	: IN STD_LOGIC_VECTOR (31 downto 0);  
			FLOAT_OUT_27	: IN STD_LOGIC_VECTOR (31 downto 0);  
			FLOAT_OUT_28	: IN STD_LOGIC_VECTOR (31 downto 0);  
			FLOAT_OUT_29	: IN STD_LOGIC_VECTOR (31 downto 0);  
			FLOAT_OUT_30	: IN STD_LOGIC_VECTOR (31 downto 0);  
			FLOAT_OUT_31	: IN STD_LOGIC_VECTOR (31 downto 0);  
			FLOAT_OUT_32	: IN STD_LOGIC_VECTOR (31 downto 0);  
			
	
			FLOAT_IN_0		: OUT STD_LOGIC_VECTOR (31 downto 0);  --CONSTANT HEADER OF THE RX FRAME FROM OPAL
			FLOAT_IN_1		: OUT STD_LOGIC_VECTOR (31 downto 0);  
			FLOAT_IN_2		: OUT STD_LOGIC_VECTOR (31 downto 0);  
			FLOAT_IN_3		: OUT STD_LOGIC_VECTOR (31 downto 0);  
			FLOAT_IN_4		: OUT STD_LOGIC_VECTOR (31 downto 0);  
			FLOAT_IN_5		: OUT STD_LOGIC_VECTOR (31 downto 0);  
			FLOAT_IN_6		: OUT STD_LOGIC_VECTOR (31 downto 0);  
			FLOAT_IN_7		: OUT STD_LOGIC_VECTOR (31 downto 0);  
			FLOAT_IN_8		: OUT STD_LOGIC_VECTOR (31 downto 0);  
			FLOAT_IN_9		: OUT STD_LOGIC_VECTOR (31 downto 0);  
			FLOAT_IN_10		: OUT STD_LOGIC_VECTOR (31 downto 0);  
			FLOAT_IN_11		: OUT STD_LOGIC_VECTOR (31 downto 0);  
			FLOAT_IN_12		: OUT STD_LOGIC_VECTOR (31 downto 0);  
			FLOAT_IN_13		: OUT STD_LOGIC_VECTOR (31 downto 0);  
			FLOAT_IN_14		: OUT STD_LOGIC_VECTOR (31 downto 0);  
			FLOAT_IN_15		: OUT STD_LOGIC_VECTOR (31 downto 0);  
			FLOAT_IN_16		: OUT STD_LOGIC_VECTOR (31 downto 0);  
			FLOAT_IN_17		: OUT STD_LOGIC_VECTOR (31 downto 0);  
			FLOAT_IN_18		: OUT STD_LOGIC_VECTOR (31 downto 0);  
			FLOAT_IN_19		: OUT STD_LOGIC_VECTOR (31 downto 0);  
			FLOAT_IN_20		: OUT STD_LOGIC_VECTOR (31 downto 0);  
			FLOAT_IN_21		: OUT STD_LOGIC_VECTOR (31 downto 0);  
			FLOAT_IN_22		: OUT STD_LOGIC_VECTOR (31 downto 0);  
			FLOAT_IN_23		: OUT STD_LOGIC_VECTOR (31 downto 0);  
			FLOAT_IN_24		: OUT STD_LOGIC_VECTOR (31 downto 0);  
			FLOAT_IN_25		: OUT STD_LOGIC_VECTOR (31 downto 0);  
			FLOAT_IN_26		: OUT STD_LOGIC_VECTOR (31 downto 0);  
			FLOAT_IN_27		: OUT STD_LOGIC_VECTOR (31 downto 0);  
			FLOAT_IN_28		: OUT STD_LOGIC_VECTOR (31 downto 0);  
			FLOAT_IN_29		: OUT STD_LOGIC_VECTOR (31 downto 0);  
			FLOAT_IN_30		: OUT STD_LOGIC_VECTOR (31 downto 0);  
			FLOAT_IN_31		: OUT STD_LOGIC_VECTOR (31 downto 0);  

	
		--Ultrascale+ board blinking leds for debug
		GPIO_LED0 : out STD_LOGIC;
		GPIO_LED1 : out STD_LOGIC;
		GPIO_LED2 : out STD_LOGIC; --soft_err
		GPIO_LED3 : out STD_LOGIC; --hard_err
		GPIO_LED4 : out STD_LOGIC; --mmc_not_locked_out
		GPIO_LED5 : out STD_LOGIC; --s_axi_tx_tready
		GPIO_LED6 : out STD_LOGIC; --channel_up
		GPIO_LED7 : out STD_LOGIC; --lane_up

		--==================================================================================================================
		--						FMC-SFP+ Card FM-S14 pins (Channels 0 to 3):
		--==================================================================================================================
		
		FMCP_HSPC_PG_M2C_LS: in STD_LOGIC;  --POWER GOOD SIGNAL "pulled High on S14" (manual of FM-S14 , page 9)
		FMCP_HSPC_H_PRSNT_M2C_B_LS: in STD_LOGIC; 		--Module Present    S14 asserts PRSNT_M2C_L  
		
		--GTY TRANSCEIVER OF BANK (QUAD) 121
		-- Channel 0                       
		FMCP_HSPC_LA17_CC_N	: in std_logic;	 --tx_fault	 input to indicate SFP+ TX diode is at fault
		FMCP_HSPC_LA17_CC_P	: out std_logic; --tx_disable	 output to disable SFP+ TX diode
		FMCP_HSPC_LA15_P	: out std_logic; --rate_sel	 output to select reduced/full bandwidth on SFP+
		FMCP_HSPC_LA14_N	: in std_logic;	 --los       input to indicate SFP+ is not receiving a RX signal
		-- Channel 1                      
		FMCP_HSPC_LA14_P	: in std_logic;	 
		FMCP_HSPC_LA13_N	: out std_logic; 
		FMCP_HSPC_LA11_N	: out std_logic; 
		FMCP_HSPC_LA11_P	: in std_logic;	 
		-- Channel 2for SFP+ connection through QSFP1 port                       
		FMCP_HSPC_LA10_N	: in std_logic;	 
		FMCP_HSPC_LA10_P	: out std_logic; 
		FMCP_HSPC_LA08_P    : out std_logic; 
		FMCP_HSPC_LA07_N    : in std_logic;	 
		
		
		-- Channel 3: for SFP+ connection through FMS14 card                     
		FMCP_HSPC_LA07_P	: in std_logic;	 
		FMCP_HSPC_LA06_N	: out std_logic; 
		FMCP_HSPC_LA04_N	: out std_logic; 
		FMCP_HSPC_LA04_P	: in std_logic;
		
		FMCP_HSPC_DP0_M2C_P  : in STD_LOGIC;	     --rxp_in 
		FMCP_HSPC_DP0_M2C_N  : in STD_LOGIC;	     --rxn_in 
		FMCP_HSPC_DP0_C2M_P  : out STD_LOGIC;	     --txp_out  in its name from constraint file which is MGTYTXN0_120  you can see the letters "TX" means transmitting so it is an output
		FMCP_HSPC_DP0_C2M_N  : out STD_LOGIC;        --txn_out

		--Aurora GTY reference clock: U40 ICS85411A clock buffer
		FMCP_HSPC_GBT0_0_N:in STD_LOGIC;--MGTREFCLK0N_121
		FMCP_HSPC_GBT0_0_P:in STD_LOGIC; --MGTREFCLK0P_121
	
		RESET_EXT: in STD_LOGIC  --push button for GT reset
	);
end Aurora64_FMC_Interface;

architecture Behavioral of Aurora64_FMC_Interface is

			
			COMPONENT Aurora64
			PORT (
					rxp : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
					rxn : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
					reset_pb : IN STD_LOGIC;
					power_down : IN STD_LOGIC;
					pma_init : IN STD_LOGIC;
					loopback : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
					txp : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
					txn : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
					hard_err : OUT STD_LOGIC;
					soft_err : OUT STD_LOGIC;
					channel_up : OUT STD_LOGIC;
					lane_up : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
					tx_out_clk : OUT STD_LOGIC;
					gt_pll_lock : OUT STD_LOGIC;
					s_axi_tx_tdata : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
					s_axi_tx_tkeep : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
					s_axi_tx_tlast : IN STD_LOGIC;
					s_axi_tx_tvalid : IN STD_LOGIC;
					s_axi_tx_tready : OUT STD_LOGIC;
					m_axi_rx_tdata : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
					m_axi_rx_tkeep : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
					m_axi_rx_tlast : OUT STD_LOGIC;
					m_axi_rx_tvalid : OUT STD_LOGIC;
					crc_pass_fail_n : OUT STD_LOGIC;
					crc_valid : OUT STD_LOGIC;
					mmcm_not_locked_out : OUT STD_LOGIC;
					gt0_drpaddr : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
					gt0_drpdi : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
					gt0_drprdy : OUT STD_LOGIC;
					gt0_drpwe : IN STD_LOGIC;
					gt0_drpen : IN STD_LOGIC;
					gt0_drpdo : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
					init_clk : IN STD_LOGIC;
					link_reset_out : OUT STD_LOGIC;
					gt_refclk1_p : IN STD_LOGIC;
					gt_refclk1_n : IN STD_LOGIC;
					user_clk_out : OUT STD_LOGIC;
					sync_clk_out : OUT STD_LOGIC;
					gt_rxcdrovrden_in : IN STD_LOGIC;
					sys_reset_out : OUT STD_LOGIC;
					gt_reset_out : OUT STD_LOGIC;
					gt_refclk1_out : OUT STD_LOGIC;
					gt_powergood : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
			);
			END COMPONENT;		


			COMPONENT ila_0		
			PORT 
			(
				clk : IN STD_LOGIC;
			
				probe0 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
				probe1 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
				probe2 : IN STD_LOGIC_VECTOR(63 DOWNTO 0); 
				probe3 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
				probe4 : IN STD_LOGIC_VECTOR(7 DOWNTO 0); 
				probe5 : IN STD_LOGIC_VECTOR(63 DOWNTO 0); 
				probe6 : IN STD_LOGIC_VECTOR(7 DOWNTO 0); 
				probe7 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
				probe8 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
				probe9 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
				probe10 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
				probe11 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
				probe12 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
				probe13 : IN STD_LOGIC_VECTOR(31 DOWNTO 0); 
				probe14 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
				probe15 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
				probe16 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
				probe17 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
				probe18 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
				probe19 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
				probe20 : IN STD_LOGIC_VECTOR(15 DOWNTO 0)
				
				
				-- probe0 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
				-- probe1 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
				-- probe2 : IN STD_LOGIC_VECTOR(63 DOWNTO 0); 
				-- probe3 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
				-- probe4 : IN STD_LOGIC_VECTOR(7 DOWNTO 0); 
				-- probe5 : IN STD_LOGIC_VECTOR(63 DOWNTO 0); 
				-- probe6 : IN STD_LOGIC_VECTOR(7 DOWNTO 0); 
				-- probe7 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
				-- probe8 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
				-- probe9 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
				-- probe10 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
				-- probe11 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
				-- probe12 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
				-- probe13 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
				-- probe14 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
				-- probe15 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
				-- probe16 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
				-- probe17 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
				-- probe18 : IN STD_LOGIC_VECTOR(15 DOWNTO 0)				
				
				
			);
			END COMPONENT  ;			

			COMPONENT ila_1		
			PORT 
			(
				clk : IN STD_LOGIC;
			
				probe0 : IN STD_LOGIC_VECTOR(71 DOWNTO 0); 
				probe1 : IN STD_LOGIC_VECTOR(71 DOWNTO 0); 
				probe2 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
				probe3 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
				probe4 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
				probe5 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
				probe6 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
				probe7 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
				probe8 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
				probe9 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
				probe10 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
				probe11 : IN STD_LOGIC_VECTOR(0 DOWNTO 0)		
				
			);
			END COMPONENT  ;			
			
			
			COMPONENT ila_2
			
			PORT (
				clk : IN STD_LOGIC;
			
				probe0 : IN STD_LOGIC_VECTOR(63 DOWNTO 0); 
				probe1 : IN STD_LOGIC_VECTOR(63 DOWNTO 0); 
				probe2 : IN STD_LOGIC_VECTOR(63 DOWNTO 0); 
				probe3 : IN STD_LOGIC_VECTOR(63 DOWNTO 0); 
				probe4 : IN STD_LOGIC_VECTOR(63 DOWNTO 0); 
				probe5 : IN STD_LOGIC_VECTOR(63 DOWNTO 0); 
				probe6 : IN STD_LOGIC_VECTOR(63 DOWNTO 0); 
				probe7 : IN STD_LOGIC_VECTOR(63 DOWNTO 0); 
				probe8 : IN STD_LOGIC_VECTOR(63 DOWNTO 0); 
				probe9 : IN STD_LOGIC_VECTOR(63 DOWNTO 0); 
				probe10 : IN STD_LOGIC_VECTOR(63 DOWNTO 0); 
				probe11 : IN STD_LOGIC_VECTOR(63 DOWNTO 0); 
				probe12 : IN STD_LOGIC_VECTOR(63 DOWNTO 0); 
				probe13 : IN STD_LOGIC_VECTOR(63 DOWNTO 0); 
				probe14 : IN STD_LOGIC_VECTOR(63 DOWNTO 0); 
				probe15 : IN STD_LOGIC_VECTOR(63 DOWNTO 0)
			);
			END COMPONENT  ;			

			COMPONENT ila_3
			
			PORT (
						clk : IN STD_LOGIC;

						probe0   : IN STD_LOGIC_VECTOR(31 downto 0);			
						probe1   : IN STD_LOGIC_VECTOR(31 downto 0);
						probe2   : IN STD_LOGIC_VECTOR(31 downto 0);
						probe3   : IN STD_LOGIC_VECTOR(31 downto 0);
						probe4   : IN STD_LOGIC_VECTOR(31 downto 0);
						probe5   : IN STD_LOGIC_VECTOR(31 downto 0);
						probe6   : IN STD_LOGIC_VECTOR(31 downto 0);
						probe7   : IN STD_LOGIC_VECTOR(31 downto 0);
						probe8   : IN STD_LOGIC_VECTOR(31 downto 0);
						probe9   : IN STD_LOGIC_VECTOR(31 downto 0);
						probe10  : IN STD_LOGIC_VECTOR(31 downto 0);				
						probe11  : IN STD_LOGIC_VECTOR(31 downto 0);
						probe12  : IN STD_LOGIC_VECTOR(31 downto 0);
						probe13  : IN STD_LOGIC_VECTOR(31 downto 0);
						probe14  : IN STD_LOGIC_VECTOR(31 downto 0);
						probe15  : IN STD_LOGIC_VECTOR(31 downto 0);
						probe16  : IN STD_LOGIC_VECTOR(31 downto 0);				
						probe17  : IN STD_LOGIC_VECTOR(31 downto 0);
						probe18  : IN STD_LOGIC_VECTOR(31 downto 0);				
						probe19  : IN STD_LOGIC_VECTOR(31 downto 0);	
						probe20  : IN STD_LOGIC_VECTOR(31 downto 0);
						probe21  : IN STD_LOGIC_VECTOR(31 downto 0);	
						probe22  : IN STD_LOGIC_VECTOR(31 downto 0);
						probe23  : IN STD_LOGIC_VECTOR(31 downto 0);	
						probe24  : IN STD_LOGIC_VECTOR(31 downto 0);
						probe25  : IN STD_LOGIC_VECTOR(31 downto 0);	
						probe26  : IN STD_LOGIC_VECTOR(31 downto 0);
						probe27  : IN STD_LOGIC_VECTOR(31 downto 0);	
						probe28  : IN STD_LOGIC_VECTOR(31 downto 0);	
						probe29  : IN STD_LOGIC_VECTOR(31 downto 0);	
						probe30  : IN STD_LOGIC_VECTOR(31 downto 0);		
						probe31  : IN STD_LOGIC_VECTOR(31 downto 0)		

			);
			END COMPONENT  ;





			
			COMPONENT SFPTOFIXEDCONVERTER
			PORT (
				ap_clk : IN STD_LOGIC;
				ap_rst : IN STD_LOGIC;
				ap_start : IN STD_LOGIC;
				ap_done : OUT STD_LOGIC;
				ap_idle : OUT STD_LOGIC;
				ap_ready : OUT STD_LOGIC;
				float_in : IN STD_LOGIC_VECTOR (31 downto 0);
				fixed_out_V : OUT STD_LOGIC_VECTOR (71 downto 0);
				fixed_in_V : IN STD_LOGIC_VECTOR (71 downto 0);
				float_out : OUT STD_LOGIC_VECTOR (31 downto 0) 
			);
			END COMPONENT;
			
			COMPONENT toplevel_core
			PORT 
			(
				ap_clk : IN STD_LOGIC;
				ap_rst : IN STD_LOGIC;
				ap_start : IN STD_LOGIC;
				ap_done : OUT STD_LOGIC;
				ap_idle : OUT STD_LOGIC;
				ap_ready : OUT STD_LOGIC;
				x_out_V : OUT STD_LOGIC_VECTOR (71 downto 0);
				x_out_1_V : OUT STD_LOGIC_VECTOR (71 downto 0);
				x_out_1_V_ap_vld : OUT STD_LOGIC;
				x_in_V : IN STD_LOGIC_VECTOR (71 downto 0)
				
			);
			END COMPONENT;	




---------------------------------------------------------------------------------------
--						SIGNALS DECLARATION
---------------------------------------------------------------------------------------
signal AuroraInitclk: std_logic:='0';			
signal reset: std_logic:='0';			
signal locked: std_logic:='0';			
	
signal FLOAT_IN		:  STD_LOGIC_VECTOR (31 downto 0);  --data coming from Opal

signal s_axi_tx_tdata  	  : std_logic_vector(63 DOWNTO 0);--:= (others=>'0');
signal s_axi_tx_tkeep  	  : std_logic_vector(7 DOWNTO 0);--:= (others=>'0');
signal s_axi_tx_tlast  	  : std_logic;--:='0';
signal s_axi_tx_tvalid 	  : std_logic;
signal s_axi_tx_tready 	  : std_logic;
signal m_axi_rx_tdata  	  : std_logic_vector(63 DOWNTO 0);--:= (others=>'0');
signal rx_tdata  	  : std_logic_vector(63 DOWNTO 0);--:= (others=>'0');
signal m_axi_rx_tkeep  	  : std_logic_vector(7 DOWNTO 0);--:= (others=>'0');
signal m_axi_rx_tlast  	  : std_logic:='0';
signal m_axi_rx_tvalid 	  : std_logic:='0';

signal soft_err           : std_logic:='0';
signal hard_err           : std_logic:='0'; 
signal mmc_not_locked_out : std_logic:='0';


signal channel_up         : std_logic:='0';
signal lane_up			  : std_logic:='0';

signal reset_pb_reg     : std_logic:='0';

signal power_down     : std_logic:='0';
signal loopback     : std_logic_vector(2 downto 0):= (others=>'0');
signal user_clk_out     : std_logic:='0';


signal rate_sel_ch0: std_logic:='0';
signal rate_sel_ch1: std_logic:='0';
signal rate_sel_ch2: std_logic:='0';
signal rate_sel_ch3: std_logic:='0';
				
signal tx_disable_ch0: std_logic:='0';
signal tx_disable_ch1: std_logic:='0';
signal tx_disable_ch2: std_logic:='0';
signal tx_disable_ch3: std_logic:='0';

signal crc_pass_fail_n :  STD_LOGIC;
signal crc_valid :  STD_LOGIC;
---------------------------------------------------------------------------
--					FRAME GENERATOR/RECEIVER
---------------------------------------------------------------------------
--type PacketArray is array (integer range <>) of std_logic_vector(0 to 31); -- array of 32-bit subwords that serve as packet to send/receive
type PacketArray is array (integer range <>) of std_logic_vector(63 downto 0); -- array of 32-bit subwords that serve as packet to send/receive

signal packet_address_send : integer range 0 to 15 := 0;
signal packet_address_send_past : integer range 0 to 15 := 0;
signal packet_send : PacketArray(63 downto 0):= (others=>(others=>'0')) ;



signal ce_packet_sent: std_logic ;
signal ce_packet_recv: std_logic ;
signal packet_address_recv : integer range 0 to 15 := 0;
signal packet_recv : PacketArray(63 downto 0):= (others=>(others=>'0')) ;

signal packet_valid_recv: std_logic;
signal packet_last_recv : std_logic;

signal packet_valid    : std_logic_vector(0 downto 0);
signal packet_last    : std_logic_vector(0 downto 0);


	signal packet_1  : std_logic_vector(63 downto 0);
	signal packet_2  : std_logic_vector(63 downto 0);
	signal packet_3  : std_logic_vector(63 downto 0);
	signal packet_4  : std_logic_vector(63 downto 0);
	signal packet_5  : std_logic_vector(63 downto 0);
	signal packet_6  : std_logic_vector(63 downto 0);
	signal packet_7  : std_logic_vector(63 downto 0);
	signal packet_8  : std_logic_vector(63 downto 0);
	signal packet_9  : std_logic_vector(63 downto 0);
	signal packet_10 : std_logic_vector(63 downto 0);
	signal packet_11 : std_logic_vector(63 downto 0);
	signal packet_12 : std_logic_vector(63 downto 0);
	signal packet_13 : std_logic_vector(63 downto 0);
	signal packet_14 : std_logic_vector(63 downto 0);
	signal packet_15 : std_logic_vector(63 downto 0);
	signal packet_16 : std_logic_vector(63 downto 0);





---------------------------------------------------------------------------
--					DEBUG SIGNALS
---------------------------------------------------------------------------

--signal PowerGoodS14: std_logic:='0';
--signal ModulePresentS14: std_logic:='0';
	-- debug signals
signal s_axi_tx_tdata_debug    : std_logic_vector(63 downto 0):= (others=>'0');
signal s_axi_tx_tready_debug   : std_logic_vector(0 downto 0):= (others=>'0');
signal s_axi_tx_tvalid_debug   : std_logic_vector(0 downto 0):= (others=>'0');
signal s_axi_tx_tlast_debug   : std_logic_vector(0 downto 0):= (others=>'0');
signal m_axi_rx_tlast_debug   : std_logic_vector(0 downto 0):= (others=>'0');
signal m_axi_rx_tdata_debug    : std_logic_vector(63 downto 0):= (others=>'0');

signal rx_packet_debug    : std_logic_vector(63 downto 0):= (others=>'0');
signal rx_packet    : std_logic_vector(63 downto 0):= (others=>'0');

signal crc_pass_fail_n_debug    : std_logic_vector(0 downto 0):= (others=>'0');
signal crc_valid_debug    : std_logic_vector(0 downto 0):= (others=>'0');


signal ap_rst_simeng_debug      : std_logic_vector(0 downto 0);
signal ap_start_simeng_debug    : std_logic_vector(0 downto 0);
signal ap_done_simeng_debug 	: std_logic_vector(0 downto 0);  
signal ap_idle_simeng_debug 	: std_logic_vector(0 downto 0);  
signal ap_ready_simeng_debug	: std_logic_vector(0 downto 0);  							
signal ap_rst_dataconv_debug    : std_logic_vector(0 downto 0);
signal ap_start_dataconv_debug  : std_logic_vector(0 downto 0);
signal ap_done_dataconv_debug   : std_logic_vector(0 downto 0);
signal ap_idle_dataconv_debug   : std_logic_vector(0 downto 0);
signal ap_ready_dataconv_debug  : std_logic_vector(0 downto 0);










signal packet_recv0_debug   : std_logic_vector(63 downto 0);
signal packet_recv1_debug	: std_logic_vector(63 downto 0);
signal packet_recv2_debug	: std_logic_vector(63 downto 0);
signal packet_recv3_debug	: std_logic_vector(63 downto 0);
signal packet_recv4_debug	: std_logic_vector(63 downto 0);
signal packet_recv5_debug	: std_logic_vector(63 downto 0);
signal packet_recv6_debug	: std_logic_vector(63 downto 0);
signal packet_recv7_debug	: std_logic_vector(63 downto 0);
signal packet_recv8_debug	: std_logic_vector(63 downto 0);
signal packet_recv9_debug	: std_logic_vector(63 downto 0);
signal packet_recv10_debug  : std_logic_vector(63 downto 0);
signal packet_recv11_debug  : std_logic_vector(63 downto 0);
signal packet_recv12_debug  : std_logic_vector(63 downto 0);
signal packet_recv13_debug  : std_logic_vector(63 downto 0);
signal packet_recv14_debug  : std_logic_vector(63 downto 0);
signal packet_recv15_debug  : std_logic_vector(63 downto 0);


signal m_axi_rx_tvalid_debug   : std_logic_vector(0 downto 0):= (others=>'0');


signal hard_err_debug          : std_logic_vector(0 downto 0):= (others=>'0');
signal soft_err_debug          : std_logic_vector(0 downto 0):= (others=>'0');
signal channel_up_debug        : std_logic_vector(0 downto 0):= (others=>'0');
signal lane_up_debug           : std_logic_vector(0 downto 0):= (others=>'0');
signal rxp_debug               : std_logic_vector(0 downto 0):= (others=>'0');
signal txp_debug               : std_logic_vector(0 downto 0):= (others=>'0');
signal s_axi_tx_tkeep_debug    : std_logic_vector(7 downto 0):= (others=>'0');
signal m_axi_rx_tkeep_debug    : std_logic_vector(7 downto 0):= (others=>'0');

signal packet_valid_debug    : std_logic_vector(0 downto 0);
signal packet_last_debug    : std_logic_vector(0 downto 0);



  -----------------------------------------------------------
--   DATA-CONVERTER SIGNALS
-----------------------------------------------------------

  signal fixed_out_V : STD_LOGIC_VECTOR (71 downto 0);
  signal fixed_in_V : STD_LOGIC_VECTOR (71 downto 0);
  signal float_out : STD_LOGIC_VECTOR (31 downto 0) ;


  signal ap_rst_dataconv   : std_logic;
  signal ap_start_dataconv : std_logic;
  signal ap_done_dataconv  : std_logic;
  signal ap_idle_dataconv  : std_logic;
  signal ap_ready_dataconv : std_logic;  
  


 
	---------------------------------------
	--    SIMULATION ENGINE
	---------------------------------------

	signal ap_rst_simeng   : std_logic;
	--signal ap_start_simeng : std_logic;
	signal ap_done_simeng  : std_logic;
	signal ap_idle_simeng  : std_logic;
	signal ap_ready_simeng : std_logic;
	
	signal sim_clk    : std_logic:='0';
	--signal x_out_V : STD_LOGIC_VECTOR (63 downto 0);
	signal x_out_V : STD_LOGIC_VECTOR (71 downto 0);
	signal x_in :  STD_LOGIC_VECTOR (71 downto 0);
	signal aout_V :  STD_LOGIC_VECTOR (15 downto 0);
	signal bout_V :  STD_LOGIC_VECTOR (15 downto 0);
	signal cout_V :  STD_LOGIC_VECTOR (15 downto 0);
	signal dout_V :  STD_LOGIC_VECTOR (15 downto 0);



	signal x_out_V_debug   : STD_LOGIC_VECTOR (71 downto 0);
	signal x_in_debug      :  STD_LOGIC_VECTOR (71 downto 0);
	signal float_in_debug  : STD_LOGIC_VECTOR (31 downto 0);
	signal float_out_debug : STD_LOGIC_VECTOR (31 downto 0) ;

-------------------------------------------------------------------------------
--				CLOCK DOMAIN CROSSING LOGIC
-------------------------------------------------------------------------------	
  signal data_sent_0  : std_logic_vector(31 downto 0); ---:= (others=>'0'); --before was (15 downto 0)
  signal data_sent_1  : std_logic_vector(31 downto 0); ---:= (others=>'0'); --before was (15 downto 0)
  signal data_sent_2  : std_logic_vector(31 downto 0); ---:= (others=>'0'); --before was (15 downto 0)
  signal data_sent_2_BigEndian  : std_logic_vector(0 to 31); ---:= (others=>'0'); --before was (15 downto 0)	
	

  signal rst :  STD_LOGIC;
  signal wr_clk :  STD_LOGIC;
  signal rd_clk :  STD_LOGIC;
  signal din :  STD_LOGIC_VECTOR(31 DOWNTO 0);
  signal wr_en :  STD_LOGIC;
  signal rd_en :  STD_LOGIC;
  signal dout :  STD_LOGIC_VECTOR(31 DOWNTO 0);
  signal full :  STD_LOGIC;
  signal empty :  STD_LOGIC;
  signal valid :  STD_LOGIC;
  signal wr_rst_busy :  STD_LOGIC;
  signal rd_rst_busy :  STD_LOGIC;
	
  signal packet_recv_counter : std_logic_vector(15 DOWNTO 0);
  signal packet_recv_counter_debug: std_logic_vector(15 DOWNTO 0);
  signal state_of_RX_FSM: std_logic_vector(15 DOWNTO 0);
  signal state_of_RX_FSM_debug: std_logic_vector(15 DOWNTO 0);

  
  
  
------------------------------------------------------------------	
	-- marking signals for debugging
------------------------------------------------------------------
attribute mark_debug : string;

attribute mark_debug of s_axi_tx_tdata_debug : signal is "true";
attribute mark_debug of s_axi_tx_tready_debug : signal is "true";
attribute mark_debug of s_axi_tx_tvalid_debug : signal is "true";
attribute mark_debug of s_axi_tx_tlast_debug : signal is "true";
attribute mark_debug of s_axi_tx_tkeep_debug : signal is "true";
attribute mark_debug of m_axi_rx_tdata_debug : signal is "true";
attribute mark_debug of m_axi_rx_tvalid_debug : signal is "true";
attribute mark_debug of m_axi_rx_tlast_debug : signal is "true";
attribute mark_debug of m_axi_rx_tkeep_debug : signal is "true";
attribute mark_debug of hard_err_debug   : signal is "true";
attribute mark_debug of soft_err_debug   : signal is "true";
attribute mark_debug of channel_up_debug : signal is "true";
attribute mark_debug of lane_up_debug    : signal is "true";
attribute mark_debug of rxp_debug    : signal is "true";
attribute mark_debug of txp_debug    : signal is "true";	
		
attribute mark_debug of x_out_V_debug      : signal is "true";		
attribute mark_debug of x_in_debug         : signal is "true";		
attribute mark_debug of float_in_debug     : signal is "true";		
attribute mark_debug of float_out_debug    : signal is "true";		
attribute mark_debug of rx_packet_debug    : signal is "true";		
attribute mark_debug of packet_valid_debug    : signal is "true";		
attribute mark_debug of packet_last_debug    : signal is "true";		
		
	

attribute mark_debug of packet_recv0_debug    : signal is "true";	
attribute mark_debug of packet_recv1_debug    : signal is "true";	
attribute mark_debug of packet_recv2_debug    : signal is "true";	
attribute mark_debug of packet_recv3_debug    : signal is "true";	
attribute mark_debug of packet_recv4_debug    : signal is "true";	
attribute mark_debug of packet_recv5_debug    : signal is "true";	
attribute mark_debug of packet_recv6_debug    : signal is "true";	
attribute mark_debug of packet_recv7_debug    : signal is "true";	
attribute mark_debug of packet_recv8_debug    : signal is "true";	
attribute mark_debug of packet_recv9_debug    : signal is "true";	
attribute mark_debug of packet_recv10_debug   : signal is "true";	
attribute mark_debug of packet_recv11_debug   : signal is "true";	
attribute mark_debug of packet_recv12_debug   : signal is "true";	
attribute mark_debug of packet_recv13_debug   : signal is "true";	
attribute mark_debug of packet_recv14_debug   : signal is "true";	
attribute mark_debug of packet_recv15_debug   : signal is "true";	

attribute mark_debug of crc_pass_fail_n   : signal is "true";	
attribute mark_debug of crc_valid   : signal is "true";	



			
begin

		
		reset <= RESET_EXT;
		AURORA_USER_CLK_OUT <= user_clk_out;
		
			s_axi_tx_tkeep <="11111111";  -- X"FF"
		
			
			Aurora64_inst : Aurora64
			PORT MAP (
			    --RX FMC Card channel 3
				rxp(0) => FMCP_HSPC_DP0_M2C_P,  
				rxn(0) => FMCP_HSPC_DP0_M2C_N,
				reset_pb => RESET_EXT,
				power_down => power_down,
				pma_init => RESET_EXT,
				loopback => "000",   --far end loopback
			    --TX FMC Card channel 3				
				txp(0) => FMCP_HSPC_DP0_C2M_P,
				txn(0) => FMCP_HSPC_DP0_C2M_N,
				--Status
				hard_err => hard_err,
				soft_err => soft_err,
				channel_up => channel_up,
				lane_up(0) => lane_up,
				--clocking
				tx_out_clk => open,
				gt_pll_lock => open,
				
				--TX/RX Framing Duplex protocol signals
				s_axi_tx_tdata  	=> s_axi_tx_tdata,
				s_axi_tx_tkeep  	=> s_axi_tx_tkeep,
				s_axi_tx_tlast  	=> s_axi_tx_tlast,
				s_axi_tx_tvalid 	=> s_axi_tx_tvalid,
				s_axi_tx_tready 	=> s_axi_tx_tready,
				
				--RX Framing Duplex protocol signals				
				m_axi_rx_tdata  	=> m_axi_rx_tdata,--s_axi_tx_tdata,
				m_axi_rx_tkeep  	=> m_axi_rx_tkeep,--s_axi_tx_tkeep, 
				m_axi_rx_tlast  	=> m_axi_rx_tlast,--s_axi_tx_tlast,
				m_axi_rx_tvalid 	=> m_axi_rx_tvalid,		


				--CRC
				crc_pass_fail_n => crc_pass_fail_n,
				crc_valid => crc_valid,
				
				--INTERNAL CLOCK
				mmcm_not_locked_out => mmc_not_locked_out,
				--DRP
				gt0_drpaddr => (others => '0'),
				gt0_drpdi => (others => '0'),
				gt0_drprdy => open,
				gt0_drpwe => '0',
				gt0_drpen => '0',
				gt0_drpdo => open,
				--CLOCKING
				init_clk => init_clk,
				link_reset_out => open,
				gt_refclk1_p => FMCP_HSPC_GBT0_0_P,
				gt_refclk1_n => FMCP_HSPC_GBT0_0_N,
				user_clk_out => user_clk_out,
				sync_clk_out => open,
				gt_rxcdrovrden_in => '0',
				sys_reset_out => open,
				gt_reset_out => open,
				gt_refclk1_out => open,
				gt_powergood => open
			);			


			
	
------------------------------------------------------------------------------
--**********************FMC CARD ACTIVATION**********************************	
------------------------------------------------------------------------------
	
				--rate_sel ch0,1,2,3		
				FMCP_HSPC_LA15_P 	<= '1';
				FMCP_HSPC_LA11_N    <= '1';
				FMCP_HSPC_LA08_P    <= '1';
				FMCP_HSPC_LA04_N    <= '1';
				--tx_disable ch0,1,2,3
				FMCP_HSPC_LA17_CC_P <= '0';
				FMCP_HSPC_LA13_N    <= '0';
				FMCP_HSPC_LA10_P    <= '0';
				FMCP_HSPC_LA06_N    <= '0';	
	
	
	
--------------------------------------------------------------------------------
--								TX LOGIC
--------------------------------------------------------------------------------


	
	
Aurora_Frame_Generator_FSM: process   -- FSM: "Finite State Machine
					(
						user_clk_out, 
						reset, 
						s_axi_tx_tready,						
						s_axi_tx_tvalid,
						s_axi_tx_tlast,
						packet_address_send
					)
				
	variable state : integer range 0 to 17 := 0;
	variable state_past : integer range 0 to 17 := 0;
	variable packet_address : integer range 0 to 15 := 0;	
	variable packet_address_past : integer range 0 to 15 := 0;	
	variable cnt : integer range 0 to 4000;
	variable send : integer range 0 to 1;
	constant SAMPLING : integer range 0 to 4000:= 0;  --<-- ( number of samples): 1562 -> 25us; 
begin

	if(rising_edge(user_clk_out))
		then
			
			if(reset = '1'  ) 
				then


					state_past:=17;                  --previous state
					packet_address_past:=0;--previous packet_address
					packet_address := 0;     			--address of the next packet
					s_axi_tx_tvalid <= '0';  			--s_axi_tx_tvalid of the present packet
					s_axi_tx_tlast <= '0';   			--s_axi_tx_tlast of the present packet
					state := 17;						
					cnt:=0;
					

				elsif(reset = '0') 
					then  
							if(s_axi_tx_tready='1')
								then

								case state is

											when 0 => 
												state_past:=state;                  --previous state
												packet_address_past:=packet_address;--previous packet_address
												packet_address := 0;     			--address of the next packet
												s_axi_tx_tvalid <= '0';  			--s_axi_tx_tvalid of the present packet
												s_axi_tx_tlast <= '0';   			--s_axi_tx_tlast of the present packet
												ce_packet_sent <= '1';
												state := 1;			
											when 1 => 
												state_past:=state;
												packet_address_past:=packet_address;
												packet_address := 1;
												s_axi_tx_tvalid <= '1';
												s_axi_tx_tlast <= '0';
												ce_packet_sent <= '1';
												state := 2;
											when 2 =>
												state_past:=state;
												packet_address_past:=packet_address;							
												packet_address := 2;
												s_axi_tx_tvalid <= '1';
												s_axi_tx_tlast <= '0';
												ce_packet_sent <= '1';
												state := 3;
											when 3 =>
												state_past:=state;
												packet_address_past:=packet_address;							
												packet_address := 3;
												s_axi_tx_tvalid <= '1';
												s_axi_tx_tlast <= '0';
												ce_packet_sent <= '1';
												state := 4;
											when 4 =>
												state_past:=state;
												packet_address_past:=packet_address;							
												packet_address := 4;
												s_axi_tx_tvalid <= '1';
												s_axi_tx_tlast <= '0';
												ce_packet_sent <= '1';
												state := 5;	
											when 5 =>
												state_past:=state;
												packet_address_past:=packet_address;							
												packet_address := 5;
												s_axi_tx_tvalid <= '1';
												s_axi_tx_tlast <= '0';
												ce_packet_sent <= '1';
												state := 6;	
											when 6 =>
												state_past:=state;
												packet_address_past:=packet_address;							
												packet_address := 6;
												s_axi_tx_tvalid <= '1';
												s_axi_tx_tlast <= '0';
												ce_packet_sent <= '1';
												state := 7;	
											when 7 =>
												state_past:=state;
												packet_address_past:=packet_address;
												packet_address := 7;
												s_axi_tx_tvalid <= '1';
												s_axi_tx_tlast <= '0';
												ce_packet_sent <= '1';
												state := 8;		
											when 8 =>
												state_past:=state;
												packet_address_past:=packet_address;							
												packet_address := 8;
												s_axi_tx_tvalid <= '1';
												s_axi_tx_tlast <= '0';
												ce_packet_sent <= '1';
												state := 9;	
											when 9 =>
												state_past:=state;
												packet_address_past:=packet_address;							
												packet_address := 9;
												s_axi_tx_tvalid <= '1';
												s_axi_tx_tlast <= '0';
												ce_packet_sent <= '1';
												state := 10;	
											when 10 =>
												state_past:=state;
												packet_address_past:=packet_address;							
												packet_address := 10;
												s_axi_tx_tvalid <= '1';
												s_axi_tx_tlast <= '0';
												ce_packet_sent <= '1';
												state := 11;	
											when 11 =>
												state_past:=state;
												packet_address_past:=packet_address;							
												packet_address := 11;
												s_axi_tx_tvalid <= '1';
												s_axi_tx_tlast <= '0';
												ce_packet_sent <= '1';
												state := 12;
											when 12 =>
												state_past:=state;
												packet_address_past:=packet_address;							
												packet_address := 12;
												s_axi_tx_tvalid <= '1';
												s_axi_tx_tlast <= '0';
												ce_packet_sent <= '1';
												state := 13;	
											when 13 =>
												state_past:=state;
												packet_address_past:=packet_address;							
												packet_address := 13;
												s_axi_tx_tvalid <= '1';
												s_axi_tx_tlast <= '0';
												ce_packet_sent <= '1';
												state := 14;	
											when 14 =>
												state_past:=state;
												packet_address_past:=packet_address;							
												packet_address := 14;
												s_axi_tx_tvalid <= '1';
												s_axi_tx_tlast <= '0';
												ce_packet_sent <= '1';
												state := 15;	
											when 15 =>
												state_past:=state;
												packet_address_past:=packet_address;							
												--packet_address := 0;
												packet_address := 15;
												s_axi_tx_tvalid <= '1';
												s_axi_tx_tlast <= '0';
												ce_packet_sent <= '1';
												state := 16;
											when 16 =>
												state_past:=state;
												packet_address_past:=packet_address;							
												packet_address := 0;
												s_axi_tx_tvalid <= '1';
												s_axi_tx_tlast <= '1';
												--ce_packet_sent <= '1';
												ce_packet_sent <= '0';
												state := 17;
											when 17 =>
												state_past:=state;
												packet_address_past:=packet_address;								
												packet_address := 0;			
												s_axi_tx_tvalid <= '0'; 
												s_axi_tx_tlast <= '0'; 
												ce_packet_sent <= '0';
												if(cnt <SAMPLING)  --1562 -> 25us ; 3124-> 50us
													then
														cnt:=cnt+1;
														state :=17; 
														send :=0; 															
													elsif(cnt = SAMPLING) --1562 -> 25us ; 3124-> 50us
														then
															cnt:=0;
															state :=0; 														
												end if;
												
											when others =>	
												state_past:=state;
												packet_address_past:=packet_address;								
												packet_address := 0;					
												s_axi_tx_tvalid <= '0';
												s_axi_tx_tlast <= '0';	
												ce_packet_sent <= '0';
												state := 16;					
												--state := 15;					
										end case;

										
									packet_address_send <= packet_address;	
						
							 elsif(s_axi_tx_tready='0')
								then
											state_past:=state_past;                  
											packet_address_past:=packet_address_past;
											packet_address := packet_address_past;     			
											s_axi_tx_tvalid <= '0';  			
											s_axi_tx_tlast <= '0'; 
											ce_packet_sent <= '0';											
											state := state_past;	
									
							end if;									
			end if;
		--state_out <= std_logic_vector( to_unsigned( state, state_out'length));  --< to output the state which is a variable
		
		else  --if not rising edge of user clock
			state_past:=state_past;                  
			packet_address_past:=packet_address_past;
			packet_address := packet_address_past;     			
			s_axi_tx_tvalid <= s_axi_tx_tvalid;  				
			s_axi_tx_tlast <= s_axi_tx_tlast;  
			ce_packet_sent <= ce_packet_sent; 			

	end if;
end process;
	   

			VALID_TX <= s_axi_tx_tvalid;  			
			READY_TX <= s_axi_tx_tready;  
	



RegisterSenderPacket : process
							(
								user_clk_out, 

								s_axi_tx_tdata,
								packet_address_send,
								packet_send,
								ce_packet_sent
							)
begin
	
	if( rising_edge(user_clk_out) ) 
		then

			--if(ce_packet_sent = '1' ) 
			if(s_axi_tx_tvalid = '1' and s_axi_tx_tready='1' ) 
				then
					s_axi_tx_tdata <= packet_send(packet_address_send); 
					--s_axi_tx_tdata <= packet_send(0); 
				else
					--s_axi_tx_tdata <= (others =>'0');
					s_axi_tx_tdata <= s_axi_tx_tdata;
			end if;	   	
	   else
			s_axi_tx_tdata <= s_axi_tx_tdata;
	end if;
end process;

---LITTLE ENDIAN FRAME
----------------packet_send(0)  <= float_out & X"00000040";  --<-- for SimEng test
--packet_send(0)  <= X"0000803f00000040";
--packet_send(1)  <= X"0000404000008040";
--packet_send(2)  <= X"0000A0400000C040";
--packet_send(3)  <= X"0000E04000000041";
--packet_send(4)  <= X"0000104100002041";
--packet_send(5)  <= X"0000304100004041";
--packet_send(6)  <= X"0000504100006041";
--packet_send(7)  <= X"0000704100008041";
--packet_send(8)  <= X"0000884100009041";
--packet_send(9)  <= X"000098410000A041";
--packet_send(10) <= X"0000A8410000B041";
--packet_send(11) <= X"0000B8410000C041";
--packet_send(12) <= X"0000C8410000D041";
--packet_send(13) <= X"0000D8410000E041";
--packet_send(14) <= X"0000E8410000F041";
--packet_send(15) <= X"0000F84100000042";



---BIG ENDIAN FRAME
--packet_send(0)  <= X"3f80000040000000";
-- packet_send(1)  <= X"4040000040800000";
-- packet_send(2)  <= X"40A0000040C00000";
-- packet_send(3)  <= X"40E0000041000000";
-- packet_send(4)  <= X"4110000041200000";
-- packet_send(5)  <= X"4130000041400000";
-- packet_send(6)  <= X"4150000041600000";
-- packet_send(7)  <= X"4170000041800000";
-- packet_send(8)  <= X"4188000041900000";
-- packet_send(9)  <= X"4198000041A00000";
-- packet_send(10) <= X"41A8000041B00000";
-- packet_send(11) <= X"41B8000041C00000";
-- packet_send(12) <= X"41C8000041D00000";
-- packet_send(13) <= X"41D8000041E00000";
-- packet_send(14) <= X"41E8000041F00000";
-- packet_send(15) <= X"41F8000042000000";

----FILLING THE PACKET ARRAY FRAME FOR AURORA64 TRANSMISSION

packet_send(0)  <= FLOAT_OUT_1 & FLOAT_OUT_2;  --<-- for SimEng test
packet_send(1)  <= FLOAT_OUT_3 & FLOAT_OUT_4;
packet_send(2)  <= FLOAT_OUT_5 & FLOAT_OUT_6;
packet_send(3)  <= FLOAT_OUT_7 & FLOAT_OUT_8;
packet_send(4)  <= FLOAT_OUT_9 & FLOAT_OUT_10;
packet_send(5)  <= FLOAT_OUT_11 & FLOAT_OUT_12;
packet_send(6)  <= FLOAT_OUT_13 & FLOAT_OUT_14;
packet_send(7)  <= FLOAT_OUT_15 & FLOAT_OUT_16;
packet_send(8)  <= FLOAT_OUT_17 & FLOAT_OUT_18;
packet_send(9)  <= FLOAT_OUT_19 & FLOAT_OUT_20;
packet_send(10) <= FLOAT_OUT_21 & FLOAT_OUT_22;
packet_send(11) <= FLOAT_OUT_23 & FLOAT_OUT_24;
packet_send(12) <= FLOAT_OUT_25 & FLOAT_OUT_26;
packet_send(13) <= FLOAT_OUT_27 & FLOAT_OUT_28;
packet_send(14) <= FLOAT_OUT_29 & FLOAT_OUT_30;
packet_send(15) <= FLOAT_OUT_31 & FLOAT_OUT_32;






	
	
--------------------------------------------------------------------------------------------------------
--						AURORA RECEIVING END
--------------------------------------------------------------------------------------------------------	



	Aurora_Frame_Reciever_FSM : process
								(
									user_clk_out, 
									reset, 
									m_axi_rx_tvalid,
									ce_packet_recv,									
									packet_address_recv,
									--float_in,
									packet_recv,
									m_axi_rx_tdata,
									m_axi_rx_tlast
									--rx_packet
								)

	variable state : integer range 0 to 15 := 0;
	variable state_past : integer range 0 to 15 := 0;
	variable ce_packet : std_logic := '0';
	variable packet_valid : std_logic := '0';
	variable packet_last : std_logic := '0';
	variable packet_address : integer range 0 to 15 := 0;
	variable counter : integer range 0 to 15 := 0;


begin

	if (rising_edge(user_clk_out)) then
	
		if (reset = '1') then
		
			packet_address := 0;
			ce_packet := '0';
			packet_valid := '0';
			packet_last := '0';
			state := 0;
		 

		 elsif( m_axi_rx_tvalid = '1') then  
			
			 case state is
			
				when 0 =>
					if(m_axi_rx_tdata(63 downto 32)=X"3f800000") -- 3f800000 is the header value which has to be the first word of the received frame
						then
							packet_recv(0) <= m_axi_rx_tdata;
							state := 1;	
						else	
							state := 0;				
					end if;
										
					packet_address := 0;
					ce_packet := '1';
					packet_valid := '1';
					packet_last := '0';
					
				when 1 =>
					packet_recv(1) <= m_axi_rx_tdata;   						
					packet_address := 1;
					ce_packet := '1';
					packet_valid := '1';
					packet_last := '0';
					state := 2;
					
				when 2 =>				
					packet_recv(2) <= m_axi_rx_tdata;  					
					packet_address := 2;
					ce_packet := '1';
					packet_valid := '1';
					packet_last := '0';
					state := 3;		
					
				when 3 =>					
					packet_recv(3) <= m_axi_rx_tdata;  												
					packet_address := 3;
					ce_packet := '1';
					packet_valid := '1';
					packet_last := '0';
					state := 4;	
					
				when 4 =>				
					packet_recv(4) <= m_axi_rx_tdata;  					
					packet_address := 4;
					ce_packet := '1';
					packet_valid := '1';
					packet_last := '0';
					state := 5;	
					
				when 5 =>				
					packet_recv(5) <= m_axi_rx_tdata;  						
					packet_address := 5;
					ce_packet := '1';
					packet_valid := '1';
					packet_last := '0';
					state := 6;	
					
				when 6 =>				
					packet_recv(6) <= m_axi_rx_tdata;   									
					packet_address := 6;
					ce_packet := '1';
					packet_valid := '1';
					packet_last := '0';
					state := 7;		
					
				when 7 =>					
					packet_recv(7) <= m_axi_rx_tdata;  					
					packet_address := 7;
					ce_packet := '1';
					packet_valid := '1';
					packet_last := '0';
					state := 8;		
					
				when 8 =>				
					packet_recv(8) <= m_axi_rx_tdata;  				
					packet_address := 8;
					ce_packet := '1';
					packet_valid := '1';
					packet_last := '0';
					state := 9;	
					
				when 9 =>				
					packet_recv(9) <= m_axi_rx_tdata;  				
					packet_address := 9;
					ce_packet := '1';
					packet_valid := '1';
					packet_last := '0';
					state := 10;
					
				when 10 =>				
					packet_recv(10) <= m_axi_rx_tdata;   	
					packet_address := 10;
					ce_packet := '1';
					packet_valid := '1';
					packet_last := '0';
					state := 11;	
					
				when 11 =>
				
					packet_recv(11) <= m_axi_rx_tdata;  	
					packet_address := 11;
					ce_packet := '1';
					packet_valid := '1';
					packet_last := '0';
					state := 12;	
					
				when 12 =>				
					packet_recv(12) <= m_axi_rx_tdata;  				
					packet_address := 12;
					ce_packet := '1';
					packet_valid := '1';
					packet_last := '0';
					state := 13;	
					
				when 13 =>				
					packet_recv(13) <= m_axi_rx_tdata;  					
					packet_address := 13;
					ce_packet := '1';
					packet_valid := '1';
					packet_last := '0';
					state := 14;	
					
				when 14 =>			
					packet_recv(14) <= m_axi_rx_tdata;  
					packet_address := 14;
					ce_packet := '1';
					packet_valid := '1';
					packet_last := '0';
					state := 15;	

				when 15 =>				
					if(m_axi_rx_tlast='1') 
						then					
							packet_recv(15) <= m_axi_rx_tdata;  
														
							FLOAT_IN_0  <= packet_recv(0)(63 downto 32);--<<-----FRAME-HEADER;				
							FLOAT_IN_1  <= packet_recv(0)(31 downto 0);					
							FLOAT_IN_2  <= packet_recv(1)(63 downto 32);	
							FLOAT_IN_3  <= packet_recv(1)(31 downto 0);	--< COUNTER FROM OPAL	
							FLOAT_IN_4  <= packet_recv(2)(63 downto 32);	
							FLOAT_IN_5  <= packet_recv(2)(31 downto 0);		
							FLOAT_IN_6  <= packet_recv(3)(63 downto 32);	
							FLOAT_IN_7  <= packet_recv(3)(31 downto 0);	
							FLOAT_IN_8  <= packet_recv(4)(63 downto 32);	
							FLOAT_IN_9  <= packet_recv(4)(31 downto 0);	
							FLOAT_IN_10 <= packet_recv(5)(63 downto 32);	
							FLOAT_IN_11 <= packet_recv(5)(31 downto 0);						
							FLOAT_IN_12 <= packet_recv(6)(63 downto 32);	
							FLOAT_IN_13 <= packet_recv(6)(31 downto 0);
							FLOAT_IN_14 <= packet_recv(7)(63 downto 32);	
							FLOAT_IN_15 <= packet_recv(7)(31 downto 0);
							FLOAT_IN_16 <= packet_recv(8)(63 downto 32);	
							FLOAT_IN_17 <= packet_recv(8)(31 downto 0);						
							FLOAT_IN_18 <= packet_recv(9)(63 downto 32);	
							FLOAT_IN_19 <= packet_recv(9)(31 downto 0);						
							FLOAT_IN_20 <= packet_recv(10)(63 downto 32);	
							FLOAT_IN_21 <= packet_recv(10)(31 downto 0);	
							FLOAT_IN_22 <= packet_recv(11)(63 downto 32);	
							FLOAT_IN_23 <= packet_recv(11)(31 downto 0);
							FLOAT_IN_24 <= packet_recv(12)(63 downto 32);	
							FLOAT_IN_25 <= packet_recv(12)(31 downto 0);
							FLOAT_IN_26 <= packet_recv(13)(63 downto 32);	
							FLOAT_IN_27 <= packet_recv(13)(31 downto 0);
							FLOAT_IN_28 <= packet_recv(14)(63 downto 32);	
							FLOAT_IN_29 <= packet_recv(14)(31 downto 0);		
							FLOAT_IN_30 <= packet_recv(15)(63 downto 32);	
							FLOAT_IN_31 <= packet_recv(15)(31 downto 0);	


							state := 0;
							
						elsif(m_axi_rx_tlast='0' and m_axi_rx_tdata(63 downto 32)=X"3f800000")
							then
								state := 1;
								
												
					end if;	
					
					packet_address := 15;
					ce_packet := '1';
					packet_valid := '1';
					packet_last := '1';
					--state := 0;

					
				when others =>
					packet_recv <= packet_recv;
					packet_address := 0;
					ce_packet := '0';
					packet_valid := '0';
					packet_last := '0';
					state := 0;	
			
			end case;

	

	
			elsif( m_axi_rx_tvalid = '0') 
				then
					packet_recv<= packet_recv;
					packet_address := packet_address;
					ce_packet := '0';
					packet_valid := '0';
					packet_last := packet_last;
					--state := state;
		end if;
		
		
		
		ce_packet_recv <= ce_packet;
		packet_address_recv <= packet_address;
		packet_valid_recv <= packet_valid;
		VALID_RX <= packet_valid;
		packet_last_recv <= packet_last;
		state_of_RX_FSM <=  std_logic_vector(to_unsigned(state, state_of_RX_FSM'length));
	
	else
		ce_packet_recv <= ce_packet_recv;
		packet_address_recv <= packet_address_recv;
		packet_valid_recv <= packet_valid_recv;
		packet_last_recv <= packet_last_recv;
		packet_recv <= packet_recv;
		state_of_RX_FSM <= state_of_RX_FSM;
		
	
	end if;

end process;




--------------------------------------------------------------------------------------------------------
--					DATA ACQUISITION AND LOGGING	
--------------------------------------------------------------------------------------------------------	
		-- AURORA_LOGIC_ANALYZER : ila_0
		-- PORT MAP (
			-- clk => user_clk_out,
				
			-- probe0  => s_axi_tx_tready_debug,  
			-- probe1  => s_axi_tx_tvalid_debug,
			-- probe2  => s_axi_tx_tdata_debug,  --63downto0
			-- probe3  => s_axi_tx_tlast_debug,
			-- probe4  => s_axi_tx_tkeep_debug,		--7 DOWNTO 0	
			-- probe5  => m_axi_rx_tdata_debug,  --63downto0			
			-- probe6  => m_axi_rx_tkeep_debug, 	--7 DOWNTO 0	
			-- probe7  => m_axi_rx_tlast_debug, 		
			-- probe8  => m_axi_rx_tvalid_debug, 		
			-- probe9  => channel_up_debug, 
			-- probe10 => lane_up_debug, 
			-- probe11 => hard_err_debug,
			-- probe12 => soft_err_debug,
			-- probe13 => state_of_RX_FSM_debug,
			-- probe14 => packet_valid_debug,
			-- probe15 => packet_last_debug,
			-- probe16 => crc_pass_fail_n_debug,
			-- probe17 => crc_valid_debug,
			-- probe18 => packet_recv_counter_debug
		           
			
		-- );






		-- AURORA_LOGIC_ANALYZER : ila_0
		-- PORT MAP (
			-- clk => user_clk_out,
				
			-- probe0  => s_axi_tx_tready_debug,  
			-- probe1  => s_axi_tx_tvalid_debug,
			-- probe2  => s_axi_tx_tdata_debug,  --63downto0
			-- probe3  => s_axi_tx_tlast_debug,
			-- probe4  => s_axi_tx_tkeep_debug,		--7 DOWNTO 0	
			-- probe5  => m_axi_rx_tdata_debug,  --63downto0			
			-- probe6  => m_axi_rx_tkeep_debug, 	--7 DOWNTO 0	
			-- probe7  => m_axi_rx_tlast_debug, 		
			-- probe8  => m_axi_rx_tvalid_debug, 		
			-- probe9  => channel_up_debug, 
			-- probe10 => lane_up_debug, 
			-- probe11 => hard_err_debug,
			-- probe12 => soft_err_debug,
			-- probe13 => float_out_debug,
			-- probe14 => float_in_debug,
			-- probe15 => state_of_RX_FSM_debug,
			-- probe16 => packet_valid_debug,
			-- probe17 => packet_last_debug,
			-- probe18 => crc_pass_fail_n_debug,
			-- probe19 => crc_valid_debug,
			-- probe20 => packet_recv_counter_debug
		           
			
		-- );

	-- AURORA_LOGIC_ANALYZER_REGISTER : process(
								-- user_clk_out,
								
								-- s_axi_tx_tready,  
								-- s_axi_tx_tvalid,									
								-- s_axi_tx_tdata,  							
								-- s_axi_tx_tlast,									
								-- s_axi_tx_tkeep,										
								-- m_axi_rx_tdata,  								
								-- m_axi_rx_tkeep, 										
								-- m_axi_rx_tlast, 										
								-- m_axi_rx_tvalid, 										
								-- channel_up, 									
								-- lane_up, 									
								-- hard_err,									
								-- soft_err,								
								-- float_out,
								-- float_in,
								-- rx_packet,
								-- packet_valid,
								-- packet_last,
								-- crc_pass_fail_n,
								-- crc_valid,
								-- packet_recv_counter,
								-- state_of_RX_FSM
							-- ) is
	
	-- begin
	
		-- if(rising_edge(user_clk_out)) then

			-- s_axi_tx_tready_debug(0) <= s_axi_tx_tready;  
			-- s_axi_tx_tvalid_debug(0) <= s_axi_tx_tvalid;									
			-- s_axi_tx_tdata_debug  	 <= s_axi_tx_tdata;  						
			-- s_axi_tx_tlast_debug(0)  <= s_axi_tx_tlast;									
			-- s_axi_tx_tkeep_debug	 <= s_axi_tx_tkeep;										
			-- m_axi_rx_tdata_debug  	 <= m_axi_rx_tdata;  							
			-- m_axi_rx_tkeep_debug 	 <= m_axi_rx_tkeep; 										
			-- m_axi_rx_tlast_debug(0)  <= m_axi_rx_tlast; 										
			-- m_axi_rx_tvalid_debug(0) <= m_axi_rx_tvalid; 									
			-- channel_up_debug(0)  	 <= channel_up; 									
			-- lane_up_debug(0)  	     <= lane_up; 									
			-- hard_err_debug(0) 	     <= hard_err;									
			-- soft_err_debug(0)        <= soft_err;
			-- float_out_debug          <= float_out;
			-- float_in_debug           <= float_in;			
			-- state_of_RX_FSM_debug          <= state_of_RX_FSM;			
			-- packet_valid_debug(0)    <= packet_valid_recv;			
			-- packet_last_debug(0)     <= packet_last_recv;			
			-- crc_pass_fail_n_debug(0) <= crc_pass_fail_n;			
			-- crc_valid_debug(0)       <= crc_valid;			
			-- packet_recv_counter_debug<= packet_recv_counter;			
			
		-- end if;
	
	-- end process;

	
	
		-- FLOAT_IN_LOGIC_ANALYZER : ila_3
		-- PORT MAP (
					-- clk => user_clk_out,
				
					-- probe0  => float_in_0_debug ,		
					-- probe1  => float_in_1_debug ,  		
					-- probe2  => float_in_2_debug ,  
					-- probe3  => float_in_3_debug ,
					-- probe4  => float_in_4_debug ,
					-- probe5  => float_in_5_debug ,
					-- probe6  => float_in_6_debug ,
					-- probe7  => float_in_7_debug ,
					-- probe8  => float_in_8_debug ,
					-- probe9  => float_in_9_debug ,
					-- probe10 => float_in_10_debug,
					-- probe11 => float_in_11_debug,		
					-- probe12 => float_in_12_debug,	
					-- probe13 => float_in_13_debug,
					-- probe14 => float_in_14_debug,
					-- probe15 => float_in_15_debug,
					-- probe16 => float_in_16_debug,
					-- probe17 => float_in_17_debug,		
					-- probe18 => float_in_18_debug,	
					-- probe19 => float_in_19_debug,		
					-- probe20 => float_in_20_debug,	
					-- probe21 => float_in_21_debug,
					-- probe22 => float_in_22_debug,
					-- probe23 => float_in_23_debug,
					-- probe24 => float_in_24_debug,
					-- probe25 => float_in_25_debug,
					-- probe26 => float_in_26_debug,
					-- probe27 => float_in_27_debug,
					-- probe28 => float_in_28_debug,
					-- probe29 => float_in_29_debug,
					-- probe30 => float_in_30_debug,				
					-- probe31 => float_in_31_debug						
		-- );	
	
	
	
	-- FLOAT_IN_LOGIC_ANALYZER_REGISTER : process(
								-- user_clk_out,
								
								-- float_in_0 ,
								-- float_in_1 ,
								-- float_in_2 ,
								-- float_in_3 ,
								-- float_in_4 ,
								-- float_in_5 ,
								-- float_in_6 ,
								-- float_in_7 ,
								-- float_in_8 ,
								-- float_in_9 ,
								-- float_in_10,
								-- float_in_11,
								-- float_in_12,
								-- float_in_13,
								-- float_in_14,
								-- float_in_15,
								-- float_in_16,
								-- float_in_17,
								-- float_in_18,
								-- float_in_19,
								-- float_in_20,
								-- float_in_21,
								-- float_in_22,
								-- float_in_23,
								-- float_in_24,
								-- float_in_25,
								-- float_in_26,
								-- float_in_27,
								-- float_in_28,
								-- float_in_29,
								-- float_in_30,
								-- float_in_31 
							-- ) is
	-- begin
		-- if(rising_edge(user_clk_out)) 
			-- then
				-- float_in_0_debug  <= float_in_0; 
				-- float_in_1_debug  <= float_in_1; 
				-- float_in_2_debug  <= float_in_2; 
				-- float_in_3_debug  <= float_in_3; 
				-- float_in_4_debug  <= float_in_4; 
				-- float_in_5_debug  <= float_in_5; 
				-- float_in_6_debug  <= float_in_6; 
				-- float_in_7_debug  <= float_in_7; 
				-- float_in_8_debug  <= float_in_8; 
				-- float_in_9_debug  <= float_in_9; 
				-- float_in_10_debug <= float_in_10;
				-- float_in_11_debug <= float_in_11;
				-- float_in_12_debug <= float_in_12;
				-- float_in_13_debug <= float_in_13;
				-- float_in_14_debug <= float_in_14;
				-- float_in_15_debug <= float_in_15;
				-- float_in_16_debug <= float_in_16;
				-- float_in_17_debug <= float_in_17;
				-- float_in_18_debug <= float_in_18;
				-- float_in_19_debug <= float_in_19;
				-- float_in_20_debug <= float_in_20;
				-- float_in_21_debug <= float_in_21;
				-- float_in_22_debug <= float_in_22;
				-- float_in_23_debug <= float_in_23;
				-- float_in_24_debug <= float_in_24;
				-- float_in_25_debug <= float_in_25;
				-- float_in_26_debug <= float_in_26;
				-- float_in_27_debug <= float_in_27;
				-- float_in_28_debug <= float_in_28;
				-- float_in_29_debug <= float_in_29;
				-- float_in_30_debug <= float_in_30;
				-- float_in_31_debug <= float_in_31;						
		-- end if;
	
	-- end process;	
	




------------------------------------------------------------------------------
--**********************FMC CARD ACTIVATION**********************************	
------------------------------------------------------------------------------	
		
	
		
				--rate_sel ch0,1,2,3		
				FMCP_HSPC_LA15_P 	<= '1';
				FMCP_HSPC_LA11_N    <= '1';
				FMCP_HSPC_LA08_P    <= '1';
				FMCP_HSPC_LA04_N    <= '1';
				--tx_disable ch0,1,2,3
				FMCP_HSPC_LA17_CC_P <= '0';
				FMCP_HSPC_LA13_N    <= '0';
				FMCP_HSPC_LA10_P    <= '0';
				FMCP_HSPC_LA06_N    <= '0';		
	
			
        -----OUTPUT SIGNALS TO EXTERNAL LEDS------------------			
		--GPIO_LED0 <= FMCP_HSPC_PG_M2C_LS        ; --FM-S14 pin POWER GOOD
		--GPIO_LED1 <= FMCP_HSPC_H_PRSNT_M2C_B_LS ; --FM-S14 pin Module Present
		GPIO_LED2 <= soft_err                   ;
		GPIO_LED3 <= hard_err                   ;
		GPIO_LED4 <= mmc_not_locked_out         ;
		GPIO_LED5 <= s_axi_tx_tready            ;
		GPIO_LED6 <= channel_up                 ;
		GPIO_LED7 <= lane_up			        ;

end Behavioral;
