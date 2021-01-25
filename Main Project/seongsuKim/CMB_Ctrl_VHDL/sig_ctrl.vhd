----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/12 13:49:56
-- Design Name: 
-- Module Name: sig_ctrl - Behavioral
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

entity sig_ctrl is
    port(clk: in std_logic;
         sig: in std_logic;
         sig_ctrl: out std_logic);
end sig_ctrl;

architecture Behavioral of sig_ctrl is
    signal sig_b: std_logic := '0';
begin
    making_sig_buffer: process(clk, sig)
    begin
        if clk'event and clk = '1' then
            sig_b <= sig;
        end if;
--        sig_ctrl <= sig and not sig_b; -- sig_ctrl becomes 1 when sig 0 -> 1
    end process;
    
    making_sig_ctrl: process(sig_b, sig)
    begin
        sig_ctrl <= sig and not sig_b; -- sig_ctrl becomes 1 when sig 0 -> 1
    end process;
    
--    making_sig_ctrl: process(clk)
--    begin
--        if clk'event and clk = '1' then
--            sig_b <= sig;
--        end if;
--        sig_ctrl <= sig and not sig_b;
--    end process;
end Behavioral;
