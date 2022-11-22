----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:55:05 11/11/2022 
-- Design Name: 
-- Module Name:    counter_dec - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

entity counter_dec is
	Port ( reset : in STD_LOGIC;
			 clock : in STD_LOGIC;  
			 sel : in STD_LOGIC;
			 counter_output : out STD_LOGIC_VECTOR (3 downto 0); 
			 out_segment : out STD_LOGIC_VECTOR (6 downto 0));
end counter_dec;

architecture Behavioral of counter_dec is
	signal count : STD_LOGIC_VECTOR (3 downto 0);
	signal clk_div : STD_LOGIC;
	signal cnt : STD_LOGIC_VECTOR (25 downto 0);
	
	begin
	
	 process(clock, reset)
		 begin
			  if reset = '0' then 
					cnt <= (others => '0');
			  elsif (clock'event and clock ='1') then
				  cnt <= cnt + '1';
			  end if;
		end process;
	clk_div<=cnt(0);
	
	Process(reset, clk_div ) 
	begin 
		if reset = '0' then
			count <= "0000";
		elsif clk_div'event and clk_div = '1' then 
			if sel = '1' then
				count <= count + 1;
				if count = "1001" then
					count <= "0000";
				end if;
			else
				count <= count - 1;
				if count = "0000" then 
					count <= "1001";
				end if;
			end if;
		end if;
	end process;
	
	counter_output <= count;
	
	process(count)
	begin
	   case count is 
	   when "0000" => out_segment <= "0000001";
	   when "0001" => out_segment <= "1001111";
	   when "0010" => out_segment <= "0010010";
           when "0011" => out_segment <= "0000110"; -- "3" 
           when "0100" => out_segment <= "1001100"; -- "4" 
           when "0101" => out_segment <= "0100100"; -- "5" 
           when "0110" => out_segment <= "0100000"; -- "6" 
           when "0111" => out_segment <= "0001111"; -- "7" 
           when "1000" => out_segment <= "0000000"; -- "8"     
           when "1001" => out_segment <= "0000100"; -- "9" 
           when "1010" => out_segment <= "0000010"; -- a
           when "1011" => out_segment <= "1100000"; -- b
           when "1100" => out_segment <= "0110001"; -- C
           when "1101" => out_segment <= "1000010"; -- d
           when "1110" => out_segment <= "0110000"; -- E
           when "1111" => out_segment <= "0111000"; -- F
           when others => out_segment <= "0111000";
           end case;
      end process;
	       
end Behavioral;

