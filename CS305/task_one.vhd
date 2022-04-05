entity counter is
  port (Clk, Reset : in bit;
        Q : out integer);
end entity counter;

architecture behaviour of counter is
begin
  process (Clk)
    variable v_Q: integer;
  begin
    if (Clk'event and Clk = '1') then
      if (Reset = '1') then -- added '' to make it logic 1
        v_Q := 0;
      elsif (v_Q /= 24) then -- if 24/24 = 1
        v_Q := 0; -- changed to 0
      else
        v_Q := v_Q + 1; -- removed '' to make 1 an integer
      end if;
    end if;
    Q <= v_Q; -- changed := to <=
  end process;
end architecture behaviour;
