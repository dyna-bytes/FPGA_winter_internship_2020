----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/09 00:37:29
-- Design Name: 
-- Module Name: tb_COUNTER_8BIT - Behavioral
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

entity tb_COUNTER_8BIT is
--  Port ( );
end tb_COUNTER_8BIT;

architecture Behavioral of tb_COUNTER_8BIT is
    component COUNTER_8BIT
    Port (CLOCK : IN std_logic;
        RESET : IN std_logic;
        OUTPUT : OUT std_logic_vector(7 downto 0) );
    END COMPONENT;    
    
    SIGNAL CLOCK : STD_LOGIC := '0';
    signal RESET : std_logic := '0';
    signal OUTPUT : std_logic_vector (7 downto 0);
begin
    U0 : COUNTER_8BIT PORT MAP(CLOCK => CLOCK, RESET => RESET, OUTPUT => OUTPUT);
    
    CLOCK0: process
  begin
    CLOCK <= '0';
    wait for 10 ns;
    CLOCK <= '1';
    wait for 10 ns;
  end process;

  RESET0: process
  begin
    RESET <= '0';
    wait for 200 ns;
    RESET <= '1';
    wait for 200 ns;
  end process;


end Behavioral;
