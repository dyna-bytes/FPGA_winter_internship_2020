----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/08 17:05:35
-- Design Name: 
-- Module Name: JK_FLIP_FLOP - Behavioral
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

entity JK_FLIP_FLOP is
  Port (CLOCK : IN std_logic;
        J     : IN std_logic;
        K     : IN std_logic;
        ENABLE : IN std_logic;
        Q : OUT std_logic;
        NOT_Q : OUT std_logic
         );
end JK_FLIP_FLOP;

architecture Behavioral of JK_FLIP_FLOP is
    signal Q_TEMP : std_logic;
begin
    process(CLOCK, ENABLE)
    BEGIN
        IF (ENABLE = '0') THEN
            Q_TEMP <= '0';
        elsIF falling_edge(CLOCK) THEN
            IF (J = '0' AND K = '0') THEN
                Q_TEMP <= Q_TEMP;
            ELSIF (J = '1' AND K = '0') THEN
                Q_TEMP <= '1';
            ELSIF (J = '0' AND K = '1') THEN
                Q_TEMP <= '0';     
            ELSE
                Q_TEMP <= NOT Q_TEMP; 
            END IF;
         END IF;
         
         Q<= Q_TEMP;
         NOT_Q <= NOT Q_TEMP;
         
      END PROCESS;
end Behavioral;
