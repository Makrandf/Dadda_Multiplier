library ieee;
use ieee.std_logic_1164.all;
entity par_product is
port( a : IN std_logic_vector(15 downto 0);
b: IN std_logic;
y:out std_logic_vector(15 downto 0));
end par_product;

architecture behav of par_product is
begin
gen: for i in 0 to 15 generate
uut: entity work.and_gate port map(a(i),b,y(i));
end generate gen;
end behav;