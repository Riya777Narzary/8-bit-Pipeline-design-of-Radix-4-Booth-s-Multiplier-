`timescale 1ns/1ps

module ALU(in1, in2, in3, in4, out, msb);
    input [15:0] in1, in2, in3, in4;
    input msb;

    output [15:0]out;
    wire [15:0]hold;
    wire [15:0]adder1_out,adder2_out;
    wire adder1_cout, adder2_cout;
    
// CLA
    
//adder
    assign hold = in1 + in2 + in3 + in4;
    assign out = msb ? hold : {msb, hold[14:0]};
endmodule


