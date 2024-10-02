----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/03/2023 04:07:07 PM
-- Design Name: 
-- Module Name: Add_Sub_4 - Behavioral
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

entity Add_Sub_4 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Add_Sub_Select : in STD_LOGIC;
           Zero:out std_logic;
           Overflow :out STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0));
end Add_Sub_4;

architecture Behavioral of Add_Sub_4 is
COMPONENT FA
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C_in : in STD_LOGIC;
           S : out STD_LOGIC;
           C_out : out STD_LOGIC);
END COMPONENT;

SIGNAL FA0_C,FA1_C,FA2_C,FA3_C: STD_LOGIC;
SIGNAL B_0,B_1,B_2,B_3: STD_LOGIC;
SIGNAL FA_Sum : STD_LOGIC_VECTOR (3 downto 0);

begin
    B_0 <= B(0) XOR Add_Sub_Select;
    B_1 <= B(1) XOR Add_Sub_Select;
    B_2 <= B(2) XOR Add_Sub_Select;
    B_3 <= B(3) XOR Add_Sub_Select;
    
    FA_0 : FA
    PORT MAP( A => A(0),
              B => B_0,
              C_in => Add_Sub_Select,
              S => FA_Sum(0),
              C_out => FA0_C);
              
    FA_1 : FA
    PORT MAP( A => A(1),
              B => B_1,
              C_in => FA0_C,
              S => FA_Sum(1),
              C_out => FA1_C);
              
    FA_2 : FA
    PORT MAP( A => A(2),
            B => B_2,
            C_in => FA1_C,
            S => FA_Sum(2),
            C_out => FA2_C);
            
   FA_3 : FA
   PORT MAP( A => A(3),
            B => B_3,
            C_in => FA2_C,
            S => FA_Sum(3),
            C_out => FA3_C);
            
   Overflow <= FA2_C xor FA3_C;
   Zero <= not(FA_Sum(0) or FA_Sum(1) or FA_Sum(2) or FA_Sum(3));
   S <= FA_Sum;
end Behavioral;



