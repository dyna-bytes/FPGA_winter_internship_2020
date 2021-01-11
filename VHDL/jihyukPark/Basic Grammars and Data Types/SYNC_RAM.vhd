----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/07 18:05:20
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


----------------------------------------------------------------------------------
--    8. 열거형 데이터형 (Enumeration Data Type)
--    열거형 데이터형 : 사용자가 정의한 값의 집합. 이때, 모든 값은 "Red", "Multiply"와 같은 식별자이거나,
--                    '0', '1', 'U', 'Z'와 같은 문자 리터럴이다.
    
--    type 「열거형 이름」 is (「열거값」);
--    ex) type Rainbow is (Red, Orange, Yellow, Green, Blue, Indigo, Violet);
--        Red = 000, Ornage = 001, Yellow = 010, Green = 011, Blue = 100, Indigo = 101, Violet = 110


--    9. 정수 데이터형(Integer Data Type)
--    정수형 선언 : 일정범위의 정수를 정의하며 그 범위는 항상 명시되어야 한다.
--    만일 명시하지 않는다면 -2^31 + 1에서 2^31 - 1 범위로 결정된다.
    
--    type 「정수형 이름」 is range 「정수범위」;
--    예)  type CountValue is range 0 to 15;
--         type Thirties is range 30 to 39;
--         type Seventies is range 79 downto 70;
    
    
--    10. 복합 데이터형(Composite Data Type)
--    복합 데이터형 : 값의 집합을 정의하는데 사용하며, 이러한 집합은 배열(Array)이나 레코드(Record)를 구성한다.
--    Array의 각 원소는 같은 데이터형이어야 하고, Record의 원소는 다른 데이터형 일 수 있다.
    
--    배열형은 RAM이나 ROM과 같은 구조를 모델링하는데 매우 편리하다. 
--    배열의 원소는 어떤 데이터형을 사용해도 되나, 모든 원소가 동일한 데이터형이어야 한다.
--    이러한 배열형은 무제한적 배열(Unconstrained Array)과 제한적 배열(Constrained Array)이 있다.
    
--    1)무제한적 배열
--    type unsigned is array(natural range<>) of std_logic;
    
--    2)제한적 배열
--    type unsigned is array(natural range 7 downto 0) of std_logic;


entity SYNC_RAM is
  Port (ADDRESS     : in unsigned (7 downto 0);
        CLOCK       : in std_logic;
        WRITE_ENABLE: in std_logic;
        DATA        : in std_logic_vector(7 downto 0);
        O           : out std_logic_vector(7 downto 0));
end SYNC_RAM;

architecture Behavioral of SYNC_RAM is
    subtype RAM_WORD is std_logic_vector(7 downto 0);   -- 8 bit vector subtype
    type RAM_TABLE is array(0 to 255) of RAM_WORD;        -- 256 RAM_WORD array type
    signal RAM_DATA : RAM_TABLE;
begin
    WRITE_PROCESS :
    process(CLOCK)
        variable TEMP : integer;
    begin
        if rising_edge(CLOCK) then
            TEMP := conv_integer(ADDRESS);  --convert the arg argument to an integer
            
            if (WRITE_ENABLE = '1') then
                RAM_DATA(TEMP) <= DATA;
                O <= (others => 'Z');
            else
                O <= RAM_DATA(TEMP);
            end if;
         end if;
     end process;
end Behavioral;
