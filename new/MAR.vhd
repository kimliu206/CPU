library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity MAR is
   Port (
            PC_in:in STD_LOGIC_VECTOR(7 downto 0);
            MBR_in:in STD_LOGIC_VECTOR(7 downto 0);
            clk:in STD_LOGIC;
            cs:in STD_LOGIC_VECTOR(31 downto 0);
            MAR_OUT:out STD_LOGIC_VECTOR(7 downto 0):="00000000"
                );
end MAR;

architecture Behavioral of MAR is

begin
process(clk)
begin
if clk'event and clk = '1' then
    if cs(10) = '1' then
        MAR_OUT<=PC_in;    
    elsif cs(5) = '1' then
        MAR_OUT<=MBR_in;    
    end if;
end if;
end process;

end Behavioral;
