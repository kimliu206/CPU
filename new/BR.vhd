library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity BR is
  Port ( 
            MBR_in:in STD_LOGIC_VECTOR(15 downto 0);
            cs:in STD_LOGIC_VECTOR(31 downto 0);
            clk:in STD_LOGIC;
            BR_out:out STD_LOGIC_VECTOR(15 downto 0)
  );
end BR;

architecture Behavioral of BR is

begin

process(clk)
begin
if clk'event and clk = '1' then
    if cs(7) = '1' then
        BR_OUT<=MBR_IN;   
    end if;
end if;

end process;



end Behavioral;
