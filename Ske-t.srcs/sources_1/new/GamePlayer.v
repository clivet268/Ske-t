`timescale 1ns / 1ps

module GamePlayer(input clock, input gameclock, input[3:0] x, input[4:0] btns, output [7:0] seg, gamestate);
    reg [2:0] entities_pos [3:0];
    reg [2:0] skateboard_pos;
    reg [2:0] skateboard;
    reg [1:0] period_count = 0; 
    reg tick;
    PlayRenderer u2(gameclock, x, entities, skateboard, seg);
/*
    T18 Up Jump btns(0) 
    U17 Down Duck btns(1)
    W19 Left Advance btns(2)
    T17 Right Receed btns(3)
    U18 Center Dodge btns(4)
*/

    //The button inputs run and calculate player position as fast as possible 
    // is this better or should it sync with ticks
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
            
            if (period_count!= 3)
                begin
                    period_count<= period_count + 1;
                    tick <= 0; 
                end
            else 
                begin
                    period_count <= 0;
                    tick <= 1;
                end
        end
    //TODO should this be another slow clock?
    /** 
    * Ticks once every four clock cycles becuase that is once the whole screen has been updated from the last tick
    */
    always @ (posedge tick) 
        begin
            if()
        end

endmodule
