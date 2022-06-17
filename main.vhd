----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:12:37 07/17/2021 
-- Design Name: 
-- Module Name:    main - Behavioral 
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

entity main is
generic (
    pwm_bits : integer := 8;
    clk_count_length : positive := 1);
port(
	 clk : in std_logic;
    rst : in std_logic;
    pwm_out : out std_logic);
end main;

architecture Behavioral of main is
type arr is array(99 to 0) of std_logic_vector(7 downto 0);
signal pwm_count : unsigned(pwm_bits - 1 downto 0) := (others => '0');
signal duty_cycle : unsigned(pwm_bits - 1 downto 0) := (others => '0');
signal clk_count : integer range 0 to clk_count_length  - 1;
signal sinewave : arr;
signal clkdiv : std_logic_vector(15 downto 0) := ( others => '0');

begin

sinewave <= (("01111111"),
("10000111"),
("10001111"),
("10010111"),
("10011111"),
("10100111"),
("10101110"),
("10110110"),
("10111101"),
("11000100"),
("11001010"),
("11010001"),
("11010111"),
("11011100"),
("11100010"),
("11100110"),
("11101011"),
("11101111"),
("11110011"),
("11110110"),
("11111000"),
("11111010"),
("11111100"),
("11111101"),
("11111110"),
("11111110"),
("11111110"),
("11111101"),
("11111011"),
("11111001"),
("11110111"),
("11110100"),
("11110001"),
("11101101"),
("11101001"),
("11100100"),
("11011111"),
("11011001"),
("11010100"),
("11001101"),
("11000111"),
("11000000"),
("10111001"),
("10110010"),
("10101010"),
("10100011"),
("10011011"),
("10010011"),
("10001011"),
("10000011"),
("01111011"),
("01110011"),
("01101011"),
("01100011"),
("01011011"),
("01010011"),
("01001100"),
("01000101"),
("00111110"),
("00110111"),
("00110000"),
("00101010"),
("00100100"),
("00011111"),
("00011010"),
("00010101"),
("00010001"),
("00001101"),
("00001010"),
("00000111"),
("00000101"),
("00000011"),
("00000001"),
("00000000"),
("00000000"),
("00000000"),
("00000001"),
("00000010"),
("00000100"),
("00000110"),
("00001000"),
("00001100"),
("00001111"),
("00010011"),
("00011000"),
("00011101"),
("00100010"),
("00101000"),
("00101110"),
("00110100"),
("00111011"),
("01000010"),
("01001001"),
("01010000"),
("01011000"),
("01011111"),
("01100111"),
("01101111"),
("01110111"),
("01111111"));

count: process(clk)
begin
  if rising_edge(clk) then
    if rst = '1' then
      clk_count <= 0;
       
    else
      if clk_count < clk_count_length - 1 then
        clk_count <= clk_count + 1;
      else
        clk_count <= 0;
      end if;
       
    end if;
  end if;
end process;
pwm : process(clk)
begin
  if rising_edge(clk) then
    if rst = '1' then
      pwm_count <= (others => '0');
      pwm_out <= '0';
 
    else
      if clk_count_length = 1 or clk_count = 0 then
 
        pwm_count <= pwm_count + 1;
        pwm_out <= '0';
 
        if pwm_count = unsigned(to_signed(-2, pwm_count'length)) then
          pwm_count <= (others => '0');
        end if;
 
        if pwm_count < duty_cycle then
          pwm_out <= '1';
        end if;
 
      end if;
    end if;
  end if;
end process;

divider : process(clk)
begin 
if rising_edge(clk) then
clkdiv <= std_logic_vector( unsigned(clkdiv) + 1 );
end if;
end process;

waveform : process(clkdiv(15))
variable index : integer := 0;
begin
if rising_edge(clkdiv(15)) then
duty_cycle <=  unsigned(sinewave(index));
end if;
if falling_edge(clkdiv(15)) then
index := index + 1 ;
end if;
if index >=100 then 
index :=0;
end if;
end process;

end Behavioral;

