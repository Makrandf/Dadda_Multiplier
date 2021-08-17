library ieee;
use ieee.std_logic_1164.all;

entity dadda_multiplier is
port(a,b: IN std_logic_vector(15 downto 0);
sum: OUT std_logic_vector(31 downto 0));
end dadda_multiplier;

architecture behav of dadda_multiplier is
--type matrix0 is array (16 downto 1,1 to 16) of std_logic;
--signal s0: matrix0;
signal s1: std_logic_vector(1 to 16);
signal s2: std_logic_vector(1 to 16);
signal s3: std_logic_vector(1 to 16);
signal s4: std_logic_vector(1 to 16);
signal s5: std_logic_vector(1 to 16);
signal s6: std_logic_vector(1 to 16);
signal s7: std_logic_vector(1 to 16);
signal s8: std_logic_vector(1 to 16);
signal s9: std_logic_vector(1 to 16);
signal s10: std_logic_vector(1 to 16);
signal s11: std_logic_vector(1 to 16);
signal s12: std_logic_vector(1 to 16);
signal s13: std_logic_vector(1 to 16);
signal s14: std_logic_vector(1 to 16);
signal s15: std_logic_vector(1 to 16);
signal s16: std_logic_vector(1 to 16);

--stage1

signal ha0_sum: std_logic_vector(4 downto 1);
signal fa0_sum: std_logic_vector(8 downto 1);
signal ha0_c: std_logic_vector(4 downto 1);
signal fa0_c: std_logic_vector(8 downto 1);

--stage2

signal ha1_sum: std_logic_vector(4 downto 1);
signal fa1_sum: std_logic_vector(40 downto 1);
signal ha1_c: std_logic_vector(4 downto 1);
signal fa1_c: std_logic_vector(40 downto 1);

--stage3
signal ha2_sum: std_logic_vector(3 downto 1);
signal fa2_sum: std_logic_vector(51 downto 1);
signal ha2_c: std_logic_vector(3 downto 1);
signal fa2_c: std_logic_vector(51 downto 1);

--stage4
signal ha3_sum,eha_cary : std_logic_vector (2 downto 1);
signal fa3_sum,fa3_c : std_logic_vector (44 downto 1);

--stage5
signal ha4_sum,ha4_c : std_logic;
signal fa4_sum,fa4_c : std_logic_vector (25 downto 1);

--stage6

signal ha5_sum,ha5_c : std_logic;
signal fa5_sum,fa5_c : std_logic_vector (27 downto 1);

--adder stage
signal a_brentkung,b_brentkung : std_logic_vector (32 downto 1);
signal cout : std_logic;

begin


U1:entity work.par_product port map(a,b(0),s1);
U2:entity work.par_product port map(a,b(1),s2);
U3:entity work.par_product port map(a,b(2),s3);
U4:entity work.par_product port map(a,b(3),s4);
U5:entity work.par_product port map(a,b(4),s5);
U6:entity work.par_product port map(a,b(5),s6);
U7:entity work.par_product port map(a,b(6),s7);
U8:entity work.par_product port map(a,b(7),s8);
U9:entity work.par_product port map(a,b(8),s9);
U10:entity work.par_product port map(a,b(9),s10);
U11:entity work.par_product port map(a,b(10),s11);
U12:entity work.par_product port map(a,b(11),s12);
U13:entity work.par_product port map(a,b(12),s13);
U14:entity work.par_product port map(a,b(13),s14);
U15:entity work.par_product port map(a,b(14),s15);
U16:entity work.par_product port map(a,b(15),s16);

--stage0 reduction 
U17:entity work.ha port map(s1(3),s2(4),ha0_sum(1),ha0_c(1));
U18:entity work.ha port map(s4(5),s5(6),ha0_sum(2),ha0_c(2));
U19:entity work.ha port map(s7(7),s8(8),ha0_sum(3),ha0_c(3));
U20:entity work.ha port map(s8(7),s9(8),ha0_sum(4),ha0_c(4));
U21:entity work.fa port map(s1(2),s2(3),s3(4),fa0_sum(1),fa0_c(1));
U22:entity work.fa port map(s1(1),s2(2),s3(3),fa0_sum(2),fa0_c(2));
U23:entity work.fa port map(s4(4),s5(5),s6(6),fa0_sum(3),fa0_c(3));
U24:entity work.fa port map(s2(1),s3(2),s4(3),fa0_sum(4),fa0_c(4));
U25:entity work.fa port map(s5(4),s6(5),s7(6),fa0_sum(5),fa0_c(5));
U26:entity work.fa port map(s3(1),s4(2),s5(3),fa0_sum(6),fa0_c(6));
U27:entity work.fa port map(s6(4),s7(5),s8(6),fa0_sum(7),fa0_c(7));
U28:entity work.fa port map(s4(1),s5(2),s6(3),fa0_sum(8),fa0_c(8));

