-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;
entity testbench is
end testbench;
architecture tb of testbench is
-- In this TB modeling Style, the test bench instantiates the DUT as a component
-- and passes the inputs from a separate VHDL process via signals
component stopwatch
  Port (clk : in STD_LOGIC;
        start : in STD_LOGIC;
        pause : in STD_LOGIC;
        continue : in STD_LOGIC;
        reset : in STD_LOGIC;
        s0 : out STD_LOGIC;
                s1 : out STD_LOGIC;
                s2 : out STD_LOGIC;
                s3 : out STD_LOGIC;
                s4 : out STD_LOGIC;
                s5 : out STD_LOGIC;
                s6 : out STD_LOGIC;
                dp : out STD_LOGIC;
                an : out STD_LOGIC_VECTOR(3 downto 0));     
end component;
signal clk : std_logic := '0';
signal start,pause,continue,reset,s0,s1,s2,s3,s4,s5,s6,dp : std_logic;
signal an : std_logic_vector(3 downto 0);
begin
UUT:stopwatch port map (clk,start, pause, continue,reset,s0,s1,s2,s3,s4,s5,s6,dp,an);
clk<= not clk after 10 ns;
   start <= '0' , '1' after 400 ns;
   pause <= '0' , '1' after 200 ns , '0' after 600 ns ;
   continue <= '0' , '1' after 300 ns , '0' after 500 ns ;
   reset <= '0';
end tb;