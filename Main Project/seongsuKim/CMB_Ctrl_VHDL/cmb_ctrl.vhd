----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/11 15:37:55
-- Design Name: 
-- Module Name: cmb_ctrl - Behavioral
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
--use ieee.numeric_std.all;
use ieee.std_logic_arith.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

library UNISIM;
use UNISIM.VComponents.all;

entity cmb_ctrl is
    Port ( 
			clk50_in				: in STD_LOGIC;									-- 50MHz X-TAL --
			pb_in 				: in STD_LOGIC_VECTOR (3 downto 0);			-- 4 push button --
			sw_in 				: in STD_LOGIC_VECTOR (7 downto 0);			-- 8 switch --
			digit_out 			: out STD_LOGIC_VECTOR (3 downto 0);		-- digit driver --
			led_out 				: out STD_LOGIC_VECTOR (7 downto 0);		-- led control --
			seg_out 				: out STD_LOGIC_VECTOR (7 downto 0);		-- 7 segment control --
			rf_sw_out			: out STD_LOGIC_VECTOR (3 downto 0);		-- rf switch control --
			debug_out			: out STD_LOGIC;									-- degug signal --
			rot_count_out		: out STD_LOGIC_VECTOR (9 downto 0);		-- reflector rotation count --
			rot_clk_out			: out STD_LOGIC;									-- step motor clock --
			stp_clk_out			: out STD_LOGIC;									-- step motor reference clock --
         adc_trg_out			: out STD_LOGIC									-- trigger for adc board --
			);
end cmb_ctrl;

architecture arch_cmb of cmb_ctrl is

	component ibuf_lvcmos33 port(i : in STD_LOGIC; o : out STD_LOGIC);
	end component;
	component ibufg_lvcmos33 port (i : in STD_LOGIC; o : out STD_LOGIC);
	end component;
	component obuf_lvcmos33 port (i : in STD_LOGIC; o : out STD_LOGIC);
	end component;
	component bufg port (i : in STD_LOGIC; o : out STD_LOGIC);
	end component;

		signal rst 				: STD_LOGIC;
		signal clk50int		: STD_LOGIC;
		signal clk50			: STD_LOGIC;
		signal pb				: STD_LOGIC_VECTOR (3 downto 0);
		signal sw				: STD_LOGIC_VECTOR (7 downto 0);
		signal digit			: STD_LOGIC_VECTOR (3 downto 0);
		signal led				: STD_LOGIC_VECTOR (7 downto 0);
		signal seg				: STD_LOGIC_VECTOR (7 downto 0);
		signal seg_dp			: STD_LOGIC;
		signal rf_sw			: STD_LOGIC_VECTOR (3 downto 0);
		signal debug			: STD_LOGIC;
		signal adc_trg			: STD_LOGIC;
		signal adc_en			: STD_LOGIC;
		signal rot_clk			: STD_LOGIC;
		signal rot_en			: STD_LOGIC;
		signal sys_init		: STD_LOGIC;
		signal sys_init_b		: STD_LOGIC;
		signal sys_init_ctrl	: STD_LOGIC;
		signal trg				: STD_LOGIC;
		signal trg_b			: STD_LOGIC;
		signal trg_ctrl		: STD_LOGIC;
		signal wrk_stat		: STD_LOGIC;
		signal mhertz_count 	: STD_LOGIC_VECTOR (5 downto 0);
		signal mhertz_clk		: STD_LOGIC;
		signal khertz_count	: STD_LOGIC_VECTOR (15 downto 0);
		signal khertz_clk		: STD_LOGIC;
		signal hertz_count	: STD_LOGIC_VECTOR (9 downto 0);
		signal hertz_clk		: STD_LOGIC;
		signal stp_count		: STD_LOGIC_VECTOR (4 downto 0);
		signal stp_clk			: STD_LOGIC;
		signal prcs_count		: STD_LOGIC_VECTOR (7 downto 0);
		signal rot_count		: STD_LOGIC_VECTOR (9 downto 0);
		signal bcdint			: STD_LOGIC_VECTOR (15 downto 0);
		signal dig_count		: STD_LOGIC_VECTOR (2 downto 0);
		signal bcdcrt			: STD_LOGIC_VECTOR (3 downto 0);
						
