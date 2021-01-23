----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/08 14:57:17
-- Design Name: 
-- Module Name: JK_FF - Behavioral
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

entity JK_FF is
  port(clock : in std_logic;
       j_input : in std_logic;
       k_input : in std_logic;
       enable : in std_logic;
       q : out std_logic;
       not_q : out std_logic);
--  Port ( );
end JK_FF;

architecture Behavioral of JK_FF is
    signal q_temp : std_logic;
begin
    process(clock, enable)
    begin
        if (falling_edge(clock) and enable = '0') then
            q_temp <= '0';
        elsif falling_edge(clock) then
            if (j_input = '0' and k_input = '0') then
                q_temp <= q_temp;
            elsif (j_input = '1' and k_input = '0') then
                q_temp <= '1';
            elsif (j_input = '0' and k_input = '1') then
                q_temp <= '0';
            else
                q_temp <= not q_temp;
            end if;
        end if;
    end process;
    
    process(q_temp)
    begin
        q <= q_temp;
        not_q <= not q_temp;
    end process;
end Behavioral;
