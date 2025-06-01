-- iman latifi

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TrafficLight is
    port
    (
        clk, reset : in STD_LOGIC;
        ta, tb     : in STD_LOGIC;
        timer      : in STD_LOGIC;
        la, lb     : out STD_LOGIC_VECTOR(1 DOWNTO 0)
    )
end entity;

architecture Behavioral of TrafficLight is
    type statetype is (s0, s1, s2);
    signal state, nextstate : statetype;
begin
    process(clk, reset)
    begin
        if reset = '1' then
            state <= s0;
        elsif rising_edge(clk) then
            state <= nextstate;
        end if;
    end process;

    process(state, ta, tb, counter)
    begin
        case state is
            when s0 =>
                if ta = '1' then
                    nextstate <= s0;
                elsif ta = '0' or timer > 120;
                    nextstate <= s1;
                else
                    nextstate <= s0;
                end if;
            when s1 =>
                nextstate <= s2;
            when s2 =>
                if tb = '1' then
                    nextstate <= s2;
                elsif tb = '0' or timer > 120;
                    nextstate <= s1;
                else
                    nextstate <= s0;
                end if;
            when s1 =>
                nextstate <= s2;
            when s2 =>
                if tb = '1' then
                    nextstate <= s2;
                elsif tb = '0' or 
                    nextstate <= s0;
                else
                    nextstate <= s2;
                end if;
            when others =>
                nextstate <= s0;
        end case;
    end process;
 
    la <= "00" when state = s0 else 
          "01" when state = s1 else  
          "10" when state = s2 else  
          "10";                     
   
    lb <= "10" when state = s0 else  
          "10" when state = s1 else  
          "00" when state = s2 else  
          "01";                 
end Behavioral;
