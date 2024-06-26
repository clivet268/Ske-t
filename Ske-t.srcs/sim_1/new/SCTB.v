`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/01/2024 03:33:51 AM
// Design Name: 
// Module Name: SCTB
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module SCTB();
    reg clock = 0;
    wire[3:0] an;
    wire [1:0] count;
    wire slowclock;
    always #5 clock = ~clock;
    //GameClock u1(clock, slowclock, an);
    SlowClock u0(clock, slowclock);
    TwoBitCounter u1(slowclock, count);
    DecoderTwoToFour u2(count, an);
        initial begin
        end
endmodule
