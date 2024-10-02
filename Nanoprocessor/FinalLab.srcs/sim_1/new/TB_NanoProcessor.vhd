----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/07/2023 01:21:35 AM
-- Design Name: 
-- Module Name: TB_NanoProcessor - Behavioral
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

entity TB_NanoProcessor is
--  Port ( );
end TB_NanoProcessor;

architecture Behavioral of TB_NanoProcessor is

component NanoProcessor
Port ( Clk : in STD_LOGIC;
       Reset : in STD_LOGIC;
       Overflow : out STD_LOGIC;
       Zero : out STD_LOGIC;
       LED : out STD_LOGIC_VECTOR (3 downto 0);
       Seven_Segment_Display: out STD_LOGIC_VECTOR (6 downto 0);
       Anode: out STD_LOGIC_VECTOR ( 3 downto 0) := "0001");
       
end component;
signal Overflow,Zero : std_logic;
signal Reset:std_logic := '1';
signal Clk:std_logic := '0';
signal LED,Anode: std_logic_vector(3 downto 0);
signal Seven_Segment_Display: std_logic_vector(6 downto 0);

begin

UUT: NanoProcessor
port map(
        Clk => Clk,
        Reset => Reset,
        Overflow => Overflow,
        Zero => Zero,
        LED =>LED,
        Seven_Segment_Display => Seven_Segment_Display,
        Anode => Anode
        );
        
process 
begin
    wait for 2ns;
    Clk <= NOT(Clk);
end process;

process 
begin
    Reset <= '1';
    wait for 56 ns;
    
    Reset <= '0';
    wait;
end process;
      
end Behavioral;
