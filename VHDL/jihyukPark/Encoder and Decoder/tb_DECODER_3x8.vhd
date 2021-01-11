----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/08 14:18:57
-- Design Name: 
-- Module Name: tb_DECODER_3x8 - Behavioral
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

entity tb_DECODER_3x8 is
--  Port ( );
end tb_DECODER_3x8;

architecture Behavioral of tb_DECODER_3x8 is
    component DECODER_3x8
    PORT( INPUT : IN std_logic_vector(2 DOWNTO 0);
          OUTPUT : OUT std_logic_vector(7 DOWNTO 0));
    END component;
    
    signal INPUT : std_logic_vector(2 DOWNTO 0) := (OTHERS => '0');
    signal OUTPUT : std_logic_vector(7 DOWNTO 0);
begin
    U0 : DECODER_3x8 PORT MAP(INPUT => INPUT, OUTPUT => OUTPUT);
    
    INPUT0 : PROCESS
    BEGIN
        INPUT(0) <= '0';
        WAIT FOR 10 NS;
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

end Behavioral;
