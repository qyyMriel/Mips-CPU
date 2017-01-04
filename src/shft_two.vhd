-- Copyright 2012 Vikram Padman
-- ******************** WARNING WARNING WARNING *******************************
-- This design is in development, prototype or production release is prohibited.
-- ****************************************************************************

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
USE ieee.std_logic_arith.ALL;

ENTITY shft_two is
     PORT(
     int_in : in std_logic_vector(31 downto 0);
     int_out : out std_logic_vector(31 downto 0)
     );
END shft_two;

ARCHITECTURE rtl OF shft_two IS
BEGIN
        int_out <= int_in(29 downto 0) & b"00"; -- Shift by 2 = int_in * 4;
END RTL;
