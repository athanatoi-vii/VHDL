-- iman latifi
library IEEE; use IEEE.STD_LOGIC_1164.all;

entity seven_seg is
    port
    (
        data     : in  STD_LOGIC_VECTOR(4 downto 0);
        segments : out STD_LOGIC_VECTOR(13 downto 0)
    );
end;

architecture synth of seven_seg is
begin
    process (all)
    begin
        case data is
            when "00000" => segments <= "00000001111110";
            when "00001" => segments <= "00000000110000";
            when "00010" => segments <= "00000001101101";
            when "00011" => segments <= "00000001111101";
            when "00100" => segments <= "00000001110001";
            when "00101" => segments <= "00000001111011";
            when "00110" => segments <= "00000001111011";
            when "00111" => segments <= "00000001100000";
            when "01000" => segments <= "00000001111111";
            when "01001" => segments <= "00000001110001";

            when "01010" => segments <= "01100001111110";
            when "01011" => segments <= "01100000110000";
            when "01100" => segments <= "01100001101101";
            when "01101" => segments <= "01100001111001";
            when "01110" => segments <= "01100000110011";
            when "01111" => segments <= "01100001011011";

            when "10000" => segments <= "01100001011111";
            when "10001" => segments <= "01100001110000";
            when "10010" => segments <= "01100001111111";
            when "10011" => segments <= "01100001110011";
            when "10100" => segments <= "11011011111110";
            when "10101" => segments <= "11011010110000";
            when "10110" => segments <= "11011011101101";
            when "10111" => segments <= "11011011111101";

            when others  => segments <= "00000000000000";
        end case;
    end process;
end;