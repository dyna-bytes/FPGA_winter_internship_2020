----------------------------------------------------------------------------------
-- Company: Korea univ.
-- Engineer: Seongsu Kim
-- 
-- Create Date: 2021/01/11 16:43:14
-- Design Name: cmb_ctrl revised
-- Module Name: mycmb_ctrl - Behavioral
-- Project Name: cmb_ctrl revised
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

library UNISIM;
use UNISIM.VComponents.all;

entity mycmb_ctrl is
    Port (clk50_in     : in STD_LOGIC;								-- 50MHz X-TAL --
	      pb_in        : in STD_LOGIC_VECTOR (3 downto 0);			-- 4 push button --
		  sw_in        : in STD_LOGIC_VECTOR (7 downto 0);			-- 8 switch --
		  digit_out    : out STD_LOGIC_VECTOR (3 downto 0);		-- digit driver --
		  led_out 	   : out STD_LOGIC_VECTOR (7 downto 0);		-- led control --
		  seg_out      : out STD_LOGIC_VECTOR (7 downto 0);		-- 7 segment control --
		  rf_sw_out	   : out STD_LOGIC_VECTOR (3 downto 0);		-- rf switch control --
		  debug_out	   : out STD_LOGIC;							-- degug signal --
		  rot_count_out: out STD_LOGIC_VECTOR (9 downto 0);		-- reflector rotation count --
		  rot_clk_out  : out STD_LOGIC;							-- step motor clock --
		  stp_clk_out  : out STD_LOGIC;							-- step motor reference clock --
          adc_trg_out  : out STD_LOGIC);							-- trigger for adc board --
end mycmb_ctrl;

architecture arch_cmb of mycmb_ctrl is
	component ibuf_lvcmos33 port(i: in STD_LOGIC; o: out STD_LOGIC);
	end component;
	component ibufg_lvcmos33 port (i: in STD_LOGIC; o: out STD_LOGIC);
	end component;
	component obuf_lvcmos33 port (i: in STD_LOGIC; o: out STD_LOGIC);
	end component;
	component bufg port (i: in STD_LOGIC; o: out STD_LOGIC);
	end component;
---------------------------------------------------------
-- importing generation of clocks ()
---------------------------------------------------------
	component hzclock
	   generic(clk_period_i:integer; 
	        clk_period_f:integer); 
	   port(clk: in std_logic := '0'; 
	        reset: in std_logic := '0'; 
	        outclk: out std_logic :='0');
	end component;
---------------------------------------------------------
-- signal control (sys_init_ctrl, trg_ctrl)
---------------------------------------------------------
    component sig_ctrl 
        port(clk : in std_logic;
             sig : in std_logic;
             sig_ctrl: out std_logic);
    end component;        
---------------------------------------------------------
-- initialize and observation process
---------------------------------------------------------
    component obs
        port(sys_init_ctrl: in std_logic;
             stp_clk: in std_logic;
             trg_ctrl: in std_logic;
             sw: in std_logic_vector (7 downto 0);
             rot_en: out std_logic;
             rf_sw: out std_logic_vector (3 downto 0);
             adc_en: out std_logic;
             wrk_stat: out std_logic;
             rot_count:out std_logic_vector (9 downto 0));
    end component;
---------------------------------------------------------
-- increment_angle_counter_7seg => bcdint
---------------------------------------------------------
    component increment_angle_counter_7seg 
        port(rot_clk: in std_logic;
             sys_init_ctrl: in std_logic;
             rot_en: in std_logic;
             bcdint: out std_logic_vector (15 downto 0));
    end component;    
---------------------------------------------------------
-- 7-segment display output by multiplexing
---------------------------------------------------------
    component mux_7seg
        port(sys_init_ctrl: in std_logic;
             khertz_clk: in std_logic;
             bcdint: in std_logic_vector (15 downto 0);
             digit: out std_logic_vector (3 downto 0);
             seg: out std_logic_vector (7 downto 0));
    end component;
