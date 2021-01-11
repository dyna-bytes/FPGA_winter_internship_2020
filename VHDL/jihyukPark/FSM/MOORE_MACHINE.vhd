----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/08 17:42:14
-- Design Name: 
-- Module Name: MOORE_MACHINE - Behavioral
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

entity MOORE_MACHINE is
  Port (CLOCK : IN std_logic;
        RESET : IN std_logic;
        INPUT : IN std_logic;
        OUTPUT : OUT std_logic_vector(2 downto 0) );
end MOORE_MACHINE;

architecture Behavioral of MOORE_MACHINE is
    TYPE STATES IS (S0, S1, S2, S3);
    
    signal STATE : STATES;
begin
    PROCESS(CLOCK, RESET, INPUT) 
    BEGIN
        IF (RESET = '1') THEN
            STATE <= S0;
        elsif rising_edge(CLOCK) THEN
            IF (STATE = S0) THEN
                IF (INPUT = '1') THEN
                    STATE <= S1;
                ELSE 
                    STATE <= S0;
                END IF;
            ELSIF (STATE = S1) THEN
                IF (INPUT = '1') THEN
                    STATE <= S2;
                ELSE
                    STATE <= S1;
                END IF;
            ELSIF (STATE = S2) THEN
                IF (INPUT = '1') THEN
                    STATE <= S3;
                ELSE
                    STATE <= S2;
                END IF;
            ELSIF (STATE = S3) THEN
                IF (INPUT = '1') THEN
                    STATE <= S0;
                ELSE
                    STATE <= S3;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    
    PROCESS(STATE)
    BEGIN
        IF(STATE = S0) THEN
            OUTPUT <= "000";
        ELSIF(STATE = S1) THEN
            OUTPUT <= "001";
        ELSIF(STATE = S2) THEN
            OUTPUT <= "010";
        ELSIF(STATE = S3) THEN
            OUTPUT <= "100";
        END IF;
    END PROCESS;

end Behavioral;
