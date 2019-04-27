library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb1 is

end tb1;

architecture Behavioral of tb1 is

component toptop
Port ( 
        clk:in STD_LOGIC;
        seg:out STD_LOGIC_VECTOR(7 downto 0);
        btt:out STD_LOGIC_VECTOR(7 downto 0)
 );
end component;


component display
    PORT (  clk2 : IN STD_LOGIC;
            CQIN: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            CQHigh:in STD_LOGIC_VECTOR(15 downto 0);
            SG : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); --段控制信号输出
            BT : OUT STD_LOGIC_VECTOR(7 DOWNTO 0) );--位控制信号输出
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
signal clkk:STD_LOGIC;
signal s:STD_LOGIC_VECTOR(7 downto 0);
signal b:STD_LOGIC_VECTOR(7 downto 0);


constant clk_period: time :=20ns;

begin
t1: display port map(clk2=>clkk,CQIN=>low,CQHigh=>high,SG=>s,BT=>b);
t2: top port map(clk1=>clkk,low16=>low,high16=>high);
i: toptop port map(clk=>clkk,seg=>s,btt=>b);


clk_gen:process
          begin
             clkk <= '1';
             wait for clk_period/2;
             clkk <= '0';
             wait for clk_period/2;
           end process;  

end Behavioral;
