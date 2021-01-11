----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/07 13:50:54
-- Design Name: 
-- Module Name: FOUR_INPUT_OR - Behavioral
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
----------------------------------------------------------------------------------

--entity <Entity 이름> is
--    port( <Port 이름> : <모드> <데이터형> ;
--          <Port 이름> : <모드> <데이터형>);
--end entity <Entity 이름>; 

-- entity 선언
entity FOUR_INPUT_OR is
  Port (A1, A2, A3, A4 : in std_logic;
        O : out std_logic );
end entity FOUR_INPUT_OR;



--architecture <Architecture 이름> of <Entity 이름> is
--    <선언문>
--    begin
--        <Architecture의 동작을 기술>
--    end architecture <Architecture의 이름>

-- architecture 선언 
architecture Behavioral of FOUR_INPUT_OR is

    -- component 생성
    component test
        port(A, B : in std_logic ;
             C    : out std_logic);
    end component test;
    
    -- 각 component를 연결하는 내부 신호선 선언
        signal N1, N2 : std_logic;
begin
    U1 : test port map(A => N1, B => N2, C => O);
    U2 : test port map(A => N1, B => A2, C => N1);
    U3 : test port map(A => A3, B => A4, C => N2);
end architecture Behavioral;
