----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/07 14:01:23
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
use ieee.std_logic_arith.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ORANGE_BOX is
    port(clock, A, B, C : in  std_logic;
         D              : out std_logic);
--  Port ( );
end ORANGE_BOX;

architecture Behavioral of ORANGE_BOX is
signal Temp : std_logic; -- declare signal right below architecture
begin
    process(clock) 
    begin
        if rising_edge(clock) then
            Temp <= A and B after 3 ns;
            D <= Temp or C after 1 ns;
        end if;
    end process;
end Behavioral;
