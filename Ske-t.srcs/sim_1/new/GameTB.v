`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/01/2024 01:31:21 AM
// Design Name: 
// Module Name: GameTB
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


module GameTB();
    reg clock = 0;
    reg [4:0] btns = 0;
    wire[3:0] an;
    wire[7:0] seg;
    wire slowclock;
    always #5 clock = ~clock;
    GameMaster u0(clock, btns, seg, an);
    //GameClock u1(clock, slowclock, an);
        initial begin
        btns = 5'b00000;
        #2000000;
        btns = 5'b00100;
        #2000000;
        btns = 5'b00000;
        end
endmodule
