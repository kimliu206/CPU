library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Control_Unit is
  Port ( 
            clk:in STD_LOGIC;
            flag:in STD_LOGIC;
            cs:in STD_LOGIC_VECTOR(31 downto 0);
            IR_in:in STD_LOGIC_VECTOR(7 downto 0);
            address_out:out STD_LOGIC_VECTOR(7 downto 0)
  );
end Control_Unit;

architecture Behavioral of Control_Unit is

begin

process(clk)
variable address:STD_LOGIC_VECTOR(7 downto 0):="00000000";
begin 
if clk'event and clk = '1' then
    if cs(0) = '1' then 
        address:=address + 1;
    elsif cs(2) = '1' then
        address:="00000000"; 
    elsif cs(1) = '1' then  
        case IR_in is
            when "00000001" =>    
                address:="00100000";  
            when "00000010" =>     
                address:="00010000";  
            when "00010001" =>      
                address:="00100101";
            when "00000011" =>     
                address:="00110000";
            when "00000100" =>     
                address:="01000000";
            when "00000101" =>     
                if flag = '0'then
                    address:="11110010";
                else address:="11110000";
                end if;
            when "00000110" =>     
                address:="11100000";
            when "00000111" =>     
                address:="01010000";
            when "00001000" =>      
                address:="10110000";
            when "00001010" =>    
                address:="01100000";
            when "00001011" =>      
                address:="01110000";
            when "00001101" =>      
                address:="10010000";
            when "00001110" =>      
                address:="10100000";
            when "00001111" =>
                address:="11000000";
            when "00010000" => 
                address:="11010000";
            when "00001100" =>
                address:="10000000";
            
            when others =>null;
        end case;
    end if;
    address_out<=address;
    

end if;
end process;
end Behavioral;
