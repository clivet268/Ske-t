`timescale 1ns / 1ps

module GamePlayer(input clock, input[3:0] x, input[4:0] btns, output [7:0] seg);
    reg [2:0] entities;
    reg [2:0] skateboard;
    PlayRenderer u2(gameclock, x, entities, skateboard, seg);
/*
    T18 Up Jump btns(0) 
    U17 Down Duck btns(1)
    W19 Left Advance btns(2)
    T17 Right Receed btns(3)
    U18 Center Dodge btns(4)
*/    
    always @(posedge clock)
        begin
        case(btns)
            1: skateboard=3'b001; //Jump
            2: skateboard=3'b010; //duck
            4: skateboard=3'b011; //Advance (back)
            8: skateboard=3'b100; //Receed
            16: skateboard=3'b101; //Dodge
            default: skateboard=3'b000; //stand
        endcase
    end

endmodule
