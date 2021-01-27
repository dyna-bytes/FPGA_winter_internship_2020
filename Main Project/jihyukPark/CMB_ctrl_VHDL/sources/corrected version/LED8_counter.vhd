----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/13 16:36:33
-- Design Name: 
-- Module Name: LED8_counter - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


-- 8 LED counter from 1Hz signal
entity LED8_counter is
  Port (sys_init_ctrl : in std_logic;
        fpga_clk : in std_logic;
        clk_1Hz : in std_logic;
        led : out std_logic_vector(7 downto 0)
         );
end LED8_counter;

architecture Behavioral of LED8_counter is
    signal led_temp : std_logic_vector(7 downto 0) := "0000" & "0000";
begin
    process(fpga_clk, sys_init_ctrl, clk_1Hz)
    begin
    led <= led_temp;
    end process;
    
    process(fpga_clk, sys_init_ctrl, clk_1Hz)
    begin 
        if sys_init_ctrl = '1' then
            led_temp <= (others => '0');
        elsif rising_edge(clk_1Hz) then
            led_temp <= led_temp + 1;

			if led_temp = "1111" & "1111" then
				led_temp <= (others => '0');
			end if;
        end if;
    end process;
    
end Behavioral;
