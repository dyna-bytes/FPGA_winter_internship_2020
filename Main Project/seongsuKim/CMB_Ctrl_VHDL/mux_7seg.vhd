----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/12 17:04:41
-- Design Name: 
-- Module Name: mux_7seg - Behavioral
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

entity mux_7seg is
    port(sys_init_ctrl: in std_logic;
         khertz_clk: in std_logic;
         bcdint: in std_logic_vector (15 downto 0);
         digit: out std_logic_vector (3 downto 0);
         seg: out std_logic_vector (7 downto 0));
end mux_7seg;

architecture Behavioral of mux_7seg is
    signal dig_count: std_logic_vector (2 downto 0);
    signal bcdcrt: std_logic_vector (3 downto 0);
    signal seg_dp: std_logic;
begin
    process(sys_init_ctrl,khertz_clk)
    begin
    if sys_init_ctrl = '1' then
		seg <= (others => '1');
		digit <= (others => '1');
		dig_count <= (others => '0');
		bcdcrt <= (others => '0');
	    dig_count(2) <= '1';
    elsif khertz_clk'event and khertz_clk = '1' then
		dig_count(1 downto 0) <= dig_count(1 downto 0) + 1;
	end if;
	
	case dig_count(1 downto 0) is
		when "00" => bcdcrt <= bcdint(3 downto 0); seg_dp <= '1'; digit <= "1110";
		when "01" => bcdcrt <= bcdint(7 downto 4); seg_dp <= '0'; digit <= "1101";
		when "10" => bcdcrt <= bcdint(11 downto 8); seg_dp <= '1'; digit <= "1011";
		when others => bcdcrt <= bcdint(15 downto 12); seg_dp <= '1'; digit <= "0111";
    end case;
	
	if dig_count(2) = '1' then
		case bcdcrt is
			when "0000" => seg <= "0000001" & seg_dp;
			when "0001" => seg <= "1001111" & seg_dp;
			when "0010" => seg <= "0010010" & seg_dp;
			when "0011" => seg <= "0000110" & seg_dp;
			when "0100" => seg <= "1001100" & seg_dp;
			when "0101" => seg <= "0100100" & seg_dp;
			when "0110" => seg <= "0100000" & seg_dp;
			when "0111" => seg <= "0001101" & seg_dp;
			when "1000" => seg <= "0000000" & seg_dp;
			when others => seg <= "0000100" & seg_dp;
	   end case;
	else
		seg <= (others => '1');
	end if;
    end process;
end Behavioral;
