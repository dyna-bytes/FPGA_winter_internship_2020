----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/08 19:32:27
-- Design Name: 
-- Module Name: CLOCKDIV_4BIT_tb - Behavioral
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

entity CLOCKDIV_4BIT_tb is
--  Port ( );
end CLOCKDIV_4BIT_tb;

architecture Behavioral of CLOCKDIV_4BIT_tb is
    component CLOCKDIV_4BIT
    port(clock : in std_logic;
         reset : in std_logic;
         clock_out : out std_logic_vector(3 downto 0));
    end component;
  
    signal clock : std_logic := '0';
    signal reset : std_logic := '0';
    signal clock_out : std_logic_vector(3 downto 0);
begin
    uut: CLOCKDIV_4BIT port map (clock => clock,reset => reset,clock_out => clock_out);
  
    clock0: process
    begin
        clock <= '0';
        wait for 10 ns;
        clock <= '1';
        wait for 10 ns;
    end process;
  
    reset0: process
    begin
        reset <= '0';
        wait for 500 ns;
        reset <= '1';
        wait;
    end process;
end;
