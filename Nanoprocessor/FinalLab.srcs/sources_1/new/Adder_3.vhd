----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/03/2023 05:18:41 PM
-- Design Name: 
-- Module Name: Adder_3 - Behavioral
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

entity Adder_3 is
    Port ( Address_In : in STD_LOGIC_VECTOR (2 downto 0);
           Address_Out : out STD_LOGIC_VECTOR (2 downto 0));
end Adder_3;

architecture Behavioral of Adder_3 is
COMPONENT FA
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC := '0';
           C_in : in STD_LOGIC;
           S : out STD_LOGIC;
           C_out : out STD_LOGIC);
END COMPONENT;

signal FA_S, FA_C : std_logic_vector(2 downto 0);

begin
    FA_0 : FA
        PORT MAP( A => Address_In(0),
                  C_in => '1',
                  S => FA_S(0),
                  C_out => FA_C(0));
    FA_1 : FA
        PORT MAP( A => Address_In(1),
                  C_in => FA_C(0),
                  S => FA_S(1),
                  C_out => FA_C(1));
    FA_2 : FA
        PORT MAP( A => Address_In(2),
                C_in => FA_C(1),
                S => FA_S(2),
                C_out => FA_C(2));
                
Address_Out <= FA_S;

end Behavioral;