begin

		rst 		<= pb(3);					-- BTN3 on board for reset --
		sys_init <= pb(2);					-- BTN2 on board for initialize --
		trg		<= pb(1);					-- BTN1 on board for start --
				
		debug <=	wrk_stat;
						
		rot_clk <= (rot_en and stp_clk);			-- Stepping motor control clock : 0.1 deg moving at 1 clock --
		adc_trg <= (adc_en nand khertz_clk);	-- Data acquisition clock for ADC board --
				
		clk50_in_ibuf		:	ibufg_lvcmos33		port map (i => clk50_in, o => clk50int);
		rxclka_bufg			:	bufg					port map (i => clk50int, o => clk50);
		
		loop0 : for i in 0 to 3 generate
		digit_obuf			:	obuf_lvcmos33		port map (i => digit(i), o => digit_out(i));
		rf_sw_obuf			:	obuf_lvcmos33		port map (i => rf_sw(i), o => rf_sw_out(i));
		pb_ibuf				:	ibuf_lvcmos33		port map (i => pb_in(i), o => pb(i));
		end generate;
		
		loop1 : for i in 0 to 7 generate
		seg_obuf				:	obuf_lvcmos33		port map (i => seg(i), o => seg_out(i));
		led_obuf				:	obuf_lvcmos33		port map (i => led(i), o => led_out(i));
		sw_ibuf				:	ibuf_lvcmos33		port map (i => sw_in(i), o => sw(i));
		end generate;
		
		loop2 : for i in 0 to 9 generate
		rot_count_obuf		:	obuf_lvcmos33		port map (i => rot_count(i), o => rot_count_out(i));
		end generate;
		
		debug_obuf			:	obuf_lvcmos33		port map (i => debug, o => debug_out);
		rot_clk_obuf		:	obuf_lvcmos33		port map (i => rot_clk, o => rot_clk_out);
		stp_clk_obuf		:	obuf_lvcmos33		port map (i => stp_clk, o => stp_clk_out);
		adc_trg_obuf		:	obuf_lvcmos33		port map (i => adc_trg, o => adc_trg_out);
				
----------------------------------------------------------------------------------
--
-- Generation of 1MHz clock from 50MHz clock
--
----------------------------------------------------------------------------------

	process (clk50, rst)
	begin
		
		if rst = '1' then
			mhertz_count <= (others => '0');
			mhertz_clk <= '1';
		elsif clk50'event and clk50 = '1' then
			mhertz_count <= mhertz_count + 1;
			
			if mhertz_count = "011000" then
				mhertz_clk <= '0';
			elsif mhertz_count = "110001" then
				mhertz_clk <= '1';
				mhertz_count <= (others => '0');
			end if;
		
		end if;
	end process;
		
----------------------------------------------------------------------------------
--
-- Generation of 1kHz clock from 50MHz clock
--
----------------------------------------------------------------------------------

	process (clk50, rst)
	begin
		
		if rst = '1' then
			khertz_count <= (others => '0');
			khertz_clk <= '1';
		elsif clk50'event and clk50 = '1' then
			khertz_count <= khertz_count + 1;
			
			if khertz_count = "0110000110100111" then
				khertz_clk <= '0';
			elsif khertz_count = "1100001101001111" then
				khertz_clk <= '1';
				khertz_count <= (others => '0');
			end if;
		
		end if;
	end process;

----------------------------------------------------------------------------------
--
-- Generation of 1Hz clock from 1kHz clock
--
----------------------------------------------------------------------------------
	
	process (khertz_clk, rst)
	begin
		
		if rst = '1' then
			hertz_count <= (others => '0');
			hertz_clk <= '1';
		elsif khertz_clk'event and khertz_clk = '1' then
			hertz_count <= hertz_count + 1;
			
			if hertz_count = "0111110011" then
				hertz_clk <= '0';
			elsif hertz_count = "1111100111" then
				hertz_clk <= '1';
				hertz_count <= (others => '0');
			end if;
		
		end if;
	end process;
	
