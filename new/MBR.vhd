library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity MBR is
  Port (
  
        ACC_in:in STD_LOGIC_VECTOR(15 downto 0);
        MEMORY_in:in STD_LOGIC_VECTOR(15 downto 0);
        cs:in STD_LOGIC_VECTOR(31 downto 0);------
        clk:in STD_LOGIC;
        MR_in:in STD_LOGIC_VECTOR(15 downto 0);
        MBR_out:out STD_LOGIC_VECTOR(15 downto 0)
   );
end MBR;

architecture Behavioral of MBR is

begin
process(clk)
begin
if clk'event and clk = '1' then
    if cs(3) = '1' then
        MBR_out<=memory_in;   
    elsif cs(12) = '1' then
        MBR_out<=ACC_in;    
    elsif cs(19) = '1' then
        MBR_out<=MR_in;
        
    end if;
end if;



end process;

end Behavioral;
