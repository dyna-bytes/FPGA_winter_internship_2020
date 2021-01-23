----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/08 14:28:02
-- Design Name: 
-- Module Name: FULL_ADDER2 - Behavioral
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

entity FULL_ADDER2 is
  port(input : in std_logic_vector(1 downto 0);
       carry_input : in std_logic;
       sum : out std_logic;
       carry_output : out std_logic);
--  Port ( );
end FULL_ADDER2;

architecture Behavioral of FULL_ADDER2 is
    signal ha_sum_temp : std_logic;
    signal ha_carry_temp : std_logic_vector(1 downto 0);
begin
    half_adder0 : process(input)
    begin
        ha_sum_temp <= input(0) xor input(1);
        ha_carry_temp(0) <= input(0) and input(1);
    end process;
    half_adder1 : process(carry_input, ha_sum_temp, ha_carry_temp)
    begin
        sum <= ha_sum_temp xor carry_input;
        ha_carry_temp(1) <= ha_sum_temp and carry_input;
        carry_output <= ha_carry_temp(0) or ha_carry_temp(1);
    end process;
end Behavioral;
