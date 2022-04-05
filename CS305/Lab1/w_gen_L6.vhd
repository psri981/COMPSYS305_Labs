-- VHDL Code to generate the required perioding waveform

entity w_gen is
   port (w : out bit);
end entity w_gen;

architecture  a2 of w_gen is
begin
    process 
    begin
       w <= '0', '1' after 20 ns;
       wait for 30 ns;
    end process;
end architecture a2;