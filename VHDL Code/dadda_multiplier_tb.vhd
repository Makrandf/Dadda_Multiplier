library ieee;
use ieee.std_logic_1164.all;
entity dadda_multiplier_tb is 
end dadda_multiplier_tb ;
architecture test1 of dadda_multiplier_tb is 
signal a , b : std_logic_vector(15 downto 0);
signal sum : std_logic_vector(31 downto 0);

component dadda_multiplier 
port(a       : in std_logic_vector(15 downto 0);
     b       : in std_logic_vector(15 downto 0);
     sum  : out std_logic_vector(31 downto 0)
    );
end component ;
begin 
UT1 : dadda_multiplier port map(a,b,sum);

process 

begin

a<="0000000000000010";
b<="0000000000000011";

wait for 20 ns;

a<="1111111111111111";
b<="1111111111111111";
wait;
end process;

end test1 ;