--stage1 reduction
U29:entity work.ha port map(s1(7),s2(8),ha1_sum(1),ha1_c(1));
U30:entity work.ha port map(s4(9),s5(10),ha1_sum(2),ha1_c(2));
U31:entity work.ha port map(s7(11),s8(12),ha1_sum(3),ha1_c(3));
U32:entity work.ha port map(s10(13),s11(14),ha1_sum(4),ha1_c(4));
U33:entity work.fa port map(s1(6),s2(7),s3(8),fa1_sum(1),fa1_c(1));
U34:entity work.fa port map(s1(5),s2(6),s3(7),fa1_sum(2),fa1_c(2));
U35:entity work.fa port map(s4(8),s5(9),s6(10),fa1_sum(3),fa1_c(3));
U36:entity work.fa port map(s1(4),s2(5),s3(6),fa1_sum(4),fa1_c(4));
U37:entity work.fa port map(s4(7),s5(8),s6(9),fa1_sum(5),fa1_c(5));
U38:entity work.fa port map(s7(10),s8(11),s9(12),fa1_sum(6),fa1_c(6));
U39:entity work.fa port map(s3(5),s4(6),s5(7),fa1_sum(7),fa1_c(7));
U40:entity work.fa port map(s6(8),s7(9),s8(10),fa1_sum(8),fa1_c(8));
U41:entity work.fa port map(s9(11),s10(12),s11(13),fa1_sum(9),fa1_c(9));
U42:entity work.fa port map(s12(14),s13(15),s14(16),fa1_sum(10),fa1_c(10));
U43:entity work.fa port map(ha0_c(1),ha0_sum(2),s6(7),fa1_sum(11),fa1_c(11));
U44:entity work.fa port map(s7(8),s8(9),s9(10),fa1_sum(12),fa1_c(12));
U45:entity work.fa port map(s10(11),s11(12),s12(13),fa1_sum(13),fa1_c(13));
U46:entity work.fa port map(s13(14),s14(15),s15(16),fa1_sum(14),fa1_c(14));
U47:entity work.fa port map(fa0_c(1),fa0_sum(3),ha0_c(2),fa1_sum(15),fa1_c(15));
U48:entity work.fa port map(ha0_sum(3),s9(9),s10(10),fa1_sum(16),fa1_c(16));
U49:entity work.fa port map(s11(11),s12(12),s13(13),fa1_sum(17),fa1_c(17));
U50:entity work.fa port map(s14(14),s15(15),s16(16),fa1_sum(18),fa1_c(18));
U51:entity work.fa port map(fa0_c(2),fa0_sum(5),fa0_c(3),fa1_sum(19),fa1_c(19));
U52:entity work.fa port map(ha0_sum(4),ha0_c(3),s10(9),fa1_sum(20),fa1_c(20));
U53:entity work.fa port map(s11(10),s12(11),s13(12),fa1_sum(21),fa1_c(21));
U54:entity work.fa port map(s14(13),s15(14),s16(15),fa1_sum(22),fa1_c(22));
U55:entity work.fa port map(fa0_c(4),fa0_sum(7),fa0_c(5),fa1_sum(23),fa1_c(23));
U56:entity work.fa port map(s9(7),ha0_c(4),s10(8),fa1_sum(24),fa1_c(24));
U57:entity work.fa port map(s11(9),s12(10),s13(11),fa1_sum(25),fa1_c(25));
U58:entity work.fa port map(s14(12),s15(13),s16(14),fa1_sum(26),fa1_c(26));
U59:entity work.fa port map(fa0_sum(8),fa0_c(6),fa0_c(7),fa1_sum(27),fa1_c(27));
U60:entity work.fa port map(s8(5),s9(6),s10(7),fa1_sum(28),fa1_c(28));
U61:entity work.fa port map(s11(8),s12(9),s13(10),fa1_sum(29),fa1_c(29));
U62:entity work.fa port map(s14(11),s15(12),s16(13),fa1_sum(30),fa1_c(30));
U63:entity work.fa port map(s5(1),s6(2),s7(3),fa1_sum(31),fa1_c(31));
U64:entity work.fa port map(s8(4),s9(5),s10(6),fa1_sum(32),fa1_c(32));
U65:entity work.fa port map(s11(7),s12(8),s13(9),fa1_sum(33),fa1_c(33));
U66:entity work.fa port map(s14(10),s15(11),s16(12),fa1_sum(34),fa1_c(34));
U67:entity work.fa port map(s6(1),s7(2),s8(3),fa1_sum(35),fa1_c(35));
U68:entity work.fa port map(s9(4),s10(5),s11(6),fa1_sum(36),fa1_c(36));
U69:entity work.fa port map(s12(7),s13(8),s14(9),fa1_sum(37),fa1_c(37));
U70:entity work.fa port map(s7(1),s8(2),s9(3),fa1_sum(38),fa1_c(38));
U71:entity work.fa port map(s10(4),s11(5),s12(6),fa1_sum(39),fa1_c(39));
U72:entity work.fa port map(s8(1),s9(2),s10(3),fa1_sum(40),fa1_c(40));

