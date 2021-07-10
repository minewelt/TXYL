library ieee;
use ieee.std_logic_1164.all;
entity PCMym is 
port(
    clkin:in std_logic; 
	C:in std_logic_vector(0 to 7);          --8位输入数据端口
	B:out std_logic_vector(0 to 12);        --十三位输出数据端口
	clkout: out std_logic);
	end PCMym;
architecture behavior of PCMym is 
begin 
	process (clkin)
	begin 
	if clkin'event and clkin='1'then         --译码规律和编码相反，最后要加上量化间隔的一半，二进制正好对应段内码译码后的下一位
	if c(1 to 3)="111"then B<=C(0)&"1"&C(4 to 7)&"1000000";
	elsif c(1 to 3)="110"then B<=C(0)&"01"&C(4 to 7)&"100000";
	elsif c(1 to 3)="101"then B<=C(0)&"001"&C(4 to 7)&"10000";
	elsif c(1 to 3)="100"then B<=C(0)&"0001"&C(4 to 7)&"1000";
	elsif c(1 to 3)="011"then B<=C(0)&"00001"&C(4 to 7)&"100";
	elsif c(1 to 3)="010"then B<=C(0)&"000001"&C(4 to 7)&"10";
	elsif c(1 to 3)="001"then B<=C(0)&"0000001"&C(4 to 7)&"1";
	elsif c(1 to 3)="000"then B<=C(0)&"0000000"&C(4 to 7)&"1";
	end if;
	end if;
	end process;  
	clkout <= clkin ;
	end behavior;
