----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/11 17:11:58
-- Design Name: 
-- Module Name: clock_top - Behavioral
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

entity clock_top is
  Port (fpga_clk : in std_logic;
         rst : in std_logic;
         clk_1MHz : out std_logic;
         clk_1KHz : out std_logic;
         clk_100Hz :out std_logic;
         clk_1Hz : out std_logic);
  
end clock_top;

architecture Behavioral of clock_top is
    constant M : integer := 10**6; -- Mega
    constant K : integer := 10**3; -- Kilo
    
    signal clk_1MHz_temp : std_logic := '0';
    signal clk_1KHz_temp : std_logic := '0';
    signal clk_100Hz_temp : std_logic := '0';
    
    component clock_generator
    generic(from_hz : integer;
            to_hz : integer;
            reverse_clk : std_logic := '0');
    port   (i_clk : in std_logic;
            rst : in std_logic;
            o_clk : out std_logic);
    end component;
    
begin
 
    clk_1MHz <= clk_1MHz_temp;
    clk_1KHz <= clk_1KHz_temp;
    clk_100Hz <= clk_100Hz_temp;   
    
    from_50MHz_to_1MHz : clock_generator 
    generic map ( from_hz => 50*M, to_hz => 1*M)
    port map (i_clk => fpga_clk, rst => rst, o_clk => clk_1MHz_temp);                                        
    
    from_1MHz_to_50MHz : clock_generator
    generic map ( from_hz => 50*M, to_hz => 1*K)
    port map (i_clk => fpga_clk, rst => rst, o_clk => clk_1KHz_temp);    

    from_1KHz_to_100Hz : clock_generator
    generic map ( from_hz => 1*K, to_hz => 100, reverse_clk => '1')
    port map (i_clk => clk_1KHz_temp, rst => rst, o_clk => clk_100Hz_temp); 

    from_1KHz_to_1Hz : clock_generator
    generic map ( from_hz => 1*K, to_hz => 1)
    port map (i_clk => clk_1KHz_temp, rst => rst, o_clk => clk_1Hz);     
       
end Behavioral;
