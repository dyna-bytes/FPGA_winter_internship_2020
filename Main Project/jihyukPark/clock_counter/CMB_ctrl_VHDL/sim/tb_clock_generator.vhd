----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/11 16:36:09
-- Design Name: 
-- Module Name: tb_clock_generator - Behavioral
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
use work.myPack.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_clock_generator is
--  Port ( );
end tb_clock_generator;

architecture Behavioral of tb_clock_generator is
--    component clock_generator
--       generic(from_hz : integer;
--            to_hz : integer);
--       port(i_clk : in std_logic;
--            rst : in std_logic;
--            o_clk : out std_logic);
--       end component;
       
       component clock_top 
        port(fpga_clk : in std_logic;
              rst : in std_logic;
              clk_1Hz : out std_logic);
       end component;
       
       signal clock : std_logic := '0';    
       signal reset : std_logic := '0';
       signal o_clk : std_logic; 
begin
    uut : clock_top port map(fpga_clk => clock, rst => reset, clk_1Hz => o_clk);
                          
     CLOCK0: process
      begin
        CLOCK <= '0';
        wait for 5 ns;
        CLOCK <= '1';
        wait for 5 ns;
      end process;
                      

end Behavioral;
