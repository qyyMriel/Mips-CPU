-- Copyright 2012 Vikram Padman
-- ******************** WARNING WARNING WARNING *******************************
-- This design is in development, prototype or production release is prohibited.
-- ****************************************************************************

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
USE ieee.std_logic_arith.ALL;

ENTITY gnd_c is
     GENERIC(
        BUS_WIDTH : positive := 1
		  );
     PORT(
     y : out std_logic_vector(BUS_WIDTH-1 downto 0)
 );
END gnd_c;

ARCHITECTURE rtl OF gnd_c IS
BEGIN

y <= (others => '0');

END RTL;
