----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/08 15:21:46
-- Design Name: 
-- Module Name: FULL_ADDER - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FULL_ADDER is
  Port (INPUT : IN std_logic_vector(1 DOWNTO 0);
        CARRY_INPUT : IN std_logic;
        SUM : OUT std_logic;
        CARRY_OUTPUT : OUT std_logic   );
end FULL_ADDER;

architecture Behavioral of FULL_ADDER is
    signal HA_SUM_TEMP : std_logic;
    signal HA_CARRY_TEMP : std_logic_vector(1 downto 0);
begin
    HALF_ADDER0 : process(INPUT)
    begin
        HA_SUM_TEMP <= INPUT(0) XOR INPUT(1);
        HA_CARRY_TEMP(0) <= INPUT(0) AND INPUT(1);
    END process;
    
    HALF_ADDER1 : process(CARRY_INPUT, HA_SUM_TEMP, HA_CARRY_TEMP)
    begin
        SUM <= HA_SUM_TEMP XOR CARRY_INPUT;
        HA_CARRY_TEMP(1) <= HA_SUM_TEMP AND CARRY_INPUT;
        CARRY_OUTPUT <= HA_CARRY_TEMP(0) OR HA_CARRY_TEMP(1);
    END PROCESS;

end Behavioral;
