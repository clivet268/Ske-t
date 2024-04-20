`timescale 1ns / 1ps

// x = Seven seg an selector
// entity = [0000 = skateboard manhole bird pole] 
// TODO how should entities be rendered? if entities have set seegments then just an array of entity types should do
module PlayRenderer(input clock, input[3:0] x, input[3:0] y, output [7:0] seg);
    reg[7:0] ourbuf= 0;
    always @(posedge clock) 
        begin
            ourbuf = ourbuf+1;
        //((~x & 4'b0101) != 4'b0000);
        end
        assign seg = ourbuf;
endmodule
