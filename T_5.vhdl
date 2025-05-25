-- iman latifi

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity register_32 is
Port
(
    CLK : in  STD_LOGIC;
    RESET : in  STD_LOGIC;
    A : in  STD_LOGIC_VECTOR(31 downto 0);
    Z : out STD_LOGIC_VECTOR(31 downto 0)
);
end register_32;

architecture synth of register_32 is
begin
    process(CLK, RESET)
    begin
        if RESET = '0' then
            Z <= (others => '0');
        elsif rising_edge(CLK) then
            Z <= A;
        end if;
    end process;
end;
                                                                                                            