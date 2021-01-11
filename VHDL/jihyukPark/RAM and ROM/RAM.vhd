----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/11 12:52:41
-- Design Name: 
-- Module Name: RAM - Behavioral
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
USE IEEE.std_logic_unsigned.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RAM is
  Port (CLOCK : IN std_logic; 
        WRITE_ENABLE : IN std_logic_vector(0 downto 0);
        ADDRESS : IN std_logic_vector(3 DOWNTO 0);
        DATA_INPUT : IN std_logic_VECTOR(3 DOWNTO 0);
        DATA_OUTPUT : OUT std_logic_vector(3 DOWNTO 0) );
        
end RAM;

architecture Behavioral of RAM is
    component SPRAM_16X4
    PORT( CLKA : IN std_logic;
          WEA : IN std_logic_vector(0 DOWNTO 0);
          ADDRA : IN std_logic_vector(3 DOWNTO 0);
          DINA : IN std_logic_vector(3 DOWNTO 0);
          DOUTA : OUT std_logic_vector(3 DOWNTO 0));
    END component;
begin
    RAM : SPRAM_16X4 PORT MAP(CLKA => CLOCK, WEA => WRITE_ENABLE, ADDRA => ADDRESS, DINA => DATA_INPUT, DOUTA => DATA_OUTPUT);

end Behavioral;
