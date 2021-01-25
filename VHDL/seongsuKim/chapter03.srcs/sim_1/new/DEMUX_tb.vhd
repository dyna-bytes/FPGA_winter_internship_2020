----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/08 13:25:16
-- Design Name: 
-- Module Name: DEMUX_tb - Behavioral
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

entity DEMUX_tb is
--  Port ( );
end DEMUX_tb;

architecture Behavioral of DEMUX_tb is
    component DEMUX
    port(input: in std_logic;
         sel: in std_logic_vector (1 downto 0);
         output: out std_logic_vector (3 downto 0));
    end component;
    
    signal input: std_logic := '0';
    signal sel: std_logic_vector (1 downto 0);
    signal output: std_logic_vector (3 downto 0);
begin
    uut: DEMUX port map(input => input, sel => sel, output => output);
    input_sig: process
    begin
        input <= '0';
        wait for 10 ns;  
        input <= '1';
        wait for 10 ns;      
    end process;
    
    sel0: process
    begin 
        sel(0) <= '0';
        wait for 20 ns;  
        sel(0) <= '1';
        wait for 20 ns;  
    end process;
    sel1: process
    begin 
        sel(1) <= '0';
        wait for 40 ns;  
        sel(1) <= '1';
        wait for 40 ns;  
    end process;
end;
