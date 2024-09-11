library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CentisecondCounter is
    Port ( clk       : in  STD_LOGIC;
           reset     : in  STD_LOGIC;
           pulse_out : out STD_LOGIC);
end CentisecondCounter;

architecture Behavioral of CentisecondCounter is
    signal counter : INTEGER := 0;
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                counter <= 0;
                pulse_out <= '0';
            end if;
            if counter = 99 then
                counter <= 0;
                pulse_out <= '1'; -- Ativa o pulse_out
            else
                counter <= counter + 1;
                pulse_out <= '0'; -- Garante que pulse_out só esteja 1 no momento desejado
            end if;
        end if;
    end process;

end Behavioral;
