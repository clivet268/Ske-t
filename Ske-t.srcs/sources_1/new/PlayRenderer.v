`timescale 1ns / 1ps

// x = Seven seg an selector
// entity = [xx = manhole bird pole] 
module PlayRenderer(input clock, input[3:0] x, input[2:0] entities, input[2:0] skateboard, output [7:0] seg);
    reg temp = 0;
    always @(posedge clock) 
        begin
            temp = ((~x & 4'b1010) != 0) ? 1 : 0;
        end
        assign seg[0] = temp;
    always @(negedge clock) 
        begin
            temp = ((~x & 4'b1010) != 0) ? 0 : 1;
        end
        assign seg[0] = temp;
endmodule