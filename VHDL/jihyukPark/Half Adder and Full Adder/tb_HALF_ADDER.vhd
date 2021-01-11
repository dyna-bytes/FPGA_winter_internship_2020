----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/08 15:07:59
-- Design Name: 
-- Module Name: tb_HALF_ADDER - Behavioral
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
USE IEEE.std_logic_arith.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_HALF_ADDER is
--  Port ( );
end tb_HALF_ADDER;

architecture Behavioral of tb_HALF_ADDER is
    component HALF_ADDER 
    Port (INPUT : IN std_logic_vector(1 DOWNTO 0);
        SUM   : OUT std_logic;
        CARRY : OUT std_logic );
    END component;
    
    SIGNAL INPUT : std_logic_vector(1 DOWNTO 0);
    signal SUM   : std_logic;
    signal CARRY : std_logic;
begin
    U0 : HALF_ADDER port MAP (INPUT => INPUT, SUM => SUM, CARRY => CARRY);
    
    INPUT0 : PROCESS
    begin
        INPUT(0) <= '0';
        WAIT FOR 10 NS;
        INPUT(0) <= '1';
        WAIT FOR 10 NS;
    END PROCESS;

    INPUT1 : PROCESS
    begin
        INPUT(1) <= '0';
        WAIT FOR 20 NS;
        INPUT(1) <= '1';
        WAIT FOR 20 NS;
    END PROCESS;
end Behavioral;
