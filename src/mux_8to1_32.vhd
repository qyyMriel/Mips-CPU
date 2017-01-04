-- Copyright 2012 Vikram Padman
-- ******************** WARNING WARNING WARNING *******************************
-- This design is in development, prototype or production release is prohibited.
-- ****************************************************************************

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
USE ieee.std_logic_arith.ALL;

ENTITY mux_8to1_32 is
     PORT(
     sel_input : in std_logic_vector(2 downto 0);
     out_bus : out std_logic_vector(31 downto 0);
     in_0 : in std_logic_vector(31 downto 0);
     in_1 : in std_logic_vector(31 downto 0);
     in_2 : in std_logic_vector(31 downto 0);
     in_3 : in std_logic_vector(31 downto 0);
     in_4 : in std_logic_vector(31 downto 0);
     in_5 : in std_logic_vector(31 downto 0);
     in_6 : in std_logic_vector(31 downto 0);
     in_7 : in std_logic_vector(31 downto 0)
 );
END mux_8to1_32;

ARCHITECTURE rtl OF mux_8to1_32 IS
BEGIN

out_bus <= in_0 when (sel_input = b"000") else
           in_1 when (sel_input = b"001") else
           in_2 when (sel_input = b"010") else
           in_3 when (sel_input = b"011") else 
           in_4 when (sel_input = b"100") else 
           in_5 when (sel_input = b"101") else 
           in_6 when (sel_input = b"110") else 
           in_7 when (sel_input = b"111") else (others => '0');

END RTL;
