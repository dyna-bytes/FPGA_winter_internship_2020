----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/07 17:39:00
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
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

package DEF_CONST_PKG is
    constant Width : integer := 8; -- declare commonly used const.
    constant No_MSBs : integer;
    function AND_MSBs(A: unsigned(Width - 1 downto 0)) return std_logic; -- prototype of func.
--  Port ( );
end DEF_CONST_PKG;

package body DEF_CONST_PKG is
    constant No_MSBs : integer := 3;

    function AND_MSBs(A : unsigned(Width - 1 downto 0)) return std_logic is
        variable V : std_logic;
    begin
        V := '1';
        for N in 7 downto 8 - No_MSBs loop
            V := V and A(N); -- A(N) is value of A in Nth loop
        end loop;

        return V;
    end function AND_MSBs;
end package body DEF_CONST_PKG;

-- package package name is
--     {declarations}
-- end package package name; 

-- package body package name is
--     {how it works}
-- end package body package name;