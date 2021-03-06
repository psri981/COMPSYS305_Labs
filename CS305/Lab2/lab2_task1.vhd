--Lab 2 Task 1
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.all;

entity seqCounter is
  port (Clk, Reset, Enable : in std_logic; 
        Mode : in std_logic_vector(1 downto 0);
        Q : out signed(5 downto 0)); 
end entity seqCounter;

architecture behaviour of seqCounter is
begin
  process(Clk, Reset, Mode, Enable)
    variable v_Q: signed(5 downto 0);
    variable temp: signed(5 downto 0);
  begin
    
    if (rising_edge(clk)) then
      
      -- down counter from 31 to 0
      if (Enable = '1' and Mode = "00") then
        if (Reset = '1') then 
          -- 31 as binary = 011111
          v_Q := "011111";
        elsif (v_Q > "000000") then -- 11111 = 31
          v_Q := v_Q - "000010"; -- 000010 = 2
        else
          v_Q := "011111";
        end if;
        Q <= v_Q;
      end if;
      
      -- a counter which counts (-1, 2, -3, 4, -5, 6, -7, 8)
      if (Enable = '1' and Mode = "01") then
        if (Reset = '1') then 
          v_Q := "111111";
          temp := "000011"; -- 3
        elsif (v_Q /= "001000" and v_Q(5) = '1' and Reset = '0') then -- 1000 = 8
          v_Q := v_Q + temp; 
          temp := v_Q + "000010";
        elsif (v_Q /= "001000" and v_Q(5) = '0' and Reset = '0') then
          v_Q := v_Q - temp;
          temp := v_Q + "000010";
        else
          v_Q := "111111";
        end if;
        Q <= v_Q;
      end if; 
      
      -- an up counter for numbers from 5 to 15
      if (Enable = '1' and Mode = "10") then 
        if (Reset = '1') then 
          v_Q := "000101"; --000101 = 5
        elsif (v_Q < "001111") then -- 001111 = 15
          v_Q := v_Q + "000001";
        else
          v_Q := "000101";
        end if;
        Q <= v_Q;
      end if;
      
      -- output Q will be "010101"
      if (Enable = '1' and Mode = "11") then
        if (Reset = '1') then 
          v_Q := "010101";
        end if;
        Q <= v_Q;
      end if; 
      
    end if;
     
  end process;
end architecture behaviour;
