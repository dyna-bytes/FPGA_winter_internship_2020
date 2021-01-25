----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/08 19:30:06
-- Design Name: 
-- Module Name: CLOCKDIV_4BIT - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CLOCKDIV_4BIT is
  port(clock : in std_logic;
       reset : in std_logic;
       clock_out : out std_logic_vector(3 downto 0));
--  port ( );
end CLOCKDIV_4BIT;

architecture Behavioral of CLOCKDIV_4BIT is
    signal clock_out_temp : std_logic_vector(3 downto 0) := "0000";
begin
    process(clock, reset, clock_out_temp)
    begin
        if (reset = '1') then
            clock_out_temp <= "0000";
        elsif rising_edge(clock) then
            clock_out_temp <= clock_out_temp + '1';
        end if;
    end process;
    
    process(clock_out_temp)
    begin
        clock_out <= clock_out_temp;
    end process;
end Behavioral;
