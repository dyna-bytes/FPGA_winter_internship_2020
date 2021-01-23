----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/07 15:01:13
-- Design Name: 
-- Module Name: SYNC_RAM - Behavioral
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
use ieee.std_logic_arith.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SYNC_RAM is
    port(ADDRESS : in unsigned (7 downto 0); -- unsigned: do not use negative number, 8 bit unsigned
         CLOCK : in std_logic;
         WRITE_ENABLE : in std_logic;
         DATA : in std_logic_vector (7 downto 0);
         O : out std_logic_vector (7 downto 0));
--  Port ( );
end SYNC_RAM;

architecture Behavioral of SYNC_RAM is
    subtype RAM_WORD is std_logic_vector (7 downto 0);
    type RAM_TABLE is array (0 to 255) of RAM_WORD; -- memory size is 8 x 256 bit
    
    signal RAM_DATA : RAM_TABLE;
begin
    WRITE_PROCESS : -- ?
    process (CLOCK)
        variable TEMP : integer;
    begin
        if rising_edge(CLOCK) then
            TEMP := conv_integer(ADDRESS); 
            -- converts integer, unsigned, signed, std_ulogic to an integer value. 

            if (WRITE_ENABLE = '1') then 
                RAM_DATA(TEMP) <= DATA;
                O <= (others => 'Z'); -- define other items as Z
            else
                O <= RAM_DATA(TEMP);
            end if;
        end if;
    end process;
end Behavioral;
