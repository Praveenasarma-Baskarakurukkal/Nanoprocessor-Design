----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/05/2023 02:38:45 AM
-- Design Name: 
-- Module Name: TB_Program_Rom - Behavioral
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

entity TB_Program_Rom is
    --  Port ( );
end TB_Program_Rom;

architecture Behavioral of TB_Program_Rom is

component Program_ROM
     Port ( MemorySelect : in STD_LOGIC_VECTOR (2 downto 0);
     Instruction : out STD_LOGIC_VECTOR (11 downto 0));
end component;

signal MemorySelect:STD_LOGIC_VECTOR (2 downto 0);
signal Instruction: STD_LOGIC_VECTOR (11 downto 0);

begin
    UUT : Program_ROM
        port map(
            MemorySelect => MemorySelect,
            Instruction => Instruction
        );
    
process
    begin
        -- Group Members Index numbers' binary form
        -- 210025T      110 011 010 001 101 001
        -- 210493A      110 011 011 000 111 101
        -- unique 3bit numbers from index numbers=> 110, 011, 010, 001, 000, 101, 111
        MemorySelect <= "110";
        wait for 100ns;
        
        MemorySelect <= "011";
        wait for 100ns;
        
        MemorySelect <= "010";
        wait for 100ns;
        
        MemorySelect <= "001";
        wait for 100ns;
        
        MemorySelect <= "000";
        wait for 100ns;
        
        MemorySelect <= "101";
        wait for 100ns;
        
        MemorySelect <= "111";
        wait;
end process;

end Behavioral;

