library ieee;
use ieee.std_logic_1164.all;
entity HDB3YM is
	port(
		codein: in std_logic_vector(1 downto 0);
		codeout: out std_logic;
		clk: in std_logic);
end HDB3YM;
architecture rtl of HDB3YM is
		shared variable temp1:std_logic_vector(4 downto 0);
		shared variable temp0:std_logic_vector(4 downto 0);
		shared variable temp8:std_logic_vector(7 downto 0);
		shared variable temp2:std_logic_vector(1 downto 0);
	begin
process(clk)
	begin
if(rising_edge(clk))then
	temp1(4 downto 0):=temp1(3 downto 0)&codein(1);
	temp0(4 downto 0):=temp0(3 downto 0)&codein(0);
	temp2(1 downto 0):=temp1(4)&temp0(4);
	temp8(7 downto 0):=temp1(3 downto 0)&temp0(3 downto 0);
	case temp2(1 downto 0) is
		when"10"=>codeout<='1';
			case temp8(7 downto 0) is
				when"00010000"=>temp1(0):='0';
				when"00001001"=>temp0(3):='0';
								temp0(0):='0';
				when others=> null;
			end case;
		when"01"=>codeout<='1';
			case temp8(7 downto 0) is
				when"00000001"=>temp0(0):='0';
				when"10010000"=>temp1(3):='0';
								temp1(0):='0';
				when others=> null;
			end case;
		when"00"=>codeout<='0';
		when others=> null;
	end case;
end if;
end process;
end rtl;