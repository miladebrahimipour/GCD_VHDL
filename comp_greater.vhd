

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

Entity comp_greater is
port( a,b :in std_logic_vector (7 downto 0);
         y: out std_logic);
end comp_greater;

Architecture rtl of comp_greater is

begin 

process(a,b)
 begin
  if ( unsigned(a) < unsigned(b)) then 
    y<='1';
  else 
   y <='0';

   end if;
 end process; 
end rtl; 
