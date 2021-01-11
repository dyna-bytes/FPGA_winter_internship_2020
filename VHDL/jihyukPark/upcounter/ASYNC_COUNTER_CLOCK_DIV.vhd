----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/09 12:12:49
-- Design Name: 
-- Module Name: ASYNC_COUNTER_CLOCK_DIV - Behavioral
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

entity ASYNC_COUNTER_CLOCK_DIV is
 port(CLOCK : in std_logic;
       RESET : in std_logic;
       CLOCK_OUT : out std_logic;
       CLOCK_5MHz_OUT : out std_logic;
       CLOCK_500KHz_OUT : out std_logic;
       CLOCK_50KHz_OUT : out std_logic;
       CLOCK_5KHz_OUT : out std_logic;
       CLOCK_500Hz_OUT : out std_logic;
       CLOCK_50Hz_OUT : out std_logic;
       CLOCK_5Hz_OUT : out std_logic);
end ASYNC_COUNTER_CLOCK_DIV;

architecture Behavioral of ASYNC_COUNTER_CLOCK_DIV is
 component SYNC_COUNTER_DECIMAL
  port(CLOCK : in std_logic;
       RESET : in std_logic;
       CLOCK_OUT : out std_logic);
  end component;

  signal CLOCK_OUT_Temp : std_logic := '0';
  signal CLOCK_5MHz_OUT_Temp : std_logic := '0';
  signal CLOCK_500KHz_OUT_Temp : std_logic := '0';
  signal CLOCK_50KHz_OUT_Temp : std_logic := '0';
  signal CLOCK_5KHz_OUT_Temp : std_logic := '0';
  signal CLOCK_500Hz_OUT_Temp : std_logic := '0';
  signal CLOCK_50Hz_OUT_Temp : std_logic := '0';
  signal CLOCK_5Hz_OUT_Temp : std_logic := '0';
  
begin
  CLOCK_5MHz : SYNC_COUNTER_DECIMAL port map
               (CLOCK => CLOCK,
                RESET => RESET,
                CLOCK_OUT => CLOCK_5MHz_OUT_Temp);

  CLOCK_500KHz : SYNC_COUNTER_DECIMAL port map
                 (CLOCK => CLOCK_5MHz_OUT_Temp,
                  RESET => RESET,
                  CLOCK_OUT => CLOCK_500KHz_OUT_Temp);

  CLOCK_50KHz : SYNC_COUNTER_DECIMAL port map
                (CLOCK => CLOCK_500KHz_OUT_Temp,
                 RESET => RESET,
                 CLOCK_OUT => CLOCK_50KHz_OUT_Temp);

  CLOCK_5KHz : SYNC_COUNTER_DECIMAL port map
               (CLOCK => CLOCK_50KHz_OUT_Temp,
                RESET => RESET,
                CLOCK_OUT => CLOCK_5KHz_OUT_Temp);

  CLOCK_500Hz : SYNC_COUNTER_DECIMAL port map
                (CLOCK => CLOCK_5KHz_OUT_Temp,
                 RESET => RESET,
                 CLOCK_OUT => CLOCK_500Hz_OUT_Temp);

  CLOCK_50Hz : SYNC_COUNTER_DECIMAL port map
               (CLOCK => CLOCK_500Hz_OUT_Temp,
                RESET => RESET,
                CLOCK_OUT => CLOCK_50Hz_OUT_Temp);

  CLOCK_5Hz : SYNC_COUNTER_DECIMAL port map
              (CLOCK => CLOCK_50Hz_OUT_Temp,
               RESET => RESET,
               CLOCK_OUT => CLOCK_5Hz_OUT_Temp);

  CLOCK_0_5Hz : SYNC_COUNTER_DECIMAL port map
                (CLOCK => CLOCK_5Hz_OUT_Temp,
                 RESET => RESET,
                 CLOCK_OUT => CLOCK_OUT_Temp);

  CLOCK_OUT <= CLOCK_OUT_Temp;
  CLOCK_5MHz_OUT <= CLOCK_5MHz_OUT_Temp;
  CLOCK_500KHz_OUT <= CLOCK_500KHz_OUT_Temp;
  CLOCK_50KHz_OUT <= CLOCK_50KHz_OUT_Temp;
  CLOCK_5KHz_OUT <= CLOCK_5KHz_OUT_Temp;
  CLOCK_500Hz_OUT <= CLOCK_500Hz_OUT_Temp;
  CLOCK_50Hz_OUT <= CLOCK_50Hz_OUT_Temp;
  CLOCK_5Hz_OUT <= CLOCK_5Hz_OUT_Temp;

end Behavioral;
