----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/13 14:09:02
-- Design Name: 
-- Module Name: mux_7seg - Behavioral
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
use IEEE.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux_7seg is
  Port (sys_init_ctrl : in std_logic;
        clk_1KHz : in std_logic;
        bcd_int : in std_logic_vector(15 downto 0);
        
        digit : out std_logic_vector(3 downto 0);
        seg : out std_logic_vector(7 downto 0)
         );
end mux_7seg;

architecture Behavioral of mux_7seg is
    signal digit_temp : std_logic_vector(3 downto 0);
    signal seg_temp : std_logic_vector(7 downto 0);
    signal digit_select : std_logic_vector(1 downto 0);
    signal dig_sel : integer;   -- variable for type transform
    signal triggered : std_logic;
    signal bcd_char : std_logic_vector(3 downto 0);
    signal seg_dp : std_logic;
    
begin    -- ����� bcd_int�� 1KHz clk�� ���� ���׸�Ʈ�� ���÷����Ѵ�.
   
    digit <= digit_temp;
    seg <= seg_temp;
   
    clock_counting : process(sys_init_ctrl, clk_1KHz)
    begin
        -- system initialization
        if sys_init_ctrl = '1' then
            seg_temp <= (others => '1');
            digit_temp <= (others => '1');
            digit_select <= (others => '0');
            bcd_char <= (others => '0');
            triggered <= '1';
            
        -- counting up digits by 1KHz clock
        elsif rising_edge(clk_1KHz) then
            digit_select(1 downto 0) <= digit_select(1 downto 0) + 1;
        end if;
      
        -- digit_selection 
        dig_sel <= TO_INTEGER(unsigned(digit_select));   -- �� ��ȯ
        bcd_char <= bcd_int( ((dig_sel*4) + 3) downto (dig_sel*4) );
    
        case dig_sel is
            when 0 =>  seg_dp <= '1';
                           digit_temp <= std_logic_vector(TO_UNSIGNED(14, 4)); -- output_1a <= std_logic_vector(to_unsigned(input_1, output_1a'length));
            when 1 =>  seg_dp <= '0';
                           digit_temp <= std_logic_vector(TO_UNSIGNED(13, 4));
            when 2 =>  seg_dp <= '1';
                           digit_temp <= std_logic_vector(TO_UNSIGNED(11, 4));  
            when others => seg_dp <= '1';
                           digit_temp <= std_logic_vector(TO_UNSIGNED(7, 4));
                        
         end case;                 
 
        --  bcd_character_to_segment_mapping 
        if triggered = '1' then
            case bcd_char is
                when "0000" => seg_temp <= "0000001" & seg_dp;
				when "0001" => seg_temp <= "1001111" & seg_dp;
				when "0010" => seg_temp <= "0010010" & seg_dp;
				when "0011" => seg_temp <= "0000110" & seg_dp;
				when "0100" => seg_temp <= "1001100" & seg_dp;
				when "0101" => seg_temp <= "0100100" & seg_dp;
				when "0110" => seg_temp <= "0100000" & seg_dp;
				when "0111" => seg_temp <= "0001101" & seg_dp;
				when "1000" => seg_temp <= "0000000" & seg_dp;
				when OTHERS  => seg_temp <= "0000100" & seg_dp;
			end case;
	    else
			seg_temp <= (others => '1');
		end if;    
    end process;
end Behavioral;
