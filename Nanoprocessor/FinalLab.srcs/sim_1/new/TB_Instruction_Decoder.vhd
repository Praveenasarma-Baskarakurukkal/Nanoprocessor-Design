----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/05/2023 02:52:19 AM
-- Design Name: 
-- Module Name: TB_Instruction_Decoder - Behavioral
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

entity TB_Instruction_Decoder is
--  Port ( );
end TB_Instruction_Decoder;

architecture Behavioral of TB_Instruction_Decoder is
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

signal Instruction : STD_LOGIC_VECTOR (11 downto 0);
signal Reg_Check_For_Jump : STD_LOGIC_VECTOR (3 downto 0);
signal Reg_En : STD_LOGIC_VECTOR (2 downto 0);
signal Load_Select : STD_LOGIC;
signal Immediate_Val : STD_LOGIC_VECTOR (3 downto 0);
signal MuxA_Sel : STD_LOGIC_VECTOR (2 downto 0);
signal MuxB_Sel : STD_LOGIC_VECTOR (2 downto 0);
signal Add_or_Sub_Sel : STD_LOGIC;
signal JumpFlag : STD_LOGIC;
signal Address_to_Jump : STD_LOGIC_VECTOR (2 downto 0);


begin
UUT : Instruction_Decoder
    port map(
        Instruction =>Instruction,
        Reg_Check_For_Jump =>Reg_Check_For_Jump,
        Reg_En =>Reg_En,
        Load_Select => Load_Select,
        Immediate_Val =>Immediate_Val,
        MuxA_Sel =>MuxA_Sel,
        MuxB_Sel =>MuxB_Sel,
        Add_or_Sub_Sel =>Add_or_Sub_Sel,
        JumpFlag =>JumpFlag,
        Address_to_Jump => Address_to_Jump
        );
process 
begin
            --Instruction <= "101010000011"; -- MOVI R5, 3
            --wait for 100ns;
            
           -- Instruction <= "101100000001"; -- MOVI R6, 1
            --wait for 100ns;
            
            --Instruction <= "011100000000"; -- NEG R6
           -- wait for 100 ns;
            
           -- Instruction <= "001111010000"; -- ADD R7, R5
           -- wait for 100 ns;
            
           -- Instruction <= "001011100000"; -- ADD R5, R6
           -- wait for 100 ns;
            Instruction <= "100000000000"; -- MOVI R0, 0
            wait for 100ns;
            Instruction <= "101010000011"; -- MOVI R5, 3
            wait for 100ns;
                        
            Instruction <= "101100000001"; -- MOVI R6, 1
            wait for 100ns;
                        
            Instruction <= "011100000000"; -- NEG R6
            wait for 100 ns;
                        
            Instruction <= "001111010000"; -- ADD R7, R5
            wait for 100 ns;
                        
            Instruction <= "001011100000"; -- ADD R5, R6
            wait for 100 ns;
            Instruction <= "110000000011"; -- JZR R0,3
            wait for 100 ns;
            Reg_Check_For_Jump <= "0010";
            wait for 100 ns;
            --Instruction <= "111010000111"; -- JZR R5, 7
            --wait for 100 ns;
            --Reg_Check_For_Jump <= "0110";
            wait;
        end process;
        
        end Behavioral;
