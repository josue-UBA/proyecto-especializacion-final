----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.07.2021 16:08:36
-- Design Name: 
-- Module Name: PUSH_BUTTON_LED - Behavioral
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

entity PUSH_BUTTON_LED is generic
    (num_but: integer := 4);
    port(
        ledout: out std_logic_vector(num_but -1 downto 0);
        button: in std_logic_vector(num_but -1 downto 0);
        enable: in std_logic);
    end PUSH_BUTTON_LED;
    
architecture Behavioral of PUSH_BUTTON_LED is begin
    ledout <= button when enable = '0' else(others=>'0');
    end Behavioral;