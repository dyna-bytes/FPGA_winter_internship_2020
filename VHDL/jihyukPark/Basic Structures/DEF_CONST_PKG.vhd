----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/07 14:32:43
-- Design Name: 
-- Module Name: DEF_CONST_PKG - Behavioral
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
use IEEE.STD_LOGIC_1164.ALL;    --ieee library에서 std_logic_1164 package 사용
use ieee.std_logic_arith.all;   --ieee library에서 std_logic_arith package 사용

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

package DEF_CONST_PKG is
    constant width : integer := 8;
    constant No_MSBs : integer; --No MSB 상수 정의 미루기
    function AND_MSBs (A : unsigned(width - 1 downto 0)) return std_logic;
end package DEF_CONST_PKG;

package body DEF_CONST_PKG is
    -- 실제 No_MSBs 상수 정의
    constant No_MSBs : integer := 3;   
    function AND_MSBs (A : unsigned(width -1 downto 0)) return std_logic is 
    variable V : std_logic;
    
    begin
        V := '1';
        
        for N in 7 downto 8 - No_MSBs loop
            V := V and A(N);
        end loop;
        
        return V;
    end function AND_MSBs;
end package body DEF_CONST_PKG;

-- package <Package 이름> is
--      {<선언문> (type, component, function, procedure 선언)}
-- end package <Package 이름>;

-- package body <Package 이름> is
--      {<동작기술문>}
-- end package body <Package 이름>;


-- Function 및 Procedure
-- 선언부(Declaration Part)
-- function <Function 이름> (<매개변수 목록>) return <데이터형>;

-- 몸체부(Body Part)
-- function <Function 이름> (<매개변수 목록>) return <데이터형> is
--  {<선언문>}
-- begin
-- {<순차문>}
-- end function <Function 이름>;