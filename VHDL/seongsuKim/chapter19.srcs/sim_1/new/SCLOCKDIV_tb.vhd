----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/08 19:16:29
-- Design Name: 
-- Module Name: SCLOCKDIV_tb - Behavioral
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

entity SCLOCKDIV_tb is
--  Port ( );
end SCLOCKDIV_tb;

architecture Behavioral of SCLOCKDIV_tb is
    component SCLOCKDIV
    port(clock : in std_logic;
         reset : in std_logic;
         clock_5mhz_out : out std_logic;
         clock_500khz_out : out std_logic;
         clock_50khz_out : out std_logic;
         clock_5khz_out : out std_logic;
         clock_500hz_out : out std_logic;
         clock_50hz_out : out std_logic;
         clock_5hz_out : out std_logic;
         clock_0_5hz_out : out std_logic);
    end component;

    signal clock : std_logic := '0';
    signal reset : std_logic := '0';
    signal clock_5mhz_out : std_logic;
    signal clock_500khz_out : std_logic;
    signal clock_50khz_out : std_logic;
    signal clock_5khz_out : std_logic;
    signal clock_500hz_out : std_logic;
    signal clock_50hz_out : std_logic;
    signal clock_5hz_out : std_logic;
    signal clock_0_5hz_out : std_logic;
begin
    uut: SCLOCKDIV port map (clock => clock,reset => reset,clock_5mhz_out => clock_5mhz_out,
         clock_500khz_out => clock_500khz_out,clock_50khz_out => clock_50khz_out,clock_5khz_out => clock_5khz_out,
         clock_500hz_out => clock_500hz_out,clock_50hz_out => clock_50hz_out,clock_5hz_out => clock_5hz_out,
         clock_0_5hz_out => clock_0_5hz_out);
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
        wait;
    end process;
end;
