library IEEE;
use ieee.std_logic_1164.all;

entity decoder is
port(i1,i2: in bit; o:out bit_vector(3 downto 0));
end decoder;

architecture behavior of decoder is
begin
process
begin
if (i1='0' and i2='0') then
o <= (0 => '1', others => '0');
elsif (i1='0' and i2='1') then
o <= (1 => '1', others => '0');
elsif (i1='1' and i2='0') then
o <= (2 => '1', others => '0');
else
o <= (3 => '1', others => '0');
end if;
wait for 5 ns;
end process;
end behavior;
