library ieee;
use ieee.std_logic_1164.all;

entity tiny_xor is
port(a,b: in std_logic;
     y:out std_logic);
end tiny_xor;

architecture a1_tiny_xor of tiny_xor is
begin
y<=a xor b;
end a1_tiny_xor;