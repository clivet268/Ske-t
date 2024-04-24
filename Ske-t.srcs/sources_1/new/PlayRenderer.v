`timescale 1ns / 1ps

// x = Seven seg an selector
// entity = [0000 = skateboard manhole bird pole] 
// TODO how should entities be rendered? if entities have set seegments then just an array of entity types should do
module PlayRenderer(input clock, input[3:0] x, input[3:0] y, output [7:0] seg);
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