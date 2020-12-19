

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

Entity comp_equ is
port( a,b :in std_logic_vector (7 downto 0);
         y: out std_logic);
end comp_equ;

Architecture rtl of comp_equ is

begin 

process(a,b)
 begin
  if ( a /= b ) then 
    y<='1';
  else 
   y <='0';

   end if;
 end process; 
end rtl; 
