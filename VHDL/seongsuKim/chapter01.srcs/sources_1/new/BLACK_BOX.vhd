----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/07 13:40:26
-- Design Name: 
-- Module Name: BLACK_BOX - Behavioral
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


library IEEE; -- library ieee, standard library of vhdl 
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

-- declaration of variables (reg in verilog)
-- variable name of variable : data type := initial value
-- assignment of variables
-- name of variable := assigned value

-- declaration of signal (wire in verilog)
-- signal signal name : data type := initial value
-- assignment of signal
-- signal name <= assigned value

entity BLACK_BOX is -- declaration of entitiy (module in verilog)
    port(A,B,C : in std_logic;
         D : out std_logic);
--  Port ( );
end entity BLACK_BOX;
-- end BLACK_BOX;

architecture Behavioral of BLACK_BOX is -- declaration of behavioral of entity (how it works)
-- architecture Behavioral of BLACK_BOX 
begin
    process(A,B,C) -- process(variables), should include all variables
        -- declaration of variables
        variable Temp : std_logic; -- variable only used in process, declared in process
    begin
        Temp := A and B;
        D <= Temp or C after 1 ns; -- after time delay 
    end process;
end architecture Behavioral;
-- end Behavioral;
