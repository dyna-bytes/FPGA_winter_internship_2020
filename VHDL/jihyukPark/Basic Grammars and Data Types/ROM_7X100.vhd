----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/07 21:58:52
-- Design Name: 
-- Module Name: ROM_7X100 - Behavioral
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
use IEEE.std_logic_arith.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ROM_7X100 is
    port(ADDRESS : in unsigned(6 downto 0);
         O       : out std_logic_vector(6 downto 0));
end ROM_7X100;

architecture Behavioral of ROM_7X100 is
    subtype ROM_WORD is std_logic_vector(6 downto 0);
    type ROM_TABLE is array(0 to 99) of ROM_WORD;
    
-- constant ROM_DATA : ROM_TABLE := 
--          ROM_TABLE'(「초기값1」, 「초기값2」, ...);
 
    constant ROM_DATA : ROM_TABLE :=
          ROM_TABLE'("0000101", "0110010", "0011001", "0011101",
                    "0000101", "0110010", "0011001", "0011101",
                    "0000101", "0110010", "0011001", "0011101",
                    "0000101", "0110010", "0011001", "0011101",
                    "0000101", "0110010", "0011001", "0011101",
                    "0000101", "0110010", "0011001", "0011101",
                    "0000101", "0110010", "0011001", "0011101",
                    "0000101", "0110010", "0011001", "0011101",
                    "0000101", "0110010", "0011001", "0011101",
                    "0000101", "0110010", "0011001", "0011101",
                    "0000101", "0110010", "0011001", "0011101",
                    "0000101", "0110010", "0011001", "0011101",
                    "0000101", "0110010", "0011001", "0011101",
                    "0000101", "0110010", "0011001", "0011101",
                    "0000101", "0110010", "0011001", "0011101",
                    "0000101", "0110010", "0011001", "0011101",
                    "0000101", "0110010", "0011001", "0011101",
                    "0000101", "0110010", "0011001", "0011101",
                    "0000101", "0110010", "0011001", "0011101",
                    "0000101", "0110010", "0011001", "0011101",
                    "0000101", "0110010", "0011001", "0011101",
                    "0000101", "0110010", "0011001", "0011101",
                    "0000101", "0110010", "0011001", "0011101",
                    "0000101", "0110010", "0011001", "0011101",
                    "0000101", "0110010", "0011001", "0011101");
begin
    READ_PROCESS :
    process(ADDRESS)
    begin
        O <= ROM_DATA(conv_integer(ADDRESS));
    end process;
end Behavioral;
