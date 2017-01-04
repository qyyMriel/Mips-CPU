-- Copyright 2012 Vikram Padman
-- ******************** WARNING WARNING WARNING *******************************
-- This design is in development, prototype or production release is prohibited.
-- ****************************************************************************

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
USE ieee.std_logic_arith.ALL;

ENTITY mux_4to1 is
     GENERIC(
          BUS_WIDTH : positive := 1
         ); 
     PORT(
     sel_input : in std_logic_vector(1 downto 0);
     out_bus : out std_logic_vector(BUS_WIDTH-1 downto 0);
     in_bus_0 : in std_logic_vector(BUS_WIDTH-1 downto 0);
     in_bus_1 : in std_logic_vector(BUS_WIDTH-1 downto 0);
     in_bus_2 : in std_logic_vector(BUS_WIDTH-1 downto 0);
     in_bus_3 : in std_logic_vector(BUS_WIDTH-1 downto 0)
     );
END mux_4to1;

ARCHITECTURE rtl OF mux_4to1 IS
BEGIN

out_bus <= in_bus_0 when (sel_input = b"00") else
           in_bus_1 when (sel_input = b"01") else
           in_bus_2 when (sel_input = b"10") else
           in_bus_3 when (sel_input = b"11") else (others => '0');

END RTL;
