-- iman latifi
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity pattern_001 is
    Port (
        clk     : in  STD_LOGIC;
        reset   : in  STD_LOGIC;
        I       : in  STD_LOGIC;
        O       : out STD_LOGIC
    );
end pattern_001;
architecture Behavioral of pattern_001 is
    type state_type is (S0, S1, S2, S3);
    signal state, next_state : state_type;
begin
    process(clk, reset)
    begin
        if reset = '1' then
            state <= S0;
        elsif rising_edge(clk) then
            state <= next_state;
        end if;
    end process;
    process(state, I)
    begin
        case state is
            when S0 =>
                if I = '0' then
                    next_state <= S1;
                else
                    next_state <= S0;
                end if;
                O <= '0';
            when S1 =>
                if I = '1' then
                    next_state <= S1;
                else
                    next_state <= S2;
                end if;
                O <= '0';
            when S2 =>
                if I = '1' then
                    next_state <= S0;
                else
                    next_state <= S3;
                end if;
                O <= '0';
            when S3 =>
                next_state <= S0;
                O <= '1';
        end case;
    end process;
end Behavioral;
