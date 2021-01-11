----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/08 14:55:25
-- Design Name: 
-- Module Name: HALF_ADDER - Behavioral
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

entity HALF_ADDER is
  Port (INPUT : IN std_logic_vector(1 DOWNTO 0);
        SUM   : OUT std_logic;
        CARRY : OUT std_logic );
end HALF_ADDER;

architecture Behavioral of HALF_ADDER is

begin
    PROCESS(INPUT)
    BEGIN
        SUM <= INPUT(0) XOR INPUT(1);
        CARRY <= INPUT(0) AND INPUT(1);
    END PROCESS;

end Behavioral;
