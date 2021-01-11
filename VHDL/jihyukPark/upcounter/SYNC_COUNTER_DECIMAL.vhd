----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/09 12:16:55
-- Design Name: 
-- Module Name: SYNC_COUNTER_DECIMAL - Behavioral
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

entity SYNC_COUNTER_DECIMAL is
--  generic(FROM_Hz : integer;
--          TO_Hz   : integer);
  port(CLOCK : in std_logic;
       RESET : in std_logic;
       CLOCK_OUT : out std_logic);
end SYNC_COUNTER_DECIMAL;

architecture Behavioral of SYNC_COUNTER_DECIMAL is
  signal OUTPUT_Temp : std_logic_vector(3 downto 0) := "0000";
  signal CLOCK_OUT_Temp : std_logic := '0';
begin
  process(CLOCK, CLOCK_OUT_Temp) BEGIN
    CLOCK_OUT <= CLOCK_OUT_Temp;
  END PROCESS;

  process(CLOCK, RESET, OUTPUT_Temp, CLOCK_OUT_Temp)
  begin
    if (RESET = '1') then
      OUTPUT_Temp <= "0000";
      CLOCK_OUT_Temp <= '0';
    elsif (CLOCK'event and CLOCK = '1') then    -- Rising Edge 에서 동작 하는 플립플롭
      if (OUTPUT_Temp = 9) then
        OUTPUT_Temp <= "0000";
        CLOCK_OUT_Temp <= not CLOCK_OUT_Temp;
      else
        OUTPUT_Temp <= OUTPUT_Temp + '1';
      end if;
    end if;
  end process;

end Behavioral;
