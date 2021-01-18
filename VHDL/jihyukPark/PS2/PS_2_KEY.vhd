----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/16 08:48:26
-- Design Name: 
-- Module Name: PS_2_KEY - Behavioral
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

entity PS_2_KEY is
  Port (
        CLOCK : in std_logic;
        RESET : in std_logic;
        KEY_CLOCK : in std_logic;
        KEY_DATA : in std_logic;
        
        ASCII_CODE : out std_logic_vector(7 downto 0)        
         );
end PS_2_KEY;

architecture Behavioral of PS_2_KEY is
    component SCAN_CODE_ROM_128X8
    port(
        CLKA : in std_logic;
        ADDRA : in std_logic_vector(6 downto 0);
        DOUTA : out std_logic_vector(7 downto 0)
         );
    end component;
    
    type STATE is (T0, T1, T2);     
    signal PS_2_COMMUNICATION_STATE : STATE := T0;
    signal ASCII_CODE_ADDRESS : std_logic_vector(7 downto 0) := "0000" & "0000";
    signal KEY_CLOCK_COUNT : integer range 0 to 11 := 0;
    signal KEY_DATA_BUFFER : std_logic_vector(7 downto 0) := "0000" & "0000";
    
begin
    SCAN_CODE_ROM : SCAN_CODE_ROM_128X8 
    port map(
    CLKA => CLOCK, 
    ADDRA => ASCII_CODE_ADDRESS(6 downto 0), 
    DOUTA => ASCII_CODE
    );
    
    process( KEY_CLOCK, RESET)
    begin
        if (RESET = '1') then
            PS_2_COMMUNICATION_STATE <= T0;
            ASCII_CODE_ADDRESS <= "0000" & "0000";
            KEY_CLOCK_COUNT <= 0;
            KEY_DATA_BUFFER <= "0000" & "0000";
        elsif falling_edge(KEY_CLOCK) then
            IF (PS_2_COMMUNICATION_STATE = T0) and (KEY_DATA = '0') then
                    KEY_CLOCK_COUNT <= 1;
                    PS_2_COMMUNICATION_STATE <= T1;
                
            ELSIF (PS_2_COMMUNICATION_STATE = T1) then
                KEY_CLOCK_COUNT <= KEY_CLOCK_COUNT + 1;
                
                IF (KEY_CLOCK_COUNT = 9) then
                    KEY_CLOCK_COUNT <= 0;
                    PS_2_COMMUNICATION_STATE <= T2;
                ELSE
                    KEY_DATA_BUFFER(7) <= KEY_DATA_BUFFER(6);
                    KEY_DATA_BUFFER(6) <= KEY_DATA_BUFFER(5);
                    KEY_DATA_BUFFER(5) <= KEY_DATA_BUFFER(4);
                    KEY_DATA_BUFFER(4) <= KEY_DATA_BUFFER(3);
                    KEY_DATA_BUFFER(3) <= KEY_DATA_BUFFER(2);
                    KEY_DATA_BUFFER(2) <= KEY_DATA_BUFFER(1);
                    KEY_DATA_BUFFER(1) <= KEY_DATA_BUFFER(0);
                    KEY_DATA_BUFFER(0) <= KEY_DATA;
                END IF;
            ELSIF (PS_2_COMMUNICATION_STATE = T2) AND (KEY_DATA = '1') then
                    ASCII_CODE_ADDRESS(7) <= KEY_DATA_BUFFER(0);
                    ASCII_CODE_ADDRESS(6) <= KEY_DATA_BUFFER(1);
                    ASCII_CODE_ADDRESS(5) <= KEY_DATA_BUFFER(2);
                    ASCII_CODE_ADDRESS(4) <= KEY_DATA_BUFFER(3);
                    ASCII_CODE_ADDRESS(3) <= KEY_DATA_BUFFER(4);
                    ASCII_CODE_ADDRESS(2) <= KEY_DATA_BUFFER(5);
                    ASCII_CODE_ADDRESS(1) <= KEY_DATA_BUFFER(6);
                    ASCII_CODE_ADDRESS(0) <= KEY_DATA_BUFFER(7);
                    
                    PS_2_COMMUNICATION_STATE <= T0;
            END IF;
        end if;    
    end process;

end Behavioral;
