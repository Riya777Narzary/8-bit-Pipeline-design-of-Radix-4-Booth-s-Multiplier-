`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.03.2024 18:11:54
// Design Name: 
// Module Name: signed_bit
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


module signed_bit(load, clk, reset, out, in1, in2);
    input load, clk, reset, in1,in2;
    output reg out;
    always@(posedge clk)begin
        if(reset)
            out <= 0;
        else if(load)
            out <= in1 ^ in2;
        else
            out <= out;
    end
endmodule
