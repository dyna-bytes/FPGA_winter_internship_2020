----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/08 13:20:15
-- Design Name: 
-- Module Name: tb_MUX_4to1 - Behavioral
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
use IEEE.std_logic_arith.ALL;
use IEEE.std_logic_unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_MUX_4to1 is
--  Port ( );
end tb_MUX_4to1;

architecture Behavioral of tb_MUX_4to1 is
    component MUX_4to1
    PORT( INPUT : IN std_logic_vector(3 downto 0);
          SEL   : IN std_logic_vector(1 downto 0);
          OUTPUT: OUT std_logic);
    END component;
    
    signal INPUT : std_logic_vector(3 downto 0) := (OTHERS => '0');
    signal SEL   : std_logic_vector(1 downto 0) := (OTHERS => '0');
    signal OUTPUT: std_logic;
    
begin
    U0 : MUX_4to1 PORT MAP(INPUT => INPUT, SEL => SEL, OUTPUT => OUTPUT);
    
    INPUT0 : process
    BEGIN
        INPUT(0) <= '0';
        wait for 10 NS;
        INPUT(0) <= '1';
        WAIT FOR 10 NS;
    END PROCESS;
    
    INPUT1 : PROCESS
    BEGIN
        INPUT(1) <= '0';
        WAIT FOR 20 NS;
        INPUT(1) <= '1';
        WAIT FOR 20 NS;
    END PROCESS;
    
    INPUT2 : PROCESS
    BEGIN
        INPUT(2) <= '0';
        WAIT FOR 40 NS;
        INPUT(2) <= '1';
        WAIT FOR 40 NS;
    END PROCESS;
    
    INPUT3 : PROCESS
    BEGIN
        INPUT(3) <= '0';
        WAIT FOR 80 NS;
        INPUT(3) <= '1';
        WAIT FOR 80 NS;
    END PROCESS;
    
    SEL0 : PROCESS
    BEGIN
        SEL(0) <= '0';
        WAIT FOR 160 NS;
        SEL(0) <= '1';
        WAIT FOR 160 NS;
    END PROCESS;
    
    SEL1 : PROCESS
    BEGIN
        SEL(1) <= '0';
        WAIT FOR 320 NS;
        SEL(1) <= '1';
        WAIT FOR 320 NS;
    END PROCESS;
end Behavioral;
