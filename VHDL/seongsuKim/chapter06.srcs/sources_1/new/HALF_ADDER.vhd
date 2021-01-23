----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/08 13:48:52
-- Design Name: 
-- Module Name: HALF_ADDER - Behavioral
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

entity HALF_ADDER is
    port(input : in std_logic_vector(1 downto 0);
         sum : out std_logic;
         carry : out std_logic);
--  Port ( );
end HALF_ADDER;

architecture Behavioral of HALF_ADDER is
begin
    process(input)
    begin
       sum <= input(0) xor input(1);
       carry <= input(0) and input(1);
    end process;
end Behavioral;