----------------------------------------------------------------------------------
--
-- Generation of stepping motor clock from 1kHz clock
--
----------------------------------------------------------------------------------	

	process (khertz_clk, sys_init_ctrl)
	begin
		
		if rst = '1' then
			stp_count <= (others => '0');
			stp_clk <= '0';
		elsif khertz_clk'event and khertz_clk = '1' then
			stp_count <= stp_count + 1;
			
			if stp_count = "0100" then  --"1001" then
				stp_clk <= '1';
			elsif stp_count = "1001" then  --"10011" then
				stp_clk <= '0';
				stp_count <= (others => '0');
			end if;
		
		end if;
	end process;
	
----------------------------------------------------------------------------------
--
-- Generation of system initialize signal
--
----------------------------------------------------------------------------------

	process (mhertz_clk)
	begin
	
		if mhertz_clk'event and mhertz_clk= '1' then
			sys_init_b <= sys_init;
		end if;
		
		sys_init_ctrl <= sys_init and not sys_init_b;
		end process;

----------------------------------------------------------------------------------
--
-- Triggering for start
--
----------------------------------------------------------------------------------
				
	process (mhertz_clk)
	begin
		
		if mhertz_clk'event and mhertz_clk = '1' then
			trg_b <= trg;
		end if;
	
	trg_ctrl <= trg and not trg_b;
	end process;
	
