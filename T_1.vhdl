-- iman latifi

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity T1 is
Port
(
    a : in STD_LOGIC_VECTOR (15 downto 0);
    y1, y2, y3, y4 : out std_logic
);
end T1;

architecture synth of T1 is
begin
    y1 <= a(15) and a(14);
    y2 <= a(5) or a(6) or a(7);
    y3 <= a(0) xor a(1);
    y4 <= not a(10);
end;
