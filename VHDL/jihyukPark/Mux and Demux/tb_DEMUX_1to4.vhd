----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/08 13:48:05
-- Design Name: 
-- Module Name: tb_DEMUX_1to4 - Behavioral
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

entity tb_DEMUX_1to4 is
--  Port ( );
end tb_DEMUX_1to4;

architecture Behavioral of tb_DEMUX_1to4 is
    component DEMUX_1to4
    PORT(INPUT : IN STD_LOGIC;
         SEL   : IN std_logic_vector(1 DOWNTO 0);
         OUTPUT: OUT std_logic_vector(3 DOWNTO 0));
    END component;
    
    SIGNAL INPUT : std_logic := '0';
    SIGNAL SEL   : std_logic_vector(1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL OUTPUT: std_logic_vector(3 DOWNTO 0) := (OTHERS => '0');
begin
    U1 : DEMUX_1TO4
    PORT MAP(INPUT => INPUT, SEL => SEL, OUTPUT => OUTPUT);
    
    INPUT_SIG : PROCESS
    BEGIN
        INPUT <= '0';
        wait FOR 10 NS;
        INPUT <= '1';
        WAIT FOR 10 NS;
    END PROCESS;
    
    SEL0 : PROCESS
    BEGIN
        SEL(0) <= '0';
        WAIT FOR 20 NS;
        SEL(0) <= '1';
        WAIT FOR 20 NS;
    END PROCESS;
    
    SEL1 : PROCESS
    BEGIN
        SEL(1) <= '0';
        WAIT FOR 40 NS;
        SEL(1) <= '1';
        WAIT FOR 40 NS;
    END PROCESS;

end Behavioral;
