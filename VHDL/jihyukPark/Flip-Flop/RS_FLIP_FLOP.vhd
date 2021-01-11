----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/08 16:02:10
-- Design Name: 
-- Module Name: RS_FLIP_FLOP - Behavioral
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
use IEEE.std_logic_arith.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RS_FLIP_FLOP is
  Port (SET : IN std_logic;
        RESET : IN std_logic;
        CLOCK : IN  std_logic;
        ENABLE : IN std_logic;
        Q     : OUT std_logic;
        NOT_Q : OUT std_logic
        );
end RS_FLIP_FLOP;

architecture Behavioral of RS_FLIP_FLOP is
    signal SG_Q_TEMP : std_logic;
    signal SG_NOT_Q_TEMP :std_logic;
begin
    process(SET, RESET, CLOCK, ENABLE)
    begin
        Q <= SG_Q_TEMP;
        NOT_Q <= SG_NOT_Q_TEMP;

        IF(ENABLE = '0' AND rising_edge(CLOCK)) THEN
            SG_Q_TEMP <= '0';
            SG_NOT_Q_TEMP <= '1';
         elsif(SET = '0' AND RESET = '0' AND rising_edge(CLOCK)) THEN
             SG_Q_TEMP <= SG_Q_TEMP;
            SG_NOT_Q_TEMP <= SG_NOT_Q_TEMP;
         elsif(SET = '0' AND RESET = '1' AND rising_edge(CLOCK)) THEN
            SG_Q_TEMP <= '0';
            SG_NOT_Q_TEMP <= '1';   
         elsif(SET = '1' AND RESET = '0' AND rising_edge(CLOCK)) THEN
            SG_Q_TEMP <= '1';
            SG_NOT_Q_TEMP <= '0';  
         END IF;
    END PROCESS;
    

end Behavioral;
