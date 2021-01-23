----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/07 14:47:35
-- Design Name: 
-- Module Name: Data_type - Behavioral
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

-- Enumeration data type
-- type enumeration data name is (enumeration value);
-- ex) type rainbow is (red, orange,...);
-- enumeration data is redefined as number in synthesis
-- red = 000, orange = 001,...

-- integer data type
-- type integer data name is range (integer range);
-- ex) type CountValue is range 0 to 15;
--     type Thirties is range 30 to 39;
--     type Seventies is range 79 downto 70;
-- cf) synthesized bit is up to needed bit

-- composite data type
-- infinite array
-- type unsigned is array(natural range<>) of std_logic;
-- finite array
-- type unsigned is array(natural range 7 downto 0) of std_logic;

-- floating point type
-- type type float data name is range (float range);

-- boolean type
-- type boolean is (false, true);

-- bit, bit_vector
-- bit tpye only represents binary state, cannot represent tristate, wired logic
-- bit vector represents several bit data

-- std_ulogic, std_ulogic_vector
-- represents 0, 1, U(X), Z

-- std_logic, std_logic_vector
-- represents 0, 1, U(X), Z, generally used

-- record type
-- set of different data type(field)
-- type record name is record
--     record field name : data type;
-- end record;

entity Data_type is
--  Port ( );
end Data_type;

architecture Behavioral of Data_type is

begin


end Behavioral;
