`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/10/2024 11:10:15 AM
// Design Name: 
// Module Name: BCDSevenSeg
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


module BCDSevenSeg(
    input[3:0] Y, 
    output reg[6:0] disp
    );
    always@(Y)
        begin
        case(Y)
            0: disp=7'b1000000;
            1: disp=7'b1111001;
            2: disp=7'b0100100;
            3: disp=7'b0110000;
            4: disp=7'b0011001;
            5: disp=7'b0010010;
            6: disp=7'b0000010;
            7: disp=7'b1111000;
            8: disp=7'b0000000;
            9: disp=7'b0010000;
            10: disp=7'b0001000;
            11: disp=7'b1100000;
            12: disp=7'b0110001;
            13: disp=7'b1000010;
            14: disp=7'b0110000;
            15: disp=7'b0111000;
       endcase
    end
endmodule
