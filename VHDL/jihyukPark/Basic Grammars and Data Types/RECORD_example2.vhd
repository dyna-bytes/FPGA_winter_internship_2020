----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/07 23:09:57
-- Design Name: 
-- Module Name: RECORD_example2 - Behavioral
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
use IEEE.std_logic_arith.all;

use work.record_type.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RECORD_example2 is
  Port (Si      : in std_logic;             --Sign
        Ex      : in unsigned(6 downto 0);  --Exponent
        Fr      : in unsigned(23 downto 0); --Fraction
        A, B    : in std_logic;
        F1, F2  : in FLOAT_POINT_TYPE;      --RECORD FIELD 전체를 피연산자에 적용.
        C       : out unsigned(31 downto 0);
        D       : out std_logic;
        E       : out FLOAT_POINT_TYPE     --RECORD FIELD 전체를 피연산자에 적용.
        );
end RECORD_example2;

architecture Behavioral of RECORD_example2 is

begin
    process(Si, Ex, Fr)
        variable F : FLOAT_POINT_TYPE;      --RECORD FIELD 전체를 피연산자에 적용.
     begin
        F.Sign      := Si;
        F.Exponent  := Ex;
        F.Fraction  := Fr;
    end process;
    
    process(A, F1, F2)
    begin
        if( F1 = F2) then
            D <= A;
            E <= F1;
        else
            D <= B;
            E <= F2;
        end if;
     end process;
end Behavioral;

--    11. 실수형(Floating Point Type)
--    합성을 위한 회로에서 사용 불가능.
--    상위 레벨의 동작 모델링에서만 사용.
--    표현범위는 -1.0×1038에서 1.0×1038까지이며, 이 표현 범위로 미리 정의된 부동소수점형.
--    예) type Real_number is range -1.0E38 to 1.0E38;
    
    
--    12. 불대수형(Boolean Type)
--    논리의 참과 거짓을 나타내는 데에만 쓰임.
--    논리 상태를 나타내는 0, 1과는 다른 의미.
--    예) type boolean_type is (false, true);transport

entity BOOL is 
    port(TRUE_FALSE : in boolean;
         O         : out bit);
end entity BOOL;

architecture behavioral of BOOL is
begin
    O <= '1' when (TRUE_FALSE) else '0';
end behavioral;















