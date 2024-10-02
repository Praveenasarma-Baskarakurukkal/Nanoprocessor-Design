----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/04/2023 10:40:27 AM
-- Design Name: 
-- Module Name: TB_Decoder_3_8 - Behavioral
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

entity TB_Decoder_3_8 is
--  Port ( );
end TB_Decoder_3_8;

architecture Behavioral of TB_Decoder_3_8 is
component Decoder_3_8
    PORT( I : in STD_LOGIC_VECTOR (2 downto 0);
          EN : in STD_LOGIC;
          Y : out STD_LOGIC_VECTOR (7 downto 0));
end component;
SIGNAL I : STD_LOGIC_VECTOR (2 downto 0);
SIGNAL EN : STD_LOGIC;
SIGNAL Y : STD_LOGIC_VECTOR (7 downto 0);
begin
    UUT: Decoder_3_8
        PORT MAP(
        I=>I,
        EN=>EN,
        Y=>Y
        );

    process
    begin
        EN <= '1';
        I <= "001";
        wait for 20ns;
        I <= "101";
        wait for 20ns;
        I <= "010";
        wait for 20ns;
        I <= "011";
        wait for 20ns;
        I <= "110";
        wait for 20ns;
        EN <= '0';
        I <= "001";
        wait for 20ns;
        I <= "101";
        wait for 20ns;
        I <= "010";
        wait for 20ns;
        I <= "011";
        wait for 20ns;
        I <= "110";
        wait;
    end process;


end Behavioral;
