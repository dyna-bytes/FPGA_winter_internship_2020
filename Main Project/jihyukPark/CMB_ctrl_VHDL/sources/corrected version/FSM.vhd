----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/12 13:54:55
-- Design Name: 
-- Module Name: FSM - Behavioral
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
use IEEE.std_logic_unsigned.ALL;
use IEEE.numeric_std.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FSM is
  Port (stp_clk : IN std_logic;
        sys_init_ctrl : IN std_logic; 
        trg_ctrl : IN std_logic;
        sw : IN std_logic_vector(7 downto 0);
        
        wrk_stat : OUT std_logic;
        rot_en : OUT std_logic;
        adc_en : OUT std_logic;
        rf_sw : OUT std_logic_vector(3 downto 0);    
        rot_count : OUT  std_logic_vector(9 downto 0) 
        );
end FSM;

architecture Behavioral of FSM is
    signal wrk_stat_temp : std_logic := '0';
    signal rot_en_temp : std_logic := '0';
    signal adc_en_temp : std_logic := '0';
    signal rf_sw_temp : std_logic_vector(3 downto 0) := (others => '0');
    signal prcs_count : std_logic_vector(7 downto 0) := (others => '0');
    signal rot_count_temp  : std_logic_vector(9 downto 0) := (others => '0');
begin
     wrk_stat <= wrk_stat_temp;
	 rot_en   <= rot_en_temp;
	 adc_en   <= adc_en_temp;
	 rf_sw    <= rf_sw_temp;
	 rot_count<= rot_count_temp;
	 
    ------ Work State Control Process ------
    work_state_controller : process(stp_clk, trg_ctrl, sys_init_ctrl, sw)
    begin 
	------ Counted Rotation Checker -------
        if rot_count_temp = 720 then
            wrk_stat_temp <= '0';
        end if;
	 
	------ Trigger Control Process ------
        if trg_ctrl = '1' then
            wrk_stat_temp <= '1';
        end if;

    
    ------ System Initialiazation Process ------
    if sys_init_ctrl = '1' then
        wrk_stat_temp    <= '0';
        rot_en_temp      <= '0';
        adc_en_temp      <= '0';
        rf_sw_temp       <= "0000";
        prcs_count  <= (others => '0');
        rot_count_temp   <= (others => '0');
 
    ------ Process Counter (State Logic & Register) ------
      elsif wrk_stat_temp = '1' and rising_edge(stp_clk) then
        prcs_count <= prcs_count + '1'; -- acts as Register and very simple Next State Logic at the same time.
                                        -- "prcs_count" is kind of STATE variable.
        ------ Output Logic ------
        case TO_INTEGER(unsigned(prcs_count)) is
            when 1 =>            rot_en_temp <= '1';
            when 6 =>            rot_en_temp <= '0';
            when 106 =>          case TO_INTEGER(unsigned(SW)) is
                                      when 0 => rf_sw_temp <= "0001";
                                      when 1 => rf_sw_temp <= "0001";
                                      when 2 => rf_sw_temp <= "0010";
                                      when 3 => rf_sw_temp <= "0100";
                                      when others =>
                                 end case;
                                    
            when 109 =>         adc_en_temp <= '1';
            when 139 =>         adc_en_temp <= '0';
                                case TO_INTEGER(unsigned(SW)) is
                                    when 0 => rf_sw_temp <= "0010";
                                    when 1 => rf_sw_temp <= "1000";
                                    when 2 => rf_sw_temp <= "1000";
                                    when 3 => rf_sw_temp <= "1000";
                                    when others =>
                                end case;
                                
            when 142 =>			adc_en_temp <= '1';
            when 172 =>         adc_en_temp <= '0';
                                case TO_INTEGER(unsigned(SW)) is
                                    when 0 => rf_sw_temp <= "0100";
                                    when OTHERS => rf_sw_temp <= "0000";
                                              prcs_count <= (others => '0');
                                              rot_count_temp <= rot_count_temp + 1;
                                end case;
                                
            when 175 =>         adc_en_temp <= '1';
            when 205 =>         adc_en_temp <= '0';
                                rf_sw_temp <= "1000";
            when 208 =>         adc_en_temp <= '1';
            when 238 =>         adc_en_temp <= '0';
                                rf_sw_temp <= "0000";
                                prcs_count <= (others => '0');
                                rot_count_temp <= rot_count_temp + 1;	
            when others =>                    
        end case;
    end if;
    end process;


end Behavioral;
