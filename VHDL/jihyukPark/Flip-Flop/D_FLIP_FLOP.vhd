----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/08 16:48:41
-- Design Name: 
-- Module Name: D_FLIP_FLOP - Behavioral
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

entity D_FLIP_FLOP is
  Port (CLOCK : IN std_logic;
        DATA_INPUT : IN std_logic;
        Q   : OUT std_logic;
        NOT_Q : OUT std_logic
         );
end D_FLIP_FLOP;

architecture Behavioral of D_FLIP_FLOP is
begin
    PROCESS(CLOCK)
    BEGIN
        IF rising_edge(CLOCK) THEN
            Q <= DATA_INPUT;
            NOT_Q <= NOT DATA_INPUT;
        END IF;
    END PROCESS;

end Behavioral;
