`timescale 1ns / 1ps

module ScoreDisplayBCD(input clock, input [9:0] score, input[1:0] select, output [6:0] seg);
    wire [3:0] mux_out;
    wire [3:0] ones, tens, hundreds, thousands; 
    BinaryToBCD u0(score, ones, tens, hundreds);
    FourBitToOneMux u1(ones, tens, hundreds, thousands, select, mux_out);
    BCDSevenSeg u5(mux_out, seg);
endmodule