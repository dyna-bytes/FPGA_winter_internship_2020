----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/16 08:44:41
-- Design Name: 
-- Module Name: PS_2_KEYBOARD_INTERFACE - Behavioral
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
use IEEE.std_logic_arith.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PS_2_KEYBOARD_INTERFACE is
  Port (
        CLOCK : in std_logic;
        RESET : in std_logic;
        KEY_CLOCK : in std_logic;
        KEY_DATA : in std_logic;
        
        LED : out std_logic_vector(7 downto 0);
        SEG_DIGIT : out std_logic_vector(3 downto 0);
        SEG_LED : out std_logic_vector(7 downto 0)
         );
end PS_2_KEYBOARD_INTERFACE;

architecture Top_Model of PS_2_KEYBOARD_INTERFACE is
    component PS_2_KEY
    Port (
        CLOCK : in std_logic;
        RESET : in std_logic;
        KEY_CLOCK : in std_logic;
        KEY_DATA : in std_logic;
        
        ASCII_CODE : out std_logic_vector(7 downto 0)        
         );
    end component;
    
    component SEGMENT_DECODE
    port(
        ASCII_CODE : in std_logic_vector(7 downto 0);
        SEG_DIGIT : out std_logic_vector(3 downto 0);
        SEG_LED : out std_logic_vector(7 downto 0)
        );
    end component;
    
    signal ASCII_CODE_temp : std_logic_vector(7 downto 0) := "0000" & "0000";

begin
    PS_2_KEY_Function : PS_2_KEY
    port map(CLOCK => CLOCK,
              RESET => RESET,
              KEY_CLOCK => KEY_CLOCK,
              KEY_DATA => KEY_DATA,
              ASCII_CODE => ASCII_CODE_temp);
              
    SEGMENT_DECODE_Function : SEGMENT_DECODE
    port map(ASCII_CODE => ASCII_CODE_temp,
              SEG_DIGIT => SEG_DIGIT,
              SEG_LED => SEG_LED);
              
    LED <= ASCII_CODE_temp;       

end Top_Model;
