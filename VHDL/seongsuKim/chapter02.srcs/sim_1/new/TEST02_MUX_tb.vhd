----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/07 18:33:19
-- Design Name: 
-- Module Name: TEST02_MUX_tb - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TEST02_MUX_tb is
--  Port ( );
end TEST02_MUX_tb;

architecture Behavioral of TEST02_MUX_tb is
    component TEST02_MUX
    port(input: in std_logic_vector (3 downto 0);
         sel: in std_logic_vector (1 downto 0);
         output: out std_logic);
    end component;

    signal input: std_logic_vector (3 downto 0);
    signal sel: std_logic_vector (1 downto 0);
    signal output: std_logic;
begin
    uut: TEST02_MUX PORT MAP(input => input, sel => sel, output => output);
    input0: process
    begin
        input(0) <= '0'; -- flipping period 20 ns 
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
    
    sel0: process
    begin
        sel(0) <= '0';
        wait for 160 ns;
        sel(0) <= '1';
        wait for 160 ns;
    end process;
    sel1: process
    begin
        sel(1) <= '0';
        wait for 320 ns;
        sel(1) <= '1';
        wait for 320 ns;
    end process;
end;
