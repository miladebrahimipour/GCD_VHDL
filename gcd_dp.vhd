

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

Entity gcd_dp is
     generic(data_width: integer := 7);
     port(clk,rst,x_sel,y_sel,x_ld,y_ld,d_ld: in std_logic;
          x_in, y_in: in std_logic_vector(data_width downto 0);
          d_o: out std_logic_vector(data_width downto 0);
          x_neq_y,x_lt_y: out std_logic);
end gcd_dp;

Architecture rtl of gcd_dp is

     component mux2_1 is
       generic(data_width: integer := 7);
       port(a,b:in std_logic_vector(data_width downto 0);
          s:in std_logic;
          y: out std_logic_vector(data_width downto 0));
     end component;

     component reg_par_8bit_load is
       generic(data_width: integer := 7);
       port (clk, rst, load: in std_logic;
          reg_in: in std_logic_vector(data_width downto 0);
          reg_out: out std_logic_vector(data_width downto 0));
     end component;

     component comp_greater is
       port( a,b :in std_logic_vector (data_width downto 0);
          y: out std_logic);
     end component;

     component sub_8bit is
       generic(data_width: integer := 7);
       Port ( A, B: in  STD_LOGIC_vector(data_width downto 0);
               D: out std_logic_vector(data_width downto 0));
     end component;

     component comp_equ is
     port( a,b :in std_logic_vector (data_width downto 0);
          y: out std_logic);
     end component;

     signal x_sub, y_sub, x_regin, y_regin, x_regout, y_regout   :std_logic_vector (data_width downto 0);
     --signal x_sel , y_sel,x_ld, y_ld,x_neq_y, x_lt_y, d_ld :std_logic;

begin 

     d:  mux2_1 generic map(data_width => data_width) port map (x_in,x_sub,x_sel,x_regin );
     d1: mux2_1 generic map(data_width => data_width) port map (y_in,y_sub,y_sel,y_regin);

     d2: reg_par_8bit_load generic map(data_width => data_width) port map (clk,rst,x_ld,x_regin,x_regout);
     d3: reg_par_8bit_load generic map(data_width => data_width) port map (clk,rst,y_ld,y_regin,y_regout);
     d4: reg_par_8bit_load generic map(data_width => data_width) port map (clk,rst,d_ld,x_regout,d_o);

     d5: comp_equ port map (x_regout,y_regout,x_neq_y);

     d6: comp_greater port map (x_regout,y_regout,x_lt_y);

     d7: sub_8bit generic map(data_width => data_width) port map (x_regout,y_regout,x_sub);
     d8: sub_8bit generic map(data_width => data_width) port map (y_regout,x_regout,y_sub);


end rtl; 
