
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity toptop is
 Port ( 
        clk:in STD_LOGIC;
        seg:out STD_LOGIC_VECTOR(7 downto 0);
        btt:out STD_LOGIC_VECTOR(7 downto 0)
 );
end toptop;

architecture Behavioral of toptop is

 component display
    PORT (  clk2 : IN STD_LOGIC;
            CQIN: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            CQHigh:in STD_LOGIC_VECTOR(15 downto 0);
            SG : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); 
            BT : OUT STD_LOGIC_VECTOR(7 DOWNTO 0) );
 end component;
 
 component top
    Port (
         clk1:in STD_LOGIC;
         low16:out STD_LOGIC_VECTOR(15 downto 0);
         high16:out STD_LOGIC_VECTOR(15 downto 0)
    );
 
 end component;

signal low :STD_LOGIC_VECTOR(15 downto 0);
signal high:STD_LOGIC_VECTOR(15 downto 0);
begin

t1: display port map(clk2=>clk,CQIN=>low,CQHigh=>high,SG=>seg,BT=>btt);
t2: top port map(clk1=>clk,low16=>low,high16=>high);

end Behavioral;
