----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/08 15:05:59
-- Design Name: 
-- Module Name: TFF_tb - Behavioral
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

entity TFF_tb is
--  Port ( );
end TFF_tb;

architecture Behavioral of TFF_tb is
    component TFF
    port(clock : in std_logic;
         t_input : in std_logic;
         enable : in std_logic;
         q : out std_logic;
         not_q : out std_logic);
    end component;
  
    signal clock : std_logic := '0';
    signal t_input : std_logic := '0';
    signal enable : std_logic := '0';
    signal q : std_logic := '0';
    signal not_q : std_logic :='1';
begin
    uut: TFF port map (clock => clock,t_input => t_input,enable => enable,q => q,not_q => not_q);
    clock0: process
    begin
        clock <= '0';
        wait for 10 ns;
        clock <= '1';
        wait for 10 ns;
    end process;
  
    t_input0: process
    begin
        t_input <= '0';
        wait for 20 ns;
        t_input <= '1';
        wait for 20 ns;
    end process;
  
    enable0: process
    begin
        enable <= '0';
        wait for 40 ns;
        enable <= '1';
        wait for 40 ns;
    end process;
end;