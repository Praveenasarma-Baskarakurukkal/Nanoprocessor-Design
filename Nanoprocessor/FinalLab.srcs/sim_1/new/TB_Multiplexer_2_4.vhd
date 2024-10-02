----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/05/2023 01:11:31 AM
-- Design Name: 
-- Module Name: TB_Multiplexer_2_4 - Behavioral
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

entity TB_Multiplexer_2_4 is
--  Port ( );
end TB_Multiplexer_2_4;

architecture Behavioral of TB_Multiplexer_2_4 is
component Multiplexer_2_4 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Load_Select : in STD_LOGIC;
           Mux_Out : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal A,B,Mux_Out : STD_LOGIC_VECTOR (3 downto 0);
signal Load_Select :  STD_LOGIC;

begin
    UUT : Multiplexer_2_4
    PORT MAP( A => A,
              B => B,
              Load_Select => Load_Select,
              Mux_Out => Mux_Out);
      process
      begin
      Load_Select <= '0';
      wait for 40ns;
      Load_Select <= '1';
      wait for 40ns;
      end process;
          
      process
      begin
         -- Group Members Index numbers' binary form
         -- 210025T      11 0011 0100 0110 1001
         -- 210493A      11 0011 0110 0011 1101
         -- unique 4bit numbers from index numbers=> 0011, 0100, 0110, 1001, 1101
         
         A<="0011";
         B<="0100";
         wait for 40ns;

         A<="0110";
         B<="1001";
         wait for 40ns;

         A<="1101";
         B<="0011";
         wait for 40ns;

         A<="0100";
         B<="0110";
         wait for 40ns;

       end process;


end Behavioral;