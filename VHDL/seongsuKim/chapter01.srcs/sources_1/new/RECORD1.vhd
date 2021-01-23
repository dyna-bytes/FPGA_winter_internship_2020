----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/07 16:16:15
-- Design Name: 
-- Module Name: RECORD1 - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

use work.record_type.all; -- import record_type all

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RECORD1 is
    port(A1, A2 : in  std_logic;
         B1, B2 : in  std_logic;
         C      : in  record1_type;
         D      : out record2_type);
--  Port ( );
end RECORD1;

architecture Behavioral of RECORD1 is
    signal Temp : record1_type;
begin
    process(A1, A2, B1, B2, C)
    begin
        Temp.I <= B1 + B2;
        Temp.J <= A1 and A2;

        if (C = Temp) then
            D.I <= Temp.I - C.I;
            D.J <= Temp.J & C.J;
        else
            D.I <= 0;
            D.J <= "0";
        end if;
    end process;
end Behavioral;
