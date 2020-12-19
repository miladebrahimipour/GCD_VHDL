
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity GCD is
        generic(data_width: integer := 7);
        port (clk, rst, go: std_logic;
        x,y:in std_logic_vector(data_width downto 0);
        d : out std_logic_vector(data_width downto 0));
end entity GCD;

architecture rtl of GCD is

        component gcd_dp is
          generic(data_width: integer := 7);
          port(clk,rst,x_sel,y_sel,x_ld,y_ld,d_ld: in std_logic;
             x_in, y_in: in std_logic_vector(data_width downto 0);
             d_o: out std_logic_vector(data_width downto 0);
             x_neq_y,x_lt_y: out std_logic);
        end component ;

        component gcd_fsm is
        port(rst,clk,go_i, x_neq_y, x_lt_y : in std_logic;
             y_sel,x_sel,x_ld,y_ld,d_ld : out std_logic);
        end component ;

        signal x_neq_y, x_lt_y, y_sel,x_sel,x_ld,y_ld,d_ld:std_logic;
begin

        f:  gcd_dp generic map(data_width => data_width) port map (clk,rst,x_sel,y_sel,x_ld,y_ld,d_ld  ,x,y,d  ,x_neq_y,x_lt_y);
        f1: gcd_fsm port map(rst,clk,go, x_neq_y, x_lt_y, y_sel,x_sel,x_ld,y_ld,d_ld);

end rtl;
