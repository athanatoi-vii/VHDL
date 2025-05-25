-- iman latifi

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux8tol is
Port
(
    I0, I1, I2, I3, I4, I5, I6, I7 : in STD_LOGIC_VECTOR (15 downto 0);
    S : in STD_LOGIC_VECTOR (15 downto 0);
    Y : out STD_LOGIC_VECTOR (15 downto 0)
);
end mux8tol;

architecture synth of mux8tol is
begin
    Y <= I0 when S = "000" else
         I1 when s = "001" else
         I2 when s = "010" else
         I3 when s = "011" else
         I4 when s = "100" else
         I5 when s = "101" else
         I6 when s = "110" else
         I7; 
end;