---------------------------------------------------------
-- 8 led_counter
---------------------------------------------------------
    component led_counter
        port(sys_init_ctrl: in std_logic;
             hertz_clk: in std_logic;
             led: out std_logic_vector (7 downto 0));
    end component;
---------------------------------------------------------
    signal rst 			: STD_LOGIC;
    signal clk50int		: STD_LOGIC;
    signal clk50		: STD_LOGIC;
    signal pb			: STD_LOGIC_VECTOR (3 downto 0);
    signal sw			: STD_LOGIC_VECTOR (7 downto 0);
    signal digit		: STD_LOGIC_VECTOR (3 downto 0);
    signal led			: STD_LOGIC_VECTOR (7 downto 0);
    signal seg			: STD_LOGIC_VECTOR (7 downto 0);
    signal seg_dp		: STD_LOGIC;
    signal rf_sw		: STD_LOGIC_VECTOR (3 downto 0);
    signal debug		: STD_LOGIC;
    signal adc_trg		: STD_LOGIC;
    signal adc_en		: STD_LOGIC;
    signal rot_clk		: STD_LOGIC;
    signal rot_en		: STD_LOGIC;
    signal sys_init		: STD_LOGIC;
    signal sys_init_b	: STD_LOGIC;
    signal sys_init_ctrl: STD_LOGIC;
    signal trg			: STD_LOGIC;
    signal trg_b		: STD_LOGIC;
    signal trg_ctrl		: STD_LOGIC;
    signal wrk_stat     : STD_LOGIC;
    signal mhertz_count : STD_LOGIC_VECTOR (5 downto 0);
    signal mhertz_clk	: STD_LOGIC;
    signal khertz_count	: STD_LOGIC_VECTOR (15 downto 0);
    signal khertz_clk	: STD_LOGIC;
    signal hertz_count	: STD_LOGIC_VECTOR (9 downto 0);
    signal hertz_clk	: STD_LOGIC;
    signal stp_count	: STD_LOGIC_VECTOR (4 downto 0);
    signal stp_clk		: STD_LOGIC;
    signal prcs_count	: STD_LOGIC_VECTOR (7 downto 0);
    signal rot_count	: STD_LOGIC_VECTOR (9 downto 0);
    signal bcdint		: STD_LOGIC_VECTOR (15 downto 0);
    signal dig_count	: STD_LOGIC_VECTOR (2 downto 0);
    signal bcdcrt		: STD_LOGIC_VECTOR (3 downto 0);
begin
		rst <= pb(3);					-- BTN3 on board for reset --
		sys_init <= pb(2);				-- BTN2 on board for initialize --
		trg	<= pb(1);					-- BTN1 on board for start --
				
		debug <= wrk_stat;
						
		rot_clk <= (rot_en and stp_clk);		-- Stepping motor control clock : 0.1 deg moving at 1 clock --
		adc_trg <= (adc_en nand khertz_clk);	-- Data acquisition clock for ADC board --
				
		clk50_in_ibuf:	ibufg_lvcmos33		port map (i => clk50_in, o => clk50int);
		rxclka_bufg  :	bufg				port map (i => clk50int, o => clk50);
		
		loop0       : for i in 0 to 3 generate
		digit_obuf	:	obuf_lvcmos33		port map (i => digit(i), o => digit_out(i));
		rf_sw_obuf	:	obuf_lvcmos33		port map (i => rf_sw(i), o => rf_sw_out(i));
		pb_ibuf		:	ibuf_lvcmos33		port map (i => pb_in(i), o => pb(i));
		end generate;
		
		loop1 : for i in 0 to 7 generate
		seg_obuf	:	obuf_lvcmos33		port map (i => seg(i), o => seg_out(i));
		led_obuf	:	obuf_lvcmos33		port map (i => led(i), o => led_out(i));
		sw_ibuf		:	ibuf_lvcmos33		port map (i => sw_in(i), o => sw(i));
		end generate;
		
		loop2 : for i in 0 to 9 generate
		rot_count_obuf: obuf_lvcmos33	port map (i => rot_count(i), o => rot_count_out(i));
		end generate;
		
		debug_obuf	:	obuf_lvcmos33		port map (i => debug, o => debug_out);
		rot_clk_obuf:	obuf_lvcmos33		port map (i => rot_clk, o => rot_clk_out);
		stp_clk_obuf:	obuf_lvcmos33		port map (i => stp_clk, o => stp_clk_out);
		adc_trg_obuf:	obuf_lvcmos33		port map (i => adc_trg, o => adc_trg_out);
		-- specification of input, output buffer
