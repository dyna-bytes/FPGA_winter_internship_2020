----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/12 13:36:27
-- Design Name: 
-- Module Name: button_edge_trigger - Behavioral
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
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity button_edge_trigger is
  generic(is_rising : boolean := TRUE);
  Port (i_clk : IN std_logic; 
        button : IN std_logic;
        button_edge : OUT std_logic
        );
        
end button_edge_trigger;

architecture Behavioral of button_edge_trigger is
    signal button_buffer : std_logic := '0';
begin
    process(i_clk, button) 
    begin
        if i_clk'event and i_clk = '1' then
            button_buffer <= button;
        else
        end if;
    
        if (is_rising = TRUE) then
            button_edge <= button and (not button_buffer);
        elsif (is_rising = FALSE) then
            button_edge <= (not button) and button_buffer;
        end if;
    end process;

end Behavioral;
