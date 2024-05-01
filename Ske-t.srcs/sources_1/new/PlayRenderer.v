`timescale 1ns / 1ps

// x = Seven seg an selector
// entity = [xxx = manhole wrench bird] 
module PlayRenderer(input clock
//, input[3:0] an
, input [2:0] entities, input[2:0] skateboard, output reg [7:0] seg);
    
    reg temp = 0;
    always @(posedge clock) 
        begin
            case(skateboard)
                3'b000: seg <= seg & 8'b11110011;//Stand
                3'b001: seg <= seg & 8'b11111011;//Jump
                3'b010: seg <= seg & 8'b11110111;//Duck
                3'b101: seg <= seg & 8'b10011111;//Dodge
                default: seg <= seg & 8'b11110011;//Stand
            endcase
            case(skateboard)
                3'b001: seg <= seg & 8'b11101111;//manhole
                3'b010: seg <= seg & 8'b01111111;//wrench
                3'b100: seg <= seg & 8'b11111101;//bird
            endcase
            //temp = ((~an & 4'b1010) != 0) ? 1 : 0;
            seg[0] <= temp;
        end
    always @(negedge clock) 
        begin
            //temp = ((~an & 4'b1010) != 0) ? 0 : 1;
            seg[0] <= temp; 
        end
endmodule