----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/08 15:31:39
-- Design Name: 
-- Module Name: tb_FULL_ADDER - Behavioral
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

entity tb_FULL_ADDER is
--  Port ( );
end tb_FULL_ADDER;

architecture Behavioral of tb_FULL_ADDER is
 component FULL_ADDER 
 PORT (INPUT : IN std_logic_vector(1 DOWNTO 0);
        CARRY_INPUT : IN std_logic;
        SUM : OUT std_logic;
        CARRY_OUTPUT : OUT std_logic   );
 END component;
 
 component FULL_ADDER_v2 
 PORT (INPUT : IN std_logic_vector(1 DOWNTO 0);
        CARRY_INPUT : IN std_logic;
        SUM : OUT std_logic;
        CARRY_OUTPUT : OUT std_logic   );
 END component;
 
 
 SIGNAL INPUT : std_logic_vector(1 DOWNTO 0) := (OTHERS => '0');
 SIGNAL CARRY_INPUT : std_logic := '0';
 SIGNAL SUM : std_logic;
 SIGNAL CARRY_OUTPUT : std_logic;
 
begin
 -- U1 : FULL_ADDER PORT MAP(INPUT => INPUT, CARRY_INPUT => CARRY_INPUT, SUM => SUM, CARRY_OUTPUT =>CARRY_OUTPUT);
    U2 : FULL_ADDER_v2 PORT MAP(INPUT => INPUT, CARRY_INPUT => CARRY_INPUT, SUM => SUM, CARRY_OUTPUT =>CARRY_OUTPUT);   
      INPUT0: process
      begin
        INPUT(0) <= '0';
        wait for 10 ns;
        INPUT(0) <= '1';
        wait for 10 ns;
      end process;
    
      INPUT1: process
      begin
        INPUT(1) <= '0';
        wait for 20 ns;
        INPUT(1) <= '1';
        wait for 20 ns;
      end process;
    
      CARRY_IN: process
      begin
        CARRY_INPUT <= '0';
        wait for 40 ns;
        CARRY_INPUT <= '1';
        wait for 40 ns;
      end process;

end Behavioral;
