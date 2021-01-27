----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/25 18:56:37
-- Design Name: 
-- Module Name: UART_INTERFACE - Behavioral
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

entity UART_INTERFACE is
  Port (CLOCK : in std_logic;
        UART_TX_DATA_ENABLE : in std_logic;
        UART_TX_DATA_INPUT : in std_logic_vector(7 downto 0);
        ----
        UART_TX_DATA_OUTPUT_RUN : out std_logic;
        UART_TX_DATA_OUTPUT_DONE : out std_logic;
        UART_TX_DATA_OUTPUT : out std_logic;
        ------------------------------------------------------- 
        UART_RX_DATA_INPUT : in std_logic;
        ----
        UART_RX_DATA_OUTPUT_DONE : out std_logic;
        -------------------------------------------------------
        SEG_DIGIT : out std_logic_vector(3 downto 0);
        SEG_LED : out std_logic_vector(7 downto 0)
        );
end UART_INTERFACE;

architecture Behavioral of UART_INTERFACE is
    component UART_TX
    port(CLOCK : in std_logic;
         UART_TX_ENABLE : in std_logic;
         UART_TX_DATA_INPUT : in std_logic_vector(7 downto 0);
         ----
         UART_TX_DATA_OUTPUT_RUN : out std_logic;
         UART_TX_DATA_OUTPUT_DONE : out std_logic;
         UART_TX_DATA_OUTPUT : out std_logic);
    end component;
    
    component UART_RX
    port(CLOCK : in std_logic;
         UART_RX_DATA_INPUT : in std_logic;
         ----
         UART_RX_DATA_OUTPUT_DONE : out std_logic;
         UART_RX_DATA_OUTPUT : out std_logic_vector(7 downto 0));
    end component;

    component SEGMENT_DECODE
    port(CLOCK : in std_logic;
         DISPLAY_SHIFT : in std_logic;
         DATA_INPUT : in std_logic_vector(7 downto 0);
         ----
         DIGIT : out std_logic_vector(3 downto 0);
         SEGMENT : out std_logic_vector(7 downto 0));
    end component;
    
    signal UART_TX_ENABLE_COUNT : integer range 0 to 50000000 := 0;
    signal UART_TX_ENABLE_temp : std_logic;
    signal UART_RX_DATA_OUTPUT_DONE_temp : std_logic;
    signal UART_RX_DATA_OUTPUT_temp : std_logic_vector(7 downto 0);    
    
begin
    UART_TX_FUNCTION : UART_TX
    port map(CLOCK => CLOCK,
             UART_TX_ENABLE => UART_TX_ENABLE_temp,
             UART_TX_DATA_INPUT => UART_TX_DATA_INPUT,
             UART_TX_DATA_OUTPUT_RUN => UART_TX_DATA_OUTPUT_RUN,
             UART_TX_DATA_OUTPUT_DONE => UART_TX_DATA_OUTPUT_DONE,
             UART_TX_DATA_OUTPUT => UART_TX_DATA_OUTPUT);
             
    UART_RX_FUNCTION : UART_RX
    port map(CLOCK => CLOCK,
             UART_RX_DATA_INPUT => UART_RX_DATA_INPUT,       
             UART_RX_DATA_OUTPUT_DONE => UART_RX_DATA_OUTPUT_DONE_temp,
             UART_RX_DATA_OUTPUT => UART_RX_DATA_OUTPUT_temp);
             
    SEGMENT_DECODE_FUNCTION : SEGMENT_DECODE
    port map(CLOCK => CLOCK,
             DISPLAY_SHIFT => UART_RX_DATA_OUTPUT_DONE_temp,         
             DATA_INPUT => UART_RX_DATA_OUTPUT_temp,
             DIGIT => SEG_DIGIT,
             SEGMENT => SEG_LED);
             
    process(CLOCK)
    begin
        if rising_edge(CLOCK) then
            if UART_TX_DATA_ENABLE = '1' then
                UART_TX_ENABLE_COUNT <= UART_TX_ENABLE_COUNT + 1;
                
                if UART_TX_ENABLE_COUNT = 1 then
                    UART_TX_ENABLE_temp <= '1';
                elsif UART_TX_ENABLE_COUNT > 1 and UART_TX_ENABLE_COUNT < 50000000 then
                    UART_TX_ENABLE_temp <= '0';
                end if;
            else
                UART_TX_ENABLE_COUNT <= 0;    
            end if;
        end if;
    end process;
    
    UART_RX_DATA_OUTPUT_DONE <= UART_RX_DATA_OUTPUT_DONE_temp;         
 
             


end Behavioral;
