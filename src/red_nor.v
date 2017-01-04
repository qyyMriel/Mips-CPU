/* Copyright 2012 Vikram Padman
******************** WARNING WARNING WARNING *******************************
*This design is in development, prototype or production release is prohibited.
*****************************************************************************/

`timescale 1ns / 1ps

module red_nor(
        a_in,
        y_out);

        input [31:0] a_in;
        output y_out;

        assign y_out = ~|a_in;
endmodule
