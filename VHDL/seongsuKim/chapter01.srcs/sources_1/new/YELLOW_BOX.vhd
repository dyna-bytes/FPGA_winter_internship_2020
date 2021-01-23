----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/07 14:09:48
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
use IEEE.std_logic_arith.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity YELLOW_BOX is
    port(CLOCK, DATA : in  std_logic;
         O : out std_logic_vector (3 downto 0)); -- std_logic_vector to use bus (3 douwnto 0)
--  Port ( );
end YELLOW_BOX;

architecture Behavioral of YELLOW_BOX is
begin
    VARIABLE_FOR : -- variable for loop
    process(CLOCK)
        -- 변수 선언
        variable Pipe : std_logic_vector(3 downto 0);
    begin
        if rising_edge(CLOCK) then
            -- for ... loop ~ end loop
            for N in 3 downto 1 loop -- decreasing from 3 to 1, do not declare for loop variable N
                Pipe(N) := Pipe(N - 1);
            end loop;

            -- works as shift register using variable
            --Pipe(3) := Pipe(2);
            --Pipe(2) := Pipe(1);
            --Pipe(1) := Pipe(0);
            --Pipe(0) := DATA;
            --OUT := Pipe;
            
            Pipe(0) := DATA;
            O <= Pipe;
        end if;
    end process;
end Behavioral;
