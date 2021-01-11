----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/09 11:39:06
-- Design Name: 
-- Module Name: tb_CNT_8pudn_en - Behavioral
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

entity tb_CNT_8pudn_en is
--  Port ( );
end tb_CNT_8pudn_en;

architecture Behavioral of tb_CNT_8pudn_en is
 component CNT_8UPDN_EN
 Port (CLOCK : IN std_logic;
        RESET : IN std_logic;
        EN : IN std_logic;
        UP_DN_CTRL : IN std_logic;
        OUTPUT : OUT std_logic_vector(7 downto 0));
 END component;
 
 signal       CLOCK : std_logic := '0';
 signal       RESET : std_logic := '0';
 signal       EN :  std_logic := '0';
 signal       UP_DN_CTRL : std_logic := '1';
 signal       OUTPUT : std_logic_vector(7 downto 0);
 
begin
    U2 : CNT_8UPDN_EN PORT MAP (CLOCK => CLOCK, RESET => RESET, EN => EN, UP_DN_CTRL => UP_DN_CTRL, OUTPUT => OUTPUT);
    
  CLOCK0: process
  begin
    CLOCK <= '0';
    wait for 10 ns;
    CLOCK <= '1';
    wait for 10 ns;
  end process;

  UP_DOWN_CONT0: process
  begin
    UP_DN_CTRL <= '1';
    wait for 160 ns;
    UP_DN_CTRL <= '0';
    wait for 160 ns;
  end process;

  ENABLE_CONT0: process
  begin
    EN <= '1';
    wait for 200 ns;
    EN <= '0';
    wait for 200 ns;
  end process;

  RESET0: process
  begin
    RESET <= '0';
    wait for 250 ns;
    RESET <= '1';
    wait for 250 ns;
  end process;

end Behavioral;
