`timescale 1ns / 1ps

module GroundTB();
    reg clock;
    reg[3:0] x;
    reg[3:0] y;
    wire[7:0] seg = 8'b00000000;
    PlayRenderer u0(clock, x, y, seg);
        initial begin
        clock = 0;
        x = 4'b1110;
        y = 4'b0000;
        #50;
        clock = 1;
        x = 4'b1110;
        #50;
        clock = 0;
        x = 4'b1101;
        #50;
        clock = 1;
        x = 4'b1011;
        #50;
        clock = 0;
        x = 4'b0111;
        #50;
        clock = 1;
        x = 4'b1110;
        #50;
        clock = 0;
        x = 4'b1101;
        #50;
        end
endmodule
