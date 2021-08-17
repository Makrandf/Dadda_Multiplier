library ieee;
use ieee.std_logic_1164.all;

entity PG_logic is
port(g2,p2,g1,p1: in std_logic;
		g,p: out std_logic);
end PG_logic;
architecture a1_PG_logic of PG_logic is

component abc_logic is 
port(a,b,c: in std_logic;
     y:out std_logic);
end component abc_logic;

component inverter is 
port(a: in std_logic;
	  a_inv:out std_logic);
end component inverter;

component nand_gate is 
port(a,b: in std_logic;
	 y: out std_logic);
end component nand_gate;

signal g_temp,p_temp : std_logic;
begin

U1: abc_logic port map(g2,p2,g1,g_temp);
U2: inverter port map(g_temp,g);
U3: nand_gate port map(p2,p1,p_temp);
U4: inverter port map(p_temp,p);		

end a1_PG_logic;