--stage2 reduction
U72b:entity work.ha port map(s1(10),s2(11),ha2_sum(1),ha2_c(1));
U73:entity work.ha port map(s4(12),s5(13),ha2_sum(2),ha2_c(2));
U74:entity work.ha port map(s7(14),s8(15),ha2_sum(3),ha2_c(3));

U75: entity work.fa port map (s1(9),s2(10),s3(11),fa2_sum(1),fa2_c(1));
U76: entity work.fa port map (s1(8),s2(9),s3(10),fa2_sum(2),fa2_c(2));
U77: entity work.fa port map (s4(11),s5(12),s6(13),fa2_sum(3),fa2_c(3));
U78: entity work.fa port map (ha1_sum(1),s3(9),s4(10),fa2_sum(4),fa2_c(4));
U79: entity work.fa port map (s5(11),s6(12),s7(13),fa2_sum(5),fa2_c(5));
U80: entity work.fa port map (s8(14),s9(15),s10(16),fa2_sum(6),fa2_c(6));
U81: entity work.fa port map (fa1_sum(1),ha1_c(1),ha1_sum(2),fa2_sum(7),fa2_c(7));
U82: entity work.fa port map (s6(11),s7(12),s8(13),fa2_sum(8),fa2_c(8));
U83: entity work.fa port map (s9(14),s10(15),s11(16),fa2_sum(9),fa2_c(9));
U84: entity work.fa port map (fa1_sum(2),fa1_c(1),fa1_sum(3),fa2_sum(10),fa2_c(10));
U85: entity work.fa port map (ha1_c(2),ha1_sum(3),s9(13),fa2_sum(11),fa2_c(11));
U86: entity work.fa port map (s10(14),s11(15),s12(16),fa2_sum(12),fa2_c(12));
U87: entity work.fa port map (fa1_sum(4),fa1_c(2),fa1_sum(5),fa2_sum(13),fa2_c(13));
U88: entity work.fa port map (fa1_c(3),fa1_sum(6),ha1_c(3),fa2_sum(14),fa2_c(14));
U89: entity work.fa port map (ha1_sum(4),s12(15),s13(16),fa2_sum(15),fa2_c(15));
U90: entity work.fa port map (fa1_sum(7),fa1_c(4),fa1_sum(8),fa2_sum(16),fa2_c(16));
U91: entity work.fa port map (fa1_c(5),fa1_sum(9),fa1_c(6),fa2_sum(17),fa2_c(17));
U92: entity work.fa port map (fa1_sum(10),ha1_c(4),ha0_sum(1),fa2_sum(18),fa2_c(18));
U93: entity work.fa port map (fa1_sum(11),fa1_c(7),fa1_sum(12),fa2_sum(19),fa2_c(19));
U94: entity work.fa port map (fa1_c(8),fa1_sum(13),fa1_c(9),fa2_sum(20),fa2_c(20));
U95: entity work.fa port map (fa1_sum(14),fa1_c(10),fa0_sum(1),fa2_sum(21),fa2_c(21));
U96: entity work.fa port map (fa1_sum(15),fa1_c(11),fa1_sum(16),fa2_sum(22),fa2_c(22));
U97: entity work.fa port map (fa1_c(12),fa1_sum(17),fa1_c(13),fa2_sum(23),fa2_c(23));
U98: entity work.fa port map (fa1_sum(18),fa1_c(14),fa0_sum(2),fa2_sum(24),fa2_c(24));
U99: entity work.fa port map (fa1_sum(19),fa1_c(15),fa1_sum(20),fa2_sum(25),fa2_c(25));
U100: entity work.fa port map (fa1_c(16),fa1_sum(21),fa1_c(17),fa2_sum(26),fa2_c(26));
U101: entity work.fa port map (fa1_sum(22),fa1_c(18),fa0_sum(4),fa2_sum(27),fa2_c(27));
U102: entity work.fa port map (fa1_sum(23),fa1_c(19),fa1_sum(24),fa2_sum(28),fa2_c(28));
U103: entity work.fa port map (fa1_c(20),fa1_sum(25),fa1_c(21),fa2_sum(29),fa2_c(29));
U104: entity work.fa port map (fa1_sum(26),fa1_c(22),fa0_sum(6),fa2_sum(30),fa2_c(30));
U105: entity work.fa port map (fa1_sum(27),fa1_c(23),fa1_sum(28),fa2_sum(31),fa2_c(31));
U106: entity work.fa port map (fa1_c(24),fa1_sum(29),fa1_c(25),fa2_sum(32),fa2_c(32));
U107: entity work.fa port map (fa1_sum(30),fa1_c(26),s7(4),fa2_sum(33),fa2_c(33));
U108: entity work.fa port map (fa1_sum(31),fa1_c(27),fa1_sum(32),fa2_sum(34),fa2_c(34));
U109: entity work.fa port map (fa1_c(28),fa1_sum(33),fa1_c(29),fa2_sum(35),fa2_c(35));
U110: entity work.fa port map (fa1_sum(34),fa1_c(30),fa0_c(8),fa2_sum(36),fa2_c(36));
U111: entity work.fa port map (fa1_sum(35),fa1_c(31),fa1_sum(36),fa2_sum(37),fa2_c(37));
U112: entity work.fa port map (fa1_c(32),fa1_sum(37),fa1_c(33),fa2_sum(38),fa2_c(38));
U113: entity work.fa port map (fa1_c(34),s15(10),s16(11),fa2_sum(39),fa2_c(39));
U114: entity work.fa port map (fa1_sum(38),fa1_c(35),fa1_sum(39),fa2_sum(40),fa2_c(40));
U115: entity work.fa port map (fa1_c(36),fa1_c(37),s13(7),fa2_sum(41),fa2_c(41));
U116: entity work.fa port map (s14(8),s15(9),s16(10),fa2_sum(42),fa2_c(42));
U117: entity work.fa port map (fa1_sum(40),fa1_c(38),fa1_c(39),fa2_sum(43),fa2_c(43));
U118: entity work.fa port map (s11(4),s12(5),s13(6),fa2_sum(44),fa2_c(44));
U119: entity work.fa port map (s14(7),s15(8),s16(9),fa2_sum(45),fa2_c(45));
U120: entity work.fa port map (fa1_c(40),s9(1),s10(2),fa2_sum(46),fa2_c(46));
U121: entity work.fa port map (s11(3),s12(4),s13(5),fa2_sum(47),fa2_c(47));
U122: entity work.fa port map (s14(6),s15(7),s16(8),fa2_sum(48),fa2_c(48));
U123: entity work.fa port map (s10(1),s11(2),s12(3),fa2_sum(49),fa2_c(49));
U124: entity work.fa port map (s13(4),s14(5),s15(6),fa2_sum(50),fa2_c(50));
U125: entity work.fa port map (s11(1),s12(2),s13(3),fa2_sum(51),fa2_c(51));