----------------------------------------------------------------------------------
--
-- Initialize and observation process
--
----------------------------------------------------------------------------------
	
	process (sys_init_ctrl, wrk_stat, stp_clk, trg_ctrl, rot_count, sw)
	begin
	
		if trg_ctrl = '1' then
			wrk_stat <= '1';
		end if;
		
		if sys_init_ctrl = '1' then
			rot_en		<= '0';
			adc_en		<= '0';
			wrk_stat		<= '0';
			rf_sw			<= "0000";
			prcs_count  <= (others => '0');
			rot_count	<= (others => '0');
			
		elsif (wrk_stat = '1') and (stp_clk'event and stp_clk = '1') then
			
			prcs_count <= prcs_count + 1;
			
			if sw = "00000000" then	
			
				if prcs_count = "00000001" and wrk_stat = '1' then				-- Stepping motor clock injection (moving 0.5 deg <= 5 clocks of 100Hz) --
					rot_en <= '1';
				elsif prcs_count = "00000110" and wrk_stat = '1' then			-- Reflector stable time == 1000ms --
					rot_en <= '0';
				elsif prcs_count = "01101010" and wrk_stat = '1' then			-- RF switch control (300K calibration source) --
					rf_sw <= "0001";
				elsif prcs_count = "01101101" and wrk_stat = '1' then			-- After 30ms, trigger for ADC board (300 clocks of 1kHz) --
					adc_en <= '1';
				elsif prcs_count = "10001011" and wrk_stat = '1' then			-- RF switch control (77K calibration source) --
					adc_en <= '0';
					rf_sw <= "0010";
				elsif prcs_count = "10001110" and wrk_stat = '1' then			-- After 30ms, trigger for ADC board (300 clocks of 1kHz) --
					adc_en <= '1';
				elsif prcs_count = "10101100" and wrk_stat = '1' then			-- RF switch control (4K calibration source) --
					adc_en <= '0';
					rf_sw <= "0100";
				elsif prcs_count = "10101111" and wrk_stat = '1' then			-- After 30ms, trigger for ADC board (300 clocks of 1kHz) --
					adc_en <= '1';
				elsif prcs_count = "11001101" and wrk_stat = '1' then			-- RF switch control (Observation data) --
					adc_en <= '0';
					rf_sw <= "1000";
				elsif prcs_count = "11010000" and wrk_stat = '1' then			-- After 30ms, trigger for ADC board (300 clocks of 1kHz) --
					adc_en <= '1';
				elsif prcs_count = "11101110" and wrk_stat = '1' then			-- 1 point process complete and counting initialize --
					adc_en <= '0';
					rf_sw <= "0000";
					prcs_count <= (others => '0');
					rot_count <= rot_count + 1;										-- Rotation Count Information for DAQ Board --
				end if;
				
			elsif sw = "00000001" then
			
				if prcs_count = "00000001" and wrk_stat = '1' then				-- Stepping motor clock injection (moving 0.5 deg <= 5 clocks of 100Hz) --
					rot_en <= '1';
				elsif prcs_count = "00000110" and wrk_stat = '1' then			-- Reflector stable time == 1000ms --
					rot_en <= '0';
				elsif prcs_count = "01101010" and wrk_stat = '1' then			-- RF switch control (300K calibration source) --
					rf_sw <= "0001";
				elsif prcs_count = "01101101" and wrk_stat = '1' then			-- After 30ms, trigger for ADC board (300 clocks of 1kHz) --
					adc_en <= '1';
				elsif prcs_count = "10001011" and wrk_stat = '1' then			-- RF switch control (Observation data) --
					adc_en <= '0';
					rf_sw <= "1000";
				elsif prcs_count = "10001110" and wrk_stat = '1' then			-- After 30ms, trigger for ADC board (300 clocks of 1kHz) --
					adc_en <= '1';
				elsif prcs_count = "10101100" and wrk_stat = '1' then			-- 1 point process complete and counting initialize --
					adc_en <= '0';
					rf_sw <= "0000";
					prcs_count <= (others => '0');
					rot_count <= rot_count + 1;										-- Rotation Count Information for DAQ Board --
				end if;
				
			elsif sw = "00000010" then
			
				if prcs_count = "00000001" and wrk_stat = '1' then				-- Stepping motor clock injection (moving 0.5 deg <= 5 clocks of 100Hz) --
					rot_en <= '1';
				elsif prcs_count = "00000110" and wrk_stat = '1' then			-- Reflector stable time == 1000ms --
					rot_en <= '0';
				elsif prcs_count = "01101010" and wrk_stat = '1' then			-- RF switch control (77K calibration source) --
					rf_sw <= "0010";
				elsif prcs_count = "01101101" and wrk_stat = '1' then			-- After 30ms, trigger for ADC board (300 clocks of 1kHz) --
					adc_en <= '1';
				elsif prcs_count = "10001011" and wrk_stat = '1' then			-- RF switch control (Observation data) --
					adc_en <= '0';
					rf_sw <= "1000";
				elsif prcs_count = "10001110" and wrk_stat = '1' then			-- After 30ms, trigger for ADC board (300 clocks of 1kHz) --
					adc_en <= '1';
				elsif prcs_count = "10101100" and wrk_stat = '1' then			-- 1 point process complete and counting initialize --
					adc_en <= '0';
					rf_sw <= "0000";
					prcs_count <= (others => '0');
					rot_count <= rot_count + 1;										-- Rotation Count Information for DAQ Board --
				end if;
				
			elsif sw = "00000011" then
			
				if prcs_count = "00000001" and wrk_stat = '1' then				-- Stepping motor clock injection (moving 0.5 deg <= 5 clocks of 100Hz) --
					rot_en <= '1';
				elsif prcs_count = "00000110" and wrk_stat = '1' then			-- Reflector stable time == 1000ms --
					rot_en <= '0';
				elsif prcs_count = "01101010" and wrk_stat = '1' then			-- RF switch control (4K calibration source) --
					rf_sw <= "0100";
				elsif prcs_count = "01101101" and wrk_stat = '1' then			-- After 30ms, trigger for ADC board (300 clocks of 1kHz) --
					adc_en <= '1';
				elsif prcs_count = "10001011" and wrk_stat = '1' then			-- RF switch control (Observation data) --
					adc_en <= '0';
					rf_sw <= "1000";
				elsif prcs_count = "10001110" and wrk_stat = '1' then			-- After 30ms, trigger for ADC board (300 clocks of 1kHz) --
					adc_en <= '1';
				elsif prcs_count = "10101100" and wrk_stat = '1' then			-- 1 point process complete and counting initialize --
					adc_en <= '0';
					rf_sw <= "0000";
					prcs_count <= (others => '0');
					rot_count <= rot_count + 1;										-- Rotation Count Information for DAQ Board --
				end if;
				
			end if;	
				
		end if;
		
		if rot_count = "1011010000" then			-- rot_count is total observation point (720 points at 0.5 deg resolution) --
			wrk_stat <= '0';
		end if;
		
	end process;
	
----------------------------------------------------------------------------------
--
-- Increment angle counter for 7-segment display
--
----------------------------------------------------------------------------------

	process (sys_init_ctrl, rot_clk, rot_en)
	begin
	
		if sys_init_ctrl = '1' then
			bcdint <= (others => '0');
		elsif rot_clk'event and rot_clk = '0' then
			
			if rot_en = '1' then
		
				if bcdint(3 downto 0) = "1001" then
				
					if bcdint(7 downto 4) = "1001" then
					
						if bcdint(11 downto 8) = "1001" then
						
							if bcdint(15 downto 12) = "1001" then
								bcdint <= "0000000000000000";
							else
								bcdint <= (bcdint(15 downto 12) + 1) & "000000000000";
							end if;
					
						else
							bcdint <= bcdint(15 downto 12) & (bcdint(11 downto 8) + 1) & "00000000";
						end if;
				
					else
						bcdint <= bcdint(15 downto 8) & (bcdint(7 downto 4) + 1) & "0000";
					end if;
			
				else
					bcdint <= bcdint (15 downto 4) & (bcdint(3 downto 0) + 1);
				end if;
				
			end if;
		
		end if;
		
	end process;
	
----------------------------------------------------------------------------------
--
-- 7-segment display output by multiplexing
--
----------------------------------------------------------------------------------	
				
	process (sys_init_ctrl, khertz_clk, dig_count)
	begin
	
		if sys_init_ctrl = '1' then
			seg <= (others => '1');
			digit <= (others => '1');
			dig_count <= (others => '0');
			bcdcrt <= (others => '0');
			dig_count(2) <= '1';
		
		elsif khertz_clk'event and khertz_clk = '1' then
			dig_count(1 downto 0) <= dig_count(1 downto 0) + 1;
		end if;
			
		case dig_count(1 downto 0) is
			when "00"	 => bcdcrt <= bcdint(3 downto 0);
								seg_dp <= '1';
								digit <= "1110";
			when "01"	 => bcdcrt <= bcdint(7 downto 4);
								seg_dp <= '0';
								digit <= "1101";
			when "10"	 => bcdcrt <= bcdint(11 downto 8);
								seg_dp <= '1';
								digit <= "1011";
			when others  => bcdcrt <= bcdint(15 downto 12);
								seg_dp <= '1';
								digit <= "0111";
		end case;
			
		if dig_count(2) = '1' then
			case bcdcrt is
				when "0000" => seg <= "0000001" & seg_dp;
				when "0001" => seg <= "1001111" & seg_dp;
				when "0010" => seg <= "0010010" & seg_dp;
				when "0011" => seg <= "0000110" & seg_dp;
				when "0100" => seg <= "1001100" & seg_dp;
				when "0101" => seg <= "0100100" & seg_dp;
				when "0110" => seg <= "0100000" & seg_dp;
				when "0111" => seg <= "0001101" & seg_dp;
				when "1000" => seg <= "0000000" & seg_dp;
				when others => seg <= "0000100" & seg_dp;
			end case;
		else
			seg <= (others => '1');
		end if;
		
	end process;

----------------------------------------------------------------------------------
--
-- 8 LED counter from 1Hz signal
--
----------------------------------------------------------------------------------					
	
	process (sys_init_ctrl, hertz_clk)
	begin
	
		if sys_init_ctrl = '1' then
			led <= (others => '0');
		elsif hertz_clk'event and hertz_clk = '1' then
			led <= led + 1;

			if led = "11111111" then
				led <= (others => '0');
			end if;
		
		end if;
	
	end process;

end arch_cmb;