`timescale 1ns / 1ps



module register(clk, load, clr, data,out);
    input clk,load,clr;
    input [7:0]data;
    output reg[7:0]out;
    always@(posedge clk)begin
        if(clr)
            out <=0;
        else if(load)
            out <= data;
        else
            out <= out;
    end
endmodule
