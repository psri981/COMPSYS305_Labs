-- task one C (Down counter from 30 to 10 counting down only even numbers)
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
        v_Q := 30;
      elsif (v_Q > 10) then 
        v_Q := v_Q - 2; -- removed '' to make 1 an integer
      elsif (v_Q < 10) then -- stop couning if v_Q is less than 10
        v_Q := 30;
      else
        v_Q := 30;
      end if;
    end if;
    Q <= v_Q; -- changed := to <=
  end process;
end architecture behaviour;

-- testbench code does not need to be changed as correct output is produced on the signals as the reset signal is correctly updating and the counter still increases with every clock edge
