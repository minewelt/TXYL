library ieee;                 
use ieee.std_logic_1164.all;     
entity pcmbm is
port(
    clkin :in std_logic;               
    B:in std_logic_vector(0 to 12);    
    C:out std_logic_vector(0 to 7);   
    clkout: out std_logic);            
    end pcmbm;                         
architecture behavior of pcmbm is
begin
process(clkin,B)
begin
if clkin'event and clkin='1' then                    
if B(1)='1' then C<=B(0)&"111"&B(2 to 5);   
elsif  B(2)='1' then C<=B(0)&"110"&B(3 to 6);    
    elsif  B(3)='1' then C<=B(0)&"101"&B(4 to 7);
    elsif  B(4)='1' then C<=B(0)&"100"&B(5 to 8);
    elsif  B(5)='1' then C<= B(0)&"011"&B(6 to 9);
    elsif  B(6)='1' then C<= B(0)&"010"&B(7 to 10);
    elsif  B(7)='1' then C<= B(0)&"001"&B(8 to 11);
    else  C<=B(0)&"000"&B(8 to 11);
    end if;
end if;
end process;
clkout<=clkin;
end  behavior;
