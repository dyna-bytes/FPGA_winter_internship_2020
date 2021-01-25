----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/07 14:42:23
-- Design Name: 
-- Module Name: BLUE_BOX - Behavioral
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

entity BLUE_BOX is
    port(CLOCK, DATA : in  std_logic;
         O         : out std_logic_vector(3 downto 0));
--  Port ( );
end BLUE_BOX;

architecture Behavioral of BLUE_BOX is
signal Pipe : std_logic_vector(3 downto 0);
begin
    VARIABLE_FOR :
    process(CLOCK)
    begin
        if rising_edge(CLOCK) then
            for N in 1 to 3 loop
                Pipe(N) <= Pipe(N - 1);
            end loop;
            
            -- shift register using signal
            
            Pipe(0) <= DATA;
            O <= Pipe;
        end if;
    end process;
end Behavioral;
