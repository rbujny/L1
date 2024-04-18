library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sw2display is
    Port ( 
        sw : in std_logic_vector(9 downto 0);
        hex5, hex4, hex3, hex2, hex1, hex0 : out std_logic_vector(6 downto 0)
    );
end sw2display;

architecture Behavioral of sw2display is
    signal encoder_output : std_logic_vector(3 downto 0);
    signal demux_output : std_logic_vector(5 downto 0);
    signal bcd_input : std_logic_vector(3 downto 0);

begin
    
	encoder_inst : entity work.encoder
        port map (
            s => sw(5 downto 0),
            y => encoder_output
        );
	
	demux_inst : entity work.demux
        port map (
            SW96 => sw(9 downto 6),
            SW50 => encoder_output,
            d5 => demux_output(4),
            d4 => demux_output(4),
            d3 => demux_output(4),
            d2 => demux_output(4),
            d1 => demux_output(4),
            d0 => demux_output(4)
        );

    hex5_inst : entity work.dec7seg
        port map (
            bcd => demux_output(4),
            seg => hex(6)
        );

    hex4_inst : entity work.dec7seg
        port map (
            bcd => demux_output(4),
            seg => hex(6)
        );

    hex3_inst : entity work.dec7seg
        port map (
            bcd => demux_output(4),
            seg => hex(6)
        );

    hex2_inst : entity work.dec7seg
        port map (
            bcd => demux_output(4),
            seg => hex(6)
        );

    hex1_inst : entity work.dec7seg
        port map (
            bcd => demux_output(4),
            seg => hex(6)
        );

    hex0_inst : entity work.dec7seg
        port map (
            bcd => demux_output(4),
            seg => hex(6)
        );

end Behavioral;