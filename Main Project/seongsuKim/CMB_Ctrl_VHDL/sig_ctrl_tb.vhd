----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/20 12:56:10
-- Design Name: 
-- Module Name: sig_ctrl_tb - Behavioral
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

entity sig_ctrl_tb is
--  Port ( );
end sig_ctrl_tb;

architecture Behavioral of sig_ctrl_tb is
    component sig_ctrl
    port(clk: in std_logic;
         sig: in std_logic;
         sig_ctrl: out std_logic); 
    end component;
    
    signal clk: std_logic := '0';
    signal sig: std_logic := '0';
    signal sig_control: std_logic := '0';
--    signal sig_b: std_logic := '0';
begin
    uut: sig_ctrl port map(clk => clk, sig => sig, sig_ctrl => sig_control);
    clk0 : process
    begin
        clk <= '0';
        wait for 5 ns;
        clk <= '1';
        wait for 5 ns;
    end process;

    sig0: process
    begin
        sig <= '0';
        wait for 40 ns;
        sig <= '1';
        wait for 40 ns;
    end process;

end Behavioral;
