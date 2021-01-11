----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/08 14:27:20
-- Design Name: 
-- Module Name: ENCODER_8x3 - Behavioral
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

--    ENCODER :
--    입력 비트의 위치에 따라, 이 입력의 위치를 이진수로 출력.
--    2^N - 1개의 입력, N 비트의 출력.

entity ENCODER_8x3 is
  Port (INPUT : IN std_logic_vector(7 downto 0);
        OUTPUT : OUT std_logic_vector(2 downto 0));
end ENCODER_8x3;

architecture Behavioral of ENCODER_8x3 is
begin
    proceSS(INPUT)
    BEGIN
        IF(INPUT = "00000001") THEN     -- act as Priority Encoder
            OUTPUT <= "000";
        ELSIF(INPUT = "00000010") THEN
            OUTPUT <= "001";
        ELSIF(INPUT = "00000100") THEN
            OUTPUT <= "010";
        ELSIF(INPUT = "00001000") THEN
            OUTPUT <= "011";
        ELSIF(INPUT = "00010000") THEN
            OUTPUT <= "100";
        ELSIF(INPUT = "00100000") THEN
            OUTPUT <= "101";
        ELSIF(INPUT = "01000000") THEN
            OUTPUT <= "110";
        ELSIF(INPUT = "10000000") THEN
            OUTPUT <= "111";
        END IF;
    END process;

end Behavioral;
