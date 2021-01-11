----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/10 19:58:36
-- Design Name: 
-- Module Name: SYNC_COUNTER_CLOCK_DIV - Behavioral
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
USE IEEE.std_logic_unsigned.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SYNC_COUNTER_CLOCK_DIV is
  Port (CLOCK : in std_logic;
       RESET : in std_logic;
       CLOCK_5MHz_OUT : out std_logic;
       CLOCK_500KHz_OUT : out std_logic;
       CLOCK_50KHz_OUT : out std_logic;
       CLOCK_5KHz_OUT : out std_logic;
       CLOCK_500Hz_OUT : out std_logic;
       CLOCK_50Hz_OUT : out std_logic;
       CLOCK_5Hz_OUT : out std_logic;
       CLOCK_0_5Hz_OUT : out std_logic);
end SYNC_COUNTER_CLOCK_DIV;


architecture Behavioral_0 of SYNC_COUNTER_CLOCK_DIV is
      signal CLOCK_5MHz_OUT_Temp : std_logic := '0';
      signal CLOCK_500KHz_OUT_Temp : std_logic := '0';
      signal CLOCK_50KHz_OUT_Temp : std_logic := '0';
      signal CLOCK_5KHz_OUT_Temp : std_logic := '0';
      signal CLOCK_500Hz_OUT_Temp : std_logic := '0';
      signal CLOCK_50Hz_OUT_Temp : std_logic := '0';
      signal CLOCK_5Hz_OUT_Temp : std_logic := '0';
      signal CLOCK_0_5Hz_OUT_Temp : std_logic := '0';
      signal M : integer := 10**6;
      signal K : integer := 10**3;
          
      component SYNC_COUNTER_GENERATOR  
      generic(FROM_Hz : integer;
          TO_Hz   : integer); 
      Port (CLOCK : IN std_logic;
            RESET : IN std_logic;
            CLOCK_OUT : OUT std_logic);
      end component;
      
begin
      CLOCK_5MHz_OUT <= CLOCK_5MHz_OUT_Temp;
      CLOCK_500KHz_OUT <= CLOCK_500KHz_OUT_Temp;
      CLOCK_50KHz_OUT <= CLOCK_50KHz_OUT_Temp;
      CLOCK_5KHz_OUT <= CLOCK_5KHz_OUT_Temp;
      CLOCK_500Hz_OUT <= CLOCK_500Hz_OUT_Temp;
      CLOCK_50Hz_OUT <= CLOCK_50Hz_OUT_Temp;
      CLOCK_5Hz_OUT <= CLOCK_5Hz_OUT_Temp;
      CLOCK_0_5Hz_OUT <= CLOCK_0_5Hz_OUT_Temp;
    
    CLOCK_from_50MHz_to_5MHz : SYNC_COUNTER_GENERATOR 
    generic MAP (FROM_HZ => 50*M, TO_HZ => 5*M)
    port MAP(CLOCK => CLOCK, RESET => RESET, CLOCK_OUT => CLOCK_5MHz_OUT_Temp);

    CLOCK_from_50MHz_to_500KHz : SYNC_COUNTER_GENERATOR 
    generic MAP (FROM_HZ => 50*M, TO_HZ => 500*K)
    port MAP(CLOCK => CLOCK, RESET => RESET, CLOCK_OUT => CLOCK_500KHz_OUT_Temp);  

    CLOCK_from_50MHz_to_50KHz : SYNC_COUNTER_GENERATOR 
    generic MAP (FROM_HZ => 50*M, TO_HZ => 50*K)
    port MAP(CLOCK => CLOCK, RESET => RESET, CLOCK_OUT => CLOCK_50KHz_OUT_Temp);

    CLOCK_from_50MHz_to_5KHz : SYNC_COUNTER_GENERATOR 
    generic MAP (FROM_HZ => 50*M, TO_HZ => 5*K)
    port MAP(CLOCK => CLOCK, RESET => RESET, CLOCK_OUT => CLOCK_5KHz_OUT_Temp);

    CLOCK_from_50MHz_to_500Hz : SYNC_COUNTER_GENERATOR 
    generic MAP (FROM_HZ => 50*M, TO_HZ => 500)
    port MAP(CLOCK => CLOCK, RESET => RESET, CLOCK_OUT => CLOCK_500Hz_OUT_Temp);

    CLOCK_from_50MHz_to_50Hz : SYNC_COUNTER_GENERATOR 
    generic MAP (FROM_HZ => 50*M, TO_HZ => 50)
    port MAP(CLOCK => CLOCK, RESET => RESET, CLOCK_OUT => CLOCK_50Hz_OUT_Temp);
    
    CLOCK_from_50MHz_to_5Hz : SYNC_COUNTER_GENERATOR 
    generic MAP (FROM_HZ => 50*M, TO_HZ => 5)
    port MAP(CLOCK => CLOCK, RESET => RESET, CLOCK_OUT => CLOCK_5Hz_OUT_Temp);    
    
    CLOCK_from_50MHz_to_0_5Hz : SYNC_COUNTER_GENERATOR 
    generic MAP (FROM_HZ => 500*M, TO_HZ => 5)  -- TO_Hz 는 INTEGER 타입으로 소수가 불가능하므로, FROM_Hz의 값을 10배로 올림.
    port MAP(CLOCK => CLOCK, RESET => RESET, CLOCK_OUT => CLOCK_0_5Hz_OUT_Temp);    

