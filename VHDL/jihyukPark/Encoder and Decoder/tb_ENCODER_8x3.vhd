----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/08 14:43:10
-- Design Name: 
-- Module Name: tb_ENCODER_8x3 - Behavioral
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

entity tb_ENCODER_8x3 is
--  Port ( );
end tb_ENCODER_8x3;

architecture Behavioral of tb_ENCODER_8x3 is
    component ENCODER_8x3
    PORT(INPUT : IN std_logic_vector(7 downto 0);
        OUTPUT : OUT std_logic_vector(2 downto 0));
    END component;
    
    signal INPUT :  std_logic_vector(7 downto 0) := (OTHERS => '0');
    signal OUTPUT : std_logic_vector(2 downto 0);
begin
    U1 : ENCODER_8X3 PORT MAP(INPUT => INPUT, OUTPUT => OUTPUT);
    
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

  INPUT2: process
  begin
    INPUT(2) <= '0';
    wait for 40 ns;
    INPUT(2) <= '1';
    wait for 40 ns;
  end process;

  INPUT3: process
  begin
    INPUT(3) <= '0';
    wait for 80 ns;
    INPUT(3) <= '1';
    wait for 80 ns;
  end process;

  INPUT4: process
  begin
    INPUT(4) <= '0';
    wait for 160 ns;
    INPUT(4) <= '1';
    wait for 160 ns;
  end process;

  INPUT5: process
  begin
    INPUT(5) <= '0';
    wait for 320 ns;
    INPUT(5) <= '1';
    wait for 320 ns;
  end process;

  INPUT6: process
  begin
    INPUT(6) <= '0';
    wait for 640 ns;
    INPUT(6) <= '1';
    wait for 640 ns;
  end process;

  INPUT7: process
  begin
    INPUT(7) <= '0';
    wait for 1280 ns;
    INPUT(7) <= '1';
    wait for 1280 ns;
  end process;
end Behavioral;
