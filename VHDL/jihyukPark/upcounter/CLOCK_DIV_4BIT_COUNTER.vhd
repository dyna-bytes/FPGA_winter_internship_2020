----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/11 01:26:51
-- Design Name: 
-- Module Name: CLOCK_DIV_4BIT_COUNTER - Behavioral
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

entity CLOCK_DIV_4BIT_COUNTER is
  Port (CLOCK : in std_logic;
        RESET : in std_logic;
        CLOCK_OUT : out std_logic_vector(3 downto 0));
end CLOCK_DIV_4BIT_COUNTER;

architecture Behavioral of CLOCK_DIV_4BIT_COUNTER is
    signal CLOCK_OUT_Temp : std_logic_vector(3 downto 0) := "0000";
begin
    CLOCK_OUT <= CLOCK_OUT_Temp;
    
    PROCESS(CLOCK, RESET, CLOCK_OUT_TEMP)
    BEGIN
        IF rising_edge(CLOCK) THEN
            IF (RESET = '1') THEN
                CLOCK_OUT_TEMP <= "0000";
            ELSE
                CLOCK_OUT_TEMP <= CLOCK_OUT_TEMP + '1';
            END IF;
        END IF;
    END PROCESS;

end Behavioral;
