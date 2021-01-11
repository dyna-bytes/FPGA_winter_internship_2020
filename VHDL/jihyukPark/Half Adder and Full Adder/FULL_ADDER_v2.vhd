----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/08 15:47:41
-- Design Name: 
-- Module Name: FULL_ADDER_v2 - Behavioral
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

entity FULL_ADDER_v2 is
  Port (INPUT : IN std_logic_vector(1 DOWNTO 0);
        CARRY_INPUT : IN std_logic;
        SUM : OUT std_logic;
        CARRY_OUTPUT : OUT std_logic );
end FULL_ADDER_v2;

architecture Behavioral of FULL_ADDER_v2 is
    component HALF_ADDER
    Port (INPUT : IN std_logic_vector(1 DOWNTO 0);
          SUM   : OUT std_logic;
          CARRY : OUT std_logic );
    END component;
    
    SIGNAL SUM_TEMP : std_logic;
    SIGNAL CARRY_TEMP : std_logic;
    SIGNAL CARRY_RESULT : std_logic;
    
begin
    HALF_ADDER0 : HALF_ADDER PORT MAP(INPUT(0) => INPUT(0), INPUT(1) => INPUT(1), SUM => SUM_TEMP, CARRY => CARRY_TEMP);
    HALF_ADDER1 : HALF_ADDER PORT MAP(INPUT(0) => SUM_TEMP, INPUT(1) => CARRY_INPUT, SUM => SUM, CARRY => CARRY_RESULT);

    PROCESS(CARRY_TEMP, CARRY_RESULT)
    begin
        CARRY_OUTPUT <= CARRY_TEMP OR CARRY_RESULT;
    END PROCESS;
end Behavioral;
