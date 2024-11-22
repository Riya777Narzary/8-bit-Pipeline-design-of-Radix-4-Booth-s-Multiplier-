`timescale 1ns/1ps

module pp_reg1(clk, clr, data_in, load, out);
    input clk, clr, load;
    output reg [15:0]out;
    input [8:0]data_in;
    reg i=0;
    
    always@(posedge clk)
    begin
        if(clr)begin
            out <= 0;
            end
        else if(load)
            begin
                out <= {data_in[8],data_in[8],data_in[8],data_in[8],data_in[8],data_in[8],data_in[8],data_in};
                
             end 
        else 
            out <= out;  
    end
endmodule