--stage3 reduction
U126: entity work.ha port map (s1(12),s2(13),ha3_sum(1),eha_cary(1));
U127: entity work.fa port map (s1(11),s2(12),s3(13),fa3_sum(1),fa3_c(1));
U128: entity work.ha port map (s4(14),s5(15),ha3_sum(2),eha_cary(2));
U129: entity work.fa port map (ha2_sum(1),s3(12),s4(13),fa3_sum(2),fa3_c(2));
U130: entity work.fa port map (s5(14),s6(15),s7(16),fa3_sum(3),fa3_c(3));
U131: entity work.fa port map (fa2_sum(1),ha2_c(1),ha2_sum(2),fa3_sum(4),fa3_c(4));
U132: entity work.fa port map (s6(14),s7(15),s8(16),fa3_sum(5),fa3_c(5));
U133: entity work.fa port map (fa2_sum(2),fa2_c(1),fa2_sum(3),fa3_sum(6),fa3_c(6));
U134: entity work.fa port map (ha2_c(2),ha2_sum(3),s9(16),fa3_sum(7),fa3_c(7));
U135: entity work.fa port map (fa2_sum(4),fa2_c(2),fa2_sum(5),fa3_sum(8),fa3_c(8));
U136: entity work.fa port map (fa2_c(3),fa2_sum(6),ha2_c(3),fa3_sum(9),fa3_c(9));
U137: entity work.fa port map (fa2_sum(7),fa2_c(4),fa2_sum(8),fa3_sum(10),fa3_c(10));
U138: entity work.fa port map (fa2_c(5),fa2_sum(9),fa2_c(6),fa3_sum(11),fa3_c(11));
U139: entity work.fa port map (fa2_sum(10),fa2_c(7),fa2_sum(11),fa3_sum(12),fa3_c(12));
U140: entity work.fa port map (fa2_c(8),fa2_sum(12),fa2_c(9),fa3_sum(13),fa3_c(13));
U141: entity work.fa port map (fa2_sum(13),fa2_c(10),fa2_sum(14),fa3_sum(14),fa3_c(14));
U142: entity work.fa port map (fa2_c(11),fa2_sum(15),fa2_c(12),fa3_sum(15),fa3_c(15));
U143: entity work.fa port map (fa2_sum(16),fa2_c(13),fa2_sum(17),fa3_sum(16),fa3_c(16));
U144: entity work.fa port map (fa2_c(14),fa2_sum(18),fa2_c(15),fa3_sum(17),fa3_c(17));
U145: entity work.fa port map (fa2_sum(19),fa2_c(16),fa2_sum(20),fa3_sum(18),fa3_c(18));
U146: entity work.fa port map (fa2_c(17),fa2_sum(21),fa2_c(18),fa3_sum(19),fa3_c(19));
U147: entity work.fa port map (fa2_sum(22),fa2_c(19),fa2_sum(23),fa3_sum(20),fa3_c(20));
U148: entity work.fa port map (fa2_c(20),fa2_sum(24),fa2_c(21),fa3_sum(21),fa3_c(21));
U149: entity work.fa port map (fa2_sum(25),fa2_c(22),fa2_sum(26),fa3_sum(22),fa3_c(22));
U150: entity work.fa port map (fa2_c(23),fa2_sum(27),fa2_c(24),fa3_sum(23),fa3_c(23));
U151: entity work.fa port map (fa2_sum(28),fa2_c(25),fa2_sum(29),fa3_sum(24),fa3_c(24));
U152: entity work.fa port map (fa2_c(26),fa2_sum(30),fa2_c(27),fa3_sum(25),fa3_c(25));
U153: entity work.fa port map (fa2_sum(31),fa2_c(28),fa2_sum(32),fa3_sum(26),fa3_c(26));
U154: entity work.fa port map (fa2_c(29),fa2_sum(33),fa2_c(30),fa3_sum(27),fa3_c(27));
U155: entity work.fa port map (fa2_sum(34),fa2_c(31),fa2_sum(35),fa3_sum(28),fa3_c(28));
U156: entity work.fa port map (fa2_c(32),fa2_sum(36),fa2_c(33),fa3_sum(29),fa3_c(29));
U157: entity work.fa port map (fa2_sum(37),fa2_c(34),fa2_sum(38),fa3_sum(30),fa3_c(30));
U158: entity work.fa port map (fa2_c(35),fa2_sum(39),fa2_c(36),fa3_sum(31),fa3_c(31));
U159: entity work.fa port map (fa2_sum(40),fa2_c(37),fa2_sum(41),fa3_sum(32),fa3_c(32));
U160: entity work.fa port map (fa2_c(38),fa2_sum(42),fa2_c(39),fa3_sum(33),fa3_c(33));
U161: entity work.fa port map (fa2_sum(43),fa2_c(40),fa2_sum(44),fa3_sum(34),fa3_c(34));
U162: entity work.fa port map (fa2_c(41),fa2_sum(45),fa2_c(42),fa3_sum(35),fa3_c(35));
U163: entity work.fa port map (fa2_sum(46),fa2_c(43),fa2_sum(47),fa3_sum(36),fa3_c(36));
U164: entity work.fa port map (fa2_c(44),fa2_sum(48),fa2_c(45),fa3_sum(37),fa3_c(37));
U165: entity work.fa port map (fa2_sum(49),fa2_c(46),fa2_sum(50),fa3_sum(38),fa3_c(38));
U166: entity work.fa port map (fa2_c(47),fa2_c(48),s16(7),fa3_sum(39),fa3_c(39));
U167: entity work.fa port map (fa2_sum(51),fa2_c(49),fa2_c(50),fa3_sum(40),fa3_c(40));
U168: entity work.fa port map (s14(4),s15(5),s16(6),fa3_sum(41),fa3_c(41));
U169: entity work.fa port map (fa2_c(51),s12(1),s13(2),fa3_sum(42),fa3_c(42));
U170: entity work.fa port map (s14(3),s15(4),s16(5),fa3_sum(43),fa3_c(43));
U171: entity work.fa port map (s13(1),s14(2),s15(3),fa3_sum(44),fa3_c(44));

