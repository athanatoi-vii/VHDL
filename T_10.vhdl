-- iman latifi
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_pattern_001 is
end tb_pattern_001;

architecture test of tb_pattern_001 is
    signal clk   : STD_LOGIC := '0';
    signal reset : STD_LOGIC := '0';
    signal I     : STD_LOGIC := '0';
    signal O     : STD_LOGIC;

    component pattern_001
        Port(clk: in STD_LOGIC; reset: in STD_LOGIC; I: in STD_LOGIC; O: out STD_LOGIC);
    end component;
    
begin
    M: pattern_001
        port map(clk => clk, reset => reset, I => I, O => O);

    clk_process: process
    begin
        while true loop
            clk <= '0'; wait for 10 ns;
            clk <= '1'; wait for 10 ns;
        end loop;
    end process;

    P: process
    begin
        reset <= '1'; wait for 20 ns;
        reset <= '0';

        I <= '0'; wait for 20 ns;
        I <= '1'; wait for 20 ns;
        I <= '1'; wait for 20 ns;
        I <= '0'; wait for 20 ns;

        I <= '1'; wait for 20 ns;
        I <= '0'; wait for 20 ns;
        I <= '1'; wait for 20 ns;
        I <= '1'; wait for 20 ns;

        wait for 20 ns;
    end process;
end test;
