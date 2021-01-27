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

library UNISIM;
use UNISIM.VComponents.all;

entity CMB_top is
  Port (clk50_in   		    : in STD_LOGIC;							-- 50MHz X-TAL --
        pb_in  				: in STD_LOGIC_VECTOR (3 downto 0);		-- 4 push button --
        sw_in  				: in STD_LOGIC_VECTOR (7 downto 0);		-- 8 switch --
        digit_out       	: out STD_LOGIC_VECTOR (3 downto 0);		-- digit driver --
        led_out      		: out STD_LOGIC_VECTOR (7 downto 0);		-- led control --
        seg_out   			: out STD_LOGIC_VECTOR (7 downto 0);		-- 7 segment control --
        rf_sw_out  			: out STD_LOGIC_VECTOR (3 downto 0);		-- rf switch control --
        debug_out  			: out STD_LOGIC;							-- degug signal --
        rot_count_out  		: out STD_LOGIC_VECTOR (9 downto 0);		-- reflector rotation count --
        rot_clk_out			: out STD_LOGIC;							-- step motor clock --
        stp_clk_out			: out STD_LOGIC;							-- step motor reference clock --
        adc_trg_out 		: out STD_LOGIC							-- trigger for adc board --
		);
end CMB_top;

architecture arch_cmb of CMB_top is
    signal clk50int : std_logic;
    signal clk50 : std_logic;
    signal digit : std_logic_vector(3 downto 0);
    signal rf_sw : std_logic_vector(3 downto 0);
    signal pb    : std_logic_vector(3 downto 0);
    signal seg   : std_logic_vector(7 downto 0);
    signal led   : std_logic_vector(7 downto 0);
    signal sw    : std_logic_vector(7 downto 0);
    signal rot_count : std_logic_vector(9 downto 0);
    signal debug : std_logic;
    signal adc_trg : std_logic;
    
	component ibuf_lvcmos33 port(i : in STD_LOGIC; o : out STD_LOGIC);
	end component;
	component ibufg_lvcmos33 port (i : in STD_LOGIC; o : out STD_LOGIC);
	end component;
	component obuf_lvcmos33 port (i : in STD_LOGIC; o : out STD_LOGIC);
	end component;
	component bufg port (i : in STD_LOGIC; o : out STD_LOGIC);
	end component;
----------------------------------------------------------------------------------
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
         wrk_stat : OUT std_logic; rot_en : OUT std_logic; adc_en : OUT std_logic; rf_sw : OUT std_logic_vector(3 downto 0); rot_count : OUT std_logic_vector(9 downto 0) );  
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
        digit : out std_logic_vector(3 downto 0); seg : out std_logic_vector(7 downto 0) );
    end component;
 ----------------------------------------------------------------------------------
       
    component LED8_counter
    port (sys_init_ctrl : in std_logic; fpga_clk : in std_logic; clk_1Hz : in std_logic;
          led : out std_logic_vector(7 downto 0) );
    end component;
    
begin
  
    rst 		<= pb(3);					-- BTN3 on board for reset --
    sys_init    <= pb(2);					-- BTN2 on board for initialize --
    trg         <= pb(1);					-- BTN1 on board for start --
				
    debug   <= wrk_stat;
						
    rot_clk     <= (rot_en and stp_clk);		-- Stepping motor control clock : 0.1 deg moving at 1 clock --
    adc_trg     <= (adc_en nand clk_1KHz);    	-- Data acquisition clock for ADC board -- 
	 
    clk50_in_ibuf		:	ibufg_lvcmos33		port map (i => clk50_in, o => clk50int);
    rxclka_bufg			:	bufg					port map (i => clk50int, o => clk50);
    
    loop0 : for i in 0 to 3 generate
    digit_obuf			:	obuf_lvcmos33		port map (i => digit(i), o => digit_out(i));
    rf_sw_obuf			:	obuf_lvcmos33		port map (i => rf_sw(i), o => rf_sw_out(i));
    pb_ibuf				:	ibuf_lvcmos33		port map (i => pb_in(i), o => pb(i));
    end generate;
    
    loop1 : for i in 0 to 7 generate
    seg_obuf				:	obuf_lvcmos33		port map (i => seg(i), o => seg_out(i));
    led_obuf				:	obuf_lvcmos33		port map (i => led(i), o => led_out(i));
    sw_ibuf				:	ibuf_lvcmos33		port map (i => sw_in(i), o => sw(i));
    end generate;
    
    loop2 : for i in 0 to 9 generate
    rot_count_obuf		:	obuf_lvcmos33		port map (i => rot_count(i), o => rot_count_out(i));
    end generate;
    
    debug_obuf			:	obuf_lvcmos33		port map (i => debug, o => debug_out);
    rot_clk_obuf		:	obuf_lvcmos33		port map (i => rot_clk, o => rot_clk_out);
    stp_clk_obuf		:	obuf_lvcmos33		port map (i => stp_clk, o => stp_clk_out);
    adc_trg_obuf		:	obuf_lvcmos33		port map (i => adc_trg, o => adc_trg_out);
	 
	 
    U0 : clock_top port map
    (fpga_clk => clk50, rst => rst, clk_1MHz => clk_1MHz, clk_1KHz => clk_1KHz, clk_100Hz => stp_clk, clk_1Hz => clk_1Hz );

    U1_1 : button_edge_trigger generic map (is_rising => TRUE) port map
    (i_clk => clk_1MHz, button => sys_init, button_edge => sys_init_ctrl);
    
    U1_2 : button_edge_trigger generic map (is_rising => TRUE) port map
    (i_clk => clk_1MHz, button => trg, button_edge => trg_ctrl);
    
    U2 : FSM port map
    (stp_clk => stp_clk, sys_init_ctrl => sys_init_ctrl, trg_ctrl => trg_ctrl, sw => sw, wrk_stat => wrk_stat,
     rot_en => rot_en, adc_en => adc_en, rf_sw => rf_sw, rot_count => rot_count);
    
    U3 : Increment_angle_counter_for_7seg port map
    (sys_init_ctrl => sys_init_ctrl, rot_clk => rot_clk, rot_en => rot_en,
     bcd_int => bcd_int);
     
    U4 : mux_7seg port map
    (sys_init_ctrl => sys_init_ctrl, clk_1KHz => clk_1KHz, bcd_int => bcd_int,
     digit => digit, seg => seg);
     
    U5 : LED8_counter port map
    (sys_init_ctrl => sys_init_ctrl, fpga_clk => clk50, clk_1Hz => clk_1Hz,
     led => led);
end arch_cmb;
