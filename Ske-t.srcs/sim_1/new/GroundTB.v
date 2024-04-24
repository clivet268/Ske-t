`timescale 1ns / 1ps

module GroundTB();
    reg clock = 0;
    reg[3:0] x;
    reg[3:0] y;
    wire[7:0] seg;
    always #5 clock = ~clock;
    PlayRenderer u0(clock, x, y, seg);
        initial begin
        x = 4'b1110;
        y = 4'b0000;
        #50;
        x = 4'b1110;
        #50;
        x = 4'b1101;
        #50;
        x = 4'b1011;
        #50;
        x = 4'b0111;
        #50;
        x = 4'b1110;
        #50;
        x = 4'b1101;
        #50;
        end
endmodule
