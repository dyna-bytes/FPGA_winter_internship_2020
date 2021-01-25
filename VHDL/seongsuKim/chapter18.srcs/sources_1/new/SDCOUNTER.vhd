----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/08 16:41:07
-- Design Name: 
-- Module Name: SDCOUNTER - Behavioral
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

entity SDCOUNTER is
  port(clock : in std_logic;
       reset : in std_logic;
       clock_out : out std_logic);
--  Port ( );
end SDCOUNTER;

architecture Behavioral of SDCOUNTER is
    signal output_temp: std_logic_vector (3 downto 0) := "0000";
    signal clock_out_temp: std_logic := '0';
begin
    process(clock,reset,output_temp,clock_out_temp)
    begin
        if (reset = '1') then
            output_temp <= "0000";
            clock_out_temp <= '0';
            
        elsif (clock'event) then 
        -- clock'event is any change on clock, clock='1' is logic level
        -- any change that results in logic high = rising edge
        -- why?
            if (output_temp = 9) then
                output_temp <= "0000";
                clock_out_temp <= not clock_out_temp;
            else
                output_temp <= output_temp + '1';
            end if;
        end if;
        
--        elsif rising_edge(clock) then 
--            if (output_temp = 9) then
--                output_temp <= "0000";
--                clock_out_temp <= not clock_out_temp;
--            elsif (output_temp = 4) then
--                output_temp <= output_temp + '1';
--                clock_out_temp <= not clock_out_temp;
--            else
--                output_temp <= output_temp + '1';
--            end if;
--        end if;
    end process;
        
    process(clock_out_temp)
    begin
        clock_out <= clock_out_temp;
    end process;
end Behavioral;
