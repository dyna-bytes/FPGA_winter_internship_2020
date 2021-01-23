----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/08 14:43:44
-- Design Name: 
-- Module Name: RS_FF_tb - Behavioral
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

entity RS_FF_tb is
--  Port ( );
end RS_FF_tb;

architecture Behavioral of RS_FF_tb is
    component rs_ff
    port(pt_set : in std_logic;
         pt_reset : in std_logic;
         pt_clock : in std_logic;
         pt_enable : in std_logic;
         pt_q : out std_logic;
         pt_not_q : out std_logic);
    end component;
  
    signal pt_set : std_logic := '0';
    signal pt_reset : std_logic := '0';
    signal pt_clock : std_logic := '0';
    signal pt_enable : std_logic := '0';
    signal pt_q : std_logic;
    signal pt_not_q : std_logic;
begin
    uut: rs_ff port map(pt_set => pt_set,pt_reset => pt_reset,pt_clock => pt_clock,pt_enable => pt_enable,
         pt_q => pt_q,pt_not_q => pt_not_q);
    pt_clock0: process
    begin
        pt_clock <= '0';
        wait for 15 ns;
        pt_clock <= '1';
        wait for 15 ns;
    end process;

    pt_enable0: process
    begin
        pt_enable <= '0';
        wait for 160 ns;
        pt_enable <= '1';
        wait;
    end process;

    pt_set_pt_reset: process
    begin
        pt_set <= '0';
        pt_reset <= '1';
        wait for 50 ns;
        pt_set <= '1';
        pt_reset <= '0';
        wait for 50 ns;
        pt_set <= '0';
        pt_reset <= '0';
        wait for 50 ns;
        pt_set <= '0';
        pt_reset <= '1';
        wait for 50 ns;
        pt_set <= '1';
        pt_reset <= '0';
        wait for 50 ns;
        pt_set <= '0';
        pt_reset <= '0';
        wait for 50 ns;
    end process;
end;