library ieee;
use ieee.std_logic_1164.all;

entity nor_gate is
port(a,b: in std_logic;
     y: out std_logic);
end nor_gate;

architecture a1_nor_gate of nor_gate is
begin
y<=a nor b;
end a1_nor_gate;