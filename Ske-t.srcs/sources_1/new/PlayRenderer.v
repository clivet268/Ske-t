`timescale 1ns / 1ps

// x = Seven seg an selector
// entity = [000 = manhole bird pole] 
// TODO how should entities be rendered? if entities have set seegments then just an array of entity types should do
module PlayRenderer(input clock, input[3:0] x, input[2:0] entities, input[2:0] skateboard, output [7:0] seg);
    reg[7:0] ourbuf= 8'b00000000;
    always @(posedge clock) 
        begin
            ourbuf = ourbuf+8'b00000001;
        //((~x & 4'b0101) != 4'b0000);
        end
        assign seg = ourbuf;
endmodule
