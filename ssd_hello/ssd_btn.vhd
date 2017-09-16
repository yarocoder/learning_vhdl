LIBRARY ieee;
USE ieee.std_logic_1164.all;
-------------------------------------------------------------------------------
ENTITY ssd_btn IS
    PORT(btn: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
         ssd: OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
END ENTITY ssd_btn;
-------------------------------------------------------------------------------
ARCHITECTURE show_all OF ssd_btn IS
    SHARED VARIABLE value: INTEGER RANGE 0 TO 9 := 0;
    SIGNAL val: INTEGER RANGE 0 TO 9 := 0;
BEGIN
    button_process: PROCESS (btn)
    BEGIN
        IF (btn="10") THEN
            IF (value=9) THEN
                value := 0;
            ELSE
                value := value + 1;
            END IF;
        END IF;
    END PROCESS button_process;
    val <= value;
    ---------------------------
    WITH val SELECT
        ssd <= "0000Z00" WHEN 0,
               "0ZZZZ0Z" WHEN 1,
               "00Z00Z0" WHEN 2,
               "Z0000Z0" WHEN 3,
               "ZZ0000Z" WHEN 4,
               "Z00Z000" WHEN 5,
               "000Z000" WHEN 6,
               "ZZ00ZZ0" WHEN 7,
               "0000000" WHEN 8,
               "ZZ00000" WHEN 9,
               "Z0ZZ0Z0" WHEN OTHERS;
END ARCHITECTURE show_all;