----------------------------------------------------------------------------------
-- Generation of 1MHz clock from 50MHz clock
----------------------------------------------------------------------------------
    u_clk_50mhz_to_mhz: hzclock
    generic map(clk_period_i => 20, clk_period_f => 10**3)
    port map(clk => clk50, reset => rst, outclk => mhertz_clk);
----------------------------------------------------------------------------------
-- Generation of 1kHz clock from 50MHz clock
----------------------------------------------------------------------------------
    u_clk_50mhz_to_khz: hzclock
    generic map(clk_period_i => 20, clk_period_f => 10**6)
    port map(clk => clk50, reset => rst, outclk => khertz_clk);
----------------------------------------------------------------------------------
-- Generation of 1Hz clock from 1kHz clock
----------------------------------------------------------------------------------
	u_clk_khz_to_hz: hzclock 
	generic map(clk_period_i => 10**6,clk_period_f => 10**9)
	port map(clk => khertz_clk, reset => rst, outclk => hertz_clk);	
----------------------------------------------------------------------------------
-- Generation of stepping motor clock from 1kHz clock (stp_clk is 100Hz clock)
----------------------------------------------------------------------------------	
	u_clk_khz_to_100hz: hzclock
	generic map(clk_period_i => 10**6,clk_period_f => 10**7)
	port map(clk => khertz_clk, reset => rst, outclk => stp_clk);	
----------------------------------------------------------------------------------
-- Generation of system initialize signal
----------------------------------------------------------------------------------
    u_sig_ctrl_sys: sig_ctrl
    port map(clk => mhertz_clk, sig => sys_init, sig_ctrl => sys_init_ctrl);
----------------------------------------------------------------------------------
-- Triggering for start
----------------------------------------------------------------------------------
	u_sig_ctrl_trg: sig_ctrl
    port map(clk => mhertz_clk, sig => trg, sig_ctrl => trg_ctrl);	
----------------------------------------------------------------------------------
-- Initialize and observation process
----------------------------------------------------------------------------------
    u_obs: obs
    port map(sys_init_ctrl => sys_init_ctrl, stp_clk => stp_clk,trg_ctrl => trg_ctrl, 
        sw => sw, rot_en => rot_en, rf_sw => rf_sw, adc_en => adc_en, wrk_stat => wrk_stat, rot_count => rot_count);
----------------------------------------------------------------------------------
-- Increment angle counter for 7-segment display
----------------------------------------------------------------------------------
	u_increment_angle_counter_7seg: increment_angle_counter_7seg
	port map(rot_clk => rot_clk,sys_init_ctrl => sys_init_ctrl, rot_en => rot_en, bcdint => bcdint);
----------------------------------------------------------------------------------
-- 7-segment display output by multiplexing
----------------------------------------------------------------------------------	
	u_mux_7seg: mux_7seg
	port map(sys_init_ctrl => sys_init_ctrl, khertz_clk => khertz_clk, bcdint => bcdint, digit => digit, seg => seg);
----------------------------------------------------------------------------------
-- 8 LED counter from 1Hz signal
----------------------------------------------------------------------------------					
	u_led_counter: led_counter
	port map(sys_init_ctrl => sys_init_ctrl, hertz_clk => hertz_clk, led => led);
end arch_cmb;
