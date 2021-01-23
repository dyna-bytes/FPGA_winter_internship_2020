----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/08 16:55:56
-- Design Name: 
-- Module Name: CLOCKDIV - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CLOCKDIV is
    port(clock: in std_logic;
         reset: in std_logic;
         clock_out: out std_logic;
         clock_5mhz_out : out std_logic;
         clock_500khz_out : out std_logic;
         clock_50khz_out : out std_logic;
         clock_5khz_out : out std_logic;
         clock_500hz_out : out std_logic;
         clock_50hz_out : out std_logic;
         clock_5hz_out : out std_logic);
--  Port ( );
end CLOCKDIV;

architecture Behavioral of CLOCKDIV is
    component SDCOUNTER
    port(clock: in std_logic;
         reset: in std_logic;
         clock_out: out std_logic);
    end component;
    
    signal clock_out_temp : std_logic := '0';
    signal clock_5mhz_out_temp : std_logic := '0';
    signal clock_500khz_out_temp : std_logic := '0';
    signal clock_50khz_out_temp : std_logic := '0';
    signal clock_5khz_out_temp : std_logic := '0';
    signal clock_500hz_out_temp : std_logic := '0';
    signal clock_50hz_out_temp : std_logic := '0';
    signal clock_5hz_out_temp : std_logic := '0';
begin
    clock_5mhz: SDCOUNTER port map(clock => clock,reset => reset, clock_out => clock_5mhz_out_temp);
    -- component port name => signal name
    clock_500khz: SDCOUNTER port map(clock => clock_5mhz_out_temp,reset => reset, clock_out => clock_500khz_out_temp);
    clock_50khz: SDCOUNTER port map(clock => clock_500khz_out_temp,reset => reset, clock_out => clock_50khz_out_temp);
    clock_5khz: SDCOUNTER port map(clock => clock_50khz_out_temp,reset => reset, clock_out => clock_5khz_out_temp);
    clock_500hz: SDCOUNTER port map(clock => clock_5khz_out_temp,reset => reset, clock_out => clock_500hz_out_temp);
    clock_50hz: SDCOUNTER port map(clock => clock_500hz_out_temp,reset => reset, clock_out => clock_50hz_out_temp);
    clock_5hz: SDCOUNTER port map(clock => clock_50hz_out_temp,reset => reset, clock_out => clock_5hz_out_temp);
    clock_0_5hz: SDCOUNTER port map(clock => clock_5hz_out_temp,reset => reset, clock_out => clock_out_temp);
    
    clock_out <= clock_out_temp;
    clock_5mhz_out <= clock_5mhz_out_temp;
    clock_500khz_out <= clock_500khz_out_temp;
    clock_50khz_out <= clock_50khz_out_temp;
    clock_5khz_out <= clock_5khz_out_temp;
    clock_500hz_out <= clock_500hz_out_temp;
    clock_50hz_out <= clock_50hz_out_temp;
    clock_5hz_out <= clock_5hz_out_temp;
end Behavioral;