end BEHAVIORAL_0;

---------------------------------------------------- SECOND BEHAVIORAL for test ----------------------------------------------------------
architecture Behavioral of SYNC_COUNTER_CLOCK_DIV is
      signal CLOCK_5MHz_OUT_Temp : std_logic := '0';
      signal CLOCK_500KHz_OUT_Temp : std_logic := '0';
      signal CLOCK_50KHz_OUT_Temp : std_logic := '0';
      signal CLOCK_5KHz_OUT_Temp : std_logic := '0';
      signal CLOCK_500Hz_OUT_Temp : std_logic := '0';
      signal CLOCK_50Hz_OUT_Temp : std_logic := '0';
      signal CLOCK_5Hz_OUT_Temp : std_logic := '0';
      signal CLOCK_0_5Hz_OUT_Temp : std_logic := '0';
      signal COUNT_10 : integer range 0 to 9;
      signal COUNT_100 : integer range 0 to 99;
      signal COUNT_1000 : integer range 0 to 999;
      signal COUNT_10000 : integer range 0 to 9999;
      signal COUNT_100000 : integer range 0 to 99999;
      signal COUNT_1000000 : integer range 0 to 999999;
      signal COUNT_10000000 : integer range 0 to 9999999;
      signal COUNT_100000000 : integer range 0 to 99999999;
    
begin
   -- process(CLOCK, RESET)
    --BEGIN
      CLOCK_5MHz_OUT <= CLOCK_5MHz_OUT_Temp;
      CLOCK_500KHz_OUT <= CLOCK_500KHz_OUT_Temp;
      CLOCK_50KHz_OUT <= CLOCK_50KHz_OUT_Temp;
      CLOCK_5KHz_OUT <= CLOCK_5KHz_OUT_Temp;
      CLOCK_500Hz_OUT <= CLOCK_500Hz_OUT_Temp;
      CLOCK_50Hz_OUT <= CLOCK_50Hz_OUT_Temp;
      CLOCK_5Hz_OUT <= CLOCK_5Hz_OUT_Temp;
      CLOCK_0_5Hz_OUT <= CLOCK_0_5Hz_OUT_Temp;
    --END process;

---------- 5MHz Clock Output ----------
    PROCESS(CLOCK, RESET)
    BEGIN
        IF rising_edge(CLOCK) THEN
            IF (RESET = '1') THEN 
                COUNT_10 <= 0;
                CLOCK_5MHz_OUT_Temp <= '0'; -- CLOCK_5MHz_OUT_Temp is a STD_LOGIC type bit
            ELSIF (COUNT_10 = 9) THEN
                COUNT_10 <= 0;              -- COUNT_10 is an INTIGER type
                CLOCK_5MHz_OUT_Temp <= NOT CLOCK_5MHz_OUT_Temp;
            ELSE
                COUNT_10 <= COUNT_10 + 1;            
            END IF;
        END IF;
    END PROCESS;

---------- 500KHz Clock Output ----------
    PROCESS(CLOCK, RESET)
    BEGIN
        IF rising_edge(CLOCK) THEN
            IF (RESET = '1') THEN 
                COUNT_100 <= 0;
                CLOCK_500KHz_OUT_Temp <= '0'; 
            ELSIF (COUNT_100 = 99) THEN
                COUNT_100 <= 0;              
                CLOCK_500KHz_OUT_Temp <= NOT CLOCK_500KHz_OUT_Temp;
            ELSE
                COUNT_100 <= COUNT_100 + 1;            
            END IF;
        END IF;
    END PROCESS;

