----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/11 15:53:11
-- Design Name: 
-- Module Name: myPACK - Behavioral
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
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

package myPack is
    function find_MSB(N : integer) return integer;
end package;

package body myPack is

    function find_MSB(N : integer) return integer is
        variable MSB : integer := 0;
        variable N_temp : integer := N;
    begin
        while (N_temp > 0) loop
            MSB := MSB + 1;
            N_temp := N_temp / 2;
        end loop;
        
        return MSB;
    end function;
    
end package body;
