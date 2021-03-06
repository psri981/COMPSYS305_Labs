-- task two A 
entity wgen1 is
  port (D : in bit_vector(2 downto 0);
        A, B, C, F : out bit);
end entity wgen1;

architecture behaviour of wgen1 is
  signal A1,B1,C1: bit;
begin 
  A <= A1;
  B <= B1;
  C <= C1;
  F <= A1 or B1 when D = "000" else
       B1 or C1 when D = "001" else
       A1 and B1 and C1 when D = "010" else
       A1 xor B1 xor C1 when D = "011" else
       C1 when D = "100" else
       B1 when D = "101" else
       A1 when D = "110" else
       '1' when D = "111";    
  process
  begin
    A1 <= '1', '0' after 2 ns, '1' after 3 ns, '0' after 4 ns;
    B1 <= '0', '1' after 1 ns, '0' after 2 ns, '1' after 3 ns, '0' after 4 ns;
    C1 <= '1', '0' after 1 ns, '1' after 2 ns, '0' after 3 ns, '1' after 4 ns;  
    wait for 5 ns;
  end process;
end architecture behaviour;
