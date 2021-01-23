----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/08 15:15:09
-- Design Name: 
-- Module Name: MSM - Behavioral
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

entity MSM is
  port(clock : in std_logic;
       reset : in std_logic;
       input : in std_logic;
       output : out std_logic_vector(2 downto 0));
--  Port ( );
end MSM;

architecture Behavioral of MSM is
    type states is (s0,s1,s2,s3);
    signal state: states;
begin
    process(clock,reset,input) -- determination of next state
    begin
        if (reset = '1') then
            state <= s0;
        elsif rising_edge(clock) then
            if (state = s0) then
                if (input = '1') then
                    state <= s1;
                else state <= s0;
            end if;
            elsif (state = s1) then
                if (input = '1') then
                    state <= s2;
                else state <= s1;
            end if;
            elsif (state = s2) then
                if (input = '1') then
                    state <= s3;
                else state <= s2;
            end if;
            elsif (state = s3) then
                if (input = '1') then
                    state <= s0;
                else state <= s3;
            end if;
        end if;
    end if;
    end process;
    
    process(state) -- output determined by current state
    begin
        if (state = s0) then
            output <= "000";
        elsif (state = s1) then
            output <= "001";
        elsif (state = s2) then
            output <= "010";
        elsif (state = s3) then
            output <= "011";
        end if;
    end process;
end Behavioral;
