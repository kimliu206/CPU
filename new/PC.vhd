library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity PC is
    Port (
            MBR_in:in STD_LOGIC_VECTOR(7 downto 0); 
            cs:in STD_LOGIC_VECTOR(31 downto 0);
            clk:in STD_LOGIC;
            PC_out:out STD_LOGIC_VECTOR(7 downto 0)   
             );
end PC;

architecture Behavioral of PC is

begin

process(clk)
variable temp:STD_LOGIC_VECTOR(7 downto 0):="00000000";
begin
if clk'event and clk = '1' then
    if cs(15) = '1' then
        temp := "00000000"; 
    elsif cs(14) = '1' then
        temp := MBR_in;    
    elsif cs(6) = '1' then
        temp:=temp + 1;    
    end if;
    PC_out<=temp;
end if;
        
    
end process;

end Behavioral;
