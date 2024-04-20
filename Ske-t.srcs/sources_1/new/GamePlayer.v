`timescale 1ns / 1ps

module GamePlayer(input clock, input[3:0] x, output [7:0] seg);
    reg [3:0] entities;
    PlayRenderer u2(gameclock, x, entities, seg);
endmodule
