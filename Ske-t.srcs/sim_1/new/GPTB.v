`include "C:\Users\clive\Ske-t\Ske-t.srcs\sources_1\new\GP1.v"
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/01/2024 04:46:23 AM
// Design Name: 
// Module Name: GPTB
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


module GPTB();

    reg clock = 0;
    reg [4:0] btns = 0;
    wire[3:0] an;
    wire[7:0] seg;
    wire slowclock;    

    always #10 clock = ~clock;
    GameClock u0(clock, slowclock, an);
    GamePlayer u1(slowclock, an, btns, seg);
        initial begin 
        btns = 5'b00000;
        #2000000;
        btns = 5'b00100;
        #2000000;
        btns = 5'b00000;
        end
endmodule
