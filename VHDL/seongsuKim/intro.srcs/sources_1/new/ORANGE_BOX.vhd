----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/07 18:04:38
-- Design Name: 
-- Module Name: ORANGE_BOX - Behavioral
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

use work.USER_PROCEDURE.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ORANGE_BOX is
    port(A, B : in  bit;
         C    : out bit);
--  Port ( );
end ORANGE_BOX;

architecture Behavioral of ORANGE_BOX is
begin
    Two_Input_Or(A, B, C);
end Behavioral;
