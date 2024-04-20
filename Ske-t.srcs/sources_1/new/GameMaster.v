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
module GameMaster(input clock, input[4:0] btns, output reg [7:0] seg, output[3:0] an);
    reg gamestate = 0;
    reg [9:0] score;
    wire[7:0] playdisplay = 8'b00000000;
    wire[7:0] scoredisplay = 8'b00000000;
    wire slowclock = 0;
    reg gameclock = 0;
    reg scoreclock = 0;

    GameClock u0(clock, slowclock, an);
    ScoreDisplayBCD u1(scoreclock, score, scoredisplay);
    //TODO game simulation logic in place of the rendereer, that then feeds the renderer
    GamePlayer u2(gameclock, an, playdisplay);
    //TODO better clocking
    always @(posedge slowclock) begin
        assign seg = (gamestate==0)?scoredisplay : playdisplay;
        if(gamestate == 1) begin
            gameclock = (~gameclock);
        end else begin 
            scoreclock = (~scoreclock);
        end
        
    end

endmodule
