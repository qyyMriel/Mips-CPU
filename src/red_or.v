/* Copyright 2012 Vikram Padman
******************** WARNING WARNING WARNING *******************************
*This design is in development, prototype or production release is prohibited.
*****************************************************************************/

`timescale 1ns / 1ps

module red_or(
        a_in,
        y_out);

        input [7:0] a_in;
        output y_out;

        assign y_out = |a_in;
endmodule
