library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench_moore011 is
end entity testbench_moore011;

architecture sim of testbench_moore011 is
    component patternMoore_011
        port(
            clk   : in  STD_LOGIC;
            reset : in  STD_LOGIC;
            a     : in  STD_LOGIC;
            y     : out STD_LOGIC
        );
    end component;

    signal clk   : STD_LOGIC := '0';
    signal reset : STD_LOGIC := '1';
    signal a     : STD_LOGIC := '0';
    signal y     : STD_LOGIC;

    constant clk_period : time := 10 ns;

begin

    dut: patternMoore_011 port map(clk => clk, reset => reset, a => a, y => y);

    clk_process: process
    begin
        while true loop
            clk <= '0';
            wait for clk_period / 2;
            clk <= '1';
            wait for clk_period / 2;
        end loop;
    end process;

    stim_proc: process
    begin
        reset <= '1';
        wait for clk_period;
        reset <= '0';

        a <= '0'; wait for clk_period;
        assert y = '0' report "Error at step 1: y should be 0" severity error;

        a <= '1'; wait for clk_period;
        assert y = '0' report "Error at step 2: y should be 0" severity error;

        a <= '1'; wait for clk_period;
        assert y = '1' report "Error at step 3: y should be 1 (pattern 011 detected)" severity error;

        a <= '0'; wait for clk_period;
        assert y = '0' report "Error at step 4: y should be 0" severity error;

        a <= '1'; wait for clk_period;
        assert y = '0' report "Error at step 5: y should be 0" severity error;

        a <= '1'; wait for clk_period;
        assert y = '1' report "Error at step 6: y should be 1 (pattern 011 detected again)" severity error;

        wait;
    end process;

end architecture sim;