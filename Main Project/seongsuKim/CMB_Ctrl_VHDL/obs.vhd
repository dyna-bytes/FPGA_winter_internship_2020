----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/13 16:31:29
-- Design Name: 
-- Module Name: obs - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity obs is
    port(sys_init_ctrl: in std_logic;
         stp_clk: in std_logic;
         trg_ctrl: in std_logic;
         sw: in std_logic_vector (7 downto 0);
         rot_en: out std_logic;
         rf_sw: out std_logic_vector (3 downto 0);
         wrk_stat: out std_logic;
         adc_en: out std_logic;
         rot_count: out std_logic_vector (9 downto 0));
end obs;

architecture Behavioral of obs is
    signal wrk_stat_temp: std_logic;
    signal rot_count_temp: std_logic_vector (9 downto 0);
    signal prcs_count: std_logic_vector (7 downto 0);
begin
	process (sys_init_ctrl, stp_clk, trg_ctrl, sw, wrk_stat_temp, prcs_count)
	begin
		if trg_ctrl = '1' then
			wrk_stat_temp <= '1';
		end if;

		if sys_init_ctrl = '1' then
			rot_en		<= '0';
			adc_en		<= '0';
			wrk_stat_temp	<= '0';
			rf_sw		<= "0000"; -- radiation frequency switching, getting certain freq.
			prcs_count  <= (others => '0');
			rot_count_temp	<= (others => '0');
			
		elsif (wrk_stat_temp = '1') and (stp_clk'event and stp_clk = '1') then
			
			prcs_count <= prcs_count + 1;
			if sw = "00000000" and wrk_stat_temp = '1' then	
				case prcs_count is                                      --  ms  --
				when "00000001" => rot_en <= '1';			    		--   1	-- Stepping motor clock injection (moving 0.5 deg <= 5 clocks of 100Hz) --
				when "00000110" => rot_en <= '0';                      --   6	-- Reflector stable time == 1000ms --
				when "01101010" => rf_sw <= "0001";                   -- 106  -- RF switch control (300K calibration source) --
				when "01101101" => adc_en <= '1';                      -- 109	-- After 30ms, trigger for ADC board (300 clocks of 1kHz) --
				when "10001011" => adc_en <= '0'; rf_sw <= "0010";    -- 139	-- RF switch control (77K calibration source) --
				when "10001110" => adc_en <= '1';	                    -- 142	-- After 30ms, trigger for ADC board (300 clocks of 1kHz) --
                when "10101100" => adc_en <= '0'; rf_sw <= "0100";    -- 172	-- RF switch control (4K calibration source) --
                when "10101111" => adc_en <= '1';                      -- 175	-- After 30ms, trigger for ADC board (300 clocks of 1kHz) --
                when "11001101" => adc_en <= '0'; rf_sw <= "1000";    -- 205	-- RF switch control (Observation data) --
                when "11010000" => adc_en <= '1';                      -- 208  -- After 30ms, trigger for ADC board (300 clocks of 1kHz) --
                when "11101110" => adc_en <= '0'; rf_sw <= "0000"; prcs_count <= (others => '0'); rot_count_temp <= rot_count_temp + 1; 
                -- 238	-- 1 point process complete and counting initialize --   -- Rotation Count Information for DAQ Board --
			    when others => 
			    end case;
			    
			elsif sw = "00000001" and wrk_stat_temp = '1' then
			    case prcs_count is
			    when "00000001" => rot_en <= '1';                       --   1	-- Stepping motor clock injection (moving 0.5 deg <= 5 clocks of 100Hz) --
                when "00000110" => rot_en <= '0';                       --   6	-- Reflector stable time == 1000ms --
                when "01101010" => rf_sw <= "0001";                    -- 106	-- RF switch control (300K calibration source) --
                when "01101101" => adc_en <= '1';                       -- 109	-- After 30ms, trigger for ADC board (300 clocks of 1kHz) --
                when "10001011" => adc_en <= '0'; rf_sw <= "1000";     -- 139	-- RF switch control (Observation data) --
                when "10001110" => adc_en <= '1';                       -- 142	-- After 30ms, trigger for ADC board (300 clocks of 1kHz) --
                when "10101100" => adc_en <= '0'; rf_sw <= "0000"; prcs_count <= (others => '0'); rot_count_temp <= rot_count_temp + 1;		
                -- 172	-- 1 point process complete and counting initialize --   -- Rotation Count Information for DAQ Board --
                when others =>
                end case;
                			
            elsif sw = "00000010" and wrk_stat_temp = '1' then
			    case prcs_count is
			    when "00000001" => rot_en <= '1';                       --   1	-- Stepping motor clock injection (moving 0.5 deg <= 5 clocks of 100Hz) --
                when "00000110" => rot_en <= '0';                       --   6	-- Reflector stable time == 1000ms --
                when "01101010" => rf_sw <= "0001";                    -- 106	-- RF switch control (77K calibration source) --
                when "01101101" => adc_en <= '1';                       -- 109	-- After 30ms, trigger for ADC board (300 clocks of 1kHz) --
                when "10001011" => adc_en <= '0'; rf_sw <= "1000";     -- 139	-- RF switch control (Observation data) --
                when "10001110" => adc_en <= '1';                       -- 142	-- After 30ms, trigger for ADC board (300 clocks of 1kHz) --
                when "10101100" => adc_en <= '0'; rf_sw <= "0000"; prcs_count <= (others => '0'); rot_count_temp <= rot_count_temp + 1;		
                -- 172	-- 1 point process complete and counting initialize --   -- Rotation Count Information for DAQ Board --
                when others =>
                end case;
                
            elsif sw = "00000011" and wrk_stat_temp = '1' then
			    case prcs_count is
			    when "00000001" => rot_en <= '1';                       --   1	-- Stepping motor clock injection (moving 0.5 deg <= 5 clocks of 100Hz) --
                when "00000110" => rot_en <= '0';                       --   6	-- Reflector stable time == 1000ms --
                when "01101010" => rf_sw <= "0001";                    -- 106	-- RF switch control (4K calibration source) --
                when "01101101" => adc_en <= '1';                       -- 109	-- After 30ms, trigger for ADC board (300 clocks of 1kHz) --
                when "10001011" => adc_en <= '0'; rf_sw <= "1000";     -- 139	-- RF switch control (Observation data) --
                when "10001110" => adc_en <= '1';                       -- 142	-- After 30ms, trigger for ADC board (300 clocks of 1kHz) --
                when "10101100" => adc_en <= '0'; rf_sw <= "0000"; prcs_count <= (others => '0'); rot_count_temp <= rot_count_temp + 1;		
                -- 172	-- 1 point process complete and counting initialize --   -- Rotation Count Information for DAQ Board --
                when others =>
                end case;
			end if;	
		end if;
		
		if rot_count_temp = "1011010000" then			-- rot_count is total observation point (720 points at 0.5 deg resolution) --
			wrk_stat_temp <= '0';
		end if;
		wrk_stat <= wrk_stat_temp;
		rot_count <= rot_count_temp;
	end process;
end Behavioral;
