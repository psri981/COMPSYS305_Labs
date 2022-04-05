-- synthesizable up/down counter
-- Lab 2 Task 2

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.all;

entity BCD_counter is
  port (Clk, Direction, Init, Enable : in std_logic;
        Q_Out : out integer; 
end entity BCD_counter;

architecture behaviour of seqCounter is
begin
  process(Clk, Direction, Init, Enable)
    variable 
  begin




