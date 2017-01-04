-- Copyright 2012 Vikram Padman
-- ******************** WARNING WARNING WARNING *******************************
-- This design is in development, prototype or production release is prohibited.
-- ****************************************************************************

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
USE ieee.std_logic_arith.ALL;

ENTITY ctrl_bits_dbg is
     PORT(
	  main_ctrl	: in std_logic_vector(14 downto 0);
	  alu_op_bits : in std_logic_vector(2 downto 0);
	  funct_bits  : in std_logic_vector(5 downto 0);
     ctrl_dbg_out : out std_logic_vector (31 downto 0)
     );

END ctrl_bits_dbg;

ARCHITECTURE rtl OF ctrl_bits_dbg IS
BEGIN

ctrl_dbg_out(23 downto 0) <= funct_bits & alu_op_bits & main_ctrl;
ctrl_dbg_out(31 downto 24) <= (others=>'0');

END RTL;
