----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/08 13:51:28
-- Design Name: 
-- Module Name: HALF_ADDER_tb - Behavioral
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

entity HALF_ADDER_tb is
--  Port ( );
end HALF_ADDER_tb;

architecture Behavioral of HALF_ADDER_tb is
    component HALF_ADDER
    port(input : in std_logic_vector(1 downto 0);
         sum : out std_logic;
         carry : out std_logic);
    end component;

    signal input : std_logic_vector(1 downto 0) := (others => '0');
    signal sum : std_logic;
    signal carry : std_logic;
begin
    uut: HALF_ADDER port map (input => input, sum => sum, carry => carry); -- uut: unit under test
    input0: process
    begin
        input(0) <= '0';
        wait for 10 ns;
        input(0) <= '1';
        wait for 10 ns;
    end process;

    input1: process
    begin
        input(1) <= '0';
        wait for 20 ns;
        input(1) <= '1';
        wait for 20 ns;
    end process;
end;
