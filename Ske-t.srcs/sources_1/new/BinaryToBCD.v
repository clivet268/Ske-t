`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/10/2024 02:19:47 AM
// Design Name: 
// Module Name: BinaryToBCD
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


module BinaryToBCD(
    input [7:0] A, 
    output [3:0] ONES, 
    output [3:0] TENS, 
    output [1:0] HUNDREDS
); 
    wire [3:0] c1,c2,c3,c4,c5,c6,c7;
    wire [3:0] d1,d2,d3,d4,d5,d6,d7; 

    assign d1 = {1'b0,A[7:5]}; 
    assign d2 = {c1[2:0],A[4]};
    assign d3 = {c2[2:0],A[3]};  
    assign d4 = {c3[2:0],A[2]};  
    assign d5 = {c4[2:0],A[1]};  
    assign d6 = {1'b0,c1[3],c2[3],c3[3]}; 
    assign d7 = {c6[2:0],c4[3]};
    AddThree m1(d1,c1); 
    AddThree m2(d2,c2); 
    AddThree m3(d3,c3); 
    AddThree m4(d4,c4); 
    AddThree m5(d5,c5); 
    AddThree m6(d6,c6); 
    AddThree m7(d7,c7); 
    assign ONES = {c5[2:0],A[0]}; 
    assign TENS = {c7[2:0],c5[3]}; 
    assign HUNDREDS = {c6[3],c7[3]}; 
endmodule 
