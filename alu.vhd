library IEEE;
use ieee.std_logic_1164.all;

entity alu is
port(CON: in bit_vector(1 downto 0);
a, b: in bit_vector(15 downto 0);
r: out bit_vector(15 downto 0);
z,c: out bit := '0');
end alu;

architecture behavior of alu is

component adder
port(
a,b: in bit_vector(15 downto 0);
r: out bit_vector(15 downto 0);
c: out bit);
end component;

component subtractor
port(
a,b: in bit_vector(15 downto 0);
r: out bit_vector(15 downto 0);
c: out bit);
end component;

component nand_op
port(
a,b: in bit_vector(15 downto 0);
r: out bit_vector(15 downto 0));
end component;

component xor_op
port(
a,b: in bit_vector(15 downto 0);
r: out bit_vector(15 downto 0));
end component;

signal r1,r2,r3,r4,rx: bit_vector(15 downto 0);
signal c1,c2: bit;
begin

Chip1: adder
port map(a,b,r1,c1);

Chip2: subtractor
port map(a,b,r2,c2);

Chip3: nand_op
port map(a,b,r3);

Chip4: xor_op
port map(a,b,r4);

rx<= r1 when CON="00" else r2 when CON="01" else r3 when CON="10" else r4 when CON="11";
c<= c1 when CON="00" else c2 when CON="01" else '0';
z<= '1' when rx="0000000000000000" else '0';
r<=rx;
end behavior;