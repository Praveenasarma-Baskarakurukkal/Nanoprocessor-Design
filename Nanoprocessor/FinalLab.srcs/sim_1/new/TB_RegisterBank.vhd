----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/05/2023 02:08:30 AM
-- Design Name: 
-- Module Name: TB_RegisterBank - Behavioral
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

entity TB_RegisterBank is
--  Port ( );
end TB_RegisterBank;

architecture Behavioral of TB_RegisterBank is

component RegisterBank
    Port ( Register_enable : in STD_LOGIC_VECTOR (2 downto 0); --To select the register
       Clk : in STD_LOGIC;
       Reset : in STD_LOGIC;
       Data_Input : in STD_LOGIC_VECTOR (3 downto 0);
       Reg0_Out : out STD_LOGIC_VECTOR (3 downto 0);
       Reg1_Out : out STD_LOGIC_VECTOR (3 downto 0);
       Reg2_Out : out STD_LOGIC_VECTOR (3 downto 0);
       Reg3_Out : out STD_LOGIC_VECTOR (3 downto 0);
       Reg4_Out : out STD_LOGIC_VECTOR (3 downto 0);
       Reg5_Out : out STD_LOGIC_VECTOR (3 downto 0);
       Reg6_Out : out STD_LOGIC_VECTOR (3 downto 0);
       Reg7_Out : out STD_LOGIC_VECTOR (3 downto 0)
       );
end component;

Signal Register_enable : STD_LOGIC_VECTOR (2 downto 0);
Signal Clk :  STD_LOGIC:='0';
Signal Reset :  STD_LOGIC;
Signal Data_Input : STD_LOGIC_VECTOR (3 downto 0);
signal  Reg0_Out,Reg1_Out,Reg2_Out,Reg3_Out,Reg4_Out,Reg5_Out,Reg6_Out,Reg7_Out: STD_LOGIC_VECTOR(3 downto 0);

begin
UUT:RegisterBank
    port map(
    Clk => Clk,
    Register_enable => Register_enable,
    Reset => Reset,
    Data_Input => Data_Input,
    Reg0_Out=> Reg0_Out,
    Reg1_Out=> Reg1_Out,
    Reg2_Out=> Reg2_Out,
    Reg3_Out=> Reg3_Out,
    Reg4_Out=> Reg4_Out,
    Reg5_Out=> Reg5_Out,
    Reg6_Out=> Reg6_Out,
    Reg7_Out=> Reg7_Out
    );
  
process
  begin
      Wait for 40ns;
      Clk<=NOT(Clk);
end process;
      
process
    begin
-- Group Members Index numbers' binary form
-- 210025T      11 0011 0100 0110 1001
-- 210493A      11 0011 0110 0011 1101
-- unique 4bit numbers from index numbers=> 0011, 0100, 0110, 1001, 1101

        Register_enable<="001";
        Data_Input<="0011";
        wait for 100ns;
        
        Register_enable<="010";
        Data_Input<="0100";
        wait for 100ns;
        
        Register_enable<="011";
        Data_Input<="0110";
        wait for 100ns;
        
        Reset <='1';
        wait for 100ns;
        
        Reset <= '0';
        Register_enable<="010"; 
        Data_Input<="1001";
        wait for 100ns;
        
        Register_enable<="100";
        Data_Input<="1101";
        wait ;
end process;      

end Behavioral;