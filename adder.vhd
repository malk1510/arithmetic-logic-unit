library IEEE;
use ieee.std_logic_1164.all;
use ieee.math_real.all;

entity adder is
port(
a, b: in bit_vector(15 downto 0);
r: out bit_vector(15 downto 0);
c: out bit);
end adder;

--Kogge stone adder--

architecture behavior of adder is
signal p,g,p1,g1,p2,g2,p3,g3,p4,g4: bit_vector(15 downto 0);
signal c0: bit := a(0) and b(0);

begin
Gen1:for i in 0 to 15 generate
	p(i) <= a(i) xor b(i);
	g(i) <= a(i) and b(i);
end generate;

--stage 1
Gen2:for i in 15 downto 1 generate
	g1(i) <= g(i) or (p(i) and g(i-1));
	p1(i) <= p(i) and p(i-1);
end generate;
Gen21:for i in 0 downto 0 generate
	g1(i) <= g(i);
	p1(i) <= p(i);
end generate;

--stage 2
Gen3:for i in 15 downto 2 generate
	g2(i) <= g1(i) or (p1(i) and g1(i-2));
	p2(i) <= p1(i) and p1(i-2);
end generate;
Gen31:for i in 1 downto 0 generate
	g2(i) <= g1(i);
	p2(i) <= p1(i);
end generate;

--stage 3
Gen4:for i in 15 downto 4 generate
	g3(i) <= g2(i) or (p2(i) and g2(i-4));
	p3(i) <= p2(i) and p2(i-4);
end generate;
Gen41:for i in 3 downto 0 generate
	g3(i) <= g2(i);
	p3(i) <= p2(i);
end generate;

--stage 4
Gen5:for i in 15 downto 8 generate
	g4(i) <= g3(i) or (p3(i) and g3(i-8));
	p4(i) <= p3(i) and p3(i-8);
end generate;
Gen51:for i in 7 downto 0 generate
	g4(i) <= g3(i);
	p4(i) <= p3(i);
end generate;

c <= g4(15) or (p4(15) and a(0) and b(0));
r(0) <= a(0) xor b(0);

G6:for i in 1 to 15 generate
	r(i) <= a(i) xor b(i) xor (g4(i-1) or (p4(i-1) and a(0) and b(0)));
end generate;
end behavior;