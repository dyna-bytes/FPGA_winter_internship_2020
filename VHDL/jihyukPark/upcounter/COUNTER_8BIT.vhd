----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/08 19:52:33
-- Design Name: 
-- Module Name: COUNTER_8BIT - Behavioral
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
USE IEEE.std_logic_unsigned.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity COUNTER_8BIT is
  Port (CLOCK : IN std_logic;
        RESET : IN std_logic;
        OUTPUT : OUT std_logic_vector(7 downto 0) );
end COUNTER_8BIT;

architecture Behavioral of COUNTER_8BIT is
    signal OUTPUT_TEMP : std_logic_vector(7 downto 0) := "00000000";
    
begin
    OUTPUT <= OUTPUT_TEMP;
    
    PROCESS(CLOCK, RESET, OUTPUT_TEMP)
    BEGIN
        IF(RESET = '1') THEN
            OUTPUT_TEMP <= "00000000";
        ELSIF rising_edge(CLOCK) THEN
            OUTPUT_TEMP <= OUTPUT_TEMP + '1';   -- USE IEEE.std_logic_unsigned.ALL;
        END IF;
    END PROCESS;

end Behavioral;
