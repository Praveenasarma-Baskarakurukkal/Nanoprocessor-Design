----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/05/2023 02:32:02 AM
-- Design Name: 
-- Module Name: Program_Rom - Behavioral
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
use ieee.numeric_std.all; 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Program_ROM is
    Port ( MemorySelect : in STD_LOGIC_VECTOR (2 downto 0);
           Instruction : out STD_LOGIC_VECTOR (11 downto 0));
end Program_ROM;

architecture Behavioral of Program_ROM is

type rom_type is array (0 to 7)of std_logic_vector (11 downto 0);

signal P_ROM : rom_type := (
          --Add 3 by looping
          "101000000011", -- MOVI R4,3
          "101100000001", -- MOVI R6,1
          "011100000000", -- NEG R6
          "001111000000", -- ADD R7,R4
          "001001100000", -- ADD R4,R6
          "111000000111", -- JZR R4,7
          "110000000011", -- JZR R0,3
          "111000000111" -- JZR R4,7

         --Program to display 10 to 0
         --"101110001010", --0  Move R7 10
         --"100100000001", --1  Move R2 01
         --"010100000000", --2  Neg R2
         --"001110100000", --3  R7<- R7+R2
         --"111110000111", --4  JMP R7=0 PR7
         --"110000000011", --5  JMP R0=0 PR3
         --"110010000111", --6
         --"110010000110"  --7   
         
         -- Add 1,2,3 to three registers R7,R6,R5 respectively.
         -- Add R6 to R7 and store in R7
         -- Add R5 to R7 and store in R7
         -- Adding 1,2,3 by storing each value in each registers.
         --"101110000001", -- 0-- MOVI R7,1
         --"101100000010", -- 1-- MOVI R6,2
         --"101010000011", -- 2-- MOVI R5,3
         --"001111100000", -- 3-- ADD R7,R6
         --"001111010000", -- 4-- ADD R7,R5
         --"110000000101", -- 5-- JZR R0,5
         --"110000000101", -- 6-- JZR R0,5
         --"110000000111"  -- 7-- JZR R0,7
    );
begin
    Instruction <= P_ROM(to_integer(unsigned(MemorySelect)));

end Behavioral;
