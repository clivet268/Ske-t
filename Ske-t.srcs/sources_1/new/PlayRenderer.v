`timescale 1ns / 1ps

// x = Seven seg an selector
// entity = [xxx = manhole wrench bird] 
module PlayRenderer(input clock, input [2:0] entities_0, input [2:0] entities_1, input [2:0] entities_2, input [2:0] entities_3, input[2:0] skateboard, input [1:0] current_render, output reg [7:0] seg);
    
    reg temp = 0;
    reg [2:0] current_entity;
    
    always @(posedge clock) 
        begin
            seg = 8'b11111111;
            if(current_render == 2'b10)begin
                case(skateboard)
                    3'b000:  seg = 8'b11111001;//Stand
                    3'b001:  seg = 8'b11111101;//Jump
                    3'b010:  seg = 8'b11111011;//Duck
                    3'b101:  seg = 8'b11001111;//Dodge
                    default: seg = 8'b11111001;//Stand
                endcase
            end
            
            case(current_render)
                2'b00: current_entity = entities_0;
                2'b01: current_entity = entities_1;
                2'b10: current_entity = entities_2;
                2'b11: current_entity = entities_3;
            endcase
            case(current_entity)
                3'b001: seg = seg & 8'b11110111;//manhole
                3'b010: seg = seg & 8'b10111111;//wrench
                3'b100: seg = seg & 8'b11111110;//bird
            endcase
        end

endmodule