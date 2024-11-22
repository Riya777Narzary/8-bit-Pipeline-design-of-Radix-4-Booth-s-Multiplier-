`timescale 1ns / 1ps



module state_selector(data_in, A, out);
    input [2:0]data_in;
    input [7:0]A;
    reg [8:0]temp = 0;
    output reg [8:0]out;
    
    always@ (*)begin
        case(data_in)
            3'b000: out = 0;
            3'b001: out = {A[7],A};
            3'b010: out = {A[7],A};
            3'b011: out = {A[7],A << 1};
            3'b100: begin
                        temp = {A[7],A};
                        temp = ~temp + 1'b1;
                        out = temp << 1;
                    end 
            3'b101: begin temp = {A[7],A};
                    out = ~temp + 1'b1; end
            3'b110: begin temp = {A[7],A};
                        out = ~temp + 1'b1; end
            3'b111: out = 0;
            default: out=0;
        endcase
    end

    

endmodule
