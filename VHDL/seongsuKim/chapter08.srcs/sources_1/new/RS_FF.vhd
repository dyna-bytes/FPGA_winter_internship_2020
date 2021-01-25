----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/08 14:38:20
-- Design Name: 
-- Module Name: RS_FF - Behavioral
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

entity RS_FF is
  port(pt_set : in std_logic;
       pt_reset : in std_logic;
       pt_clock : in std_logic;
       pt_enable : in std_logic;
       pt_q : out std_logic;
       pt_not_q : out std_logic);
--  Port ( );
end RS_FF;

architecture Behavioral of RS_FF is
    signal sg_q_temp : std_logic;
    signal sg_not_q_temp : std_logic;
begin
    process(pt_set, pt_reset, pt_clock, pt_enable)
    begin
        if (rising_edge(pt_clock) and pt_enable = '0') then
            sg_q_temp <= '0';
            sg_not_q_temp <= '1';
        elsif rising_edge(pt_clock) then
            if (pt_set = '0' and pt_reset = '0') then
                sg_q_temp <= sg_q_temp;
                sg_not_q_temp <= sg_not_q_temp;
            elsif (pt_set = '0' and pt_reset = '1') then
                sg_q_temp <= '0';
                sg_not_q_temp <= '1';
            elsif (pt_set = '1' and pt_reset = '0') then
                sg_q_temp <= '1';
                sg_not_q_temp <= '0';
            end if;
        end if;
    end process;
    
    process(sg_q_temp)
    begin
        pt_q <= sg_q_temp;
        pt_not_q <= sg_not_q_temp;
    end process;
end Behavioral;
