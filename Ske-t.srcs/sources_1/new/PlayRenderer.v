`timescale 1ns / 1ps

// x = 00 -> 11 = Seven Seg 0 -> 3
// y = [entity index for that spot, 0 -> 3][00 -> 11 = skateboard manhole bird pole] 
// TODO how should entities be rendered? if entities have set seegments then just an array of entity types should do
module PlayRenderer(input clock, input[1:0] x, input[1:0] y [1:0], output [7:0] seg);
    EntityRenderer u1(y, seg);
    GroundRenderer u2(clock, x, seg);
endmodule
