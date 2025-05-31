-- iman latifi

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PM_011 is
    port
    (
        clk   : in  STD_LOGIC;
        reset : in  STD_LOGIC;
        I     : in  STD_LOGIC;
        O     : out STD_LOGIC
    );
end PM_011;

architecture Behavioral of PM_011 is
    type statetype is (S0, S1, S2, S3);
    signal state, nextstate: statetype;
begin   
    process(clk, reset)
    begin
        if reset = '1' then
            state <= S0;
        elsif rising_edge(clk) then
            state <= nextstate;
        end if;
    end process;
  
    process(state, I)
    begin
        case state is
            when S0 =>
                if I = '0' then
                    nextstate <= S1;
                else
                    nextstate <= S0;
                end if;
            when S1 =>
                if I = '1' then
                    nextstate <= S2;
                else
                    nextstate <= S1;
                end if;
            when S2 =>
                if I = '1' then
                    nextstate <= S3;
                else
                    nextstate <= S1;
                end if;
            when S3 =>
                if I = '0' then
                    nextstate <= S1;
                else
                    nextstate <= S0;
                end if;
            when others =>
                nextstate <= S0;
        end case;
    end process;
    
    O <= '1' when state = S3 else '0';
    
end Behavioral;
