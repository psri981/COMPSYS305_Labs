-- A Testbech to test wgen1
entity test_wgen1 is
end entity test_wgen1;

architecture test of test_wgen1 is
	signal t_A, t_B, t_C, t_F : bit;
	signal t_D : bit_vector(2 downto 0);
	
	component wgen1 is
		port (D : in bit_vector(2 downto 0);
			    A, B, C, F : out bit);
	end component;
	
  begin
	 my_design : wgen1 port map(t_D, t_A, t_B, t_C, t_F);

	-- Initialization process (code that executes only once).
	init : process
	begin
		t_D <= "000", "001" after 30 ns, "010" after 45 ns, "011" after 70 ns, "100" after 105 ns, 
			"101" after 140 ns, "101" after 180 ns, "110" after 195 ns, "111" after 245 ns;
		wait for 300 ns;
	end process init;
end architecture test;