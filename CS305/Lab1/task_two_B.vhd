-- task two B adding in Enable so when Enable = 0 all outputs are 0
entity wgen2 is
  port (Enable : in bit; 
        D : in bit_vector(2 downto 0); 
        A, B, C, F : out bit); 
end entity wgen2;

architecture behaviour of wgen2 is
  signal A1,B1,C1: bit;
begin
  A <= A1 when Enable = '1' else -- added Enable here
       '0' when Enable = '0';
  B <= B1 when Enable = '1' else -- added Enable here
       '0' when Enable = '0';
  C <= C1 when Enable = '1' else -- added Enable here
       '0' when Enable = '0';
  F <= A1 or B1 when D = "000" else
       B1 or C1 when D = "001" else
       A1 and B1 and C1 when D = "010" else
       A1 xor B1 xor C1 when D = "011" else
       C1 when D = "100" else
       B1 when D = "101" else
       A1 when D = "110" else
       '1' when D = "111" else
       '0' when Enable = '0';   -- added Enable here 
  process
  begin
      A1 <= '1', '0' after 2 ns, '1' after 3 ns, '0' after 4 ns;
      B1 <= '0', '1' after 1 ns, '0' after 2 ns, '1' after 3 ns, '0' after 4 ns;
      C1 <= '1', '0' after 1 ns, '1' after 2 ns, '0' after 3 ns, '1' after 4 ns; 
    wait for 5 ns;
  end process;
end architecture behaviour;
