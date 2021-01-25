----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/07 16:55:44
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

entity FOUR_INPUT_OR is
    port(A1, A2, A3, A4 : in  std_logic;
         O : out std_logic);
--  Port ( );
end FOUR_INPUT_OR;

architecture Behavioral of FOUR_INPUT_OR is
    component BLACK_BOX
        port(A, B : in  std_logic;
             C    : out std_logic);
    end component;
    signal N1, N2 : std_logic;
begin
    -- specified connection
    U1 : BLACK_BOX port map(A => N1, B => N2, C => O);
    U2 : BLACK_BOX port map(A => A1, B => A2, C => N1);
    U3 : BLACK_BOX port map(A => A3, B => A4, C => N2);
    
    -- positionwise connection
    -- U1 : BLACK_BOX port map(N1, N2, OUT);
end Behavioral;
