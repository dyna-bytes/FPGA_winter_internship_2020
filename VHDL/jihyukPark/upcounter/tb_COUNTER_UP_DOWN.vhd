----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/09 10:08:12
-- Design Name: 
-- Module Name: tb_COUNTER_UP_DOWN - Behavioral
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

entity tb_COUNTER_UP_DOWN is
--  Port ( );
end tb_COUNTER_UP_DOWN;

architecture Behavioral of tb_COUNTER_UP_DOWN is
    component COUNTER_UP_DOWN
    Port (CLOCK : IN std_logic;
        RESET : IN std_logic;
        UP_DOWN_CTRL : IN std_logic;
        OUTPUT : OUT std_logic_vector(7 downto 0) );
    END component;
    
    SIGNAL    CLOCK : std_logic := '0';
    SIGNAL    RESET : std_logic := '0';
    SIGNAL    UP_DOWN_CTRL : std_logic := '0';
    SIGNAL    OUTPUT : std_logic_vector(7 downto 0);
begin
    U1 : COUNTER_UP_DOWN PORT MAP(CLOCK => CLOCK, RESET => RESET, UP_DOWN_CTRL => UP_DOWN_CTRL, OUTPUT => OUTPUT);
    
  CLOCK0: process
  begin
    CLOCK <= '0';
    wait for 10 ns;
    CLOCK <= '1';
    wait for 10 ns;
  end process;

  UP_DOWN_CTRL0: process
  begin
    UP_DOWN_CTRL <= '1';
    wait for 100 ns;
    UP_DOWN_CTRL <= '0';
    wait for 100 ns;
  end process;

  RESET0: process
  begin
    RESET <= '0';
    wait for 150 ns;
    RESET <= '1';
    wait for 150 ns;
  end process; 
end Behavioral;
