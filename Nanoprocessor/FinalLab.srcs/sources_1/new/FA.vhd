----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/03/2023 04:12:28 PM
-- Design Name: 
-- Module Name: FA - Behavioral
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

entity FA is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C_in : in STD_LOGIC;
           S : out STD_LOGIC;
           C_out : out STD_LOGIC);
end FA;

architecture Behavioral of FA is
COMPONENT HA 
PORT(  A,B : in STD_LOGIC;
       C,S : out STD_LOGIC);
END COMPONENT;
SIGNAL HA0_S, HA0_C, HA1_S, HA1_C : std_logic;
begin
    HA_0 :HA
    port map(
    A => A,
    B => B,
    C => HA0_C,
    S => HA0_S);
    HA_1 :HA
    port map(
    A => HA0_S,
    B => C_in,
    C => HA1_C,
    S => HA1_S);
    
    S <= HA0_S XOR C_in;
    C_out <= (C_in AND ( HA0_S)) OR HA0_C;


end Behavioral;
