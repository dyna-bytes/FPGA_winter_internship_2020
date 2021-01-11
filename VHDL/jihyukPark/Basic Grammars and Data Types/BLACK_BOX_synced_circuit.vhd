----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/07 16:11:00
-- Design Name: 
-- Module Name: BLACK_BOX_synqed_circuit - Behavioral
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

-- 동기 회로 설계
entity BLACK_BOX_synced_circuit is
    Port (CLOCK, A, B, C : in   std_logic;
          D              : out  std_logic);
end BLACK_BOX_synced_circuit;

architecture Behavioral1 of BLACK_BOX_synced_circuit is
 begin
        process(CLOCK)
        -- 변수 선언
        variable Temp : std_logic;
        begin
            if rising_edge(CLOCK) then
                Temp := A and B;
                D <= Temp or C after 1 ns; -- d flipflop with 1 ns delay time
            end if;
        end process;
end Behavioral1;


--    동기회로 : 클록의 상승 엣지 혹은 하강 엣지를 기준으로 모든 신호가 전달되는 회로
--    신호 D는 D flip flop의 출력으로 선언되어 1 ns 지연 후에 나타남.

architecture Behavioral2 of BLACK_BOX_synced_circuit is
         -- 신호 선언
        signal Temp : std_logic;
 begin
        process(CLOCK)
        begin
            if rising_edge(CLOCK) then
                Temp <= A and B after 3 ns; -- dff with 3 ns delay time
                D <= Temp or C after 1 ns;  -- dff with 1 ns delay time
            end if;
        end process;
end Behavioral2;
--    신호 Temp는 D flip flop의 출력으로 선언되어 3 ns 지연 후에 나타남.
--    신호 D는 D flip flop의 출력으로 선언되어 1 ns 지연 후에 나타남.

configuration Conf of BLACK_BOX_synced_circuit is
    for Behavioral2
    end for;
end configuration Conf;