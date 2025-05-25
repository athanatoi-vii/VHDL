-- iman latifi

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity mux2_1_16bit is
port
(
        d0: in STD_LOGIC_VECTOR(15 downto 0);
        d1: in STD_LOGIC_VECTOR(15 downto 0);
        s : in STD_LOGIC;
        y : out STD_LOGIC_VECTOR(15 downto 0)
);
end entity;

architecture struct of mux2_1_16bit is
        
component mux2_1_8bit
port
(
        d0: in STD_LOGIC_VECTOR(7 downto 0);
        d1: in STD_LOGIC_VECTOR(7 downto 0);
        s : in STD_LOGIC;
        y : out STD_LOGIC_VECTOR(7 downto 0)
);
end component;

begin
lsbmux: mux2_1_8bit port map (d0(7 downto 0), d1(7 downto 0), s, y(7 downto 0));
msbmux: mux2_1_8bit port map (d0(15 downto 8), d1(15 downto 8), s, y(15 downto 8));
end architecture;
