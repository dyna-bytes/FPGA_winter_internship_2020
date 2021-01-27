----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/13 16:47:59
-- Design Name: 
-- Module Name: arch_cmb - Behavioral
-- Project Name: 
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


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

library WORK;
use WORK.myPACK.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CMB_top is
  Port (clk50_in   		    : in STD_LOGIC;									-- 50MHz X-TAL --
        pb_in  				: in STD_LOGIC_VECTOR (3 downto 0);			-- 4 push button --
        sw_in  				: in STD_LOGIC_VECTOR (7 downto 0);			-- 8 switch --
        digit_out    			: out STD_LOGIC_VECTOR (3 downto 0);		-- digit driver --
        led_out      			: out STD_LOGIC_VECTOR (7 downto 0);		-- led control --
        seg_out      			: out STD_LOGIC_VECTOR (7 downto 0);		-- 7 segment control --
        rf_sw_out   			: out STD_LOGIC_VECTOR (3 downto 0);		-- rf switch control --
        debug_out   			: out STD_LOGIC;									-- degug signal --
        rot_count_out   		: out STD_LOGIC_VECTOR (9 downto 0);		-- reflector rotation count --
        rot_clk_out			: out STD_LOGIC;									-- step motor clock --
        stp_clk_out			: out STD_LOGIC;									-- step motor reference clock --
        adc_trg_out 			: out STD_LOGIC									-- trigger for adc board --
		);
end CMB_top;

architecture arch_cmb of CMB_top is

	signal rst 				: STD_LOGIC;
----------------------------------------------------------------------------------
    constant M : integer := 10**6; -- Mega
    constant K : integer := 10**3; -- Kilo
	signal clk_1MHz : std_logic;
	signal clk_1KHz : std_logic;
	signal clk_1Hz  : std_logic;
	signal stp_clk  : std_logic;
	
	component clock_top   
	port(fpga_clk : in std_logic; rst : in std_logic; clk_1MHz : out std_logic; clk_1KHz : out std_logic;
         clk_100Hz : out std_logic; clk_1Hz : out std_logic);
	end component;
----------------------------------------------------------------------------------
	
	signal sys_init		    : STD_LOGIC;
    signal sys_init_ctrl	: STD_LOGIC;
    signal trg              : STD_LOGIC;
    signal trg_ctrl         : STD_LOGIC;
		
	component button_edge_trigger
	generic(is_rising : boolean := TRUE);
    port (i_clk : IN std_logic; button : IN std_logic; button_edge : OUT std_logic);
	end component;
----------------------------------------------------------------------------------
	
	signal rot_en : std_logic;
	signal adc_en : std_logic;
	signal wrk_stat : std_logic;
	signal rot_clk  : std_logic;
	
	component FSM
	port (stp_clk : IN std_logic; sys_init_ctrl : IN std_logic; trg_ctrl : IN std_logic; sw : IN std_logic_vector(7 downto 0);
         wrk_stat : OUT std_logic; rot_en : OUT std_logic; adc_en : OUT std_logic; rf_sw : OUT std_logic_vector(3 downto 0); rot_count_out : OUT std_logic_vector(9 downto 0) );  
    end component;
----------------------------------------------------------------------------------
    
    signal bcd_int :  std_logic_vector(15 downto 0);
    
    component Increment_angle_counter_for_7seg
    port (sys_init_ctrl : in std_logic; rot_clk : in std_logic; rot_en : in std_logic;
         bcd_int : out std_logic_vector(15 downto 0) );
    end component;
 ----------------------------------------------------------------------------------
     
    component mux_7seg
    port (sys_init_ctrl : in std_logic; clk_1KHz : in std_logic; bcd_int : in std_logic_vector(15 downto 0);        
        digit_out : out std_logic_vector(3 downto 0); seg_out : out std_logic_vector(7 downto 0) );
    end component;
 ----------------------------------------------------------------------------------
       
    component LED8_counter
    port (sys_init_ctrl : in std_logic; clk50_in : in std_logic; clk_1Hz : in std_logic;
          led : out std_logic_vector(7 downto 0) );
    end component;
    
begin
  
    rst 		<= pb_in(3);					-- BTN3 on board for reset --
    sys_init    <= pb_in(2);					-- BTN2 on board for initialize --
    trg         <= pb_in(1);					-- BTN1 on board for start --
				
    debug_out   <= wrk_stat;
						
    rot_clk     <= (rot_en and stp_clk);		-- Stepping motor control clock : 0.1 deg moving at 1 clock --
    adc_trg_out <= (adc_en nand clk_1KHz);    	-- Data acquisition clock for ADC board --
	
	rot_clk_out <= rot_clk;	
    stp_clk_out <= stp_clk;
    
    U0 : clock_top port map
    (fpga_clk => clk50_in, rst => rst, clk_1MHz => clk_1MHz, clk_1KHz => clk_1KHz, clk_100Hz => stp_clk, clk_1Hz => clk_1Hz );

    U1_1 : button_edge_trigger generic map (is_rising => TRUE) port map
    (i_clk => clk_1MHz, button => sys_init, button_edge => sys_init_ctrl);
    
    U1_2 : button_edge_trigger generic map (is_rising => TRUE) port map
    (i_clk => clk_1MHz, button => trg, button_edge => trg_ctrl);
    
    U2 : FSM port map
    (stp_clk => stp_clk, sys_init_ctrl => sys_init_ctrl, trg_ctrl => trg_ctrl, sw => sw_in, wrk_stat => wrk_stat,
     rot_en => rot_en, adc_en => adc_en, rf_sw => rf_sw_out, rot_count_out => rot_count_out);
    
    U3 : Increment_angle_counter_for_7seg port map
    (sys_init_ctrl => sys_init_ctrl, rot_clk => rot_clk, rot_en => rot_en,
     bcd_int => bcd_int);
     
    U4 : mux_7seg port map
    (sys_init_ctrl => sys_init_ctrl, clk_1KHz => clk_1KHz, bcd_int => bcd_int,
     digit_out => digit_out, seg_out => seg_out);
     
    U5 : LED8_counter port map
    (sys_init_ctrl => sys_init_ctrl, clk50_in => clk50_in, clk_1Hz => clk_1Hz,
     led => led_out);
end arch_cmb;
