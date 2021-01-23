----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/08 14:53:58
-- Design Name: 
-- Module Name: DFF_tb - Behavioral
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

entity DFF_tb is
--  Port ( );
end DFF_tb;

architecture Behavioral of DFF_tb is
    component DFF
    port(clock : in std_logic;
         data_input : in std_logic;
         data_output : out std_logic;
         not_data_output : out std_logic);
    end component;
  
    signal clock : std_logic := '0';
    signal data_input : std_logic := '0';
    signal data_output : std_logic;
    signal not_data_output : std_logic;
begin
    uut: DFF port map (clock => clock,data_input => data_input,data_output => data_output,not_data_output => not_data_output);
    clock0: process
    begin
        clock <= '0';
        wait for 10 ns;
        clock <= '1';
        wait for 10 ns;
    end process;
  
    data_input0: process
    begin
        data_input <= '0';
        wait for 20 ns;
        data_input <= '1';
        wait for 20 ns;
    end process;
end;
