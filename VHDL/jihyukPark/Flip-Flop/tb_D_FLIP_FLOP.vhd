----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/08 16:57:34
-- Design Name: 
-- Module Name: tb_D_FLIP_FLOP - Behavioral
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

entity tb_D_FLIP_FLOP is
--  Port ( );
end tb_D_FLIP_FLOP;

architecture Behavioral of tb_D_FLIP_FLOP is
    component D_FLIP_FLOP
    Port (CLOCK : IN std_logic;
        DATA_INPUT : IN std_logic;
        Q   : OUT std_logic;
        NOT_Q : OUT std_logic
         );
     END component;
     
     signal CLOCK : std_logic := '0';
     signal DATA_INPUT : std_logic := '0';
     signal Q : std_logic;
     signal NOT_Q : std_logic;
     
begin
    DFF : D_FLIP_FLOP PORT MAP(CLOCK, DATA_INPUT, Q, NOT_Q);
    
    

      CLOCK0: process
      begin
        CLOCK <= '0';
        wait for 10 ns;
        CLOCK <= '1';
        wait for 10 ns;
      end process;
    
      DATA_INPUT0: process
      begin
        DATA_INPUT <= '0';
        wait for 20 ns;
        DATA_INPUT <= '1';
        wait for 20 ns;
      end process;

end Behavioral;
