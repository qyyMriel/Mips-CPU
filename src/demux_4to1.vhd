-- Copyright 2012 Vikram Padman
-- ******************** WARNING WARNING WARNING *******************************
-- This design is in development, prototype or production release is prohibited.
-- ****************************************************************************

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
USE ieee.std_logic_arith.ALL;

ENTITY demux_4to1 is
     GENERIC(
          BUS_WIDTH : positive := 1
         ); 
     PORT(
     sel_input : in std_logic_vector(1 downto 0);
     in_bus : in std_logic_vector(BUS_WIDTH-1 downto 0);
     out_bus_0 : out std_logic_vector(BUS_WIDTH-1 downto 0);
     out_bus_1 : out std_logic_vector(BUS_WIDTH-1 downto 0);
     out_bus_2 : out std_logic_vector(BUS_WIDTH-1 downto 0);
     out_bus_3 : out std_logic_vector(BUS_WIDTH-1 downto 0)
     );
END demux_4to1;

ARCHITECTURE rtl OF demux_4to1 IS
BEGIN

out_bus_0 <= in_bus when (sel_input = b"00") else (others => '0');
out_bus_1 <= in_bus when (sel_input = b"01") else (others => '0');
out_bus_2 <= in_bus when (sel_input = b"10") else (others => '0');
out_bus_3 <= in_bus when (sel_input = b"11") else (others => '0');

END RTL;
