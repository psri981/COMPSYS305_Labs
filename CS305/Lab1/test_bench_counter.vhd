-- Testbench.

entity test_counter is
end entity test_counter;

architecture test of test_counter is 
   signal t_Clk, t_Reset : bit;
   signal t_Q : integer;
  
  component counter is 
     port (Clk, Reset : in bit;
           Q : out integer);
  end component counter; 
begin
   DUT: counter  port map (t_Clk, t_Reset, t_Q);
                
      
   -- Initialization process (code that executes only once).
   init: process
   begin 
        t_Reset <= '0', '1' after 12 ns, '0' after 25 ns;
        wait;
   end process init;

   -- Clock generator (with period of 10 ns)
   clk_gen: process
   begin
       wait for 5 ns;
       t_clk <= '1'; 
       wait for 5 ns;
       t_clk <= '0';
   end process clk_gen; 
end architecture test;
