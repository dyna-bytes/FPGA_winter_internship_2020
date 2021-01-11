----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/07 16:30:43
-- Design Name: 
-- Module Name: BLACK_BOX_loop - Behavioral
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



----------------------------------------------------------------------------------

--    7. 루프에서의 변수와 신호의 할당문
--    동기로직을 모델링하는데 있어서 변수 할당문과 신호 할당문의 합성 결과 비교.
--    시프트 레지스터의 출력과 버퍼 레지스터의 출력이 분리되어 있는 논리회로 구현

entity BLACK_BOX_loop is
    Port (CLOCK, DATA : in  std_logic;
          O           : out std_logic_vector(3 downto 0));  --출력용 시프트 레지스터
end BLACK_BOX_loop;

architecture Behavioral_1 of BLACK_BOX_loop is

begin
    variable_for :
    process(CLOCK)
        -- 변수 선언
           variable pipe : std_logic_vector (3 downto 0); --버퍼 역할 시프트 레지스터
       begin
            if rising_edge(clock) then
                for N in 3 downto 1 loop        
                    pipe(N) := pipe(N - 1);     -- Pipe(3) := Pipe(2); 
                end loop;                       -- Pipe(2) := Pipe(1); 
                                                -- Pipe(1) := Pipe(0); 
                pipe(0) := DATA;                -- Pipe(0) := DATA;    
                O <= pipe;                      -- OUT := Pipe;        
            end if;
        end process;          
end Behavioral_1;


-- for loop을 오름차순으로 하면
architecture Behavioral_2 of BLACK_BOX_loop is

begin
    variable_for :
    process(CLOCK)
        -- 변수 선언
           variable pipe : std_logic_vector (3 downto 0);--버퍼 역할 d_FlipFlop
       begin
            if rising_edge(clock) then
                for N in 1 to 3 loop        
                    pipe(N) := pipe(N - 1);     -- Pipe(1) := Pipe(0); 
                end loop;                       -- Pipe(2) := Pipe(1); 
                                                -- Pipe(3) := Pipe(2); 
                pipe(0) := DATA;                -- Pipe(0) := DATA;    
                O <= pipe;                      -- OUT := Pipe;        
            end if;                             -- 어차피 Pipe(0) = Pipe(1) = Pipe(2) = Pipe(3) 이므로 하나의 dff만으로 충분함.
        end process;          
end Behavioral_2;


-- signal 을 이용한 시프트 레지스터 구현
-- Behavioral_1 과 동일한 동작
architecture Behavioral_3 of BLACK_BOX_loop is
    signal pipe : std_ulogic_vector(3 downto 0);
begin
    variable_for :
    process(clock)
    begin
        if rising_edge(clock) then
            for N in 1 to 3 loop
                pipe(N) <= pipe(N - 1);
            end loop;
        end if;
    end process;
end Behavioral_3;

configuration Config of BLACK_BOX_loop is
    for Behavioral_1
    end for;
end Config;