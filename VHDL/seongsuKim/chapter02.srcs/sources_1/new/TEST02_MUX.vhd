----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/07 18:25:13
-- Design Name: 
-- Module Name: TEST02_MUX - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TEST02_MUX is
    port(input: in std_logic_vector (3 downto 0);
         sel: in std_logic_vector (1 downto 0);
         output: out std_logic);
--  Port ( );
end TEST02_MUX;

architecture Behavioral of TEST02_MUX is
begin
    output <= input(0) when sel = "00" else -- when else in series
    input(1) when sel = "01" else
    input(2) when sel = "10" else
    input(3);
end Behavioral;
