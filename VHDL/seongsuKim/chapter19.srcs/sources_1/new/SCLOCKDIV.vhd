----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/08 19:01:10
-- Design Name: 
-- Module Name: SCLOCKDIV - Behavioral
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

entity SCLOCKDIV is
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
--  Port ( );
end SCLOCKDIV;

architecture Behavioral of SCLOCKDIV is
    signal clock_5mhz_out_temp : std_logic := '0';
    signal clock_500khz_out_temp : std_logic := '0';
    signal clock_50khz_out_temp : std_logic := '0';
    signal clock_5khz_out_temp : std_logic := '0';
    signal clock_500hz_out_temp : std_logic := '0';
    signal clock_50hz_out_temp : std_logic := '0';
    signal clock_5hz_out_temp : std_logic := '0';
    signal clock_0_5hz_out_temp : std_logic := '0';
    signal count_10 : integer range 0 to 4;
    signal count_100 : integer range 0 to 49;
    signal count_1000 : integer range 0 to 499;
    signal count_10000 : integer range 0 to 4999;
    signal count_100000 : integer range 0 to 49999;
    signal count_1000000 : integer range 0 to 499999;
    signal count_10000000 : integer range 0 to 4999999;
    signal count_100000000 : integer range 0 to 49999999;  
begin
  ---------- 5mhz clock output ----------
    process(clock, reset)
    begin
        if (reset = '1') then
            count_10 <= 0;
            clock_5mhz_out_temp <= '0';
        elsif rising_edge(clock) then
            if (count_10 = 4) then
                count_10 <= 0;
                clock_5mhz_out_temp <= not clock_5mhz_out_temp;
            else
                count_10 <= count_10 + 1;
            end if;
        end if;
    end process;
  
  ---------- 500khz clock output ----------
    process(clock, reset)
    begin
        if (reset = '1') then
            count_100 <= 0;
            clock_500khz_out_temp <= '0';
        elsif rising_edge(clock) then
            if (count_100 = 49) then
                count_100 <= 0;
                clock_500khz_out_temp <= not clock_500khz_out_temp;
            else
                count_100 <= count_100 + 1;
            end if;
        end if;
    end process;
  
  ---------- 50khz clock output ----------
    process(clock, reset)
    begin
        if (reset = '1') then
            count_1000 <= 0;
            clock_50khz_out_temp <= '0';
        elsif rising_edge(clock) then
            if (count_1000 = 499) then
                count_1000 <= 0;
                clock_50khz_out_temp <= not clock_50khz_out_temp;
            else
                count_1000 <= count_1000 + 1;
            end if;
        end if;
    end process;
  
  ---------- 5khz clock output ----------
    process(clock, reset)
    begin
        if (reset = '1') then
            count_10000 <= 0;
            clock_5khz_out_temp <= '0';
        elsif rising_edge(clock) then
            if (count_10000 = 4999) then
                count_10000 <= 0;
                clock_5khz_out_temp <= not clock_5khz_out_temp;
            else
                count_10000 <= count_10000 + 1;
            end if;
        end if;
    end process;
  
  ---------- 500hz clock output ----------
    process(clock, reset)
    begin
        if (reset = '1') then
            count_100000 <= 0;
            clock_500hz_out_temp <= '0';
        elsif rising_edge(clock) then
            if (count_100000 = 49999) then
                count_100000 <= 0;
                clock_500hz_out_temp <= not clock_500hz_out_temp;
            else
                count_100000 <= count_100000 + 1;
            end if;
        end if;
    end process;
  
  ---------- 50hz clock output ----------
    process(clock, reset)
    begin
        if (reset = '1') then
            count_1000000 <= 0;
            clock_50hz_out_temp <= '0';
        elsif rising_edge(clock) then
            if (count_1000000 = 499999) then
                count_1000000 <= 0;
                clock_50hz_out_temp <= not clock_50hz_out_temp;
            else
                count_1000000 <= count_1000000 + 1;
            end if;
        end if;
    end process;
  
  ---------- 5hz clock output ----------
    process(clock, reset)
    begin
        if (reset = '1') then
            count_10000000 <= 0;
            clock_5hz_out_temp <= '0';
        elsif rising_edge(clock) then
            if (count_10000000 = 4999999) then
                count_10000000 <= 0;
                clock_5hz_out_temp <= not clock_5hz_out_temp;
            else
                count_10000000 <= count_10000000 + 1;
            end if;
        end if;
    end process;
  
  ---------- 0.5hz clock output ----------
    process(clock, reset)
    begin
        if (reset = '1') then
            count_100000000 <= 0;
            clock_0_5hz_out_temp <= '0';
        elsif rising_edge(clock) then
            if (count_100000000 = 49999999) then
                count_100000000 <= 0;
                clock_0_5hz_out_temp <= not clock_0_5hz_out_temp;
            else
                count_100000000 <= count_100000000 + 1;
            end if;
        end if;
    end process;  
    
    -- assignment process must be last part, if not variables and siganl are not assigned(U)
    process(clock_5mhz_out_temp,clock_500khz_out_temp,clock_50khz_out_temp,clock_5khz_out_temp,
         clock_500hz_out_temp,clock_50hz_out_temp,clock_5hz_out_temp,clock_0_5hz_out_temp)
    begin
        clock_5mhz_out <= clock_5mhz_out_temp;    
        clock_500khz_out <= clock_500khz_out_temp;
        clock_50khz_out <= clock_50khz_out_temp;  
        clock_5khz_out <= clock_5khz_out_temp;    
        clock_500hz_out <= clock_500hz_out_temp;  
        clock_50hz_out <= clock_50hz_out_temp;    
        clock_5hz_out <= clock_5hz_out_temp;      
        clock_0_5hz_out <= clock_0_5hz_out_temp;  
    end process;
end Behavioral;   
                  
                  
                  
                  
                  
                  
