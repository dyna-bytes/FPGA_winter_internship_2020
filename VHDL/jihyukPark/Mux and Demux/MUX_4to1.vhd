----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/08 13:10:06
-- Design Name: 
-- Module Name: MUX_4to1 - Behavioral
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
use IEEE.std_logic_arith.ALL;
USE IEEE.std_logic_unsigned.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


----------------------------------------------------------------------------------
--MUX : N개의 입력들 중 M개의 제어 신호 입력을 통해 하나의 출력을 결정
--M개의 제어 신호 입력을 갖는 멀티플렉서는 N =< 2M개의 입력 신호 중 하나를 출력해 할당할 수 있다.

entity MUX_4to1 is
  Port (INPUT : IN std_logic_vector (3 downto 0);
        SEL   : IN std_logic_vector (1 downto 0);
        OUTPUT: OUT std_logic);
end MUX_4to1;

architecture Behavioral of MUX_4to1 is

begin
    OUTPUT <= INPUT(0) when SEL = "00" 
     else     INPUT(1) when SEL = "01" 
     else     INPUT(2) when SEL = "10" 
     else     INPUT(3) when SEL = "11";
end Behavioral;
