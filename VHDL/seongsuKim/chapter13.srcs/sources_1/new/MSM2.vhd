----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/08 15:28:17
-- Design Name: 
-- Module Name: MSM2 - Behavioral
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

entity MSM2 is
  port(clock : in std_logic;
       reset : in std_logic;
       input : in std_logic;
       output : out std_logic_vector(2 downto 0));
--  Port ( );
end MSM2;

architecture Behavioral of MSM2 is
    type states is (s0, s1, s2, s3);
    signal state : states;
begin
    process(clock, reset)
    begin
        if (reset = '1') then
            state <= s0;
        elsif rising_edge(clock) then
            if (state = s0) then
                if (input = '1') then
                    state <= s1;
                else
                    state <= s0;
                end if;
            elsif (state = s1) then
                if (input = '1') then
                    state <= s2;
                else
                    state <= s1;
                end if;
            elsif (state = s2) then
                if (input = '1') then
                    state <= s3;
                else
                    state <= s2;
                end if;
            elsif (state = s3) then
                if (input = '1') then
                    state <= s0;
                else
                    state <= s3;
                end if;
            end if;
        end if;
    end process;

    process(input, state) --mealy machine has input in output part
    begin
        if (state = s0) then
            if (input = '1') then
                output <= "000";
            else
                output <= "111";
            end if;
        elsif (state = s1) then
            if (input = '1') then
                output <= "001";
            else
                output <= "111";
            end if;
        elsif (state = s2) then
            if (input = '1') then
                output <= "010";
            else
                output <= "111";
            end if;
        elsif (state = s3) then
            if (input = '1') then
                output <= "100";
            else
                output <= "111";
            end if;
        end if;
    end process;
end Behavioral;
