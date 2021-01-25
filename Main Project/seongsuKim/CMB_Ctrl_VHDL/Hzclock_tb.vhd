----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/11 16:28:05
-- Design Name: 
-- Module Name: Hzclock_tb - Behavioral
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

entity Hzclock_tb is
--  Port ( );
end Hzclock_tb;

architecture Behavioral of Hzclock_tb is
    component hzclock
    port(clk: in std_logic;
         reset: in std_logic;
         outclk: out std_logic);
    end component;
    
    signal clk: std_logic := '0';
    signal reset: std_logic := '0';
    signal outclk: std_logic := '0';
begin
    uut: hzclock port map(clk => clk, reset => reset, outclk => outclk);
    clk0: process
    begin
        clk <= '0';
        wait for 5 ns;
        clk <= '1';
        wait for 5 ns;
    end process;
    
    reset0: process
    begin
        reset <= '0';
        wait;
    end process;

end Behavioral;
