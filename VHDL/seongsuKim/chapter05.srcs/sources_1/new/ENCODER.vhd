----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/08 13:42:10
-- Design Name: 
-- Module Name: ENCODER - Behavioral
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

entity ENCODER is
  port(input : in std_logic_vector(7 downto 0);
       output : out std_logic_vector(2 downto 0));
--  Port ( );
end ENCODER;

architecture Behavioral of ENCODER is
begin
    process(input)
    begin
    if (input = "00000001") then
        output <= "000";
    elsif (input = "00000010") then
        output <= "001";
    elsif (input = "00000100") then
        output <= "010";
    elsif (input = "00001000") then
        output <= "011";
    elsif (input = "00010000") then
        output <= "100";
    elsif (input = "00100000") then
        output <= "101";
    elsif (input = "01000000") then
        output <= "110";
    elsif (input = "10000000") then
        output <= "111";
    else
        output <= "000";
    end if;
    end process;
end Behavioral;
