----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/20 13:44:39
-- Design Name: 
-- Module Name: obs_tb - Behavioral
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

entity obs_tb is
--  Port ( );
end obs_tb;

architecture Behavioral of obs_tb is
    component obs
    port(sys_init_ctrl: in std_logic;
         stp_clk: in std_logic;
         trg_ctrl: in std_logic;
         sw: in std_logic_vector (7 downto 0);
         rot_en: out std_logic;
         rf_sw: out std_logic_vector (3 downto 0);
         wrk_stat: out std_logic;
         adc_en: out std_logic;
         rot_count: out std_logic_vector (9 downto 0));
    end component;
    
    signal sys_init_ctrl: std_logic := '0';
    signal stp_clk: std_logic := '0';
    signal trg_ctrl: std_logic := '0';
    signal sw: std_logic_vector (7 downto 0) := "00000000";
    signal rot_en: std_logic := '0';
    signal rf_sw: std_logic_vector (3 downto 0) := "0000";
    signal wrk_stat: std_logic := '0';
    signal adc_en: std_logic:= '0';
    signal rot_count: std_logic_vector (9 downto 0) := "0000000000";
--    signal wrk_stat_temp: std_logic := '0';
--    signal rot_count_temp: std_logic_vector (9 downto 0) := "0000000000";
--    signal prcs_count: std_logic_vector (7 downto 0) := "00000000";
begin
    uut: obs port map(sys_init_ctrl => sys_init_ctrl, stp_clk => stp_clk, trg_ctrl => trg_ctrl, sw => sw, rot_en => rot_en, 
        rf_sw => rf_sw, wrk_stat => wrk_stat, adc_en => adc_en, rot_count => rot_count);
    clk0: process
    begin
        stp_clk <= '0';
        wait for 5 ns;
        stp_clk <= '1';
        wait for 5 ns;
    end process;
    
    sys_init_ctrl0: process
    begin
        sys_init_ctrl <= '1';
        wait for 10ns;
        sys_init_ctrl <= '0';
        wait;
    end process;

    trg_ctrl0: process
    begin
        trg_ctrl <= '1';
        wait;
    end process;
    
    sw0: process
    begin
        sw <= "00000000";
        wait;
--        sw <= "00000001";
--        wait for 160 ns;
--        sw <= "00000010";
--        wait for 160 ns;
--        sw <= "00000011";
--        wait for 160 ns;
    end process;
end Behavioral;
