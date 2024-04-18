library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;

entity demux is
    Port (
        SW96 : in std_logic_vector(3 downto 0);
        SW50 : in std_logic_vector(2 downto 0);
        d5, d4, d3, d2, d1, d0 : out STD_LOGIC
    );
end demux;

architecture Behavioral of demux is
begin
    process(SW50, SW96)
    begin
        d0 <= '0';
        d1 <= '0';
        d2 <= '0';
        d3 <= '0';
        d4 <= '0';
        d5 <= '0';

        case SW50 is
            when "000" =>
                d0 <= SW96(3);
            when "001" =>
                d1 <= SW96(3);
            when "010" =>
                d2 <= SW96(3);
            when "011" =>
                d3 <= SW96(3);
            when "100" =>
                d4 <= SW96(3);
            when "101" =>
                d5 <= SW96(3);
            when others => null;
        end case;
    end process;
end Behavioral;