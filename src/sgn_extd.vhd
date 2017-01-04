-- Copyright 2012 Vikram Padman
-- ******************** WARNING WARNING WARNING *******************************
-- This design is in development, prototype or production release is prohibited.
-- ****************************************************************************

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
USE ieee.std_logic_arith.ALL;

ENTITY sgn_extd is
     PORT(
     int_in : in std_logic_vector(15 downto 0);
     int_out : out std_logic_vector(31 downto 0)
     );
END sgn_extd;

ARCHITECTURE rtl OF sgn_extd IS
BEGIN
        int_out <= int_in(15) & --bit 31 
                   int_in(15) & --bit 30
                   int_in(15) & --bit 29
                   int_in(15) & --bit 28
                   int_in(15) & --bit 27
                   int_in(15) & --bit 26
                   int_in(15) & --bit 25
                   int_in(15) & --bit 24
                   int_in(15) & --bit 23
                   int_in(15) & --bit 22
                   int_in(15) & --bit 21
                   int_in(15) & --bit 20
                   int_in(15) & --bit 19
                   int_in(15) & --bit 18
                   int_in(15) & --bit 17
                   int_in(15) & --bit 16
                   int_in; -- bits 15 .. 0

END RTL;
