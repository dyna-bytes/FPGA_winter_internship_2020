----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/09 12:04:39
-- Design Name: 
-- Module Name: tb_CNT_8bit_en_sync - Behavioral
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

entity tb_CNT_8bit_en_sync is
--  Port ( );
end tb_CNT_8bit_en_sync;

architecture Behavioral of tb_CNT_8bit_en_sync is
    component CNT_8BIT_EN_SYNC
    Port (CLOCK : IN std_logic;
        RESET : IN std_logic;
        SYNC_RESET : IN std_logic;
        EN : IN std_logic;
        OUTPUT : OUT std_logic_vector(7 downto 0) );
    END component;
    
    SIGNAL    CLOCK : std_logic;
    SIGNAL    RESET : std_logic;
    SIGNAL    SYNC_RESET : std_logic;
    SIGNAL    EN : std_logic;
    SIGNAL    OUTPUT : std_logic_vector(7 downto 0);
begin
    U3 : CNT_8BIT_EN_SYNC PORT MAP(CLOCK => CLOCK, RESET => RESET, SYNC_RESET => SYNC_RESET, EN => EN, OUTPUT => OUTPUT);
    
    CLOCK0: process
  begin
    CLOCK <= '0';
    wait for 10 ns;
    CLOCK <= '1';
    wait for 10 ns;
  end process;

  ENABLE_CTRL : process
  begin
    EN <= '0';
    wait for 80 ns;
    EN <= '1';
    wait;
  end process;

  SYNC_RESET0: process
  begin
    SYNC_RESET <= '0';
    wait for 140 ns;
    SYNC_RESET <= '1';
    wait for 20 ns;
    SYNC_RESET <= '0';
    wait;
  end process;

  RESET0: process
  begin
    RESET <= '0';
    wait for 200 ns;
    RESET <= '1';
    wait for 20 NS;
    RESET <= '0';
    WAIT;
  end process;

end Behavioral;
