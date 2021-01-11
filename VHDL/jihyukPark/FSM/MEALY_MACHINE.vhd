----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/08 19:03:58
-- Design Name: 
-- Module Name: MEALY_MACHINE - Behavioral
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

entity MEALY_MACHINE is
    port(CLOCK : in std_logic;
       RESET : in std_logic;
       INPUT : in std_logic;
       OUTPUT : out std_logic_vector(2 downto 0));
end MEALY_MACHINE;

architecture Behavioral of MEALY_MACHINE is
    type states is (S0, S1, S2, S3);
    signal STATE : states;
begin

      NEXT_STATE_LOGIC : process(CLOCK, RESET)
      begin
        if (RESET = '1') then
          STATE <= S0;
        elsif rising_edge(CLOCK) then
            CASE STATE IS
                WHEN S0 => IF (INPUT = '1') THEN STATE <= S1;
                           ELSE                  STATE <= S0;
                           END IF;
                WHEN S1 => IF (INPUT = '1') THEN STATE <= S2;
                           ELSE                  STATE <= S1;
                           END IF;
                WHEN S2 => IF (INPUT = '1') THEN STATE <= S3;
                           ELSE                  STATE <= S2;
                           END IF;
                WHEN S3 => IF (INPUT = '1') THEN STATE <= S0;
                           ELSE                  STATE <= S3;
                           END IF;
                WHEN OTHERS => IF (INPUT = '1') THEN STATE <= S1;
                           ELSE                  STATE <= S0;
                           END IF;
             END CASE;        
         END IF;                  
      end process;

    OUTPUT_LOGIC : PROCESS(INPUT, STATE)
    BEGIN
        CASE STATE IS
            WHEN S0 =>   IF (INPUT = '1') THEN OUTPUT <= "000";
                         ELSE                  OUTPUT <= "111";
                         END IF;
            WHEN S1 =>   IF (INPUT = '1') THEN OUTPUT <= "001";
                         ELSE                  OUTPUT <= "111";
                         END IF;
            WHEN S2 =>   IF (INPUT = '1') THEN OUTPUT <= "010";
                         ELSE                  OUTPUT <= "111";
                         END IF;
            WHEN S3 =>   IF (INPUT = '1') THEN OUTPUT <= "100";
                         ELSE                  OUTPUT <= "111";
                         END IF;        
            WHEN others => IF (INPUT = '1') THEN OUTPUT <= "000";
                           ELSE                  OUTPUT <= "111";
                           END IF;                               
        END CASE;
    END process;
end Behavioral;
