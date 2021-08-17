library ieee;
use ieee.std_logic_1164.all;
entity ha is
port(
a,b: IN std_logic;
s,c: OUT std_logic);
end ha;

architecture behav of ha is

begin
s<=(a xor b);
c<=( a and b);

end behav;
