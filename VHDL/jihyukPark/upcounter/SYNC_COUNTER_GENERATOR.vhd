----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/10 20:54:23
-- Design Name: 
-- Module Name: SYNC_COUNTER_GENERATOR - Behavioral
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

entity SYNC_COUNTER_GENERATOR is
  generic(FROM_Hz : integer;
          TO_Hz   : integer);
  
  Port (CLOCK : IN std_logic;
        RESET : IN std_logic;
        CLOCK_OUT : OUT std_logic);
end SYNC_COUNTER_GENERATOR;

architecture Behavioral of SYNC_COUNTER_GENERATOR is
    signal N : integer := FROM_HZ / TO_HZ;
    signal COUNT_N : integer := 0;
    signal CLOCK_OUT_Temp : std_logic := '0';
begin

    CLOCK_OUT_GENRATION : PROCESS(CLOCK, RESET)
    BEGIN
        IF rising_edge(CLOCK) THEN
            IF (RESET = '1') THEN 
                COUNT_N <= 0;
                CLOCK_OUT_Temp <= '0'; -- CLOCK_OUT_Temp is a STD_LOGIC type bit
            ELSIF (COUNT_N = N -1) THEN
                COUNT_N <= 0;              -- COUNT_N is an INTIGER type
                CLOCK_OUT_Temp <= NOT CLOCK_OUT_Temp;
            ELSE
                COUNT_N <= COUNT_N + 1;            
            END IF;
        END IF;
    END PROCESS;
    
    CLOCK_OUT_ASSIGN : PROCESS(CLOCK)
    BEGIN
        CLOCK_OUT <= CLOCK_OUT_TEMP;
    END PROCESS;


end Behavioral;
