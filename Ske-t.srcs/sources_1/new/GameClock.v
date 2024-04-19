`timescale 1ns / 1ps

module GameClock(input clock, output clk_out, output[3:0] an);
    wire counter_out;
    SlowClock u2(clock, clk_out);
    TwoBitCoutner u3(clk_out, counter_out);
    DecoderTwoToFour u4(counter_out, an);
    
endmodule