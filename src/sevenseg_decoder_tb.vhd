----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/12/2026 10:30:05 AM
-- Design Name: 
-- Module Name: sevenseg_decoder_tb - Behavioral
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

entity sevenseg_decoder_tb is
end sevenseg_decoder_tb;

architecture test_bench of sevenseg_decoder_tb is

    --unit under test
    component sevenseg_decoder
    port ( i_Hex : in STD_LOGIC_VECTOR (3 downto 0);
           o_seg_n : out STD_LOGIC_VECTOR (6 downto 0)
    );
    end component;
    
    signal w_Hex : std_logic_vector (3 downto 0) := "0000";
    signal w_seg_n : std_logic_vector (6 downto 0) := "0000000";

begin
   --instantiate UUT
   uut: sevenseg_decoder port map (
          i_Hex(0) => w_Hex(0),
          i_Hex(1) => w_Hex(1),
          i_Hex(2) => w_Hex(2),
          i_Hex(3) => w_Hex(3),
          o_seg_n(0) => w_seg_n(0),
          o_seg_n(1) => w_seg_n(1),
          o_seg_n(2) => w_seg_n(2),
          o_seg_n(3) => w_seg_n(3),
          o_seg_n(4) => w_seg_n(4),
          o_seg_n(5) => w_seg_n(5),
          o_seg_n(6) => w_seg_n(6)
        );
   
   --testing
   sim_proc: process
   begin
        
        wait for 10 ns;
        assert w_seg_n = "1111110" report "should be 1111110" severity failure;

        w_Hex <= "0100"; wait for 10 ns;
            assert w_seg_n = "0110011" report "should be 0110011" severity failure;
            
        w_Hex <= "0101"; wait for 10 ns;
            assert w_seg_n = "1011011" report "should be 1011011" severity failure;
            
        w_Hex <= "1001"; wait for 10 ns;
            assert w_seg_n = "1110011" report "should be 1110011" severity failure;
            
        w_Hex <= "1111"; wait for 10 ns;
            assert w_seg_n = "1000111" report "should be 1000111" severity failure;
        
        wait; 
            
   end process;

end test_bench;
