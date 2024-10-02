----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/04/2023 08:28:45 AM
-- Design Name: 
-- Module Name: Multiplexer_2_4 - Behavioral
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

entity Multiplexer_2_4 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Load_Select : in STD_LOGIC;
           Mux_Out : out STD_LOGIC_VECTOR (3 downto 0));
end Multiplexer_2_4;

architecture Behavioral of Multiplexer_2_4 is


begin
--process(Load_Select,A,B)
--    begin
--        if (Load_Select = '1') then
--            Mux_Out <= B;
--        else
--            Mux_Out <= A;
--        end if;
--    end process;

    --Simplified code
    Mux_Out <= A when Load_Select = '0' else B;

end Behavioral;