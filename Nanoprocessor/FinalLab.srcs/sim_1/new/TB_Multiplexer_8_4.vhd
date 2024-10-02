----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/04/2023 11:49:31 PM
-- Design Name: 
-- Module Name: TB_Multiplexer_8_4 - Behavioral
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

entity TB_Multiplexer_8_4 is
--  Port ( );
end TB_Multiplexer_8_4;

architecture Behavioral of TB_Multiplexer_8_4 is
component Multiplexer_8_4 is
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
end component;

SIGNAL Reg0_Out,Reg1_Out,Reg2_Out,Reg3_Out,Reg4_Out,Reg5_Out,Reg6_Out,Reg7_Out,Mux_Out :STD_LOGIC_VECTOR (3 downto 0);
signal Register_select : STD_LOGIC_VECTOR (2 downto 0);

begin
    UUT: Multiplexer_8_4
    PORT MAP( Reg0_Out =>Reg0_Out,
              Reg1_Out =>Reg1_Out,
              Reg2_Out =>Reg2_Out,
              Reg3_Out =>Reg3_Out,
              Reg4_Out =>Reg4_Out,
              Reg5_Out =>Reg5_Out,
              Reg6_Out =>Reg6_Out,
              Reg7_Out =>Reg7_Out,
              Register_select =>Register_select,
              Mux_Out => Mux_Out);
        
        
        process
        begin
        Reg0_Out<="0000";
        Reg1_Out<="0001";
        Reg2_Out<="0010";
        Reg3_Out<="0011";
        Reg4_Out<="0100";
        Reg5_Out<="0101";
        Reg6_Out<="0110";
        Reg7_Out<="0111";
        wait;
        end process;
        
        process
        begin
            -- Group Members Index numbers' binary form
            -- 210025T      110 011 010 001 101 001
            -- 210493A      110 011 011 000 111 101
            -- unique 3 bit numbers from index numbers=>110, 011, 010, 001, 000, 101, 111
            Register_select <= "110";
            wait for 40ns;
            
            Register_select <= "011";
            wait for 40ns;
            
            Register_select <= "010";
            wait for 40ns;
            
            Register_select <= "001";
            wait for 40ns;
            
            Register_select <= "000";
            wait for 40ns;
            
            Register_select <= "101";
            wait for 40ns;
            
            Register_select <= "111";
            wait for 40ns;
        end process;

end Behavioral;
