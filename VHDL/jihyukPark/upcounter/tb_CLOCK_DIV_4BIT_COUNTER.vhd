----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/11 02:16:30
-- Design Name: 
-- Module Name: tb_CLOCK_DIV_4BIT_COUNTER - Behavioral
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

entity tb_CLOCK_DIV_4BIT_COUNTER is
--  Port ( );
end tb_CLOCK_DIV_4BIT_COUNTER;

architecture Behavioral of tb_CLOCK_DIV_4BIT_COUNTER is
    COMPONENT CLOCK_DIV_4BIT_COUNTER
      PORT(
           CLOCK : IN std_logic;
           RESET : IN std_logic;
           CLOCK_OUT : OUT std_logic_vector(3 downto 0)
          );
      END COMPONENT;
    
      signal CLOCK : std_logic := '0';
      signal RESET : std_logic := '0';
      signal CLOCK_OUT : std_logic_vector(3 downto 0);
begin
    U : CLOCK_DIV_4BIT_COUNTER PORT MAP (
       CLOCK => CLOCK,
       RESET => RESET,
       CLOCK_OUT => CLOCK_OUT
     );

      CLOCK0: process
      begin
        CLOCK <= '0';
        wait for 10 ns;
        CLOCK <= '1';
        wait for 10 ns;
      end process;

end Behavioral;
