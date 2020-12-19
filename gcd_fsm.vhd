library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;


entity gcd_fsm is
	port(rst,clk,go_i, x_neq_y, x_lt_y : in std_logic;
		 y_sel,x_sel,x_ld,y_ld,d_ld : out std_logic);
end gcd_fsm;


architecture rtl of gcd_fsm is

	type state_type is (s0, s1, s2,s3,s4,s5,s6,s7,s8,s9,s10);
	signal current_state, next_state: state_type;

begin 

	process (go_i, x_neq_y, x_lt_y, current_state)
	begin
		case current_state is
			when s0 =>  x_sel<='0';
				y_sel<='0';
				x_ld <='0';
				y_ld <='0';
				d_ld <='0';	
				if(true) then 
					next_state <= s1;
				else
					next_state<=s0 ;	
				end if;

			when s1 =>  x_sel<='0';
				y_sel<='0';
				x_ld<='0';
				y_ld<='0';
				d_ld<='0';	
				if( go_i = '1' ) then 
					next_state <= s3 ;
				else
					next_state<= s2;	
				end if;

			when s2 =>  x_sel<='0';
				y_sel<='0';
				x_ld<='0';
				y_ld<='0';
				d_ld<='0';	
				next_state <=s1 ;
		
			when s3 =>  x_sel<='0';
				y_sel<='0';
				x_ld<='1';
				y_ld<='1';
				d_ld<='0';	
				next_state <= s4;

			when s4 =>  x_sel<='0';
				y_sel<='0';
				x_ld<='0';
				y_ld<='0';
				d_ld<='0';	
				if( x_neq_y ='1' ) then 
					next_state <= s5;
				else
					next_state<=s9 ;   
				end if;

			when s5 =>  x_sel<='0';
				y_sel<='0';
				x_ld<='0';
				y_ld<='0';
				d_ld<='0';	
				if(x_lt_y ='1'  ) then 
					next_state <=s6 ;
				else
					next_state<=s7 ;	
				end if;

			when s6 =>  x_sel<='0';
				y_sel<='1';
				x_ld<='0';
				y_ld<='1';
				d_ld<='0';	
				next_state<=s8 ;	

			when s7 =>  x_sel<='1';
				y_sel<='0';
				x_ld<='1';
				y_ld<='0';
				d_ld<='0';	
				next_state<= s8 ;	

			when s8 =>  x_sel<='0';
				y_sel<='0';
				x_ld<='0';
				y_ld<='0';
				d_ld<='0';	
				next_state<=s4 ;	

			when s9 =>  x_sel<='0';
				y_sel<='0';
				x_ld<='0';
				y_ld<='0';
				d_ld<='1';	
				next_state<=s10 ;	

			when s10 =>  x_sel<='0';
				y_sel<='0';
				x_ld<='0';
				y_ld<='0';
				d_ld<='0';	
				next_state<= s0 ;	


			when others =>x_sel<='0';
				y_sel<='0';
				x_ld<='0';
				y_ld<='0';
				d_ld<='0';	
				next_state<= s0 ;	     
			end case;
	end process;

	process (rst, clk)
	begin
		if (rst ='1') then
			current_state <= s0;
		elsif (rising_edge(clk)) then
			current_state <= next_state;
		end if;
	end process;


end rtl;
