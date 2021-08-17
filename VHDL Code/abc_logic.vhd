library ieee;
use ieee.std_logic_1164.all;

entity abc_logic is
port(a,b,c: in std_logic;
     y:out std_logic);
end abc_logic;

Architecture a1_ab_logic of abc_logic is
begin
y<=not(a or (b and c ));
end a1_ab_logic;