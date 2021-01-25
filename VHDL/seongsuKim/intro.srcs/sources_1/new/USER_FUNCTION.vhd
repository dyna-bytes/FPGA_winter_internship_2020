----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/07 17:52:31
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
    function Two_Input_Or(X, Y : bit) return bit is variable O : bit;
    begin
        O := X or Y;
        return O;
    end function Two_Input_Or;
end package body USER_FUNCTION;

-- Declaration Part
-- function function name(parameter list) return data type;

-- Body Part
-- function function name(parameter list) return data type is
--     {declarations}
-- begin
--     {ordered statements}
-- end function function name;