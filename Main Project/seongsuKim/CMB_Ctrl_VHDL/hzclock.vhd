----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/11 15:42:51
-- Design Name: 
-- Module Name: hzclock - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity hzclock is
    generic(clk_period_i: integer := 10;
            clk_period_f: integer := 10**9);
    port(clk: in std_logic;
         reset: in std_logic;
         outclk: out std_logic);
end hzclock;

architecture Behavioral of hzclock is
    constant clk_cnt: integer := clk_period_f/clk_period_i;
    constant clk_1: std_logic_vector (27 downto 0) := (0 => '1',others => '0'); -- "0000 .... 0000 0001"
    signal cnt: std_logic_vector (27 downto 0) := (others => '0'); -- counted clks
begin
    counting_clks: process(clk, reset, cnt)
    begin
        if (reset = '1') then 
            cnt <= (others => '0');
        elsif rising_edge(clk) then
            if (cnt < clk_cnt-1) then 
                cnt <= cnt + clk_1;
            else cnt <= (others => '0');
            end if;
        end if;
    end process;
    
    making_clk: process(clk, reset)
    begin
        if (reset = '1') then
            outclk <= '0';
        elsif rising_edge(clk) then
            if (cnt < clk_cnt/2) then
                outclk <= '0';
            else outclk <= '1';
            end if;
        end if;
    end process;
end Behavioral;
