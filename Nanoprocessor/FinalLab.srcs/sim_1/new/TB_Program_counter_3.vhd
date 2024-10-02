----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/03/2023 08:50:32 PM
-- Design Name: 
-- Module Name: TB_Program_counter_3 - Behavioral
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

entity TB_Program_Counter_3 is
--  Port ( );
end TB_Program_Counter_3;

architecture Behavioral of TB_Program_Counter_3 is
component Program_Counter_3 is
    Port ( Address : in STD_LOGIC_VECTOR (2 downto 0);  
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           MemorySelect : out STD_LOGIC_VECTOR (2 downto 0));
 end component;
 signal Clk : STD_LOGIC := '0';
 signal Res: STD_LOGIC;
 signal Address,MemorySelect: STD_LOGIC_VECTOR(2 downto 0);
begin
    UUT: Program_Counter_3
        PORT MAP(
        Clk => Clk,
        Address => Address,
        Res => Res,
        MemorySelect => MemorySelect
        );
    process
            begin
            wait for 5ns;
            Clk <= Not(Clk);
            end process;
            
-- Group Members Index numbers' binary form
-- 210025T      110 011 010 001 101 001
-- 210493A      110 011 011 000 111 101
-- unique 3 bit numbers from index numbers for  =>110, 011, 010, 001, 000, 101, 111
process
      begin
            Res <= '1';
            wait for 100ns;
            
            Res <= '0';
            Address <= "110";
            wait for 100ns;
            
            Address <= "011";
            wait for 100ns;
            
            Address <= "010";
            wait for 100ns;
            
            Address <= "001";
            wait for 100ns;
            
            Address <= "000";
            wait for 100ns;
            
            Address <= "101";
            wait for 100ns;
            
            Address <= "111";
            wait for 100ns;
            
            Res <= '1';
            wait;
end process;

end Behavioral;