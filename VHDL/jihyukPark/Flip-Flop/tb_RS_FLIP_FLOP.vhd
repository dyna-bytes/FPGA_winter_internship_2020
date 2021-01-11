----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/08 16:38:58
-- Design Name: 
-- Module Name: tb_RS_FLIP_FLOP - Behavioral
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

entity tb_RS_FLIP_FLOP is
--  Port ( );
end tb_RS_FLIP_FLOP;

architecture Behavioral of tb_RS_FLIP_FLOP is
    component RS_FLIP_FLOP
    Port (SET : IN std_logic;
        RESET : IN std_logic;
        CLOCK : IN  std_logic;
        ENABLE : IN std_logic;
        Q     : OUT std_logic;
        NOT_Q : OUT std_logic
        );
     END component;
     
     SIGNAL   SET :  std_logic;
     SIGNAL   RESET : std_logic;
     SIGNAL   CLOCK : std_logic;
     SIGNAL   ENABLE : std_logic;
     SIGNAL   Q     : std_logic;
     SIGNAL   NOT_Q : std_logic;
begin
    RSFF : RS_FLIP_FLOP PORT MAP(SET, RESET, CLOCK, ENABLE, Q, NOT_Q);
    
  CLOCK0: process
  begin
    CLOCK <= '0';
    wait for 15 ns;
    CLOCK <= '1';
    wait for 15 ns;
  end process;

  ENABLE0: process
  begin
    ENABLE <= '0';
    wait for 160 ns;
    ENABLE <= '1';
    wait;
  end process;

  SET_RESET: process
  begin
    SET <= '0';
    RESET <= '1';
    wait for 50 ns;
    
    SET <= '1';
    RESET <= '0';
    wait for 50 ns;
    
    SET <= '0';
    RESET <= '0';
    wait for 50 ns;
    
    SET <= '0';
    RESET <= '1';
    wait for 50 ns;
    
    SET <= '1';
    RESET <= '0';
    wait for 50 ns;
    
    SET <= '0';
    RESET <= '0';
    wait for 50 ns;
  end process;
end Behavioral;
