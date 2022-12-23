

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity segment is
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
end segment;

architecture Behavioral of segment is

    component timingcircuit
    port(clk : in STD_LOGIC;
            an : out STD_LOGIC_VECTOR(3 downto 0);
            s1 : out STD_LOGIC;
            s2 : out STD_LOGIC);
    end component;
    
    component multiplexer
      port( a,b,c,d : in STD_LOGIC_VECTOR(3 downto 0);
             s1 : in STD_LOGIC;
             s2 : in STD_LOGIC;
             dp : out STD_LOGIC;
             op : out STD_LOGIC_VECTOR(3 downto 0));
    end component;
    
    signal temp1,temp2:std_logic;
    signal op: std_logic_vector(3 downto 0);
    begin
    c: timingcircuit port
    map(clk,an,temp1,temp2);
    mul : multiplexer port
    map(b3,b2,b1,b0,temp1,temp2,dp,op);
    s6 <= ((not op(0)) and (not op(1)) and (not op(2)) and op(3)) or ((not op(0)) and op(1) and (not op(2)) and (not op(3))) or ((op(0)) and (not op(1)) and (op(2)) and (op(3))) or ((op(0)) and (op(1)) and (not op(2)) and (op(3)));
    s5 <= ((not op(0)) and (op(1)) and (not op(2)) and op(3)) or ((not op(0)) and op(1) and (op(2)) and (not op(3))) or ((op(0)) and op(1) and (not op(2)) and (not op(3))) or ((op(0)) and op(1) and (op(2))) or ((op(0)) and (not op(1)) and (op(2)) and (op(3)));
    s4 <= ((not op(0)) and (not op(1)) and (op(2)) and (not op(3))) or ((op(0)) and op(1) and (not op(2)) and (not op(3))) or ((op(0)) and op(1) and (op(2)));
    s3 <= ((not op(0)) and (not op(1)) and (not op(2)) and op(3)) or ((not op(0)) and op(1) and (not op(2)) and (not op(3))) or ((not op(0)) and op(1) and op(2) and op(3)) or ((op(0)) and op(1) and (op(2)) and (op(3))) or ((op(0)) and (not op(1)) and (op(2)) and (not op(3)));
    s2 <= ((not op(0)) and op(3)) or ((not op(0)) and op(1) and (not op(2)) and (not op(3))) or ((op(0)) and (not op(1)) and (not op(2)) and (op(3)));
    s1 <= ((not op(0)) and (not op(1)) and (not op(2)) and op(3)) or ((not op(0)) and (not op(1)) and (op(2))) or ((not op(0)) and op(1) and (op(2)) and (op(3))) or ((op(0)) and op(1) and (not op(2)) and (op(3)));
    s0 <= ((not op(0)) and (not op(1)) and (not op(2))) or ((not op(0)) and op(1) and (op(2)) and (op(3))) or ((op(0)) and op(1) and (not op(2)) and (not op(3)));
    
end Behavioral;