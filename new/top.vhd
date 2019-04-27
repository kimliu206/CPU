library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top is
  Port (
        clk1:in STD_LOGIC;
        low16:out STD_LOGIC_VECTOR(15 downto 0):="0000000000000000";
        high16:out STD_LOGIC_VECTOR(15 downto 0):="0000000000000000"
  
   );
end top;

architecture Behavioral of top is

    component PC
        Port (
            MBR_in:in STD_LOGIC_VECTOR(7 downto 0);
            cs:in STD_LOGIC_VECTOR(31 downto 0);
            clk:in STD_LOGIC;
            PC_out:out STD_LOGIC_VECTOR(7 downto 0)   
             );
    end component;
    
    component MR
      Port (
              cs:in STD_LOGIC_VECTOR(31 downto 0);
              clk:in STD_LOGIC;
              MR:out STD_LOGIC_vector(15 downto 0);
              ACC_in:in STD_LOGIC_VECTOR(15 downto 0)          
     );
    end component;
    
    component ALU
    Port (
                clk:in STD_LOGIC;
                BR_in:in STD_LOGIC_VECTOR(15 downto 0);
                cs:in STD_LOGIC_VECTOR(31 downto 0);
                accis0:out STD_LOGIC;
                acc:out STD_LOGIC_VECTOR(15 downto 0);
                mpyhigh:out STD_LOGIC_VECTOR(15 downto 0)         
       );
    end component;
    
    component BR
    Port ( 
                MBR_in:in STD_LOGIC_VECTOR(15 downto 0);
                cs:in STD_LOGIC_VECTOR(31 downto 0);
                clk:in STD_LOGIC;
                BR_out:out STD_LOGIC_VECTOR(15 downto 0)
      );
    end component;
    
    component Control_Unit
    Port ( 
                clk:in STD_LOGIC;
                flag:in STD_LOGIC;
                cs:in STD_LOGIC_VECTOR(31 downto 0);
                IR_in:in STD_LOGIC_VECTOR(7 downto 0);
                address_out:out STD_LOGIC_VECTOR(7 downto 0)
      );
    end component;
    
    component IR
    Port (
                MBR_in:in STD_LOGIC_VECTOR(7 downto 0);   
                cs:in STD_LOGIC_VECTOR(31 downto 0);
                clk:in STD_LOGIC;
                IR_out:out STD_LOGIC_VECTOR(7 downto 0)
                 );
    end component;
    
    component MAR
    Port (
                PC_in:in STD_LOGIC_VECTOR(7 downto 0);
                MBR_in:in STD_LOGIC_VECTOR(7 downto 0);
                clk:in STD_LOGIC;
                cs:in STD_LOGIC_VECTOR(31 downto 0);
                MAR_OUT:out STD_LOGIC_VECTOR(7 downto 0)
                    );
    end component;
    
    component MBR
     Port (
     
           ACC_in:in STD_LOGIC_VECTOR(15 downto 0);
           MEMORY_in:in STD_LOGIC_VECTOR(15 downto 0);
           cs:in STD_LOGIC_VECTOR(31 downto 0);------
           clk:in STD_LOGIC;
           MR_in:in STD_LOGIC_VECTOR(15 downto 0);
           MBR_out:out STD_LOGIC_VECTOR(15 downto 0)
      );
    end component;
    
    component RAM1
    PORT (
        a : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        d : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        clk : IN STD_LOGIC;
        we : IN STD_LOGIC;
        spo : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
      );
    end component;
    
    component ROM1
    PORT (
        a : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        spo : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
      );
    end component;

signal csall:STD_LOGIC_VECTOR(31 downto 0):="00000000000000000000000000001001";
signal MBR_16:STD_LOGIC_VECTOR(15 downto 0);
signal BR_ALU:STD_LOGIC_VECTOR(15 downto 0);
signal address:STD_LOGIC_VECTOR(7 downto 0);
signal memory_data:STD_LOGIC_VECTOR(15 downto 0);
signal add:STD_LOGIC_VECTOR(7 downto 0);
signal PC_8:STD_LOGIC_VECTOR(7 downto 0);
signal ACC_16:STD_LOGIC_VECTOR(15 downto 0);
signal mpy_high16:STD_LOGIC_VECTOR(15 downto 0);
signal IR_8:STD_LOGIC_VECTOR(7 downto 0);
signal flagg:STD_LOGIC;
signal MR_16:STD_LOGIC_VECTOR(15 downto 0):="0000000000000000";

begin


u1: MR PORT MAP(clk=>clk1,cs=>csall,ACC_in=>mpy_high16,MR=>MR_16);   
u2: ALU PORT MAP(clk=>clk1,cs=>csall,BR_in=>BR_ALU,acc=>ACC_16,mpyhigh=>mpy_high16,accis0=>flagg);  
u3: BR PORT MAP(clk=>clk1,cs=>csall,MBR_in=>MBR_16,BR_out=>BR_ALU);         
u4: Control_Unit PORT MAP(clk=>clk1,cs=>csall,flag=>flagg,address_out=>address,IR_in=>IR_8);
u5: IR PORT MAP(clk=>clk1,cs=>csall,MBR_in=>MBR_16(15 downto 8),IR_out=>IR_8);      
u6: MAR PORT MAP(clk=>clk1,cs=>csall,MAR_OUT=>add,PC_in=>PC_8,MBR_in=>MBR_16(7 downto 0));   
u7: MBR PORT MAP(clk=>clk1,cs=>csall,MBR_out=>MBR_16,MEMORY_in=>memory_data,ACC_in=>ACC_16,MR_in=>MR_16);   
u8: PC PORT MAP(clk=>clk1,cs=>csall,MBR_in=>MBR_16(7 downto 0),PC_out=>PC_8);    
u9: RAM1 PORT MAP(clk=>clk1,spo=>memory_data,a=>add,d=>MBR_16,we=>csall(11));
u10: ROM1 PORT MAP(spo=>csall,a=>address);       

low16<=ACC_16;
high16<=mpy_high16;
end Behavioral;
