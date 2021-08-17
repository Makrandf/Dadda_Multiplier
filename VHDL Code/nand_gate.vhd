library ieee;
use ieee.std_logic_1164.all;

entity nand_gate is
port(a,b: in std_logic;
	 y: out std_logic);
end nand_gate;

architecture a1_nand_gate of nand_gate is
begin
y<=a nand b;
end a1_nand_gate;