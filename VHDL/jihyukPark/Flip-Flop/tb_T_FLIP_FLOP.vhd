----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/08 17:37:15
-- Design Name: 
-- Module Name: tb_T_FLIP_FLOP - Behavioral
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

entity tb_T_FLIP_FLOP is
--  Port ( );
end tb_T_FLIP_FLOP;

architecture Behavioral of tb_T_FLIP_FLOP is
    component T_FLIP_FLOP 
    Port (CLOCK : IN std_logic;
        T     : IN std_logic;
        EN    : IN std_logic;
        Q     : OUT std_logic;
        NOT_Q : OUT std_logic); 
    END component;
    
  signal CLOCK : std_logic := '0';
  signal T : std_logic := '0';
  signal EN : std_logic := '0';
  signal Q : std_logic;
  signal NOT_Q : std_logic;
  
begin
    TFF : T_FLIP_FLOP PORT MAP (CLOCK => CLOCK, T => T, EN => EN, Q => Q, NOT_Q => NOT_Q);
    
      CLOCK0: process
      begin
        CLOCK <= '0';
        wait for 10 ns;
        CLOCK <= '1';
        wait for 10 ns;
      end process;
    
      T_INPUT0: process
      begin
        T <= '0';
        wait for 15 ns;
        T <= '1';
        wait for 15 ns;
      end process;
    
      ENABLE0: process
      begin
        EN <= '0';
        wait for 40 ns;
        EN <= '1';
        wait;
      end process;

end Behavioral;
