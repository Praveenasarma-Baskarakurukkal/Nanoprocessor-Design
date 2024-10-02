library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RegisterBank is
    Port ( Register_enable : in STD_LOGIC_VECTOR (2 downto 0); --To select the register
           Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Data_Input : in STD_LOGIC_VECTOR (3 downto 0);
           Reg0_Out : out STD_LOGIC_VECTOR (3 downto 0);
           Reg1_Out : out STD_LOGIC_VECTOR (3 downto 0);
           Reg2_Out : out STD_LOGIC_VECTOR (3 downto 0);
           Reg3_Out : out STD_LOGIC_VECTOR (3 downto 0);
           Reg4_Out : out STD_LOGIC_VECTOR (3 downto 0);
           Reg5_Out : out STD_LOGIC_VECTOR (3 downto 0);
           Reg6_Out : out STD_LOGIC_VECTOR (3 downto 0);
           Reg7_Out : out STD_LOGIC_VECTOR (3 downto 0)
           );
           
end RegisterBank;

architecture Behavioral of RegisterBank is

component Register_4
    port(
       D : in STD_LOGIC_VECTOR (3 downto 0);
       En : in STD_LOGIC;
       Reset : in STD_LOGIC;
       Clk : in STD_LOGIC;
       Q : out STD_LOGIC_VECTOR (3 downto 0)
    );
end component;

component Decoder_3_8
    port(
        I : in STD_LOGIC_VECTOR (2 downto 0);
        En : in STD_LOGIC;
        Y : OUT STD_LOGIC_VECTOR (7 downto 0)
    );
end component;

SIGNAL Y : STD_LOGIC_VECTOR (7 downto 0);

begin
Decoder_3_to_8_0: Decoder_3_8
    port map(
        I => Register_enable,
        En => '1',  
        Y => Y
    );


Reg_0: Register_4
    port map(
        D=>"0000",
        En=>Y(0),
        Reset => Reset,
        Clk=>Clk,
        Q=>Reg0_Out
    );

Reg_1: Register_4
    port map(
        D=>Data_Input,
        En=>Y(1),
        Reset => Reset,
        Clk=>Clk,
        Q=>Reg1_Out
    );
    
Reg_2: Register_4
    port map(
        D=>Data_Input,
        En=>Y(2),
        Reset => Reset,
        Clk=>Clk,
        Q=>Reg2_Out
        );
  
Reg_3: Register_4
    port map(
        D=>Data_Input,
        En=>Y(3),
        Reset => Reset,
        Clk=>Clk,
        Q=>Reg3_Out
    );
            
Reg_4: Register_4
    port map(
        D=>Data_Input,
        En=>Y(4),
        Reset => Reset,
        Clk=>Clk,
        Q=>Reg4_Out
    );

Reg_5: Register_4
    port map(
        D=>Data_Input,
        En=>Y(5),
        Reset => Reset,
        Clk=>Clk,
        Q=>Reg5_Out
        );
  
Reg_6: Register_4
    port map(
        D=>Data_Input,
        En=>Y(6),
        Reset => Reset,
        Clk=>Clk,
        Q=>Reg6_Out
    );
            
Reg_7: Register_4
    port map(
        D=>Data_Input,
        En=>Y(7),
        Reset => Reset,
        Clk=>Clk,
        Q=>Reg7_Out
    );   
    

end Behavioral;