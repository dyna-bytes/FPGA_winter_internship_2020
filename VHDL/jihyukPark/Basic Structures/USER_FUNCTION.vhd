----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/07 14:54:47
-- Design Name: 
-- Module Name: USER_FUNCTION - Behavioral
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

package USER_FUNCTION is
    function Two_Input_Or(X, Y : bit) return bit;
end package USER_FUNCTION;

package body USER_FUNCTION is
    function Two_Input_Or(X, Y : bit) return bit is
    variable O : bit;
    
    begin
        O := X or Y;
        return O;
    end function Two_Input_Or;
end package body USER_FUNCTION;


-- Function 및 Procedure

-- 선언부(Declaration Part)
-- function <Function 이름> (<매개변수 목록>) return <데이터형>;

-- 몸체부(Body Part)
-- function <Function 이름> (<매개변수 목록>) return <데이터형> is
--  {<선언문>}
-- begin
-- {<순차문>}
-- end function <Function 이름>;



-- 선언부(Declaration Part)
-- procedure <Procedure 이름> (<매개변수 목록>);

-- 몸체부(Body Part)
-- procedure <Procedure 이름> (<매개변수 목록>) is
--  {<선언문>}
-- begin
--  {<순차문>}
-- end procedure <Procedure 이름>;

package USER_PROCEDURE is
    procedure Two_Input_Or_ver2(signal X, Y : in bit;
                           signal O    : out bit);
end package USER_PROCEDURE;

package body USER_PROCEDURE is
    procedure Two_Input_Or_ver2(signal X, Y : in bit;
                                signal O    : out bit) is
    begin
        O <= X or Y;
    end procedure Two_Input_Or_ver2;
end package body USER_PROCEDURE;                                                  