----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/08 17:29:13
-- Design Name: 
-- Module Name: T_FLIP_FLOP - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity T_FLIP_FLOP is
  Port (CLOCK : IN std_logic;
        T     : IN std_logic;
        EN    : IN std_logic;
        Q     : OUT std_logic;
        NOT_Q : OUT std_logic);  
END T_FLIP_FLOP;        
        
architecture BEHAVIORAL OF T_FLIP_FLOP IS   
      signal Q_TEMP : std_logic;
begin
      P1 : PROCESS(CLOCK, EN)
      BEGIN
              
        IF (EN = '0' AND rising_edge(CLOCK)) THEN
            Q_TEMP <= '0';
        ELSIF rising_edge(CLOCK) THEN
            IF (T = '1') THEN
                Q_TEMP <= NOT Q_TEMP;
            ELSE
                Q_TEMP <= Q_TEMP;
            END IF;
        END IF;
      END PROCESS;
        
      P2 : PROCESS(CLOCK, Q_TEMP) 
      begin
        Q <= Q_TEMP;
        NOT_Q <= NOT Q_TEMP;
      END PROCESS;


end Behavioral;
