----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/05/2023 02:46:32 AM
-- Design Name: 
-- Module Name: Instruction_Decoder - Behavioral
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

entity Instruction_Decoder is
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
end Instruction_Decoder; 

architecture Behavioral of Instruction_Decoder is

component Decoder_2_4
    PORT (
    I : in STD_LOGIC_VECTOR (1 downto 0);
    EN : in STD_LOGIC;
    Y : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    signal jump_Instruction, Add_Instruction:std_logic;
begin

    Operation_Selector : Decoder_2_4
port map(
    I  => Instruction(11 downto 10),
    EN => '1',
    Y(0) => Add_Instruction, --add --we will not use this
    Y(1) => Add_or_Sub_Sel, -- neg
    Y(2) => Load_Select,     --movi
    Y(3) => jump_Instruction);   --jzr

Immediate_Val <= Instruction(3 downto 0);
Reg_En <= Instruction(9 downto 7);
Address_to_Jump <= Instruction(2 downto 0); 
MuxB_Sel <= Instruction(9 downto 7);
MuxA_Sel <= Instruction(6 downto 4);

JumpFlag <= jump_Instruction and (not(Reg_Check_For_Jump(0) or Reg_Check_For_Jump(1) or Reg_Check_For_Jump(2) or Reg_Check_For_Jump(3)));

end Behavioral;
