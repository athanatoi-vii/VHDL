-- iman latifi

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_PM_011 is
end TB_PM_011;

architecture Behavioral of TB_PM_011 is

    component PM_011 port (clk : in STD_LOGIC; reset : in STD_LOGIC; I : in STD_LOGIC; O : out STD_LOGIC); end component;

    signal clk   : STD_LOGIC := '0';
    signal reset : STD_LOGIC := '1';
    signal I     : STD_LOGIC := '0';
    signal O     : STD_LOGIC;

begin

    PM: entity work.PM_011 port map
    (
        clk => clk,
        reset => reset,
        I => I,
        O => O
    );

    clk_process : process
    begin
        while true loop
            clk <= '0';
            wait for 5 ns;
            clk <= '1';
            wait for 5 ns;
        end loop;
    end process;

    TB_process : process
    begin
        reset <= '1';
        wait for 10 ns;
        reset <= '0';

        I <= '0'; wait for 10 ns;
        I <= '1'; wait for 10 ns;
        I <= '1'; wait for 10 ns;
        assert O = '1' report "Error: expected O = '1' at state S3" severity error;

        I <= '0'; wait for 10 ns;
        assert O = '0' report "Error: expected O = '0' at state S1" severity error;

        I <= '1'; wait for 10 ns;
        I <= '1'; wait for 10 ns;
        assert O = '1' report "Error: expected O = '1' at state S3" severity error;

        wait for 20 ns;
    end process;

end Behavioral;
