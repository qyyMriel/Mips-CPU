-- Copyright 2012 Vikram Padman
-- ******************** WARNING WARNING WARNING *******************************
-- This design is in development, prototype or production release is prohibited.
-- ****************************************************************************

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
USE ieee.std_logic_arith.ALL;

ENTITY stp_concat is
     PORT(
     pc_in : in  std_logic_vector(31 downto 0);
     im_in : in std_logic_vector(31 downto 0);
     rf_in_1 : in std_logic_vector(31 downto 0);
     rf_in_2 : in std_logic_vector(31 downto 0);
     alu_in : in std_logic_vector(31 downto 0);
     dm_in : in std_logic_vector(31 downto 0);
     dw_mux_in : in std_logic_vector(31 downto 0);
     user_sig : in std_logic_vector(31 downto 0);
     strb_in : in std_logic;

     acq_data_out : out std_logic_vector(255 downto 0);
     acq_trigger_out : out std_logic
     );

END stp_concat;

ARCHITECTURE rtl OF stp_concat IS
BEGIN

acq_data_out <= user_sig & -- signal tap pins 255 downto 224
                dw_mux_in & -- signal tap pins 223 downto 192
                dm_in & -- signal tap pins 191 downto 160
                alu_in & -- signal tap pins 159 downto 128
                rf_in_2 & -- signal tap pins 127 downto 96
                rf_in_1 & -- signal tap pins 95 downto 64
                im_in & -- signal tap pins 63 downto 32
                pc_in; --signal tap pins 31 downto 0
acq_trigger_out <= strb_in;
END RTL;
