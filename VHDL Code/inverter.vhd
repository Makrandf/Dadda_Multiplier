library ieee;
use ieee.std_logic_1164.all;

entity inverter is
port(a: in std_logic;
	  a_inv:out std_logic);
end inverter;

architecture a1_inverter of inverter is
begin
a_inv<=not a ;
end a1_inverter;
