library ieee;
use ieee.std_logic_1164.all;
entity fa is
port(
a,b,cin: IN std_logic;
s,c: OUT std_logic);
end fa;

architecture behav of fa is

begin
s<=((a xor b) xor cin);
c<=((a and b) or (a and cin) or (b and cin));

end behav;