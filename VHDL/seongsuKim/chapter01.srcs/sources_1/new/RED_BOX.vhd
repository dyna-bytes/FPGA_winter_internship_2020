----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/07 13:54:49
-- Design Name: 
-- Module Name: RED_BOX - Behavioral
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

entity RED_BOX is
    port(clock, A,B,C : in std_logic;
         D : out std_logic);
--  Port ( );
end RED_BOX;

architecture Behavioral of RED_BOX is
begin
    process(clock)
        -- 변수 선언
        variable Temp : std_logic; 
    begin
        if rising_edge(clock) then -- rising_|edge(clock) (posedge clk)
            Temp := A and B;
            D <= Temp or C after 1 ns;
        end if;
    end process;
end Behavioral;
