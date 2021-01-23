----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/08 15:04:35
-- Design Name: 
-- Module Name: TFF - Behavioral
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

entity TFF is
  port(clock : in std_logic;
       t_input : in std_logic;
       enable : in std_logic;
       q : out std_logic;
       not_q : out std_logic);
--  Port ( );
end TFF;

architecture Behavioral of TFF is
    signal q_temp : std_logic;
begin
    process(clock, enable)
    begin
        if (rising_edge(clock) and enable = '0') then
            q_temp <= '0';
        elsif rising_edge(clock) then
            if (t_input = '1') then
                q_temp <= not q_temp;
            else
                q_temp <= q_temp;
            end if;
        end if;
    end process;
    
    process(clock,q_temp) -- must make separate process, if not delayed
    begin
        q <= q_temp;
        not_q <= not q_temp;
    end process;
end Behavioral;
