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
module GameMaster(input clock, input[4:0] btns, output [7:0] seg, output [3:0] an);
    reg gamestate = 1;
    //reg [9:0] score = 10'b0000000000;
    wire[7:0] playdisplay = 8'b01111111;
    wire[7:0] scoredisplay = 8'b11111110;
    wire slowclock;
    //wire die = 0;
    reg scoreclock = 0;

    GameClock u0(clock, slowclock, an);
    //ScoreDisplayBCD u1(scoreclock, score, seg);
    //TODO game simulation logic in place of the rendereer, that then feeds the renderer
    GamePlayer u2(slowclock, an, btns, seg);
    //TODO better clocking
    
    /*
    always @(posedge slowclock) begin
        seg = (gamestate==0) ? scoredisplay : playdisplay;
        if(gamestate == 1) begin
            if(die == 1) begin
                gamestate = 0;
            end else begin
                gameclock = (~gameclock);
            end
        end else begin 
            if(btns != 5'b00000) begin
                gamestate = 1;
            end else begin
            scoreclock = (~scoreclock);
            end
        end
    end
    */

endmodule
