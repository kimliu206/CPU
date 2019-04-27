library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;


entity MR is
  Port (
            cs:in STD_LOGIC_VECTOR(31 downto 0);
            clk:in STD_LOGIC;
            MR:out STD_LOGIC_vector(15 downto 0);
            ACC_in:in STD_LOGIC_VECTOR(15 downto 0)          
   );
end MR;

architecture Behavioral of MR is

begin
process(clk)
begin
if(clk'event and clk = '1')then
    if cs(18) = '1' then
        MR<=ACC_in;
    end if;
end if;
end process;
end Behavioral;
