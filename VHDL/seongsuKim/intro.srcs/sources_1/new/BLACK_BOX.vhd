----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/07 16:48:27
-- Design Name: 
-- Module Name: BLACK_BOX - Behavioral
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

entity BLACK_BOX is
    port(A, B : in  std_logic;
         C    : out std_logic);
--  Port ( );
end BLACK_BOX;

-- entity entity name is
--     port(port name : mode data type;
--          port name : mode data type);
-- end entity entity name;
-- entity name should start with eng. 
-- _ cannot be used consecutively
-- does ot distinguish capital, small letter
-- mode : in, out, inout, buffer, linkage

architecture Behavioral of BLACK_BOX is
begin
    process(A, B)
    begin
        C <= A or B;
    end process;
end Behavioral;

-- architecture architecture name of entity name is
-- declarations
-- begin
--      process(variables)    
--      begin
--          (how it works)
--      end process;
-- end architecture architecture name;

architecture Behavioral2 of BLACK_BOX is
begin
        C <= '0' when (A = '0' and B = '0') 
        else '1';
end architecture Behavioral2;

configuration Config of BLACK_BOX is
    -- entity BLACK_BOX와 Behavioral2를 연결시킴
    for Behavioral2
    end for;
end configuration Config;

-- configuration connects certain architecture among others
-- configuration configuration name of entity1 name is
--     for architecture name
--         {for component label name : component name
--          use entity library name. entity2 name (architecture name);}
--     end for;
-- end architecture configuration name;
