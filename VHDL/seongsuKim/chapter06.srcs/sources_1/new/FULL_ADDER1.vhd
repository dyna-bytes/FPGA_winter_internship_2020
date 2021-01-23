----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/08 14:06:26
-- Design Name: 
-- Module Name: FULL_ADDER1 - Behavioral
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

entity FULL_ADDER1 is
  port(input : in std_logic_vector(1 downto 0);
       carry_input : in std_logic;
       sum : out std_logic;
       carry_output : out std_logic);
--  Port ( );
end FULL_ADDER1;

architecture Behavioral of FULL_ADDER1 is
    component HALF_ADDER
        port(input: in std_logic_vector (1 downto 0);
             sum: out std_logic;
             carry: out std_logic);
    end component;
    
    signal sum_temp: std_logic;
    signal carry_temp: std_logic;
    signal carry_result: std_logic;
begin
    half_adder1: HALF_ADDER port map(input(0) => input(0), input(1) => input(1), sum => sum_temp, carry => carry_temp);
    half_adder2: HALF_ADDER port map(input(0) => sum_temp, input(1) => carry_input, sum => sum, carry => carry_result);
    
    process(carry_temp, carry_result)
    begin
        carry_output <= carry_temp or carry_result;
    end process;
end Behavioral;
