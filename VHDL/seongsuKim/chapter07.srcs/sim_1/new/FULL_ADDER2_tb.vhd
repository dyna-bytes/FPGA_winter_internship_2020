----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/08 14:34:21
-- Design Name: 
-- Module Name: FULL_ADDER2_tb - Behavioral
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

entity FULL_ADDER2_tb is
--  Port ( );
end FULL_ADDER2_tb;

architecture Behavioral of FULL_ADDER2_tb is
    component FULL_ADDER2
    port(input : in std_logic_vector(1 downto 0);
         carry_input : in std_logic;
         sum : out std_logic;
         carry_output : out std_logic);
    end component;
  
    signal input : std_logic_vector(1 downto 0) := (others => '0');
    signal carry_input : std_logic := '0';
    signal sum : std_logic;
    signal carry_output : std_logic;
begin
    uut: FULL_ADDER2 port map(input => input, carry_input => carry_input, sum => sum, carry_output => carry_output);
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

    carry_in: process
    begin
        carry_input <= '0';
        wait for 40 ns;
        carry_input <= '1';
        wait for 40 ns;
    end process;
end;