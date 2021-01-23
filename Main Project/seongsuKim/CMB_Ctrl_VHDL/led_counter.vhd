----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/13 14:17:36
-- Design Name: 
-- Module Name: led_counter - Behavioral
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

entity led_counter is
    port(sys_init_ctrl: in std_logic;
         hertz_clk: in std_logic;
         led: out std_logic_vector (7 downto 0));
end led_counter;

architecture Behavioral of led_counter is
    signal led_temp: std_logic_vector (7 downto 0);
begin
    process(sys_init_ctrl, hertz_clk)
    begin
        if sys_init_ctrl = '1' then
			led_temp <= (others => '0');
		elsif hertz_clk'event and hertz_clk = '1' then
			led_temp <= led_temp + 1;
			if led_temp = "11111111" then
				led_temp <= (others => '0');
			end if;
		end if;
		
		led <= led_temp;
    end process;
end Behavioral;
