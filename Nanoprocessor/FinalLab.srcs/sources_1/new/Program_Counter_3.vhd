----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/03/2023 08:15:34 PM
-- Design Name: 
-- Module Name: Program_Counter_3 - Behavioral
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

entity Program_Counter_3 is
    Port ( Address : in STD_LOGIC_VECTOR (2 downto 0);  
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           MemorySelect : out STD_LOGIC_VECTOR (2 downto 0));
end Program_Counter_3;

architecture Behavioral of Program_Counter_3 is

component D_FF
    port (
    D : in STD_LOGIC;
    Res: in STD_LOGIC;
    Clk : in STD_LOGIC;
    Enable: in std_logic:='1';
    Q : out STD_LOGIC;
    Qbar : out STD_LOGIC);
end component;


begin  
    D_FF0 : D_FF
        port map (
            D => Address(0),
            Res => Res,
            Clk => Clk,
            Q => MemorySelect(0)
            );
                                 
    D_FF1 : D_FF
        port map (
            D => Address(1),
            Res => Res,
            Clk => Clk,
            Q => MemorySelect(1)
            );
            
    D_FF2 : D_FF
         port map (
            D => Address(2),
            Res => Res,
            Clk => Clk,
            Q => MemorySelect(2)
            );

end Behavioral;
