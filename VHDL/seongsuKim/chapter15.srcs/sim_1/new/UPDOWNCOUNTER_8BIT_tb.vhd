----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/08 16:13:53
-- Design Name: 
-- Module Name: UPDOWNCOUNTER_8BIT_tb - Behavioral
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

entity UPDOWNCOUNTER_8BIT_tb is
--  Port ( );
end UPDOWNCOUNTER_8BIT_tb;

architecture Behavioral of UPDOWNCOUNTER_8BIT_tb is
    component UPDOWNCOUNTER_8BIT
    port(clock : in std_logic;
         reset : in std_logic;
         up_down_cont : in std_logic;
         output : out std_logic_vector(7 downto 0));
    end component;

    signal clock : std_logic := '0';
    signal reset : std_logic := '0';
    signal up_down_cont : std_logic := '0';
    signal output : std_logic_vector(7 downto 0);
begin
    uut: UPDOWNCOUNTER_8BIT port map (clock => clock,reset => reset,up_down_cont => up_down_cont,output => output);
    clock0: process
    begin
        clock <= '0';
        wait for 10 ns;
        clock <= '1';
        wait for 10 ns;
    end process;

    up_down_cont0: process
    begin
        up_down_cont <= '1';
        wait for 100 ns;
        up_down_cont <= '0';
        wait for 100 ns;
    end process;

    reset0: process
    begin
        reset <= '0';
        wait for 150 ns;
        reset <= '1';
        wait for 150 ns;
    end process;
end;