`timescale 1ns / 1ps

module GamePlayer(input gameclock, input[3:0] x, input[4:0] btns, output [7:0] seg, output reg [9:0] score, output reg gamestate);
    // 000 - nothing 001 - manhole 010 - bird 100 - pole
    reg [2:0] entities_pos [3:0];
    reg [1:0] skateboard_pos = 2'b00;
    reg [2:0] skateboard = 3'b000;
    reg [5:0] period_count = 0; 
    reg [2:0] next_entity = 3'b000;
    integer i = 0;
    reg tick = 0;
    
    PlayRenderer u2(gameclock, x, entities, skateboard, seg);
/*
    T18 Up Jump btns(0) 
    U17 Down Duck btns(1)
    W19 Left Advance btns(2)
    U18 Center Dodge btns(3)
    T17 Right Receed btns(4)
*/

    //The button inputs run and calculate player position as fast as possible 
    // is this better or should it sync with ticks
    always @(posedge gameclock)
        begin
            
            if (period_count!= 60)
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
            case(btns)
                1: skateboard=3'b001; //Jump
                2: skateboard=3'b010; //duck
                4: skateboard=3'b011; //Advance 
                8: skateboard=3'b101; //Dodge
                16: skateboard=3'b100; //Receed
            default: skateboard=3'b000; //stand
            endcase
            if (entities_pos[skateboard_pos] != btns) begin
                gamestate = 0;
            end else begin
                score <= score + 1;
                 next_entity = $dist_uniform(69,0,1) << $dist_uniform(69,0,2);
                 entities_pos[3] = next_entity;
                 for (i = 0; i < 2; i = i + 1) begin
                    entities_pos[i] = entities_pos[i] + 1;
                 end
            end
        end 
endmodule
