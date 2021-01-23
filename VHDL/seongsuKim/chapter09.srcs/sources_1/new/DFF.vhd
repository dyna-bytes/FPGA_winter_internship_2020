----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/08 14:52:24
-- Design Name: 
-- Module Name: DFF - Behavioral
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

entity DFF is
  port(clock : in std_logic;
       data_input : in std_logic;
       data_output : out std_logic;
       not_data_output : out std_logic);
--  Port ( );
end DFF;

architecture Behavioral of DFF is
begin
    process(clock)
    begin
        if rising_edge(clock) then
            data_output <= data_input;
            not_data_output <= not data_input;
        end if;
    end process;
end Behavioral;
