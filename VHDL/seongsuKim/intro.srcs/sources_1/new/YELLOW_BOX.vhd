----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/07 18:06:04
-- Design Name: 
-- Module Name: YELLOW_BOX - Behavioral
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

use work.USER_PROCEDURE2.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity YELLOW_BOX is
    port(A, B : in  bit;
         C    : out bit);
--  Port ( );
end YELLOW_BOX;

architecture Behavioral of YELLOW_BOX is
begin
    process(A, B)
        variable Temp : bit;
    begin
        Two_Input_Or(A, B, Temp);
        C <= Temp;
    end process;
end Behavioral;
