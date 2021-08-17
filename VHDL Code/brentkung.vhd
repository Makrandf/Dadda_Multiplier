library ieee;
use ieee.std_logic_1164.all;

entity brentkung is
port (A,B : in std_logic_vector(31 downto 0);
		c0 : in std_logic;
		cout: out std_logic;
		sum: out  std_logic_vector(31 downto 0));

		end brentkung;

architecture a1_brentkung of brentkung is
 
signal p_s0,g_s0,g_temp,s_temp: std_logic_vector(31 downto 0);
signal c_temp: std_logic_vector(32 downto 0);
signal p_s1,g_s1: std_logic_vector(15 downto 0);
signal p_s2,g_s2: std_logic_vector(7 downto 0);
signal p_s3,g_s3: std_logic_vector(3 downto 0);
signal p_s4,g_s4: std_logic_vector(1 downto 0);
signal p_s5,g_s5: std_logic;
begin

c_temp(0)<=c0;

Stage0: for i in 0 to 31 generate 

U1: entity work.nand_gate port map(A(i),B(i),g_temp(i));
U2: entity work.inverter port map(g_temp(i),g_s0(i));
U3: entity work.tiny_xor port map(A(i),B(i),p_s0(i));

end generate Stage0;

Stage1: for j in 0 to 15 generate
U4 :entity work.PG_logic port map(g_s0(2*j+1),p_s0(2*j+1),g_s0(2*j),p_s0(2*j),g_s1(j),p_s1(j));
end generate Stage1;

Stage2: for k in 0 to 7 generate
U5: entity work.PG_logic port map(g_s1(2*k+1),p_s1(2*k+1),g_s1(2*k),p_s1(2*k),g_s2(k),p_s2(k));
end generate Stage2;

Stage3: for l in 0 to 3 generate
U6: entity work.PG_logic port map(g_s2(2*l+1),p_s2(2*l+1),g_s2(2*l),p_s2(2*l),g_s3(l),p_s3(l));
end generate Stage3;

Stage4: for m in 0 to 1 generate
U7: entity work.PG_logic port map(g_s3(2*m+1),p_s3(2*m+1),g_s3(2*m),p_s3(2*m),g_s4(m),p_s4(m));
end generate Stage4;

--Stage5---
U8: entity work.PG_logic port map(g_s4(1),p_s4(1),g_s4(0),p_s4(0),g_s5,p_s5);

---------------------------Carry generate logic-------------------------------


U9: entity work.cgen_logic port map(g_s5,p_s5,c_temp(0),c_temp(32));


U10: entity work.cgen_logic port map(g_s4(0),p_s4(0),c_temp(0),c_temp(16));

Stage6: for n in 0 to 1 generate 
U11: entity work.cgen_logic port map(g_s3(2*n),p_s3(2*n),c_temp(16*n),c_temp(16*n+8));
end generate Stage6;

Stage7: for o in 0 to 3 generate 
U12: entity work.cgen_logic port map(g_s2(2*o),p_s2(2*o),c_temp(8*o),c_temp(8*o+4));
end generate Stage7;

Stage8: for p in 0 to 7 generate 
U13: entity work.cgen_logic port map(g_s1(2*p),p_s1(2*p),c_temp(4*p),c_temp(4*p+2));
end generate Stage8;

Stage9: for q in 0 to 15 generate 
U14: entity work.cgen_logic port map(g_s0(2*q),p_s0(2*q),c_temp(2*q),c_temp(2*q+1));
end generate Stage9;
------------------------------------sum values-----------------------------------
Stage10: for r in 0 to 31 generate
U15: entity work.tiny_xor port map(p_s0(r),c_temp(r),s_temp(r));
end generate Stage10;

cout<=c_temp(32);
sum<=s_temp;

end a1_brentkung;

	