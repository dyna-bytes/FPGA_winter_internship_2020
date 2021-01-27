----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/22 19:05:43
-- Design Name: 
-- Module Name: SEGMENT_DECODE - Behavioral
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

entity SEGMENT_DECODE is
-- 다음의 DYNAMIC_DRIVE의 초기 지정값은 아래의 수식으로 지정
-- CLOCK_PER_BIT = (FPGA 메인 클록 주파수) / (DYNAMIC DRIVE 횟수)
-- 예) FPGA 메인 클록 주파수 : 50MHz
-- DYNAMIC DRIVE 횟수 = (7-Segment 자릿수) * (60 Frame)
-- = 4 * 60
-- = 240
-- DYNAMIC_DRIVE = 50000000 / 240
-- = 416666
  generic(DYNAMIC_DRIVE : integer := 416666 / 2);
  Port (CLOCK : in std_logic;
        DISPLAY_SHIFT : in std_logic;
        DATA_INPUT : in std_logic_vector(7 downto 0);
        -----------------------------------------------
        DIGIT : out std_logic_vector(3 downto 0);
        SEGMENT : out std_logic_vector(7 downto 0)
         );
end SEGMENT_DECODE;

architecture Behavioral of SEGMENT_DECODE is
    type DYNAMIC_DRIVE_STATES is (DIGIT0, DIGIT1, DIGIT2, DIGIT3);
    
    signal DYNAMIC_DRIVE_STATE : DYNAMIC_DRIVE_STATES := DIGIT0;
    signal CLOCK_COUNT : integer range 0 to DYNAMIC_DRIVE - 1 := 0;
    signal DIGIT0_DATA : std_logic_vector(7 downto 0) := "1100" & "0000";
    signal DIGIT1_DATA : std_logic_vector(7 downto 0) := "1100" & "0000";
    signal DIGIT2_DATA : std_logic_vector(7 downto 0) := "1100" & "0000";
    signal DIGIT3_DATA : std_logic_vector(7 downto 0) := "1100" & "0000";
    signal DATA_INPUT_UPPER_BUFFER : std_logic_vector(3 downto 0) := "0000";
    signal DATA_INPUT_LOWER_BUFFER : std_logic_vector(3 downto 0) := "0000";
    
