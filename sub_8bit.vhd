
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity sub_8bit is
  generic(data_width: integer := 7);
  Port(A, B: in  STD_LOGIC_vector(data_width downto 0);
       D: out std_logic_vector(data_width downto 0));
end sub_8bit;

architecture rtl of sub_8bit is
  signal d_u : unsigned (data_width downto 0);
begin

  process(A,B)
  begin 
    d_u <= unsigned(A) - unsigned(B);
  end process;

  d<= std_logic_vector(d_u);


end rtl;
