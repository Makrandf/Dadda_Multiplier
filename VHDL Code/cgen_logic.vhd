library ieee;
use ieee.std_logic_1164.all;

entity cgen_logic is
port( Gi,Pi,Ci: in std_logic;
		Cout: out std_logic);
end cgen_logic;

architecture a1_cgen_logic of cgen_logic is

component abc_logic is 
port(a,b,c: in std_logic;
     y:out std_logic);
end component abc_logic;

component inverter is 
port(a: in std_logic;
	  a_inv:out std_logic);
end component inverter;


signal temp: std_logic;
begin

U1: abc_logic port map(Gi,Pi,Ci,temp);
U2: inverter port map(temp,Cout);

end a1_cgen_logic;