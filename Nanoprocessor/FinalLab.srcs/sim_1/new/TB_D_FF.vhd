----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/03/2023 06:11:01 PM
-- Design Name: 
-- Module Name: TB_D_FF - Behavioral
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

entity TB_D_FF is
--  Port ( );
end TB_D_FF;

architecture Behavioral of TB_D_FF is
component D_FF
    Port ( D : in STD_LOGIC;
    Res : in STD_LOGIC;
    Clk : in STD_LOGIC;
    Q : out STD_LOGIC;
    Qbar : out STD_LOGIC);
end component;
signal D,Res,Q,Qbar : STD_LOGIC;
signal Clk : STD_LOGIC :='0';

begin
    UUT: D_FF
    PORT MAP(
    D=>D,
    Res=>Res,
    Clk=>Clk,
    Q=>Q,
    Qbar=>Qbar
    );
    process
    Begin
    Clk <=NOT(Clk);
    wait for 10ns;
    end process;
    
    process
    begin
    Res<='1';
    wait for 50 ns;
    Res<='0';
    D<='0';
    wait for 50 ns;
    D<='1';
    wait for 50 ns;
    end process;
end Behavioral;
