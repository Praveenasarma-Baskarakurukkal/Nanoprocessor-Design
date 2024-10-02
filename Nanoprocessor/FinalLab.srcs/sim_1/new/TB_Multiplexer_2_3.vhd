----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/04/2023 09:14:43 AM
-- Design Name: 
-- Module Name: TB_Multiplexer_2_3 - Behavioral
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

entity TB_Multiplexer_2_3 is
--  Port ( );
end TB_Multiplexer_2_3;

architecture Behavioral of TB_Multiplexer_2_3 is
component Multiplexer_2_3 is
    Port ( Address_Out : in STD_LOGIC_VECTOR (2 downto 0);
           Address_to_Jump : in STD_LOGIC_VECTOR (2 downto 0);
           Jump_Flag : in STD_LOGIC;
           Address_to_PC : out STD_LOGIC_VECTOR (2 downto 0));
end component;
signal Address_Out,Address_to_Jump,Address_to_PC : STD_LOGIC_VECTOR (2 downto 0);
signal Jump_Flag :  STD_LOGIC;
begin
    UUT : Multiplexer_2_3
    PORT MAP( Address_Out => Address_Out,
              Address_to_Jump => Address_to_Jump,
              Jump_Flag => Jump_Flag,
              Address_to_PC => Address_to_PC);
      process
      begin
      Jump_Flag <= '0';
      wait for 40ns;
      Jump_Flag <= '1';
      wait for 40ns;
      end process;
          
      process
      begin
         -- Group Members Index numbers' binary form
         -- 210025T      110 011 010 001 101 001
         -- 210493A      110 011 011 000 111 101
         -- unique 3 bit numbers from index numbers=>110, 011, 010, 001, 000, 101, 111
         Address_Out<="110";
         Address_to_Jump<="011";
         wait for 40ns;
         
         Address_Out<="010";
         Address_to_Jump<="001";
         wait for 40ns;
         
         Address_Out<="000";
         Address_to_Jump<="101";
         wait for 40ns;
       end process;

end Behavioral;