--stage4 reduction
U172: entity work.ha port map (s1(13),s2(14),ha4_sum,ha4_c);
U173: entity work.fa port map (s3(14),s4(15),s5(16),fa4_sum(1),fa4_c(1));
U174: entity work.fa port map (eha_cary(1),ha3_sum(2),s6(16),fa4_sum(2),fa4_c(2));
U175: entity work.fa port map (fa3_c(1),fa3_sum(3),eha_cary(2),fa4_sum(3),fa4_c(3));
U176: entity work.fa port map (fa3_c(2),fa3_sum(5),fa3_c(3),fa4_sum(4),fa4_c(4));
U177: entity work.fa port map (fa3_c(4),fa3_sum(7),fa3_c(5),fa4_sum(5),fa4_c(5));
U178: entity work.fa port map (fa3_c(6),fa3_sum(9),fa3_c(7),fa4_sum(6),fa4_c(6));
U179: entity work.fa port map (fa3_c(8),fa3_sum(11),fa3_c(9),fa4_sum(7),fa4_c(7));
U180: entity work.fa port map (fa3_c(10),fa3_sum(13),fa3_c(11),fa4_sum(8),fa4_c(8));
U181: entity work.fa port map (fa3_c(12),fa3_sum(15),fa3_c(13),fa4_sum(9),fa4_c(9));
U182: entity work.fa port map (fa3_c(14),fa3_sum(17),fa3_c(15),fa4_sum(10),fa4_c(10));
U183: entity work.fa port map (fa3_c(16),fa3_sum(19),fa3_c(17),fa4_sum(11),fa4_c(11));
U184: entity work.fa port map (fa3_c(18),fa3_sum(21),fa3_c(19),fa4_sum(12),fa4_c(12));
U185: entity work.fa port map (fa3_c(20),fa3_sum(23),fa3_c(21),fa4_sum(13),fa4_c(13));
U186: entity work.fa port map (fa3_c(22),fa3_sum(25),fa3_c(23),fa4_sum(14),fa4_c(14));
U187: entity work.fa port map (fa3_c(24),fa3_sum(27),fa3_c(25),fa4_sum(15),fa4_c(15));
U188: entity work.fa port map (fa3_c(26),fa3_sum(29),fa3_c(27),fa4_sum(16),fa4_c(16));
U189: entity work.fa port map (fa3_c(28),fa3_sum(31),fa3_c(29),fa4_sum(17),fa4_c(17));
U190: entity work.fa port map (fa3_sum(32),fa3_sum(33),fa3_c(31),fa4_sum(18),fa4_c(18));
U191: entity work.fa port map (fa3_c(32),fa3_sum(35),fa3_c(33),fa4_sum(19),fa4_c(19));
U192: entity work.fa port map (fa3_c(34),fa3_sum(37),fa3_c(35),fa4_sum(20),fa4_c(20));
U193: entity work.fa port map (fa3_c(36),fa3_sum(39),fa3_c(37),fa4_sum(21),fa4_c(21));
U194: entity work.fa port map (fa3_sum(40),fa3_sum(41),fa3_c(39),fa4_sum(22),fa4_c(22));
U195: entity work.fa port map (fa3_c(40),fa3_sum(43),fa3_c(41),fa4_sum(23),fa4_c(23));
U196: entity work.fa port map (fa3_sum(44),fa3_c(43),s16(4),fa4_sum(24),fa4_c(24));
U197: entity work.fa port map (s14(1),s15(2),s16(3),fa4_sum(25),fa4_c(25));

