----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/08 13:40:09
-- Design Name: 
-- Module Name: DEMUX_1to4 - Behavioral
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
USE IEEE.std_logic_unsigned.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


----------------------------------------------------------------------------------
--    Demultiplexer :
--    하나의 입력신호와 여러 개의 출력 신호를 가짐.
--    선택 신호에 의해 지정되는 출력으로 입력 신호가 연결된다.
--    따라서 디멀티플렉서를 데이터 분배기라고도 한다.

entity DEMUX_1to4 is
  Port ( INPUT : IN std_logic;
         SEL   : IN std_logic_vector(1 DOWNTO 0);
         OUTPUT: OUT std_logic_vector(3 downto 0));
end DEMUX_1to4;


architecture Behavioral of DEMUX_1to4 is
begin
    process(INPUT, SEL)
    BEGIN
        IF(SEL = "00") THEN
            OUTPUT(0) <= INPUT;
            OUTPUT(1) <= '0';
            OUTPUT(2) <= '0';
            OUTPUT(3) <= '0';
        ELSIF(SEL = "01") THEN
            OUTPUT(0) <= '0';
            OUTPUT(1) <= INPUT;
            OUTPUT(2) <= '0';
            OUTPUT(3) <= '0';
        ELSIF(SEL = "10") THEN
            OUTPUT(0) <= '0';
            OUTPUT(1) <= '0';
            OUTPUT(2) <= INPUT;
            OUTPUT(3) <= '0';
        ELSIF(SEL = "11") THEN
            OUTPUT(0) <= '0';
            OUTPUT(1) <= '0';
            OUTPUT(2) <= '0';
            OUTPUT(3) <= INPUT;
        END IF;
    END PROCESS;
end Behavioral;
