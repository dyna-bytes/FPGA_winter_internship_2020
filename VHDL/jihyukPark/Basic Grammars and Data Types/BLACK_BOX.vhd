----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/07 15:30:30
-- Design Name: 
-- Module Name: BLACK_BOX - Behavioral
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
--    1. VHDL의 표현(Expression)
--    Y <= A + B + C
--    Operator : +,-
--    Operand : A, B, C
    
--    2. 피연산자(Operand)
--    1) 문자열 리터럴(String Literals)
--    - 문자열 리터럴은 일련의 문자의 그룹을 의미
--    ex) "ABC"
--    - 단일 비트 : '1', '0;
--    - 비트열 리터럴 : B"1100", 0"15", X"BF" (2진, 8진, 16진)
--    2) 숫자 리터럴(Numeric Literals)
--    ex) 1234, 2#1010_1111#, 8#132#, 16#FF#
--        16#F.01#E+2 : 15.00390625 × 162
--        12 ft : 거리 12 ft
--        3 kohm : 저항 3K옴
        
--    3. 피연산자 선언문(Operand Declaration Statement)
--    선언문 : 상수(constant), 데이터형(Type), 객체(Object),서브프로그램(Subprogram) 등을 정의하는데 사용
--         상수 : 숫자 리터럴, 문자열 리터럴
--         데이터형 : 배열, 레코드
--         객체 : 변수(Variable), 신호(Signal), 외부 컴포넌트(Component)
--    서브프로그램 : 함수(Function), 프로시저(procedure)
    
--    4. 병행처리문(Concurrent Statement)
--    하나의 Architecture에 여러개의 Process문이 있다면, 각각의 Process문은 동시에 병렬로 동작하는 블록이 된다.
    
--    5. 순차처리문(Sequential Statement)
--    기술된 순서대로 수행됨.
--    항상 Process, 함수, 프로시저에서 쓰여짐. 
    
--    6. 변수(variable) 와 신호(signal)
--    변수 : 프로세스, 함수, 프로시저와 같은 서브프로그램 내에서만 선언가능한 기억장소
--           값의 할당 시에 할당과 동시에 즉시 값이 갱신.
--    신호 : Entity, Architecture, Package, Block에서 선언.
--          Port와 같이 값의 할당 시에 일정 지연 후에 값이 갱신된다.
          
--        -- 변수 선언
--        variable 「변수 이름」 : 「데이터형」 := 「초기값」
--        -- 변수 할당
--        「변수 이름」 := 「할당값」
        
--        -- 신호 선언
--        signal 「신호 이름」 : 「데이터형」 := 「초기값」
--        -- 신호 할당
--        「신호 이름」 <= 「할당값」
    
--    변수와 신호의 할당은 루프문 내에 모두 사용할 수 있다.
--    그러나 다음과 같은 이유로 루프 내에는 변수를 사용하는 것이 좋다.
--     - 시뮬레이션이 빨라짐.
--     - 합성결과로 생성된 회로를 쉽게 예측할 수 있다.

entity BLACK_BOX is
    Port (A, B, C : in  std_logic;
          D       : out std_logic);
end BLACK_BOX;

architecture Behavioral of BLACK_BOX is
begin
    process(A, B, C)    --Sensitive List
    -- 변수 선언
    variable Temp : std_logic;
    begin
        Temp := A and B;           --변수
        D <= Temp or C after 1 ns; -- 신호 -- 지연시간 1 ns는 합성 시에 고려되지 않음. 시뮬레이션에서만 지연시간 관찰가능
    end process;
end Behavioral;
