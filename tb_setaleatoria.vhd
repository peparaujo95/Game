--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:16:21 12/18/2016
-- Design Name:   
-- Module Name:   C:/Users/Alberto/Documents/ISE_projects/PROYECT_SERPIENTE/tb_setaleatoria.vhd
-- Project Name:  PROYECT_SERPIENTE
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: setaleatoria
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_setaleatoria IS
END tb_setaleatoria;
 
ARCHITECTURE behavior OF tb_setaleatoria IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT setaleatoria
    PORT(
         enable : IN  std_logic;
         rst : IN  std_logic;
         clk : IN  std_logic;
         addrb : OUT  std_logic_vector(9 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal enable : std_logic := '0';
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal addrb : std_logic_vector(9 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: setaleatoria PORT MAP (
          enable => enable,
          rst => rst,
          clk => clk,
          addrb => addrb
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
     rst<='1';	
      wait for clk_period*10;
		rst<='0';
      -- insert stimulus here 
		 wait for clk_period*10;
		 enable<='1';
		  wait for clk_period*400;
		  enable<='0';
      wait;
   end process;

END;
