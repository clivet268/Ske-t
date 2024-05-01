`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/01/2024 05:33:42 AM
// Design Name: 
// Module Name: GP1
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

module GP1(input gameclock, input[3:0] an, input[4:0] btns, output [7:0] seg);
    // 000 - nothing 001 - manhole 010 - wrench 100 - bird
    reg [2:0] entities_0 = 3'b100;
    reg [2:0] entities_1 = 3'b001;
    reg [2:0] entities_2 = 3'b010;
    reg [2:0] entities_3 = 3'b000;
    reg [1:0] skateboard_pos = 2'b00;
    reg [2:0] skateboard = 3'b000;
    reg [5:0] period_count = 0; 
    reg [2:0] next_entity = 3'b000;
    reg [1:0] current_render = 0;
    reg tick = 0;
    
    PlayRenderer u2(gameclock, entities_0, entities_1, entities_2, entities_3, skateboard, current_render, seg);
/*
    T18 Up Jump btns(0) 
    U17 Down Duck btns(1)
    U18 Center Dodge btns(2)
    W19 Left Advance btns(3)
    T17 Right Receed btns(4)
*/

    //The button inputs run and calculate player position as fast as possible 
    // is this better or should it sync with ticks
    always @(posedge gameclock)
        begin
            case(an)
            4'b1110: current_render = 2'b00;
            4'b1101: current_render = 2'b01;
            4'b1011: current_render = 2'b10;
            4'b0111: current_render = 2'b11;
            endcase
            if (period_count!= 100)
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
    /** 
    * Ticks once every four clock cycles becuase that is once the whole screen has been updated from the last tick
    */
    always @ (posedge tick) 
        begin
            case(btns)
                1: skateboard=3'b001; //Jump
                2: skateboard=3'b010; //Duck
                4: skateboard=3'b011; //Advance 
                8: skateboard=3'b101; //Dodge
                16: skateboard=3'b100; //Receed
            default: skateboard=3'b000; //Stand
            endcase
            if (entities_0 != btns[2:0] & (entities_0 != 0)) begin
                //die <= 1;
            end else begin
                //die <= 0;
                //score <= score + 1;
                 //next_entity = $dist_uniform(69,0,1) << $dist_uniform(69,0,2);
                 entities_0 = entities_1;
                 entities_1 = entities_2;
                 entities_2 = entities_3;
                 entities_3 = entities_0;
            end
        end 
endmodule