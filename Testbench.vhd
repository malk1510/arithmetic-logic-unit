entity Testbench is
end Testbench;
architecture testbench of Testbench is

component alu is
	port(CON: in bit_vector(1 downto 0);
	a,b: in bit_vector(15 downto 0);
	r: out bit_vector(15 downto 0);
	z,c: out bit:='0');
end component;

signal vect_in1,vect_in2,result: bit_vector(15 downto 0);
signal control: bit_vector(1 downto 0);
signal zero,cy: bit;
begin
dut_instance: alu
port map (control,vect_in1,vect_in2,result,zero,cy);
process
--only few examples taken due to 16 bit input
begin
vect_in1 <= "1010101010101010"; vect_in2<="0101010101010110"; control<="00"; wait for 5 ns;
vect_in1 <= "1010101010101010"; vect_in2<="0101010101010110"; control<="01"; wait for 5 ns;
vect_in1 <= "1010101010101010"; vect_in2<="0101010101010110"; control<="10"; wait for 5 ns;
vect_in1 <= "1010101010101010"; vect_in2<="0101010101010110"; control<="11"; wait for 5 ns;
vect_in1 <= "0000001000001000"; vect_in2<="1111111101111111"; control<="00"; wait for 5 ns;
vect_in1 <= "0000000000000000"; vect_in2<="0101010101010110"; control<="00"; wait for 5 ns;
vect_in1 <= "0000000000000000"; vect_in2<="0101010101010110"; control<="01"; wait for 5 ns;
vect_in1 <= "1010101010101010"; vect_in2<="0000000000000000"; control<="10"; wait for 5 ns;
vect_in1 <= "1111111111111111"; vect_in2<="0000000000000000"; control<="00"; wait for 5 ns;
vect_in1 <= "0000000000000000"; vect_in2<="1111111111111111"; control<="01"; wait for 5 ns;
vect_in1 <= "1111111000000000"; vect_in2<="0000000111111111"; control<="00"; wait for 5 ns;
vect_in1 <= "0000000000000001"; vect_in2<="1111111111111111"; control<="00"; wait for 5 ns;
vect_in1 <= "0000000000000001"; vect_in2<="0111111111111111"; control<="01"; wait for 5 ns;
vect_in1 <= "1001001101001001"; vect_in2<="0000100100110111"; control<="00"; wait for 5 ns;
vect_in1 <= "0101010010101001"; vect_in2<="1101110101011101"; control<="00"; wait for 5 ns;
vect_in1 <= "0001000100100101"; vect_in2<="0101010101010110"; control<="01"; wait for 5 ns;
vect_in1 <= "1000000101000101"; vect_in2<="0111111111111111"; control<="00"; wait for 5 ns;
end process;
end testbench;