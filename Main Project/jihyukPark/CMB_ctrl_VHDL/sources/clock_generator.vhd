----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/11 14:32:34
-- Design Name: 
-- Module Name: clock_generator - Behavioral
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
use IEEE.std_logic_unsigned.ALL;
use work.myPACK.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clock_generator is
    generic(from_hz : integer := 100;
            to_hz : integer := 100;
            reverse_clk : std_logic := '0');
    port   (i_clk : in std_logic;
            rst : in std_logic;
            o_clk : out std_logic);
end entity;

architecture Beahavioral of clock_generator is
    constant N : integer := from_hz / to_hz;
    constant MSB : integer := find_MSB(N);
    signal cnt : std_logic_vector(MSB - 1 downto 0) := (0 => '1', others => '0');
    
    constant ZERO : std_logic := '1' and reverse_clk;
    constant ONE : std_logic := '1' nand reverse_clk;
begin
    
    count_up : process(i_clk, rst, cnt)
    begin
        if rst = '1' then
            cnt <= (0 => '1', others => '0');
            o_clk <= ONE;
            
        elsif rising_edge(i_clk) then
            cnt <= cnt + '1';

            if cnt < N/2 then
                o_clk <= ONE;
            elsif cnt < N - 1 then
                o_clk <= ZERO;
            elsif cnt = N - 1 then
                o_clk <= ZERO;
                cnt <= (others => '0');
            end if;
        end if;
    end process;

end architecture;
    
