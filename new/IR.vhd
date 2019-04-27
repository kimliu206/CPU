library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity IR is
    Port (
            MBR_in:in STD_LOGIC_VECTOR(7 downto 0);  
            cs:in STD_LOGIC_VECTOR(31 downto 0);
            clk:in STD_LOGIC;
            IR_out:out STD_LOGIC_VECTOR(7 downto 0)
             );
end IR;

architecture Behavioral of IR is

begin

process(clk)
begin
if clk'event and clk = '1' then
    if cs(4) = '1' then
        IR_out<=MBR_in;   
    end if;
end if;

end process;



end Behavioral;
