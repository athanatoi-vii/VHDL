-- iman latifi

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TrafficLight is
    Port
    (
        clk     : in  STD_LOGIC;
        reset   : in  STD_LOGIC;
        light   : out STD_LOGIC_VECTOR (1 downto 0)
    );

end TrafficLight;

architecture Behavioral of TrafficLight is
    type state_type is (S0, S1, S2);
    signal state, next_state : state_type;
    signal timer : integer range 0 to 119;

begin
    process(clk, reset)
    begin
        if reset = '1' then
            state <= S0;
            timer <= 0;
        elsif rising_edge(clk) then
            if timer = 119 then
                state <= next_state;
                timer <= 0;
            else
                timer <= timer + 1;
            end if;
        end if;
    end process;

    process(state)
    begin
        case state is
            when S0 =>
                light <= "00";
                next_state <= S1;
            when S1 =>
                light <= "01";
                next_state <= S2;
            when S2 =>
                light <= "10";
                next_state <= S0;
        end case;
    end process;

end Behavioral;
