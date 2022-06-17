----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:27:12 07/15/2021 
-- Design Name: 
-- Module Name:    waveform - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;



entity waveform is
    port ( 
	 triangle : out  STD_LOGIC;
    square : out  STD_LOGIC;
    sine : out  STD_LOGIC;
    clk : in  STD_LOGIC;
    switch : in  STD_LOGIC);
end waveform;

architecture Behavioral of waveform is
type wave is array(0 to 99) of std_logic_vector(15 downto 0);
signal sin : wave;
signal tri : wave;
signal sqr : wave;

signal clkdiv : std_logic_vector(15 downto 0) := ( others => '0');
signal index : std_logic_vector(6 downto 0) := (others => '0');

begin

--???????? ???????
cdiv : process(clk)
begin
if rising_edge(clk) then
clkdiv <= std_logic_vector(unsigned(clkdiv) + 1);
end if;
end process;


pwm1 : process(clk)
begin

end process;

pwm2 : process(clk)
begin

end process;

pwm3 : process(clk)
begin

end process;


end Behavioral;

