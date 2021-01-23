----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/08 16:28:07
-- Design Name: 
-- Module Name: SASUPCOUNTER_8BIT_tb - Behavioral
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

entity SASUPCOUNTER_8BIT_tb is
--  Port ( );
end SASUPCOUNTER_8BIT_tb;

architecture Behavioral of SASUPCOUNTER_8BIT_tb is
    component SASUPCOUNTER_8BIT
    port(clock : in std_logic;
         reset : in std_logic;
         sync_reset : in std_logic;
         enable_cont : in std_logic;
         output : out std_logic_vector(7 downto 0));
    end component;
  
    signal clock : std_logic := '0';
    signal reset : std_logic := '0';
    signal sync_reset : std_logic := '0';
    signal enable_cont : std_logic := '0';
    signal output : std_logic_vector(7 downto 0);
begin
    uut: SASUPCOUNTER_8BIT port map (clock => clock,reset => reset,sync_reset => sync_reset,enable_cont => enable_cont,output => output);
    clock0: process
    begin
        clock <= '0';
        wait for 10 ns;
        clock <= '1';
        wait for 10 ns;
    end process;
  
    enable_cont0: process
    begin
        enable_cont <= '0';
        wait for 80 ns;
        enable_cont <= '1';
        wait;
    end process;
  
    sync_reset0: process
    begin
        sync_reset <= '0';
        wait for 140 ns;
        sync_reset <= '1';
        wait for 20 ns;
        sync_reset <= '0';
        wait;
    end process;
  
    reset0: process  
    begin
        reset <= '0';
        wait for 200 ns;
        reset <= '1';
        wait;
    end process;
end;