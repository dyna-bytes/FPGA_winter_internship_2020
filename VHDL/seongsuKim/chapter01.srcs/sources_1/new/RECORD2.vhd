----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/07 16:32:21
-- Design Name: 
-- Module Name: RECORD2 - Behavioral
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

use work.record_type2.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RECORD2 is
    port(Si     : in  std_logic;
         Ex     : in  unsigned(6 downto 0);
         Fr     : in  unsigned(23 downto 0);
         A, B   : in  std_logic;
         F1, F2 : in  float_point_type;
         C      : out unsigned(31 downto 0);
         D      : out std_logic;
         E      : out float_point_type);
--  Port ( );
end RECORD2;

architecture Behavioral of RECORD2 is
begin
    process(Si, Ex, Fr)
        variable F : float_point_type;
    begin
        F.Sign     := Si;
        F.Exponent := Ex;
        F.Fraction := Fr;
        C <= F.Sign & F.Exponent & F.Fraction; -- & is merging chain operator
    end process;

    process(A, F1, F2)
    begin
        if (F1 = F2) then
            D <= A;
            E <= F1;
        else
            D <= B;
            E <= F2;
        end if;
    end process;
end Behavioral;
