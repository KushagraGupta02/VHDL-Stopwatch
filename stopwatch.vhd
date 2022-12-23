----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/28/2022 02:38:49 PM
-- Design Name: 
-- Module Name: stopwatch - Behavioral
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

entity stopwatch is
  Port (start : in STD_LOGIC;
        pause : in STD_LOGIC;
        continue : in STD_LOGIC;
        reset : in STD_LOGIC;
        clk : in STD_LOGIC;
        s0 : out STD_LOGIC;
        s1 : out STD_LOGIC;
        s2 : out STD_LOGIC;
        s3 : out STD_LOGIC;
        s4 : out STD_LOGIC;
        s5 : out STD_LOGIC;
        s6 : out STD_LOGIC;
        dp : out STD_LOGIC;
        an : out STD_LOGIC_VECTOR(3 downto 0));
end stopwatch;

architecture Behavioral of stopwatch is
    component counter
      Port (clk : in STD_LOGIC;
            start : in STD_LOGIC;
            pause : in STD_LOGIC;
            continue : in STD_LOGIC;
            reset : in STD_LOGIC;
          b0 : out STD_LOGIC_VECTOR(3 downto 0);
          b1 : out STD_LOGIC_VECTOR(3 downto 0);  
          b2 : out STD_LOGIC_VECTOR(3 downto 0);
          b3 : out STD_LOGIC_VECTOR(3 downto 0));
    end component;
    component segment
    Port (b0 : in STD_LOGIC_VECTOR(3 downto 0);
            b1 : in STD_LOGIC_VECTOR(3 downto 0);  
            b2 : in STD_LOGIC_VECTOR(3 downto 0);
            b3 : in STD_LOGIC_VECTOR(3 downto 0);
            clk : in STD_LOGIC;
            dp : out STD_LOGIC;
            s0 : out STD_LOGIC;
            s1 : out STD_LOGIC;
            s2 : out STD_LOGIC;
            s3 : out STD_LOGIC;
            s4 : out STD_LOGIC;
            s5 : out STD_LOGIC;
            s6 : out STD_LOGIC;
            an : out STD_LOGIC_VECTOR(3 downto 0));
     end component;
     signal d0,d1,d2,d3: std_logic_vector(3 downto 0);
begin
    coun : counter port
    map (clk,start,pause,continue,reset,d0,d1,d2,d3);
    seg : segment port
    map (d0,d1,d2,d3,clk,dp,s0,s1,s2,s3,s4,s5,s6,an);

end Behavioral;
