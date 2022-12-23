----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/21/2022 03:21:28 PM
-- Design Name: 
-- Module Name: multiplexer - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity multiplexer is
  Port ( a,b,c,d : in STD_LOGIC_VECTOR(3 downto 0);
         s1 : in STD_LOGIC;
         s2 : in STD_LOGIC;
         dp : out STD_LOGIC;
         op : out STD_LOGIC_VECTOR(3 downto 0));
end multiplexer;

architecture Behavioral of multiplexer is

begin
    mux : process(s1,s2)
    begin
        if s1='0' and s2='0' then
            op <= a;
            dp <= '0';
        end if;
        if s1='0' and s2='1' then
            op <= b;
            dp <= '1';
        end if;
        if s1='1' and s2='0' then
            op <= c;
            dp <= '0';
        end if;
        if s1='1' and s2='1' then
            op <= d;
            dp <= '1';
        end if;
    end process;
    
end Behavioral;
