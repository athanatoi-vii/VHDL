-- iman latifi

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity example is
Port
(
    a, b, c : in std_logic;
    Y : out std_logic
);
end;

architecture synth of example is
signal ab, bb, cb, n1, n2, n3 : std_logic;
begin
    ab <= not a after 1 ns;
    bb <= not b after 1 ns;
    cb <= not c after 1 ns;
    n1 <= ab and bb and cb after 2 ns;
    n2 <= a and bb and cb after 2 ns;
    n3 <= a and bb and c after 2 ns;
    Y  <= n1 or n2 or n3 after 4 ns;
end;
