--------------------------------------------------------------------------------
-- Company: Korea University / Department of Physics
-- Engineer: Jihoon Choi (pury828@gmail.com)
--
-- Create Date:   20:34:25 09/28/2011
-- Design Name:   CMB_Ctrl
-- Module Name:   C:/ISE_Data/CMB_Ctrl/cmb_test.vhd
-- Project Name:  CMB_Ctrl
-- Target Device: Spartan XC3S400 
-- Tool versions: ISE 13.2 
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: cmb_ctrl
-- 
-- Dependencies:
-- 
-- Revision: 0.99
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY cmb_test IS
END cmb_test;
 
ARCHITECTURE cmb_test OF cmb_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CMB_top
    PORT(
         clk50_in : IN  std_logic;
         pb_in : IN  std_logic_vector(3 downto 0);
         sw_in : IN  std_logic_vector(7 downto 0);
         digit_out : OUT  std_logic_vector(3 downto 0);
         led_out : OUT  std_logic_vector(7 downto 0);
         seg_out : OUT  std_logic_vector(7 downto 0);
         rf_sw_out : OUT  std_logic_vector(3 downto 0);
         debug_out : OUT  std_logic;
			rot_count_out : OUT  std_logic_vector(9 downto 0);
         rot_clk_out : OUT  std_logic;
         stp_clk_out : OUT  std_logic;
			adc_trg_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk50_in : std_logic;
   signal pb_in : std_logic_vector(3 downto 0) := (others => '0');
   signal sw_in : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal digit_out : std_logic_vector(3 downto 0);
   signal led_out : std_logic_vector(7 downto 0);
   signal seg_out : std_logic_vector(7 downto 0);
   signal rf_sw_out : std_logic_vector(3 downto 0);
   signal debug_out : std_logic;
	signal rot_count_out : std_logic_vector(9 downto 0); 
   signal rot_clk_out : std_logic;
   signal stp_clk_out : std_logic;
   signal adc_trg_out : std_logic;
	
   -- Clock period definitions
   constant step : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CMB_top PORT MAP (
          clk50_in => clk50_in,
          pb_in => pb_in,
          sw_in => sw_in,
          digit_out => digit_out,
          led_out => led_out,
          seg_out => seg_out,
          rf_sw_out => rf_sw_out,
          debug_out => debug_out,
			 rot_count_out => rot_count_out,
          rot_clk_out => rot_clk_out,
          stp_clk_out => stp_clk_out,
			 adc_trg_out => adc_trg_out
			);

   -- Clock process definitions
   clk50_in_process :process
   begin
		
		clk50_in <= '0';
		wait for step/2;
		clk50_in <= '1';
		wait for step/2;
		
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
   
   
      
		-- hold reset state for 100 ns.
      wait for 10 ns;	
		pb_in(3) <= '0';
      wait for step*10;
		pb_in(3) <= '1';
		wait for step*20;
		pb_in(3) <= '0';
		
		wait for 2 us;
		pb_in(2) <= '0';
		wait for step*10;
		pb_in(2) <= '1';
		wait for step*30;
		pb_in(2) <= '0';
		
		wait for 8 us;
		pb_in(1) <= '0';
		wait for step*10;
		pb_in(1) <= '1';
		wait for step*30;
		pb_in(1) <= '0';

      -- insert stimulus here 

      wait;
   end process;

END cmb_test;
