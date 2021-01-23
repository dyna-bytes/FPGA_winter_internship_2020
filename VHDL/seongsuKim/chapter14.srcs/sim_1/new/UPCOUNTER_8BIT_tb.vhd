----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/08 16:06:47
-- Design Name: 
-- Module Name: UPCOUNTER_8BIT_tb - Behavioral
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

entity UPCOUNTER_8BIT_tb is
--  Port ( );
end UPCOUNTER_8BIT_tb;

architecture Behavioral of UPCOUNTER_8BIT_tb is
    component UPCOUNTER_8BIT
    port(clock : in std_logic;
         reset : in std_logic;
         output : out std_logic_vector(7 downto 0));
    end component;
  
    signal clock : std_logic := '0';
    signal reset : std_logic := '0';
    signal output : std_logic_vector(7 downto 0);
  
begin
    uut: UPCOUNTER_8BIT port map (clock => clock,reset => reset,output => output);
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
        wait for 200 ns;
        reset <= '1';
        wait for 200 ns;
    end process;
end;