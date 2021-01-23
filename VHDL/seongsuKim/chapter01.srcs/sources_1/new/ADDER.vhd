----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/07 16:40:59
-- Design Name: 
-- Module Name: ADDER - Behavioral
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
use ieee.std_logic_arith.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

-- fit data type to assign
-- CONV_INTEGER : convert Integer, Unsigned, Signed Std_Ulogic into Integer
--     range is from -2147483647 to 2147483647 (size of 31-Bit Unsigned or 32-Bit Signed)
-- CONV_UNSIGNED : convert Integer, Unsigned, Signed, Std_Ulogic into Unsigned with specified size of parameter
-- CONV_SIGNED : convert Integer, Unsigned, Signed, Std_Ulogic into Signed with specified size of parameter
-- CONV_STD_LOGIC_VECTOR : convert Integer, Unsigned, Signed, Std_Ulogic into Std_Logic_Vector with specified size of parameter

entity ADDER is
    port(OP1, OP2 : in  unsigned(7 downto 0);
         O      : out integer);
--  Port ( );
end ADDER;

architecture Behavioral of ADDER is
begin
    O <= conv_integer(OP1 + OP2);
end Behavioral;
