----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/03/2023 04:45:11 PM
-- Design Name: 
-- Module Name: TB_Add_Sub - Behavioral
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


entity TB_Add_Sub_4 is
--  Port ( );
end TB_Add_Sub_4;

architecture Behavioral of TB_Add_Sub_4 is
component Add_Sub_4
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Add_Sub_Select : in STD_LOGIC;
           Zero:out std_logic;
           Overflow :out STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0));
end component;
SIGNAL A,B,S : STD_LOGIC_VECTOR (3 downto 0);
    SIGNAL Add_Sub_Select,Overflow,Zero : STD_LOGIC;
begin
    uut: Add_Sub_4 PORT MAP (
          A => A,
          B => B,
          Add_Sub_Select => Add_Sub_Select,
          S => S,
          Zero => Zero,
          Overflow => Overflow
        );
        
process 
   begin
-- Group Members Index numbers' binary form
-- 210025T      11 0011 0100 0110 1001
-- 210493A      11 0011 0110 0011 1101
-- unique 4bit numbers from index numbers=> 0011, 0100, 0110, 1001, 1101
        A <= "0100"; 
        B <= "0011"; 
        Add_Sub_Select <= '0';
        wait for 20ns;
        
        A <= "1001"; 
        B <= "0110";
        Add_Sub_Select <= '1';
        wait;
        end process;

end Behavioral;