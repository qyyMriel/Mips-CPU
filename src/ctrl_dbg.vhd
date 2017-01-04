-- Copyright 2012 Vikram Padman
-- ******************** WARNING WARNING WARNING *******************************
-- This design is in development, prototype or production release is prohibited.
-- ****************************************************************************

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
USE ieee.std_logic_arith.ALL;

ENTITY ctrl_dbg is
     PORT(
     op_code : in std_logic_vector(5 downto 0);
     regdst : in std_logic;
     memread : in std_logic;
     memtoreg : in std_logic;
     memwrite : in std_logic;
     branch : in std_logic;
     alusrc : in std_logic;
     regwrite : in std_logic;
     aluop : in std_logic_vector( 1 downto 0);
     dbg_out : out std_logic_vector (14 downto 0)
     );

END ctrl_dbg;

ARCHITECTURE rtl OF ctrl_dbg IS
BEGIN

dbg_out(14 downto 0) <= op_code & regdst &
           memread & memtoreg &
           memwrite & branch &
           alusrc & regwrite &
           aluop;

END RTL;