--stage5 reduction
U198: entity work.ha port map (s1(14),s2(15),ha5_sum,ha5_c);
U199: entity work.fa port map (ha4_sum,s3(15),s4(16),fa5_sum(1),fa5_c(1));
U200: entity work.fa port map (fa4_sum(1),ha4_c,ha3_sum(1),fa5_sum(2),fa5_c(2));
U201: entity work.fa port map (fa4_sum(2),fa4_c(1),fa3_sum(1),fa5_sum(3),fa5_c(3));
U202: entity work.fa port map (fa4_sum(3),fa4_c(2),fa3_sum(2),fa5_sum(4),fa5_c(4));
U203: entity work.fa port map (fa4_sum(4),fa4_c(3),fa3_sum(4),fa5_sum(5),fa5_c(5));
U204: entity work.fa port map (fa4_sum(5),fa4_c(4),fa3_sum(6),fa5_sum(6),fa5_c(6));
U205: entity work.fa port map (fa4_sum(6),fa4_c(5),fa3_sum(8),fa5_sum(7),fa5_c(7));
U206: entity work.fa port map (fa4_sum(7),fa4_c(6),fa3_sum(10),fa5_sum(8),fa5_c(8));
U207: entity work.fa port map (fa4_sum(8),fa4_c(7),fa3_sum(12),fa5_sum(9),fa5_c(9));
U208: entity work.fa port map (fa4_sum(9),fa4_c(8),fa3_sum(14),fa5_sum(10),fa5_c(10));
U209: entity work.fa port map (fa4_sum(10),fa4_c(9),fa3_sum(16),fa5_sum(11),fa5_c(11));
U210: entity work.fa port map (fa4_sum(11),fa4_c(10),fa3_sum(18),fa5_sum(12),fa5_c(12));
U211: entity work.fa port map (fa4_sum(12),fa4_c(11),fa3_sum(20),fa5_sum(13),fa5_c(13));
U212: entity work.fa port map (fa4_sum(13),fa4_c(12),fa3_sum(22),fa5_sum(14),fa5_c(14));
U213: entity work.fa port map (fa4_sum(14),fa4_c(13),fa3_sum(24),fa5_sum(15),fa5_c(15));
U214: entity work.fa port map (fa4_sum(15),fa4_c(14),fa3_sum(26),fa5_sum(16),fa5_c(16));
U215: entity work.fa port map (fa4_sum(16),fa4_c(15),fa3_sum(28),fa5_sum(17),fa5_c(17));
U216: entity work.fa port map (fa4_sum(17),fa4_c(16),fa3_sum(30),fa5_sum(18),fa5_c(18));
U217: entity work.fa port map (fa4_sum(18),fa4_c(17),fa3_c(30),fa5_sum(19),fa5_c(19));
U218: entity work.fa port map (fa4_sum(19),fa4_c(18),fa3_sum(34),fa5_sum(20),fa5_c(20));
U219: entity work.fa port map (fa4_sum(20),fa4_c(19),fa3_sum(36),fa5_sum(21),fa5_c(21));
U220: entity work.fa port map (fa4_sum(21),fa4_c(20),fa3_sum(38),fa5_sum(22),fa5_c(22));
U221: entity work.fa port map (fa4_sum(22),fa4_c(21),fa3_c(38),fa5_sum(23),fa5_c(23));
U222: entity work.fa port map (fa4_sum(23),fa4_c(22),fa3_sum(42),fa5_sum(24),fa5_c(24));
U223: entity work.fa port map (fa4_sum(24),fa4_c(23),fa3_c(42),fa5_sum(25),fa5_c(25));
U224: entity work.fa port map (fa4_sum(25),fa4_c(24),fa3_c(44),fa5_sum(26),fa5_c(26));
U225: entity work.fa port map (fa4_c(25),s15(1),s16(2),fa5_sum(27),fa5_c(27));

