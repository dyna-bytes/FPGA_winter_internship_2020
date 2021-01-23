----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/08 13:44:15
-- Design Name: 
-- Module Name: ENCODER_tb - Behavioral
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

entity ENCODER_tb is
--  Port ( );
end ENCODER_tb;

architecture Behavioral of ENCODER_tb is
  component ENCODER
  port(input : IN std_logic_vector(7 downto 0);
       output : OUT std_logic_vector(2 downto 0));
  end component;

  signal input : std_logic_vector(7 downto 0) := (others => '0');
  signal output : std_logic_vector(2 downto 0);
begin
  uut: ENCODER port map(input => input, output => output);
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

  input3: process
  begin
    input(3) <= '0';
    wait for 80 ns;
    input(3) <= '1';
    wait for 80 ns;
  end process;

  input4: process
  begin
    input(4) <= '0';
    wait for 160 ns;
    input(4) <= '1';
    wait for 160 ns;
  end process;

  input5: process
  begin
    input(5) <= '0';
    wait for 320 ns;
    input(5) <= '1';
    wait for 320 ns;
  end process;

  input6: process
  begin
    input(6) <= '0';
    wait for 640 ns;
    input(6) <= '1';
    wait for 640 ns;
  end process;

  input7: process
  begin
    input(7) <= '0';
    wait for 1280 ns;
    input(7) <= '1';
    wait for 1280 ns;
  end process;
end;