begin
    CLOCK_GENEARTION_AND_FSM : process(CLOCK)
    begin
    ---- CLOCK GENERATION ----
    if rising_edge(CLOCK) then
        CLOCK_COUNT <= CLOCK_COUNT + 1;
        
        if CLOCK_COUNT = (DYNAMIC_DRIVE - 1) then
            CLOCK_COUNT <= 0;
            
            ---- FSM ----
            if (DYNAMIC_DRIVE_STATE = DIGIT3) then
                DYNAMIC_DRIVE_STATE <= DIGIT0;
            elsif (DYNAMIC_DRIVE_STATE = DIGIT0) then
                DYNAMIC_DRIVE_STATE <= DIGIT1;
            elsif (DYNAMIC_DRIVE_STATE = DIGIT1) then
                DYNAMIC_DRIVE_STATE <= DIGIT2;    
            elsif (DYNAMIC_DRIVE_STATE = DIGIT2) then
                DYNAMIC_DRIVE_STATE <= DIGIT3;    
            end if;
        end if;                
    end if;    
    end process;
    
    INSERT_DATA_TO_SEGMENT : process(DYNAMIC_DRIVE_STATE)
    begin
    if (DYNAMIC_DRIVE_STATE = DIGIT0) then
        DIGIT <= "1110";        -- Digit Selection --
        SEGMENT <= DIGIT0_DATA;  -- Data Insertion --
    elsif (DYNAMIC_DRIVE_STATE = DIGIT1) then
        DIGIT <= "1101";
        SEGMENT <= DIGIT1_DATA;    
    elsif (DYNAMIC_DRIVE_STATE = DIGIT2) then
        DIGIT <= "1011";
        SEGMENT <= DIGIT2_DATA;
    elsif (DYNAMIC_DRIVE_STATE = DIGIT3) then
        DIGIT <= "0111";
        SEGMENT <= DIGIT3_DATA;    
    end if;
    end process;
    
    process(CLOCK)
    begin
    if rising_edge(CLOCK) then
        -- Shift digit1 and digit0 to digit3 and digit2 --
        if (DISPLAY_SHIFT = '1') then
            DIGIT3_DATA <= DIGIT1_DATA;
            DIGIT2_DATA <= DIGIT0_DATA;
        -- Insert Data Inputs to Buffers --    
        else
            DATA_INPUT_UPPER_BUFFER <= DATA_INPUT(7 downto 4);
            DATA_INPUT_LOWER_BUFFER <= DATA_INPUT(3 downto 0);
            
            -- Insert Upper Buffer to Digit1 Data --
            if (DATA_INPUT_UPPER_BUFFER = 0) then
                DIGIT1_DATA <= "1100" & "0000";
            elsif (DATA_INPUT_UPPER_BUFFER = 1) then
                DIGIT1_DATA <= "1111" & "1001";
            elsif (DATA_INPUT_UPPER_BUFFER = 2) then
                DIGIT1_DATA <= "1010" & "0100";
            elsif (DATA_INPUT_UPPER_BUFFER = 3) then
                DIGIT1_DATA <= "1011" & "0000";
            elsif (DATA_INPUT_UPPER_BUFFER = 4) then
                DIGIT1_DATA <= "1001" & "1001";
            elsif (DATA_INPUT_UPPER_BUFFER = 5) then
                DIGIT1_DATA <= "1001" & "0010";
            elsif (DATA_INPUT_UPPER_BUFFER = 6) then
                DIGIT1_DATA <= "1000" & "0010";
            elsif (DATA_INPUT_UPPER_BUFFER = 7) then
                DIGIT1_DATA <= "1111" & "1000";
            elsif (DATA_INPUT_UPPER_BUFFER = 8) then
                DIGIT1_DATA <= "1000" & "0000";
            elsif (DATA_INPUT_UPPER_BUFFER = 9) then
                DIGIT1_DATA <= "1001" & "0000";
            elsif (DATA_INPUT_UPPER_BUFFER = 10) then
                DIGIT1_DATA <= "0000" & "1000";
            elsif (DATA_INPUT_UPPER_BUFFER = 11) then
                DIGIT1_DATA <= "0000" & "0011";
            elsif (DATA_INPUT_UPPER_BUFFER = 12) then
                DIGIT1_DATA <= "0100" & "0110";
            elsif (DATA_INPUT_UPPER_BUFFER = 13) then
                DIGIT1_DATA <= "0010" & "0001";
            elsif (DATA_INPUT_UPPER_BUFFER = 14) then
                DIGIT1_DATA <= "0000" & "0110";
            elsif (DATA_INPUT_UPPER_BUFFER = 15) then
                DIGIT1_DATA <= "0000" & "1110";
            end if;
            
            -- Insert Lower Buffer to DIgit0 data --
            if (DATA_INPUT_LOWER_BUFFER = 0) then
                DIGIT0_DATA <= "1100" & "0000";
            elsif (DATA_INPUT_LOWER_BUFFER = 1) then
                DIGIT0_DATA <= "1111" & "1001";
            elsif (DATA_INPUT_LOWER_BUFFER = 2) then
                DIGIT0_DATA <= "1010" & "0100";
            elsif (DATA_INPUT_LOWER_BUFFER = 3) then
                DIGIT0_DATA <= "1011" & "0000";
            elsif (DATA_INPUT_LOWER_BUFFER = 4) then
                DIGIT0_DATA <= "1001" & "1001";
            elsif (DATA_INPUT_LOWER_BUFFER = 5) then
                DIGIT0_DATA <= "1001" & "0010";
            elsif (DATA_INPUT_LOWER_BUFFER = 6) then
                DIGIT0_DATA <= "1000" & "0010";
            elsif (DATA_INPUT_LOWER_BUFFER = 7) then
                DIGIT0_DATA <= "1111" & "1000";
            elsif (DATA_INPUT_LOWER_BUFFER = 8) then
                DIGIT0_DATA <= "1000" & "0000";
            elsif (DATA_INPUT_LOWER_BUFFER = 9) then
                DIGIT0_DATA <= "1001" & "0000";
            elsif (DATA_INPUT_LOWER_BUFFER = 10) then
                DIGIT0_DATA <= "0000" & "1000";
            elsif (DATA_INPUT_LOWER_BUFFER = 11) then
                DIGIT0_DATA <= "0000" & "0011";
            elsif (DATA_INPUT_LOWER_BUFFER = 12) then
                DIGIT0_DATA <= "0100" & "0110";
            elsif (DATA_INPUT_LOWER_BUFFER = 13) then
                DIGIT0_DATA <= "0010" & "0001";
            elsif (DATA_INPUT_LOWER_BUFFER = 14) then
                DIGIT0_DATA <= "0000" & "0110";
            elsif (DATA_INPUT_LOWER_BUFFER = 15) then
                DIGIT0_DATA <= "0000" & "1110";
            end if;            
        end if;
    end if;
    
    end process;


end Behavioral;
