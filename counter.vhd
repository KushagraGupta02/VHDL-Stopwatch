----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/28/2022 03:14:13 PM
-- Design Name: 
-- Module Name: counter - Behavioral
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter is
  Port (clk : in STD_LOGIC;
        start : in STD_LOGIC;
        pause : in STD_LOGIC;
        continue : in STD_LOGIC;
        reset : in STD_LOGIC;
        b0 : out STD_LOGIC_VECTOR(3 downto 0);
        b1 : out STD_LOGIC_VECTOR(3 downto 0);  
        b2 : out STD_LOGIC_VECTOR(3 downto 0);
        b3 : out STD_LOGIC_VECTOR(3 downto 0));
        
end counter;

architecture Behavioral of counter is
signal star : std_logic := start;
signal paus : std_logic := pause;
signal continu : std_logic := continue;
signal rese : std_logic := reset;
signal q : integer := 0 ;
signal b : integer := 0;
signal c : integer := 0;
signal d : integer := 0;
signal e : integer := 0;
signal f : integer := 0;

begin

    timer:process(clk)
    begin
        if rising_edge(clk) then
                if (q mod 10000000=0 and ((star='1' and paus='0' and continu='0') or (star='1' and paus='0' and continu='1') or (star='1' and paus='1' and continu='1'))) then
                    b <= b+1;
                    q <= q+1;
                    
                elsif (rese='1') then
                    b <= 0;
                elsif ((star='1' and paus='1' and continu='1') or (star='1' and paus='0' and continu='1') or (star='1' and paus='0' and continu='0')) then
                    q <= q+1;             
                end if;
         end if;
    end process;
        
    c <= b mod 10;
    d <= b/10 mod 60 mod 10;
    e <= b/10 mod 60 /10;
    f <= b/600 mod 10;
    
    value:process(c,d,e,f)
    begin
        if c=0 then
            b0 <= "0000";
        elsif c=1 then
            b0 <= "1000";
        elsif c=2 then
            b0 <= "0100";
        elsif c=3 then
            b0 <= "1100";
        elsif c=4 then
            b0 <= "0010";
        elsif c=5 then
            b0 <= "1010";
        elsif c=6 then
            b0 <= "0110";
        elsif c=7 then
            b0 <= "1110";
        elsif c=8 then
            b0 <= "0001";
        elsif c=9 then
            b0 <= "1001";
        end if;
            
            
        if d=0 then
            b1 <= "0000";
        elsif d=1 then
            b1 <= "1000";
        elsif d=2 then
            b1 <= "0100";
        elsif d=3 then
            b1 <= "1100";
        elsif d=4 then
            b1 <= "0010";
        elsif d=5 then
            b1 <= "1010";
        elsif d=6 then
            b1 <= "0110";
        elsif d=7 then
            b1<= "1110";
        elsif d=8 then
            b1 <= "0001";
        elsif d=9 then
            b1 <= "1001";
        end if;  
            
            
        if e=0 then
            b2 <= "0000";
        elsif e=1 then
            b2 <= "1000";
        elsif e=2 then
            b2 <= "0100";
        elsif e=3 then
            b2 <= "1100";
        elsif e=4 then
            b2 <= "0010";
        elsif e=5 then
            b2 <= "1010";
        elsif e=6 then
            b2 <= "0110";
        elsif e=7 then
            b2 <= "1110";
        elsif e=8 then
            b2 <= "0001";
        elsif e=9 then
            b2 <= "1001";
        end if;   
        
        
        if f=0 then
            b3 <= "0000";
        elsif f=1 then
            b3 <= "1000";
        elsif f=2 then
            b3 <= "0100";
        elsif f=3 then
            b3 <= "1100";
        elsif f=4 then
            b3 <= "0010";
        elsif f=5 then
            b3 <= "1010";
        elsif f=6 then
            b3 <= "0110";
        elsif f=7 then
            b3 <= "1110";
        elsif f=8 then
            b3 <= "0001";
        elsif f=9 then
            b3 <= "1001";
        end if;
        
    end process;                                                             
    

end Behavioral;
