----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/03/2023 05:36:08 PM
-- Design Name: 
-- Module Name: TB_Adder_3 - Behavioral
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

entity TB_Adder_3 is
--  Port ( );
end TB_Adder_3;

architecture Behavioral of TB_Adder_3 is
component Adder_3
    Port ( Address_In : in STD_LOGIC_VECTOR (2 downto 0);
           Address_Out : out STD_LOGIC_VECTOR (2 downto 0));
end component;
SIGNAL Address_In,Address_Out : STD_LOGIC_VECTOR (2 downto 0);
    
begin
    uut: Adder_3 PORT MAP (
          Address_In => Address_In,
          Address_Out => Address_Out
        );
        
        process 
        begin
        -- Group Members Index numbers' binary form
        -- 210025T      110 011 010 001 101 001
        -- 210493A      110 011 011 000 111 101
        -- unique 3bit numbers from index numbers for Address_In=>110, 011, 010, 001, 000, 101, 111
        
        Address_In <= "110"; 
        wait for 20ns;

        Address_In <= "011";
        wait for 20ns;

        Address_In <= "010"; 
        wait for 20ns;

        Address_In <= "001";
        wait for 20ns;

        Address_In <= "000"; 
        wait;
        end process;


end Behavioral;
