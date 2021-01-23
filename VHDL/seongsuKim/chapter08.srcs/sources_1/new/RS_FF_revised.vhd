----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/08 14:48:19
-- Design Name: 
-- Module Name: RS_FF_revised - Behavioral
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

entity RS_FF_revised is  
  port(pt_set : in std_logic;
       pt_reset : in std_logic;
       pt_clock : in std_logic;
       pt_enable : in std_logic;
       pt_q : inout std_logic;      -- use inout or buffer to assign output value to output
       pt_not_q : inout std_logic);
--  Port ( );
end RS_FF_revised;

architecture Behavioral of RS_FF_revised is
begin
    process(pt_set, pt_reset, pt_clock, pt_enable)
    begin
        if (rising_edge(pt_clock) and pt_enable = '0') then
            pt_q <= '0';
            pt_not_q <= '1';
        elsif rising_edge(pt_clock) then
            if (pt_set = '0' and pt_reset = '0') then
                pt_q <= pt_q;
                pt_not_q <= pt_not_q;
            elsif (pt_set = '0' and pt_reset = '1') then
                pt_q <= '0';
                pt_not_q <= '1';
            elsif (pt_set = '1' and pt_reset = '0') then
                pt_q <= '1';
                pt_not_q <= '0';
            end if;
        end if;
    end process;
end Behavioral;
