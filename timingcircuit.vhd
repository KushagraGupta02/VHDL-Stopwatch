----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/21/2022 02:24:57 PM
-- Design Name: 
-- Module Name: timingcircuit - Behavioral
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

entity timingcircuit is

  Port (clk : in STD_LOGIC;
        an : out STD_LOGIC_VECTOR(3 downto 0);
        s1 : out STD_LOGIC;
        s2 : out STD_LOGIC);
        
end timingcircuit;

architecture Behavioral of timingcircuit is
    signal q : integer := 0 ;
begin

    timer:process(clk)
    begin
        if rising_edge(clk) then
            if q = 400000 then
                an <= "0111";         
                s1 <= '0';
                s2 <= '0';
                q <= q+1;       
            elsif q = 800000 then
                an <= "1011"; 
                s1 <= '0';
                s2 <= '1';
                q <= q+1;        
            elsif q = 1200000 then
                an <= "1101";
                s1 <= '1';
                s2 <= '0';
                q <= q+1;        
            elsif q= 1600000 then
                an <= "1110";
                s1 <= '1';
                s2 <= '1'; 
                q<=1; 
            else
                q <= q+1;             
            end if;
                       
        end if;
        
    end process;
    
end Behavioral;



































