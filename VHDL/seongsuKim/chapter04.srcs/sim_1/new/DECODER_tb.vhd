----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/08 13:37:08
-- Design Name: 
-- Module Name: DECODER_tb - Behavioral
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

entity DECODER_tb is
--  Port ( );
end DECODER_tb;

architecture Behavioral of DECODER_tb is
  component DECODER
  port(input : in std_logic_vector(2 downto 0);
       output : out std_logic_vector(7 downto 0));
  end component;

  signal input : std_logic_vector(2 downto 0) := (others => '0');
  signal output : std_logic_vector(7 downto 0);
begin
  uut: DECODER port map(input => input, output => output);
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
  input2: process
  begin
    input(2) <= '0';
    wait for 40 ns;
    input(2) <= '1';
    wait for 40 ns;
  end process;
end;