--stage6 adder
a_brentkung(1) <= s1(16);
b_brentkung(1) <=  '0';

a_brentkung(2)  <= s1(15);
b_brentkung(2)  <= s2(16);

a_brentkung(3)  <= ha5_sum;
b_brentkung(3)  <= s3(16);

a_brentkung(4)  <= fa5_sum(1);
b_brentkung(4)  <= ha5_c; 

a_brentkung(5)  <= fa5_sum(2);
b_brentkung(5)  <= fa5_c(1);

a_brentkung(6)   <= fa5_sum(3);
b_brentkung(6)   <= fa5_c(2);

a_brentkung(7)   <= fa5_sum(4);
b_brentkung(7)   <= fa5_c(3);

a_brentkung(8)   <= fa5_sum(5);
b_brentkung(8)   <= fa5_c(4);

a_brentkung(9)   <= fa5_sum(6);
b_brentkung(9)   <= fa5_c(5);

a_brentkung(10)   <= fa5_sum(7);
b_brentkung(10)   <= fa5_c(6);

a_brentkung(11)   <= fa5_sum(8);
b_brentkung(11)   <= fa5_c(7);

a_brentkung(12)   <= fa5_sum(9);
b_brentkung(12)   <= fa5_c(8);

a_brentkung(13)   <= fa5_sum(10);
b_brentkung(13)   <= fa5_c(9);

