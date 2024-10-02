----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/04/2023 08:16:38 AM
-- Design Name: 
-- Module Name: Multiplexer_2_3 - Behavioral
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

entity Multiplexer_2_3 is
    Port ( Address_Out : in STD_LOGIC_VECTOR (2 downto 0);
           Address_to_Jump : in STD_LOGIC_VECTOR (2 downto 0);
           Jump_Flag : in STD_LOGIC;
           Address_to_PC : out STD_LOGIC_VECTOR (2 downto 0));
end Multiplexer_2_3;

architecture Behavioral of Multiplexer_2_3 is

begin
--    process(Jump_Flag,Address_Out,Address_to_Jump)
--        begin
--            if (Jump_Flag = '0') then
--                Address_to_PC <= Address_Out;
--            else
--                Address_to_PC <= Address_to_Jump;
--            end if;
--    end process;

--Simplified code
   Address_to_PC <= Address_Out when Jump_Flag = '0' else Address_to_Jump;
end Behavioral;