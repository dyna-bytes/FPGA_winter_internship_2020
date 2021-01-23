----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/07 16:30:09
-- Design Name: 
-- Module Name: RECORD_TYPE2 - Behavioral
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

package RECORD_TYPE2 is
    type FLOAT_POINT_TYPE is record
        Sign : std_logic;
        Exponent : unsigned (6 downto 0);
        Fraction : unsigned (23 downto 0);
    end record;
--  Port ( );
end RECORD_TYPE2;

--architecture Behavioral of RECORD_TYPE2 is

--begin


--end Behavioral;
