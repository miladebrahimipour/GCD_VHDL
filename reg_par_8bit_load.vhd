
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity reg_par_8bit_load is
  generic(data_width: integer := 7);
port (clk, rst, load: in std_logic;
        reg_in: in std_logic_vector(data_width downto 0);
       reg_out: out std_logic_vector(data_width downto 0));
end reg_par_8bit_load;

architecture rtl of reg_par_8bit_load is
begin

process (rst, clk)
begin
  if (rst='1') then
    reg_out<= (others => '0');
  elsif (rising_edge(clk)) then
    if(load='1')then
       reg_out <= reg_in;
    end if;
  end if;
end process;

end rtl;
