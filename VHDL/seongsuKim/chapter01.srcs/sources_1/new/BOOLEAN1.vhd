----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/07 16:38:07
-- Design Name: 
-- Module Name: BOOLEAN1 - Behavioral
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

entity BOOLEAN1 is
    port(TRUE_FALSE : in  boolean;
         O        : out bit);
--  Port ( );
end BOOLEAN1;

architecture Behavioral of BOOLEAN1 is
begin
    O <= '1' when (TRUE_FALSE) else '0'; -- when (cond.) ~ else ...
end Behavioral;
