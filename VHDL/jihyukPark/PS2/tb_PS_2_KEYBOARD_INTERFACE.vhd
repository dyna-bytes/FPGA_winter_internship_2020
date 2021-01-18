----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/19 00:27:38
-- Design Name: 
-- Module Name: tb_PS_2_KEYBOARD_INTERFACE - Behavioral
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

entity tb_PS_2_KEYBOARD_INTERFACE is
--  Port ( );
end tb_PS_2_KEYBOARD_INTERFACE;

architecture Behavioral of tb_PS_2_KEYBOARD_INTERFACE is
 COMPONENT PS_2_KEYBOARD_INTERFACE
  PORT(
       CLOCK : IN std_logic;
       RESET : IN std_logic;
       KEY_CLOCK : IN std_logic;
       KEY_DATA : IN std_logic;
       LED : OUT std_logic_vector(7 downto 0);
       SEG_DIGIT : OUT std_logic_vector(3 downto 0);
       SEG_LED : OUT std_logic_vector(7 downto 0)
      );
  END COMPONENT;

  signal CLOCK : std_logic := '0';
  signal RESET : std_logic := '0';
  signal KEY_CLOCK : std_logic := '0';
  signal KEY_DATA : std_logic := '0';
  signal LED : std_logic_vector(7 downto 0);
  signal SEG_DIGIT : std_logic_vector(3 downto 0);
  signal SEG_LED : std_logic_vector(7 downto 0);

BEGIN
  uut: PS_2_KEYBOARD_INTERFACE PORT MAP (
       CLOCK => CLOCK,
       RESET => RESET,
       KEY_CLOCK => KEY_CLOCK,
       KEY_DATA => KEY_DATA,
       LED => LED,
       SEG_DIGIT => SEG_DIGIT,
       SEG_LED => SEG_LED
     );

  CLOCK0: process
  begin
    CLOCK <= '0';
    wait for 10 ns;
    CLOCK <= '1';
    wait for 10 ns;
  end process;

  RESET0: process
  begin
    RESET <= '0';
    wait for 1000 ns;
    RESET <= '1';
    wait;
  end process;

  KEY_CLOCK0: process
  begin
    KEY_CLOCK <= '0';
    wait for 10 ns;
    KEY_CLOCK <= '1';
    wait for 10 ns;
  end process;

  KEY_DATA0: process
  begin
    KEY_DATA <= '1';
    wait for 10 ns;
    -- Start Bit -- Keyboard '0' Key Scan Code
    KEY_DATA <= '0';
    wait for 20 ns;
    -- Scan Code
    KEY_DATA <= '1';
    wait for 20 ns;
    KEY_DATA <= '0';
    wait for 20 ns;
    KEY_DATA <= '1';
    wait for 20 ns;
    KEY_DATA <= '0';
    wait for 20 ns;
    KEY_DATA <= '0';
    wait for 20 ns;
    KEY_DATA <= '0';
    wait for 20 ns;
    KEY_DATA <= '1';
    wait for 20 ns;
    KEY_DATA <= '0';
    wait for 20 ns;
    -- Odd Parity
    KEY_DATA <= '0';
    wait for 20 ns;
    -- Stop Bit
    KEY_DATA <= '1';
    wait for 10 ns;
    KEY_DATA <= '1';
    wait for 10 ns;
    -- Start Bit -- Keyboard '1' Key Scan Code
    KEY_DATA <= '0';
    wait for 20 ns;
    -- Scan Code
    KEY_DATA <= '0';
    wait for 20 ns;
    KEY_DATA <= '1';
    wait for 20 ns;
    KEY_DATA <= '1';
    wait for 20 ns;
    KEY_DATA <= '0';
    wait for 20 ns;
    KEY_DATA <= '1';
    wait for 20 ns;
    KEY_DATA <= '0';
    wait for 20 ns;
    KEY_DATA <= '0';
    wait for 20 ns;
    KEY_DATA <= '0';
    wait for 20 ns;
    -- Odd Parity
    KEY_DATA <= '0';
    wait for 20 ns;
    -- Stop Bit
    KEY_DATA <= '1';
    wait for 10 ns;
  end process;
end Behavioral;
