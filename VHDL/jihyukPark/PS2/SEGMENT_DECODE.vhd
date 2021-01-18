----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/17 20:33:39
-- Design Name: 
-- Module Name: SEGMENT_DECODE - Behavioral
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
USE IEEE.std_logic_arith.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SEGMENT_DECODE is
  Port (ASCII_CODE : IN std_logic_vector(7 downto 0);
        SEG_DIGIT : OUT std_logic_vector(3 downto 0);
        SEG_LED : OUT std_logic_vector(7 downto 0)
         );
end SEGMENT_DECODE;

architecture Behavioral of SEGMENT_DECODE is
begin
    SEG_DIGIT <= "1110";
    
    process(ASCII_CODE)
    begin -- 7-Segment LED : .gfedcba Keyboard Value
      if (ASCII_CODE = X"30") then SEG_LED <= "11000000";--'0'
      elsif (ASCII_CODE = X"31") then SEG_LED <= "11111001";--'1'
      elsif (ASCII_CODE = X"32") then SEG_LED <= "10100100";--'2'
      elsif (ASCII_CODE = X"33") then SEG_LED <= "10110000";--'3'
      elsif (ASCII_CODE = X"34") then SEG_LED <= "10011001";--'4'
      elsif (ASCII_CODE = X"35") then SEG_LED <= "10010010";--'5'
      elsif (ASCII_CODE = X"36") then SEG_LED <= "10000010";--'6'
      elsif (ASCII_CODE = X"37") then SEG_LED <= "11111000";--'7'
      elsif (ASCII_CODE = X"38") then SEG_LED <= "10000000";--'8'
      elsif (ASCII_CODE = X"39") then SEG_LED <= "10010000";--'9'
      elsif (ASCII_CODE = X"41") then SEG_LED <= "00001000";--'A'
      elsif (ASCII_CODE = X"42") then SEG_LED <= "00000011";--'B'
      elsif (ASCII_CODE = X"43") then SEG_LED <= "01000110";--'C'
      elsif (ASCII_CODE = X"44") then SEG_LED <= "00100001";--'D'
      elsif (ASCII_CODE = X"45") then SEG_LED <= "00000110";--'E'
      elsif (ASCII_CODE = X"46") then SEG_LED <= "00001110";--'F'
      elsif (ASCII_CODE = X"47") then SEG_LED <= "00000010";--'G'
      elsif (ASCII_CODE = X"48") then SEG_LED <= "00001001";--'H'
      elsif (ASCII_CODE = X"49") then SEG_LED <= "01001111";--'I'
      elsif (ASCII_CODE = X"4A") then SEG_LED <= "01110001";--'J'
      elsif (ASCII_CODE = X"4B") then SEG_LED <= "00000111";--'K'
      elsif (ASCII_CODE = X"4C") then SEG_LED <= "01000111";--'L'
      elsif (ASCII_CODE = X"4D") then SEG_LED <= "00001000";--'M'
      elsif (ASCII_CODE = X"4E") then SEG_LED <= "00101011";--'N'
      elsif (ASCII_CODE = X"4F") then SEG_LED <= "00100011";--'O'
      elsif (ASCII_CODE = X"50") then SEG_LED <= "00001100";--'P'
      elsif (ASCII_CODE = X"51") then SEG_LED <= "00011000";--'Q'
      elsif (ASCII_CODE = X"52") then SEG_LED <= "00101111";--'R'
      elsif (ASCII_CODE = X"53") then SEG_LED <= "00010010";--'S'
      elsif (ASCII_CODE = X"54") then SEG_LED <= "00000111";--'T'
      elsif (ASCII_CODE = X"55") then SEG_LED <= "01000001";--'U'
      elsif (ASCII_CODE = X"56") then SEG_LED <= "01100011";--'V'
      elsif (ASCII_CODE = X"57") then SEG_LED <= "00000001";--'W'
      elsif (ASCII_CODE = X"58") then SEG_LED <= "01001001";--'X'
      elsif (ASCII_CODE = X"59") then SEG_LED <= "00010001";--'Y'
      elsif (ASCII_CODE = X"5A") then SEG_LED <= "00110110";--'Z'
      else SEG_LED <= "11111111";--'All Segment OFF'
    end if;
    end process; 
end Behavioral;
