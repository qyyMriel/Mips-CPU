-- Copyright 2012 Vikram Padman
-- ******************** WARNING WARNING WARNING *******************************
-- This design is in development, prototype or production release is prohibited.
-- ****************************************************************************

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
USE ieee.std_logic_arith.ALL;

ENTITY mux5b_2to1 is
     PORT(
     sel_input : in std_logic; --Input "S"
     out_bus : out std_logic_vector(4 downto 0); --Output "Y"
     in_bus_0 : in std_logic_vector(4 downto 0); --Input "0"
     in_bus_1 : in std_logic_vector(4 downto 0)  --Input "1"	
     );
END mux5b_2to1;

ARCHITECTURE rtl OF mux5b_2to1 IS
BEGIN

out_bus <= in_bus_0 when (sel_input = '0') else
           in_bus_1 when (sel_input = '1') else (others => '0');

END RTL;
