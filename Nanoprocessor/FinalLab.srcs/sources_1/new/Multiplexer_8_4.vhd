----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/04/2023 08:48:00 AM
-- Design Name: 
-- Module Name: Multiplexer_8_4 - Behavioral
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

entity Multiplexer_8_4 is
    Port ( Reg0_Out : in STD_LOGIC_VECTOR (3 downto 0);
           Reg1_Out : in STD_LOGIC_VECTOR (3 downto 0);
           Reg2_Out : in STD_LOGIC_VECTOR (3 downto 0);
           Reg3_Out : in STD_LOGIC_VECTOR (3 downto 0);
           Reg4_Out : in STD_LOGIC_VECTOR (3 downto 0);
           Reg5_Out : in STD_LOGIC_VECTOR (3 downto 0);
           Reg6_Out : in STD_LOGIC_VECTOR (3 downto 0);
           Reg7_Out : in STD_LOGIC_VECTOR (3 downto 0);
           Register_select : in STD_LOGIC_VECTOR (2 downto 0);
           Mux_Out : out STD_LOGIC_VECTOR (3 downto 0));
end Multiplexer_8_4;

architecture Behavioral of Multiplexer_8_4 is
    
    component Mux_8_to_1
    Port ( S : in std_logic_vector(2 downto 0);
           D : in std_logic_vector(7 downto 0);
           Y : out std_logic
          );
end component;

begin
Mux_8_to_1_0: Mux_8_to_1
    port map(
        D(0) => Reg0_Out(0),
        D(1) => Reg1_Out(0),
        D(2) => Reg2_Out(0),
        D(3) => Reg3_Out(0),
        D(4) => Reg4_Out(0),
        D(5) => Reg5_Out(0),
        D(6) => Reg6_Out(0),
        D(7) => Reg7_Out(0),
        S => Register_select,
        Y => Mux_Out(0)
    );

Mux_8_to_1_1: Mux_8_to_1
    port map(
        D(0) => Reg0_Out(1),
        D(1) => Reg1_Out(1),
        D(2) => Reg2_Out(1),
        D(3) => Reg3_Out(1),
        D(4) => Reg4_Out(1),
        D(5) => Reg5_Out(1),
        D(6) => Reg6_Out(1),
        D(7) => Reg7_Out(1),
        S => Register_select,
        Y => Mux_Out(1)
    );
    
Mux_8_to_1_2: Mux_8_to_1
    port map(
        D(0) => Reg0_Out(2),
        D(1) => Reg1_Out(2),
        D(2) => Reg2_Out(2),
        D(3) => Reg3_Out(2),
        D(4) => Reg4_Out(2),
        D(5) => Reg5_Out(2),
        D(6) => Reg6_Out(2),
        D(7) => Reg7_Out(2),
        S => Register_select,
        Y => Mux_Out(2)
    );

Mux_8_to_1_3: Mux_8_to_1
    port map(
        D(0) => Reg0_Out(3),
        D(1) => Reg1_Out(3),
        D(2) => Reg2_Out(3),
        D(3) => Reg3_Out(3),
        D(4) => Reg4_Out(3),
        D(5) => Reg5_Out(3),
        D(6) => Reg6_Out(3),
        D(7) => Reg7_Out(3),
        S => Register_select,
        Y => Mux_Out(3)
    );
end Behavioral;

