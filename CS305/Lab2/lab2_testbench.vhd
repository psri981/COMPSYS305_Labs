  -- A Testbech to test counter  
  library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.std_logic_unsigned.all;
  use IEEE.NUMERIC_STD.all;
  
  entity test_seqCounter is 
  end entity test_seqCounter; 
 
  architecture test of test_seqCounter is  
     signal t_Clk, t_Reset, t_Enable : std_logic; 
     signal t_Mode: std_logic_vector (1 downto 0);
     signal t_Q : signed(5 downto 0); 
 
     component seqCounter is  
      port (Clk, Reset, Enable : in std_logic; 
      Mode: in std_logic_vector (1 downto 0);
      Q : out signed(5 downto 0));  
     end component seqCounter; 
 
     begin 
       DUT: seqCounter 
            port map (t_Clk, t_Reset, t_Enable, t_Mode, t_Q); 
    
       -- Initialization process (code that executes only once). 
       init: process 
       begin 
        t_Reset <= '1', '0' after 20 ns, '1' after 102 ns, '0' after 106 ns, '1' after 190 ns, '0' after 198 ns, '1' after 262 ns, '0' after 266 ns;
        t_Enable <= '1', '0' after 48 ns, '1' after 54 ns, '0' after 162 ns, '1' after 170 ns, '0' after 262 ns, '1' after 266 ns;
        t_Mode <= "10", "01" after 10 ns, "00" after 14 ns, "01" after 118 ns, "10" after 210 ns, "11" after 262 ns;
        wait;
      end process init;
        
      -- Clock generator (with period of 4 ns)
      clk_gen: process
      begin
        wait for 2 ns;
        t_clk <= '1';
        wait for 2 ns;
        t_clk <= '0';
        
      end process clk_gen;
        
end architecture test; 