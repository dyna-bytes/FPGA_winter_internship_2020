----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/08 15:31:39
-- Design Name: 
-- Module Name: MSM2_tb - Behavioral
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

entity MSM2_tb is
--  Port ( );
end MSM2_tb;

architecture Behavioral of MSM2_tb is
    component MSM2
    port(clock : in std_logic;
         reset : in std_logic;
         input : in std_logic;
         output : out std_logic_vector(2 downto 0));
    end component;

    signal clock : std_logic := '0';
    signal reset : std_logic := '0';
    signal input : std_logic := '0';
    signal output : std_logic_vector(2 downto 0);
begin
    uut: MSM2 port map (clock => clock,reset => reset,input => input,output => output);
    clock0: process
    begin
        clock <= '0';
        wait for 10 ns;
        clock <= '1';
        wait for 10 ns;
    end process;

    input0: process
    begin
        input <= '0';
        wait for 20 ns;
        input <= '1';
        wait for 20 ns;
    end process;

    reset0: process
    begin
        reset <= '0';
        wait for 160 ns;
        reset <= '1';
        wait for 160 ns;
    end process;
end;