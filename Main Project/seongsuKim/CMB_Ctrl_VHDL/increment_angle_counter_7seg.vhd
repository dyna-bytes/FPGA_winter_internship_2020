----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/12 15:49:31
-- Design Name: 
-- Module Name: increment_angle_counter_7seg - Behavioral
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

entity increment_angle_counter_7seg is
    port(rot_clk: in std_logic;
         sys_init_ctrl: in std_logic;
         rot_en: in std_logic;
         bcdint: out std_logic_vector (15 downto 0));
end increment_angle_counter_7seg;

architecture Behavioral of increment_angle_counter_7seg is
    signal cnt1: std_logic_vector (3 downto 0) := (others =>'0'); -- 1st site
    signal cnt2: std_logic_vector (3 downto 0) := (others =>'0'); -- 2nd site
    signal cnt3: std_logic_vector (3 downto 0) := (others =>'0'); -- 3rd site
    signal cnt4: std_logic_vector (3 downto 0) := (others =>'0'); -- 4th site
--    signal site: std_logic_vector (1 downto 0) := (others =>'0');
    constant cnt_1: std_logic_vector (3 downto 0):= (0 => '1',others =>'0'); -- "0001"
--    constant site_1: std_logic_vector (1 downto 0):= (0 => '1',others =>'0');
begin
    process(sys_init_ctrl, rot_clk, rot_en)
    begin
        if sys_init_ctrl = '1' then
            bcdint <= (others =>'0');
        elsif rot_clk'event and rot_clk = '0' and rot_en = '1' then
            if cnt1 = "1001" and cnt2 /= "1001" and cnt3 /= "1001" and cnt4 /= "1001" then
                cnt1 <= "0000"; cnt2 <= cnt2 + cnt_1;
            elsif cnt1 = "1001" and cnt2 = "1001" and cnt3 /= "1001" and cnt4 /= "1001" then
                cnt1 <= "0000"; cnt2 <= "0000"; cnt3 <= cnt3 + cnt_1;      
            elsif cnt1 = "1001" and cnt2 = "1001" and cnt3 = "1001" and cnt4 /= "1001" then
                cnt1 <= "0000"; cnt2 <= "0000"; cnt3 <= "0000"; cnt4 <= cnt4 + cnt_1;      
            elsif cnt1 = "1001" and cnt2 = "1001" and cnt3 = "1001" and cnt4 = "1001" then
                cnt1 <= "0000"; cnt2 <= "0000"; cnt3 <= "0000"; cnt4 <= "0000";
            else
                cnt1 <= cnt1 + cnt_1;
            end if;            
        end if;
        bcdint <= cnt4 & cnt3 & cnt2 & cnt1;
    end process;

--    cnt1_up: process(sys_init_ctrl, rot_clk, rot_en,cnt1)
--    begin
--        if sys_init_ctrl = '1' or cnt1 = "1001" then
--            cnt1 <= (others =>'0');
--        elsif rot_clk'event and rot_clk = '0' then
--            cnt1 <= cnt1 + cnt_1;
--        else
--        end if;
--    end process;

--    counting_up_digits: process(sys_init_ctrl, rot_clk, rot_en, cnt1, cnt2, cnt3, cnt4)
--    begin
--        if sys_init_ctrl = '1' then
--			bcdint <= (others => '0');
--        elsif rot_clk'event and rot_clk = '0' and rot_en ='1' then
--	        case cnt1 is
--	        when "1010" => cnt1 <= "0000"; cnt2 <= cnt2 + cnt_1;
--            when others =>
--                case cnt2 is 
--                when "1010" => cnt2 <= "0000"; cnt3 <= cnt3 + cnt_1;
--                when others =>
--                    case cnt3 is 
--                    when "1010" => cnt3 <= "0000"; cnt4 <= cnt4 + cnt_1;
--                    when others =>
--                        if cnt4 = "1010" then 
--                            cnt1 <= (others => '0'); cnt2 <= (others => '0'); cnt3 <= (others => '0'); cnt4 <= (others => '0');
--                        else
--                        end if;
--                    end case;
--                end case;
--            end case;
--        end if;
--    end process;
    
--    getting_bcdint: process(cnt1,cnt2,cnt3,cnt4)        
--    begin
--        bcdint <= cnt4 & cnt3 & cnt2 & cnt1;
--    end process;
    
--    site_up: process(sys_init_ctrl, rot_clk, rot_en)
--    begin
--        if sys_init_ctrl = '1' then
--	        bcdint <= (others => '0');
--		elsif rot_clk'event and rot_clk = '0' and rot_en ='1' then
--            if cnt = "1001" then
--                site <= site + site_1;
--                if site = "11" then
--                    site <= "00";
--                else
--                end if;
--            end if;
--        end if;
--    end process;

end Behavioral;
