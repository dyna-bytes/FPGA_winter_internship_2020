----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/12 17:03:29
-- Design Name: 
-- Module Name: Increment_angle_counter_for_7seg - Behavioral
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
use IEEE.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Increment_angle_counter_for_7seg is
  Port (sys_init_ctrl : in std_logic;
        rot_clk       : in std_logic;
        rot_en        : in std_logic;
        
        bcd_int        : out std_logic_vector(15 downto 0)
        );
end Increment_angle_counter_for_7seg;

architecture Behavioral of Increment_angle_counter_for_7seg is
    type dig is array(3 downto 0) of std_logic_vector(3 downto 0);
    signal digit : dig;
begin 
    -- rot_clk을 10진수로 count up 한다.
    counting : process(sys_init_ctrl, rot_clk, rot_en)
    begin
        if sys_init_ctrl = '1' then
            digit(3 downto 0) <= (others => (others => '0'));
                 
        elsif rot_en = '1' and falling_edge(rot_clk) then
            if digit(3) = 9 and digit(2) = 9 and digit(1) = 9 and digit(0) = 9 then
                digit(3 downto 0) <= (others => (others => '0'));            
            elsif digit(2) = 9 and digit(1) = 9 and digit(0) = 9 then    
                digit(2 downto 0) <= (others => (others => '0'));
                digit(3) <= digit(3) + 1;
            elsif digit(1) = 9 and digit(0) = 9 then
                digit(1 downto 0) <= (others => (others => '0'));
                digit(2) <= digit(2) + 1;
            elsif digit(0) = 9 then 
                digit(0) <= "0000";
                digit(1) <= digit(1) + 1;
            else
                digit(0) <= digit(0) + 1;     
            end if;
        end if;
        
        bcd_int <= digit(3) & digit(2) & digit(1) & digit(0);
    end process;
    
end Behavioral;
