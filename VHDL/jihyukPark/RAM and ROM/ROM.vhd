----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/11 12:34:46
-- Design Name: 
-- Module Name: ROM - Behavioral
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

entity ROM is
  Port (CLOCK : IN std_logic;
        ADDRESS : IN std_logic_vector(3 DOWNTO 0);
        DATA : OUT std_logic_vector(7 DOWNTO 0));
end ROM;

architecture Behavioral of ROM is
    component ROM_16X8
    PORT(CLKA  : IN std_logic;
         ADDRA : IN std_logic_vector(3 DOWNTO 0);
         DOUTA : OUT std_logic_vector(7 downto 0));
    END component;
begin
    ROM : ROM_16X8 PORT MAP(CLKA => CLOCK, ADDRA => ADDRESS, DOUTA => DATA);
end Behavioral;
