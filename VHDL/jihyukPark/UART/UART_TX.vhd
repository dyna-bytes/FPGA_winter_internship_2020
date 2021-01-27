----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/22 16:53:33
-- Design Name: 
-- Module Name: UART_TX - Behavioral
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
use IEEE.numeric_std.ALL;

-- UART_TX Component의 UART TX 통신 규약
-- 통신속도 : CLOCK_PER_BIT 지정 값에 따라 설정
-- 1200bps : 41666.67 = 41666
-- 2400bps : 20833.33 = 20833
-- 4800bps : 10416.67 = 10416
-- 9600bps : 5208.33 = 5208
-- 14400bps : 3472.22 = 3472
-- 19200bps : 2604.17 = 2604
-- 38400bps : 1302.08 = 1302
-- 57600bps : 868.06 = 868
-- 115200bps : 434.03 = 434
-- 230400bps : 217.01 = 217
-- 460800bps : 108.51 = 108
-- 921600bps : 54.25 = 54
-- 시작 Bit : 1 Bit
-- 데이터 Bit : 8 Bit
-- 패리티 Bit : 패리티 없음
-- 정지 Bit : 1 Bit

entity UART_TX is
  -- 다음의 CLOCK_PER_BIT의 초기 지정값은 아래의 수식으로 지정
  -- CLOCK_PER_BIT = (FPGA 메인 클록 주파수) / (UART 통신 속도)
  -- 예) FPGA 메인 클록 주파수 : 50MHz
  -- UART 통신 속도 : 115,200bps
  -- CLOCK_PER_BIT = 50000000 / 115200
  -- = 434.03
  generic (CLOCK_PER_BIT : integer := 434);
  Port (CLOCK : in std_logic;
        UART_TX_ENABLE : in std_logic;
        UART_TX_DATA_INPUT : in std_logic_vector(7 downto 0);
        -------------------------------------------------------
        UART_TX_DATA_OUTPUT_RUN : out std_logic;
        UART_TX_DATA_OUTPUT_DONE : out std_logic;
        UART_TX_DATA_OUTPUT : out std_logic
         );
end UART_TX;

architecture Behavioral of UART_TX is
    type UART_TX_STATES is (UART_TX_IDLE, UART_TX_START_BIT, 
    UART_TX_DATA_BIT, UART_TX_STOP_BIT, UART_TX_COMPLETE);

    signal UART_TX_STATE : UART_TX_STATES := UART_TX_IDLE;
    signal CLOCK_COUNT : integer range 0 to CLOCK_PER_BIT - 1 := 0;
    -- 8 bit  데이터 전송
    signal UART_TX_BIT_INDEX : integer range 0 to 7 := 0;
    signal UART_TX_DATA : std_logic_vector(7 downto 0) := "0000000";
    signal UART_TX_DATA_OUTPUT_COMPLETE : std_logic := '0';
    
begin
    process(CLOCK)
    begin
    if rising_edge(CLOCK) then
        ---- [STATE IDLE] : UART TX 대기 상태 ----
        if (UART_TX_STATE = UART_TX_IDLE) then
            CLOCK_COUNT <= 0;
            UART_TX_BIT_INDEX <= 0;
            UART_TX_DATA_OUTPUT <= '1';
            UART_TX_DATA_OUTPUT_RUN <= '0';
            UART_TX_DATA_OUTPUT_COMPLETE <= '0';
            
            -- move to next state --
            if (UART_TX_ENABLE = '1') then
                UART_TX_STATE <= UART_TX_START_BIT;
                UART_TX_DATA <= UART_TX_DATA_INPUT;
            -- stay in current state --   
            else
                UART_TX_STATE <= UART_TX_IDLE;
            end if;
            
            
        ---- [STATE START BIT] : UART TX Start Bit 전송 상태 ----
        elsif (UART_TX_STATE = UART_TX_START_BIT) then
            UART_TX_DATA_OUTPUT_RUN <= '1';
            UART_TX_DATA_OUTPUT <= '0';
            
            -- stay in current state --
            if (CLOCK_COUNT < (CLOCK_PER_BIT - 1)) then
                CLOCK_COUNT <= CLOCK_COUNT + 1;
                UART_TX_STATE <= UART_TX_START_BIT;
            -- move to next state --   
            else
                CLOCK_COUNT <= 0;
                UART_TX_STATE <= UART_TX_DATA_BIT;
            end if;
        
        
        ---- [STATE DATA BIT] : UART TX Data Bit 전송 상태(전송 데이터 : 8 bit) ----
        elsif (UART_TX_STATE = UART_TX_DATA_BIT) then            
            UART_TX_DATA_OUTPUT <= UART_TX_DATA(UART_TX_BIT_INDEX);
            
            -- stay in current state --
            -- count up the clock till a bit is sended --
            if (CLOCK_COUNT < (CLOCK_PER_BIT - 1)) then
                CLOCK_COUNT <= CLOCK_COUNT + 1;
                UART_TX_STATE <= UART_TX_DATA_BIT;
            -- if a bit sended, reset the clock and select the next state. the next state can be DATA_BIT or STOP_BIT --              
            else
                CLOCK_COUNT <= 0;
                
                -- if sended bits are less then 8 bits, keep transmitting data bits --
                -- stay in current state --
                    if(UART_TX_BIT_INDEX < 7) then
                    UART_TX_BIT_INDEX <= UART_TX_BIT_INDEX + 1;
                    UART_TX_STATE <= UART_TX_DATA_BIT;
                -- move to next state --    
                else
                    UART_TX_BIT_INDEX <= 0;
                    UART_TX_STATE <= UART_TX_STOP_BIT;
                end if;                
            end if;
        
        
        ---- [STATE STOP BIT] : UART TX Stop Bit 전송 상태 ----   
        elsif (UART_TX_STATE = UART_TX_STOP_BIT) then
            UART_TX_DATA_OUTPUT <= '1';
            
            -- stay in current state --
            if( CLOCK_COUNT < (CLOCK_PER_BIT - 1)) then
                CLOCK_COUNT <= CLOCK_COUNT + 1;
                UART_TX_STATE <= UART_TX_STOP_BIT;
            -- move to next state --    
            else
                CLOCK_COUNT <= 0;
                UART_TX_DATA_OUTPUT_COMPLETE <= '0';
                UART_TX_STATE <= UART_TX_COMPLETE;
            end if;
       
        
        
        ---- [STATE COMPLETE] : UART TX 데이터 프레임 송신 완료 상태 ----
        elsif (UART_TX_STATE = UART_TX_COMPLETE) then
            UART_TX_DATA_OUTPUT_RUN <= '0';
            UART_TX_DATA_OUTPUT_COMPLETE <= '1';
            UART_TX_STATE <= UART_TX_IDLE;
        
        
        ---- [STATE DEFAULT] ----
        else
            UART_TX_STATE <= UART_TX_IDLE;    
        end if;
     end if;
     end process;
    
    UART_TX_DATA_OUTPUT_DONE <= UART_TX_DATA_OUTPUT_COMPLETE;
end Behavioral;