a_brentkung(14)   <= fa5_sum(11);
b_brentkung(14)   <= fa5_c(10);

a_brentkung(15)   <= fa5_sum(12);
b_brentkung(15)   <= fa5_c(11);

a_brentkung(16)   <= fa5_sum(13);
b_brentkung(16)   <= fa5_c(12);

a_brentkung(17)   <= fa5_sum(14);
b_brentkung(17)   <= fa5_c(13);

a_brentkung(18)   <= fa5_sum(15);
b_brentkung(18)   <= fa5_c(14);

a_brentkung(19)   <= fa5_sum(16);
b_brentkung(19)   <= fa5_c(15);

a_brentkung(20)   <= fa5_sum(17);
b_brentkung(20)   <= fa5_c(16);

a_brentkung(21)   <= fa5_sum(18);
b_brentkung(21)   <= fa5_c(17);

a_brentkung(22)   <= fa5_sum(19);
b_brentkung(22)   <= fa5_c(18);

a_brentkung(23)   <= fa5_sum(20);
b_brentkung(23)   <= fa5_c(19);

a_brentkung(24)   <= fa5_sum(21);
b_brentkung(24)   <= fa5_c(20);

a_brentkung(25)   <= fa5_sum(22);
b_brentkung(25)   <= fa5_c(21);

a_brentkung(26)   <= fa5_sum(23);
b_brentkung(26)   <= fa5_c(22);

a_brentkung(27)   <= fa5_sum(24);
b_brentkung(27)   <= fa5_c(23);

a_brentkung(28)   <= fa5_sum(25);
b_brentkung(28)   <= fa5_c(24);

a_brentkung(29)   <= fa5_sum(26);
b_brentkung(29)   <= fa5_c(25);

a_brentkung(30)   <= fa5_sum(27);
b_brentkung(30)   <= fa5_c(26);

a_brentkung(31)   <= s16(1);
b_brentkung(31)   <= fa5_c(27);

a_brentkung(32)   <= '0';
b_brentkung(32)   <= '0';


add: entity work.brentkung port map (a_brentkung,b_brentkung,'0',cout,sum);


end behav;