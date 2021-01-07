library IEEE;
use ieee.std_logic_1164.all;
use ieee.math_real.all;

entity xor_op is
port(
a, b: in bit_vector(15 downto 0);
r: out bit_vector(15 downto 0));
end xor_op;

architecture behavior of xor_op is
begin
r <= a xor b;
end behavior;