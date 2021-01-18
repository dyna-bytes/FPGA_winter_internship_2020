----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/18 23:18:31
-- Design Name: 
-- Module Name: tb_SCAN_CODE_ROM_128X8 - Behavioral
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
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_SCAN_CODE_ROM_128X8 is
--  Port ( );
end tb_SCAN_CODE_ROM_128X8;

architecture Behavioral of tb_SCAN_CODE_ROM_128X8 is
    component SCAN_CODE_ROM_128X8
    port(CLKA : in std_logic;
         ADDRA : in std_logic_vector(6 downto 0);
         DOUTA : out std_logic_vector(7 downto 0));
    end component;
    
    signal CLOCK : std_logic := '0';
    signal ADDRESS : std_logic_vector(6 downto 0) := (others => '0');
    signal DATA : std_logic_vector(7 downto 0);
begin

    uut : SCAN_CODE_ROM_128X8 port map
    (CLKA => CLOCK, ADDRA => ADDRESS, DOUTA => DATA);
    
    
    CLOCK0: process
  begin
    CLOCK <= '0';
    wait for 10 ns;
    CLOCK <= '1';
    wait for 10 ns;
  end process;

  ADDRESS0: process
  begin
    ADDRESS <= ADDRESS + '1';
    wait for 20 ns;
 
  end process;

end Behavioral;
