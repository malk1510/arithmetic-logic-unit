library IEEE;
use ieee.std_logic_1164.all;
use ieee.math_real.all;

entity nand_op is
port(
a, b: in bit_vector(15 downto 0);
r: out bit_vector(15 downto 0));
end nand_op;

architecture behavior of nand_op is
begin
r <= a nand b;
end behavior;