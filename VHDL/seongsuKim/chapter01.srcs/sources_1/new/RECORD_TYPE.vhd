----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/07 16:11:26
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
use ieee.std_logic_arith.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

package RECORD_TYPE is -- declare package
    type Record1_Type is record
        I : integer range 7 downto 0;
        J : std_logic;
    end record;
    type Record2_Type is record
        I : integer range 0 to 7;
        J : unsigned (1 downto 0);
    end record;
end RECORD_TYPE;

--architecture Behavioral of RECORD_TYPE is

--begin


--end Behavioral;
