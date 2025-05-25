-- iman latifi

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sh_register_4_R is
Port
(
    CLK : in  STD_LOGIC;
    RESET  : in  STD_LOGIC;
    SER_IN : in  STD_LOGIC;
    Q : out STD_LOGIC_VECTOR(3 downto 0)
);
end sh_register_4_R;

architecture synth of sh_register_4_R is
signal shift_reg : STD_LOGIC_VECTOR(3 downto 0);
begin
    process(CLK, RESET)
    begin
        if RESET = '1' then
            shift_reg (0) <= '0';
            shift_reg (1) <= '0';
            shift_reg (2) <= '0';
            shift_reg (3) <= '0';
            Q <=  shift_reg;
        elsif rising_edge(CLK) then
            shift_reg (3) <= shift_reg (2);
            shift_reg (2) <= shift_reg (1);
            shift_reg (1) <= shift_reg (0);
            shift_reg (0) <= SER_IN;
            Q <=  shift_reg;
        end if;
    end process;
    Q <= shift_reg;
end synth;
