----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/07 13:37:00
-- Design Name: 
-- Module Name: test - Behavioral
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

entity test is
  Port (A, B : in std_logic;
        C    : out std_logic);
end entity test;

architecture Behavioral1 of test is
begin
    process(A, B)
    begin
        C <= A or B;
    end process;
end architecture Behavioral1;

architecture Behavioral2 of test is
begin
    C <= '0' when (A = '0' and B = '0') 
    else '1';
end architecture Behavioral2;

configuration Config of test is
    -- entity test 와 Behavioral2를 연결시킴
    for Behavioral2
    end for;
end configuration Config;

--configuration <Configuaration 이름> of <Entity1 이름> is
--    for <Architecture 이름>
--        {for <Compenent 라벨 이름> : <Component 이름>
--         use entity <Library 이름>.<Entity2 이름>
--         (<Architercture 이름>);}
--    end for;
--end architecture <Configureation 이름>;


