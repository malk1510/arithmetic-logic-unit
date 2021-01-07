library IEEE;
use ieee.std_logic_1164.all;
use ieee.math_real.all;

entity subtractor is
port(
a, b: in bit_vector(15 downto 0);
r: out bit_vector(15 downto 0);
c: out bit);
end subtractor;

--Ripple subtractor--

architecture behavior of subtractor is
signal cy: bit_vector(15 downto 0) := (others => '0');

begin
G1: for i in 0 to 14 generate
		r(i) <= a(i) xor b(i) xor cy(i);
		cy(i+1) <= (cy(i) and ((not a(i)) or b(i))) or (not(a(i)) and b(i));
	end generate;
r(15) <= a(15) xor b(15) xor cy(15);
c <= 	(cy(15) and ((not a(15)) or b(15))) or (not(a(15)) and b(15));
end behavior;