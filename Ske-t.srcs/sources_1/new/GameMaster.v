`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2024 06:58:07 PM
// Design Name: 
// Module Name: GameMaster
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


//TODO ABREVIATED information for each module
//TODO timing 
module GameMaster(input clock, input buttons[4:0], output[7:0] seg, output[3:0] an);
    reg gamestate = 0;
    reg [9:0] score
    wire[7:0] playdisplay;
    wire[7:0] scoredisplay;
    wire anotherclock = 0;
    wire gameclock = 0;
    wire scoreclock = 0;

    GameClock u0(clock, an);
    DisplayFourBCD u1(scoreclock, score, [6:0] seg);
    //TODO game simulation logic in place of the rendereer, that then feeds the renderer
    PlayRenderer u2(input clock, input[1:0] x, input[1:0] y [1:0], output [7:0] seg);
    //TODO better clocking
    always @(posedge anotherclock or negedge anotherclock) begin
        assign seg = (gamestate==0)?scoredisplay : playdisplay;
        assign gameclock = (gamestate==0)? 0 : (~gameclock);
        assign scoreclock = (gamestate==0)? (~scoreclock): 0;
    end

endmodule
