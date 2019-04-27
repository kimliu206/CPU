library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity ALU is
  Port (
            clk:in STD_LOGIC;
            BR_in:in STD_LOGIC_VECTOR(15 downto 0);
            cs:in STD_LOGIC_VECTOR(31 downto 0);
            accis0:out STD_LOGIC;
            acc:out STD_LOGIC_VECTOR(15 downto 0);
            mpyhigh:out STD_LOGIC_VECTOR(15 downto 0)         
   );
end ALU;

architecture Behavioral of ALU is
signal temp:STD_LOGIC_VECTOR(15 downto 0);
begin
accis0<='1' when temp(15) = '1' else '0';
process(clk)
variable x:STD_LOGIC_VECTOR(31 downto 0);
begin
if clk'event and clk = '1' then
    if cs(8) = '1' then
        temp<="0000000000000000";  
    elsif cs(9) = '1' then
        temp<=temp + BR_in;     
    elsif cs(16) = '1' then
        temp<=temp - BR_in;   
    elsif cs(17) = '1' then
        temp<='0'&temp(15 downto 1);  
    elsif cs(24) = '1' then     
        if(temp(15) xor BR_in(15)) = '1' then
            if temp(15) = '1' then
                x:=('0'&temp(14 downto 0))*BR_in;
            else
                x:=temp*('0'&BR_in(14 downto 0));
            end if;
            if(x(16)='1' or x(17)='1' or x(18)='1' or x(19)='1' or x(20)='1' or x(21)='1' or x(22)='1' or x(23)='1' or x(24)='1' or x(25)='1' or x(26)='1' or x(27)='1' or x(28)='1' or x(29)='1' or x(30)='1' or x(31)='1')
            then
            x:='1'&x(30 downto 0);
            else
            x:=x(31 downto 16)&'1'&x(14 downto 0);
            end if;
            
            temp<=x(15 downto 0);
            mpyhigh<=x(31 downto 16);
        else
            if temp(15) = '1' then
                x:=('0'&temp(14 downto 0))*('0'&BR_in(14 downto 0));
            else
                x:=temp*BR_in;
            end if;
        temp<=x(15 downto 0);
        mpyhigh<=x(31 downto 16);
        end if;
    elsif cs(25) = '1' then 
        temp<=temp(14 downto 0)&'0';
    elsif cs(29) = '1' then 
        temp<=temp(15)&temp(15 downto 1);
    elsif cs(30) = '1' then 
        temp<=temp(14 downto 0)&'0';
    elsif cs(28) = '1' then 
        temp<=temp and BR_in;
    elsif cs(27) = '1' then 
        temp<=temp or BR_in;
    elsif cs(26) = '1' then 
        temp<=not temp;
end if;
acc<=temp;       
end if;
end process;
end Behavioral;
