----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/08 18:56:41
-- Design Name: 
-- Module Name: tb_MOORE_MACHINE - Behavioral
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

entity tb_MOORE_MACHINE is
--  Port ( );
end tb_MOORE_MACHINE;

ARCHITECTURE behavior OF tb_MOORE_MACHINE IS
  COMPONENT MOORE_MACHINE
  PORT(
       CLOCK : IN std_logic;
       RESET : IN std_logic;
       INPUT : IN std_logic;
       OUTPUT : OUT std_logic_vector(2 downto 0)
      );
  END COMPONENT;

  signal CLOCK : std_logic := '0';
  signal RESET : std_logic := '0';
  signal INPUT : std_logic := '0';
  signal OUTPUT : std_logic_vector(2 downto 0);

BEGIN
  u0 : MOORE_MACHINE PORT MAP (
       CLOCK => CLOCK,
       RESET => RESET,
       INPUT => INPUT,
       OUTPUT => OUTPUT
     );

  CLOCK0: process
  begin
    CLOCK <= '0';
    wait for 10 ns;
    CLOCK <= '1';
    wait for 10 ns;
  end process;

  INPUT0: process
  begin
    INPUT <= '0';
    wait for 20 ns;
    INPUT <= '1';
    wait for 20 ns;
  end process;

  RESET0: process
  begin
    RESET <= '0';
    wait for 160 ns;
    RESET <= '1';
    wait for 160 ns;
  end process;
END;