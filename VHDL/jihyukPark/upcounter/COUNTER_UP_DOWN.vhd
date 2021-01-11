----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/09 10:00:18
-- Design Name: 
-- Module Name: COUNTER_UP_DOWN - Behavioral
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
USE IEEE.std_logic_arith.ALL;
USE IEEE.std_logic_unsigned.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity COUNTER_UP_DOWN is
  Port (CLOCK : IN std_logic;
        RESET : IN std_logic;
        UP_DOWN_CTRL : IN std_logic;
        OUTPUT : OUT std_logic_vector( 7 downto 0) );
end COUNTER_UP_DOWN;

architecture Behavioral of COUNTER_UP_DOWN is
    signal OUTPUT_TEMP : std_logic_vector(7 downto 0) := "00000000";
begin
    PROCESS(CLOCK, RESET, UP_DOWN_CTRL) 
    BEGIN
        IF rising_edge(CLOCK) THEN
            IF (RESET = '1') THEN
                 OUTPUT_TEMP <= "00000000";
            ELSE
                CASE UP_DOWN_CTRL IS
                WHEN '0' => OUTPUT_TEMP <= (OUTPUT_TEMP - '1') ;
                when '1' => OUTPUT_TEMP <= (OUTPUT_TEMP + '1' ) ;
                WHEN OTHERS => OUTPUT_TEMP <= OUTPUT_TEMP;
                END CASE;
            END IF;
        ELSE OUTPUT_TEMP <= OUTPUT_TEMP;
        END IF;
    END process;
    
    PROCESS(CLOCK, OUTPUT_TEMP) 
    begin
         OUTPUT <= OUTPUT_TEMP;
    END PROCESS;
end Behavioral;
