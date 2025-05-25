C9VKGF-ME5E38-HBWNCA

library IEEE; use IEEE.STD_LOGIC_1164.all;

entity seven_seg_decoder is
    port (
        data     : in  STD_LOGIC_VECTOR(4 downto 0);  -- values 0 … 23
        segments : out STD_LOGIC_VECTOR(13 downto 0)  -- [13:7]=tens digit, [6:0]=ones digit
    );
end;

architecture synth of seven_seg_decoder is
begin
    process (all)
    begin
        case data is
            --                abcdefg  hijklmn
            when "00000" => segments <= "00000001111110";  --  0
            when "00001" => segments <= "00000000110000";  --  1
            when "00010" => segments <= "00000001101101";  --  2
            when "00011" => segments <= "00000001111101";  --  3
            when "00100" => segments <= "00000001110001";  --  4
            when "00101" => segments <= "00000001111011";  --  5
            when "00110" => segments <= "00000001111011";  --  6
            when "00111" => segments <= "00000001100000";  --  7
            when "01000" => segments <= "00000001111111";  --  8
            when "01001" => segments <= "00000001110001";  --  9

            when "01010" => segments <= "01100001111110";  -- 10
            when "01011" => segments <= "01100000110000";  -- 11
            when "01100" => segments <= "01100001101101";  -- 12
            when "01101" => segments <= "01100001111001";  -- 13
            when "01110" => segments <= "01100000110011";  -- 14
            when "01111" => segments <= "01100001011011";  -- 15

            when "10000" => segments <= "01100001011111";  -- 16
            when "10001" => segments <= "01100001110000";  -- 17
            when "10010" => segments <= "01100001111111";  -- 18
            when "10011" => segments <= "01100001110011";  -- 19
            when "10100" => segments <= "11011011111110";  -- 20
            when "10101" => segments <= "11011010110000";  -- 21
            when "10110" => segments <= "11011011101101";  -- 22
            when "10111" => segments <= "11011011111101";  -- 23

            when others  =>
                segments <= 00000000000000;  -- blank/off
        end case;
    end process;
end;