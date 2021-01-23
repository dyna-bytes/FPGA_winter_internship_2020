----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/08 13:20:38
-- Design Name: 
-- Module Name: DEMUX - Behavioral
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

entity DEMUX is
  Port ( input : in std_logic;
         sel : in std_logic_vector(1 downto 0);
         output : out std_logic_vector(3 downto 0));
--  Port ( );
end DEMUX;

architecture Behavioral of DEMUX is
begin
    process(input, sel)
    begin
        if (sel = "00") then
            output(0) <= input;
            output(1) <= '0';
            output(2) <= '0';
            output(3) <= '0';
        elsif (sel = "01") then
            output(0) <= '0';
            output(1) <= input;
            output(2) <= '0';
            output(3) <= '0';
        elsif (sel = "10") then
            output(0) <= '0';
            output(1) <= '0';
            output(2) <= input;
            output(3) <= '0';
        elsif (sel = "11") then
            output(0) <= '0';
            output(1) <= '0';
            output(2) <= '0';
            output(3) <= input;
       end if;
    end process;  
end Behavioral;
