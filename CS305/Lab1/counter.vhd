-- A modulo 8 counter

entity counter is
   port (Clk, Reset : in bit;
         Q : out integer);
end entity counter; 


architecture behaviour of counter is
begin
   process  (Clk)
       variable v_Q : integer;
   begin
       if (Clk'event and Clk = '1') then
          if (Reset = '1') then   
	           v_Q := 0;
          else 
             if (v_Q = 7) then
                v_Q := 0;
             else 
                v_Q := v_Q + 1;
             end if;
          end if;  
          Q <= v_Q;
       end if;
	  
   end process;
end architecture behaviour;