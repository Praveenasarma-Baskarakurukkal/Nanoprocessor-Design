----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/06/2023 01:26:04 PM
-- Design Name: 
-- Module Name: NanoProcessor - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity NanoProcessor is
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Seven_Segment_Display : out STD_LOGIC_VECTOR (6 downto 0);
           LED : out STD_LOGIC_VECTOR (3 downto 0);
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC;
           Anode : out STD_LOGIC_VECTOR(3 downto 0));
end NanoProcessor;

architecture Behavioral of NanoProcessor is

-------------------------------------Slow_Clk-----------------------------------------------
component Slow_Clk is
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end component;

-------------------------------------Program Counter----------------------------------------
component Program_Counter_3
    Port ( Address : in STD_LOGIC_VECTOR (2 downto 0);  
       Res : in STD_LOGIC;
       Clk : in STD_LOGIC;
       MemorySelect : out STD_LOGIC_VECTOR (2 downto 0));
end component;

---------------------------------3-bit Adder-----------------------------------------------
component Adder_3
    Port ( Address_In : in STD_LOGIC_VECTOR (2 downto 0);
       Address_Out : out STD_LOGIC_VECTOR (2 downto 0));
end component;

---------------------------------2-way 3-bit MUX--------------------------------------------
component Multiplexer_2_3
    Port ( Address_Out : in STD_LOGIC_VECTOR (2 downto 0);
       Address_to_Jump : in STD_LOGIC_VECTOR (2 downto 0);
       Jump_Flag : in STD_LOGIC;
       Address_to_PC : out STD_LOGIC_VECTOR (2 downto 0));
end component;

---------------------------------Program_ROM--------------------------------------------       
component Program_ROM 
    Port ( MemorySelect : in STD_LOGIC_VECTOR (2 downto 0);
       Instruction : out STD_LOGIC_VECTOR (11 downto 0));
end component;

---------------------------------Instruction Decoder-------------------------------------------- 
component Instruction_Decoder 
     Port ( 
        Instruction : in STD_LOGIC_VECTOR (11 downto 0);
        Reg_Check_For_Jump : in STD_LOGIC_VECTOR (3 downto 0);
        Reg_En : out STD_LOGIC_VECTOR(2 downto 0);
        Load_Select : out STD_LOGIC;
        Immediate_Val : out STD_LOGIC_VECTOR(3 downto 0);
        MuxA_Sel : out STD_LOGIC_VECTOR (2 downto 0);
        MuxB_Sel : out STD_LOGIC_VECTOR (2 downto 0);
        Add_or_Sub_Sel : out STD_LOGIC;
        JumpFlag : out STD_LOGIC;
        Address_to_Jump : out STD_LOGIC_VECTOR (2 downto 0));
end component;

---------------------------------2 way 4 bit MUX-------------------------------------------- 
component Multiplexer_2_4 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
       B : in STD_LOGIC_VECTOR (3 downto 0);
       Load_Select : in STD_LOGIC;
       Mux_Out : out STD_LOGIC_VECTOR (3 downto 0));
end component;

---------------------------------Register Bank-------------------------------------------- 
component RegisterBank is
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
end component;

---------------------------------Multiplexer_8_4-------------------------------------------- 
component Multiplexer_8_4 
    Port ( Reg0_Out : in STD_LOGIC_VECTOR (3 downto 0);
       Reg1_Out : in STD_LOGIC_VECTOR (3 downto 0);
       Reg2_Out : in STD_LOGIC_VECTOR (3 downto 0);
       Reg3_Out : in STD_LOGIC_VECTOR (3 downto 0);
       Reg4_Out : in STD_LOGIC_VECTOR (3 downto 0);
       Reg5_Out : in STD_LOGIC_VECTOR (3 downto 0);
       Reg6_Out : in STD_LOGIC_VECTOR (3 downto 0);
       Reg7_Out : in STD_LOGIC_VECTOR (3 downto 0);
       Register_select : in STD_LOGIC_VECTOR (2 downto 0);
       Mux_Out : out STD_LOGIC_VECTOR (3 downto 0));
end component;

--------------------------------------Add_Sub_4------------------------------------------------ 
component Add_Sub_4
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
       B : in STD_LOGIC_VECTOR (3 downto 0);
       Add_Sub_Select : in STD_LOGIC;
       Zero:out std_logic;
       Overflow :out STD_LOGIC;
       S : out STD_LOGIC_VECTOR (3 downto 0)); 
end component;

-------------------------------------LUT_16_7----------------------------------------------- 
component LUT_16_7 is
    Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
           data : out STD_LOGIC_VECTOR (6 downto 0));
