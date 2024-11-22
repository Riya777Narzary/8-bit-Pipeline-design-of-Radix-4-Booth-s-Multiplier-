`timescale 1ns / 1ps



module controller(clrpp, ldpp, eqz, start, clk,clr1,clr2,load1,load2,ld_sg,clr_sg);
    input start,clk;
    output reg clrpp, ldpp,eqz,load1,load2,clr1,clr2,ld_sg,clr_sg;
    
    
    reg [0:0] state;
    parameter [0:0] S0 = 1'b0,
                    S1 = 1'b1;
                
    always@(posedge clk)begin
        case (state)
            S0: if(start) 
                    state <= S1;
                else
                    state <= S0;
            S1: state <= S1;
            default: state <= S0;

        endcase
    end  
    always@(*) begin
        case(state)
            S0: begin clrpp= 1;ldpp =0;  eqz=0; load1=0; load2=0; clr1=1; clr2=1; ld_sg=0; clr_sg=1;
                      end
            S1: begin load1=1; load2=1; clr1=0; clr2=0;clrpp= 0;ldpp =1; eqz=1; ld_sg=1; clr_sg=0;
                      end
            
            default:begin clrpp= 1; ldpp =0; eqz=0; load1=0; load2=0; clr1=1; clr2=1; ld_sg=0; clr_sg=1;
                           end
           endcase 
      end
endmodule
