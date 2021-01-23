----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/07 18:08:20
-- Design Name: 
-- Module Name: USER_PROCEDURE2 - Behavioral
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

package USER_PROCEDURE2 is
    procedure Two_Input_Or(signal X, Y : in  bit;
                           variable O  : out bit);
end package USER_PROCEDURE2;

package body USER_PROCEDURE2 is
    procedure Two_Input_Or(signal X, Y : in  bit;
                           variable O  : out bit) is
    begin
        O := X or Y;
    end procedure Two_Input_Or;
end package body USER_PROCEDURE2;