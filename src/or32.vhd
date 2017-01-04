-- Copyright 2012 Vikram Padman
-- ******************** WARNING WARNING WARNING *******************************
-- This design is in development, prototype or production release is prohibited.
-- ****************************************************************************

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
USE ieee.std_logic_arith.ALL;

ENTITY or32 is
     PORT(
     y : out std_logic_vector(31 downto 0);
     a : in std_logic_vector(31 downto 0);
     b : in std_logic_vector(31 downto 0)
 );
END or32;

ARCHITECTURE rtl OF or32 IS
BEGIN

y <= a OR b;

END RTL;
