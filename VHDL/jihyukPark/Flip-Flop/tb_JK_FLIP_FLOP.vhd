----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/08 17:16:59
-- Design Name: 
-- Module Name: tb_JK_FLIP_FLOP - Behavioral
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

entity tb_JK_FLIP_FLOP is
--  Port ( );
end tb_JK_FLIP_FLOP;

architecture Behavioral of tb_JK_FLIP_FLOP is
    COMPONENT JK_FLIP_FLOP
    Port (CLOCK : IN std_logic;
            J     : IN std_logic;
            K     : IN std_logic;
            ENABLE : IN std_logic;
            Q : OUT std_logic;
            NOT_Q : OUT std_logic
             );   
     END component;
     
      signal CLOCK : std_logic := '0';
      signal J : std_logic := '0';
      signal K : std_logic := '0';
      signal ENABLE : std_logic := '0';
      signal Q : std_logic;
      signal NOT_Q : std_logic;
begin
    JKFF : JK_FLIP_FLOP PORT MAP (CLOCK => CLOCK, J => J, K => K, ENABLE => ENABLE, Q => Q, NOT_Q => NOT_Q);
    
    CLOCK0: process
  begin
    CLOCK <= '0';
    wait for 10 ns;
    CLOCK <= '1';
    wait for 10 ns;
  end process;

  J_INPUT0: process
  begin
    J <= '0';
    wait for 20 ns;
    J <= '1';
    wait for 20 ns;
  end process;

  K_INPUT0: process
  begin
    K <= '0';
    wait for 40 ns;
    K <= '1';
    wait for 40 ns;
  end process;

  ENABLE0: process
  begin
    ENABLE <= '0';
    wait for 80 ns;
    ENABLE <= '1';
    wait for 80 ns;
  end process;


end Behavioral;
