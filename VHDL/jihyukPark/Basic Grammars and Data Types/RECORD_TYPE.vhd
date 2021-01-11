----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/07 22:16:39
-- Design Name: 
-- Module Name: RECORD_TYPE - Behavioral
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
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

----------------------------------------------------------------------------------


--    레코드형(RECORD) : 서로 같거나 다른 데이터형 객체의 집합.
--    레코드형을 정의함으로써 서로 다른 데이터형을 하나의 레코드형으로 사용할 수 있다.
--    필드(FIELD) : 레코드의 각 원소들, 즉 레코드를 구성하고 있는 여러 데이터 객체를 필드라 부른다.
    
--    type 「레코드 이름」 is record
--        「레코드 필드 이름」 : 「데이터형」;
--    end record;

package RECORD_TYPE is
    type Record1_Type is record
        I : integer range 7 to 0;
        J : std_logic;
    end record;
        
    type Record2_Type is record
        I : integer range 0 to 7;
        J : unsigned(1 downto 0);
    end record;
    
    type FLOAT_POINT_TYPE is record
        sign     : std_logic;
        Exponent : unsigned(6 downto 0);
        Fraction : unsigned(23 downto 0);
     end record;
 end RECORD_TYPE;