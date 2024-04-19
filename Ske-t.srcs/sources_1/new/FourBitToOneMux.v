module FourBitToOneMux(
    input [3:0] A, 
    input [3:0] B, 
    input [1:0] C,
    input [3:0] D, 
    input [1:0] sel, 
    output[3:0] Y
    ); 
    assign Y = (sel==0)?A : (sel==1)?B : (sel==2)?C : D;
endmodule