---------- 50KHz Clock Output ----------
    PROCESS(CLOCK, RESET)
    BEGIN
        IF rising_edge(CLOCK) THEN
            IF (RESET = '1') THEN 
                COUNT_1000 <= 0;
                CLOCK_50KHz_OUT_Temp <= '0'; 
            ELSIF (COUNT_1000 = 999) THEN
                COUNT_1000 <= 0;              
                CLOCK_50KHz_OUT_Temp <= NOT CLOCK_50KHz_OUT_Temp;
            ELSE
                COUNT_1000 <= COUNT_1000 + 1;            
            END IF;
        END IF;
    END PROCESS;    
    
---------- 5KHz Clock Output ----------
    PROCESS(CLOCK, RESET)
    BEGIN
        IF rising_edge(CLOCK) THEN
            IF (RESET = '1') THEN 
                COUNT_10000 <= 0;
                CLOCK_5KHz_OUT_Temp <= '0'; 
            ELSIF (COUNT_10000 = 9999) THEN
                COUNT_10000 <= 0;              
                CLOCK_5KHz_OUT_Temp <= NOT CLOCK_5KHz_OUT_Temp;
            ELSE
                COUNT_10000 <= COUNT_10000 + 1;            
            END IF;
        END IF;
    END PROCESS;    
    
---------- 500Hz Clock Output ----------
    PROCESS(CLOCK, RESET)
    BEGIN
        IF rising_edge(CLOCK) THEN
            IF (RESET = '1') THEN 
                COUNT_100000 <= 0;
                CLOCK_500Hz_OUT_Temp <= '0'; 
            ELSIF (COUNT_100000 = 99999) THEN
                COUNT_100000 <= 0;              
                CLOCK_500Hz_OUT_Temp <= NOT CLOCK_500Hz_OUT_Temp;
            ELSE
                COUNT_100000 <= COUNT_100000 + 1;            
            END IF;
        END IF;
    END PROCESS;    
    
---------- 50Hz Clock Output ----------
    PROCESS(CLOCK, RESET)
    BEGIN
        IF rising_edge(CLOCK) THEN
            IF (RESET = '1') THEN 
                COUNT_1000000 <= 0;
                CLOCK_50Hz_OUT_Temp <= '0'; 
            ELSIF (COUNT_1000000 = 999999) THEN
                COUNT_1000000 <= 0;              
                CLOCK_50Hz_OUT_Temp <= NOT CLOCK_50Hz_OUT_Temp;
            ELSE
                COUNT_1000000 <= COUNT_1000000 + 1;            
            END IF;
        END IF;
    END PROCESS;
        
---------- 5Hz Clock Output ----------
    PROCESS(CLOCK, RESET)
    BEGIN
        IF rising_edge(CLOCK) THEN
            IF (RESET = '1') THEN 
                COUNT_10000000 <= 0;
                CLOCK_5Hz_OUT_Temp <= '0'; 
            ELSIF (COUNT_10000000 = 9999999) THEN
                COUNT_10000000 <= 0;              
                CLOCK_5Hz_OUT_Temp <= NOT CLOCK_5Hz_OUT_Temp;
            ELSE
                COUNT_10000000 <= COUNT_10000000 + 1;            
            END IF;
        END IF;
    END PROCESS;
    
---------- 0.5Hz Clock Output ----------
    PROCESS(CLOCK, RESET)
    BEGIN
        IF rising_edge(CLOCK) THEN
            IF (RESET = '1') THEN 
                COUNT_100000000 <= 0;
                CLOCK_0_5Hz_OUT_Temp <= '0'; 
            ELSIF (COUNT_100000000 = 99999999) THEN
                COUNT_100000000 <= 0;              
                CLOCK_0_5Hz_OUT_Temp <= NOT CLOCK_0_5Hz_OUT_Temp;
            ELSE
                COUNT_100000000 <= COUNT_100000000 + 1;            
            END IF;
        END IF;
    END PROCESS;    
            
end Behavioral;


configuration CONF of SYNC_COUNTER_CLOCK_DIV is
    FOR BEHAVIORAL_0
    END FOR;
END CONF;
