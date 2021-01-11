----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/10 22:37:25
-- Design Name: 
-- Module Name: tb_SYNC_COUNTER_CLOCK_DIV - Behavioral
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

entity tb_SYNC_COUNTER_CLOCK_DIV is
end tb_SYNC_COUNTER_CLOCK_DIV;

architecture Behavioral of tb_SYNC_COUNTER_CLOCK_DIV is

       COMPONENT SYNC_COUNTER_CLOCK_DIV
      PORT(
           CLOCK : IN std_logic;
           RESET : IN std_logic;
           CLOCK_5MHz_OUT : OUT std_logic;
           CLOCK_500KHz_OUT : OUT std_logic;
           CLOCK_50KHz_OUT : OUT std_logic;
           CLOCK_5KHz_OUT : OUT std_logic;
           CLOCK_500Hz_OUT : OUT std_logic;
           CLOCK_50Hz_OUT : OUT std_logic;
           CLOCK_5Hz_OUT : OUT std_logic;
           CLOCK_0_5Hz_OUT : OUT std_logic
          );
      END COMPONENT;


      signal CLOCK : std_logic := '0';
      signal RESET : std_logic := '0';
      signal CLOCK_5MHz_OUT : std_logic;
      signal CLOCK_500KHz_OUT : std_logic;
      signal CLOCK_50KHz_OUT : std_logic;
      signal CLOCK_5KHz_OUT : std_logic;
      signal CLOCK_500Hz_OUT : std_logic;
      signal CLOCK_50Hz_OUT : std_logic;
      signal CLOCK_5Hz_OUT : std_logic;
      signal CLOCK_0_5Hz_OUT : std_logic;
begin

    U5 : SYNC_COUNTER_CLOCK_DIV PORT MAP (
       CLOCK => CLOCK,
       RESET => RESET,
       CLOCK_5MHz_OUT => CLOCK_5MHz_OUT,
       CLOCK_500KHz_OUT => CLOCK_500KHz_OUT,
       CLOCK_50KHz_OUT => CLOCK_50KHz_OUT,
       CLOCK_5KHz_OUT => CLOCK_5KHz_OUT,
       CLOCK_500Hz_OUT => CLOCK_500Hz_OUT,
       CLOCK_50Hz_OUT => CLOCK_50Hz_OUT,
       CLOCK_5Hz_OUT => CLOCK_5Hz_OUT,
       CLOCK_0_5Hz_OUT => CLOCK_0_5Hz_OUT
     );

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
        wait;
      end process;


end Behavioral;