end component;

signal Slow_Clock, JumpFlag, Load_Select, Add_or_Sub_Sel: STD_LOGIC;
signal AddressToPC, MemorySelect, Adder_Out: STD_LOGIC_VECTOR(2 downto 0);
signal JumpAddress, Register_enable, MuxA_Sel, MuxB_Sel: STD_LOGIC_VECTOR(2 downto 0);
signal PROM_Instruction : STD_LOGIC_VECTOR (11 downto 0);
signal MuxA_out,MuxB_out, Sum, Mux_Out,Immediate_Val: STD_LOGIC_VECTOR(3 downto 0);
signal  Reg0_Out,Reg1_Out,Reg2_Out,Reg3_Out,Reg4_Out,Reg5_Out,Reg6_Out,Reg7_Out: STD_LOGIC_VECTOR(3 downto 0);

begin
Slow_Clk_0 : Slow_Clk
    port map(
        Clk_in => Clk,
        Clk_out => Slow_Clock);

Program_Counter_3_0 : Program_Counter_3
port map (
    Address => AddressToPC,
    Res => Reset,
    Clk => Slow_Clock,
    MemorySelect => MemorySelect
);
         
Adder_3_0: Adder_3
port map (
    Address_In => MemorySelect,
    Address_Out => Adder_Out

);
       
Multiplexer_2_3_0 : Multiplexer_2_3
port map (
    Address_Out => Adder_Out ,
    Address_to_Jump => JumpAddress,
    Jump_Flag => JumpFlag,
    Address_to_PC => AddressToPC
);

Program_ROM_0 :Program_ROM
port map(
    MemorySelect => MemorySelect,
    Instruction => PROM_Instruction
);

Instruction_Decoder_0 : Instruction_Decoder
port map(
    Instruction => PROM_Instruction,
    Reg_Check_For_Jump => MuxB_out,
    Reg_En => Register_enable,
    Load_Select  => Load_Select,
    Immediate_Val => Immediate_Val,
    MuxA_Sel => MuxA_Sel,
    MuxB_Sel => MuxB_Sel,
    Add_or_Sub_Sel => Add_or_Sub_Sel,
    JumpFlag => JumpFlag,
    Address_to_Jump => JumpAddress
    );
    
Multiplexer_2_4_0 : Multiplexer_2_4
port map(
    A => Sum,
    B => Immediate_Val,
    Load_Select => Load_Select,
    Mux_Out => Mux_Out
    );

RegisterBank_0 : RegisterBank
port map(
    Clk => Slow_Clock,
    Register_enable => Register_enable,
    Reset => Reset,
    Data_Input => Mux_Out,
    Reg0_Out=> Reg0_Out,
    Reg1_Out=> Reg1_Out,
    Reg2_Out=> Reg2_Out,
    Reg3_Out=> Reg3_Out,
    Reg4_Out=> Reg4_Out,
    Reg5_Out=> Reg5_Out,
    Reg6_Out=> Reg6_Out,
    Reg7_Out=> Reg7_Out
    );
    
Multiplexer_8_4_A :Multiplexer_8_4
port map (
        Reg0_Out=> Reg0_Out,
        Reg1_Out=> Reg1_Out,
        Reg2_Out=> Reg2_Out,
        Reg3_Out=> Reg3_Out,
        Reg4_Out=> Reg4_Out,
        Reg5_Out=> Reg5_Out,
        Reg6_Out=> Reg6_Out,
        Reg7_Out=> Reg7_Out,
        Register_select => MuxA_Sel,
        Mux_Out => MuxA_Out
        );
        
Multiplexer_8_4_B :Multiplexer_8_4
port map (
    Reg0_Out=> Reg0_Out,
    Reg1_Out=> Reg1_Out,
    Reg2_Out=> Reg2_Out,
    Reg3_Out=> Reg3_Out,
    Reg4_Out=> Reg4_Out,
    Reg5_Out=> Reg5_Out,
    Reg6_Out=> Reg6_Out,
    Reg7_Out=> Reg7_Out,
    Register_select => MuxB_Sel,
    Mux_Out => MuxB_Out
    );
    
Add_Sub_4_0 : Add_Sub_4
port map (
    A => MuxA_Out, 
    B => MuxB_Out,
    Add_Sub_Select => Add_or_Sub_Sel,
    S => Sum,
    Overflow => Overflow,
    Zero => Zero
    );

LUT_16_7_0 : LUT_16_7
port map(
    address => Reg7_Out,
    data => Seven_Segment_Display
);
   
LED <=  Reg7_Out;
Anode <= "1110";

end Behavioral;