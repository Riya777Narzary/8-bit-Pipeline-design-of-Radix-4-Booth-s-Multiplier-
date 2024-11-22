`timescale 1ns/1ps

module pp_reg4(clk, clr, data_in, load, out);
    input clk, clr, load;
    output reg [15:0]out;
    input [8:0]data_in;
    
    always@(posedge clk)
    begin
        if(clr)begin
            out <= 0;
            end
        else if(load)
            begin
//                out[5:0] <= 6'b0;
//                out[14:6] <= data_in;
//                out[15] <= data_in[8];
                out <= {data_in[8],data_in,6'b0};
             end 
        else
            out <= out;  
    end
endmodule