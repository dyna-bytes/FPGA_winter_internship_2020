----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/08 15:00:36
-- Design Name: 
-- Module Name: JK_FF_tb - Behavioral
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

entity JK_FF_tb is
--  Port ( );
end JK_FF_tb;

architecture Behavioral of JK_FF_tb is
    component JK_FF
    port(clock : in std_logic;
         j_input : in std_logic;
         k_input : in std_logic;
         enable : in std_logic;
         q : out std_logic;
         not_q : out std_logic);
    end component;
  
    signal clock : std_logic := '0';
    signal j_input : std_logic := '0';
    signal k_input : std_logic := '0';
    signal enable : std_logic := '0';
    signal q : std_logic;
    signal not_q : std_logic;
begin
    uut: JK_FF port map (clock => clock,j_input => j_input,k_input => k_input,enable => enable,q => q,not_q => not_q);
    clock0: process
    begin
        clock <= '0';
        wait for 10 ns;
        clock <= '1';
        wait for 10 ns;
    end process;
  
    j_input0: process
    begin
        j_input <= '0';
        wait for 20 ns;
        j_input <= '1';
        wait for 20 ns;
    end process;
  
    k_input0: process
    begin
        k_input <= '0';
        wait for 40 ns;
        k_input <= '1';
        wait for 40 ns;
    end process;
  
    enable0: process
    begin
        enable <= '0';
        wait for 80 ns;
        enable <= '1';
        wait for 80 ns;
    end process;
end;