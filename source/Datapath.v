`timescale 1ns/1ps

module Datapath(data1, data2, clk_in,reset, result, start,clk);

  
    input clk_in, start,reset;
    input [7:0] data1, data2;
    output [15:0]result;
    output wire clk; // This clock generate after a delay of 345ns.
    
    clk_wiz_0 instance_name
   (
    // Clock out ports
    .clk(clk),     // output clk
    // Status and control signals
    .reset(reset), // input reset
    .locked(locked),       // output locked
   // Clock in ports
    .clk_in1(clk_in)      // input clk_in1
);
    wire start,ldpp,load1,load2;
    wire clrpp,clr1,clr2;
    wire eqz, add;
    wire [8:0]out1,out2,out3,out4;
    wire [15:0] out_reg1, out_reg2, out_reg3, out_reg4;
    wire [15:0] final_out;
    wire [7:0] out_multiplier,out_multiplicand;
    wire ld_sg,clr_sg,msb;

    assign result = final_out;
    
    //output register

    // Used for signed bit xor of msb of two input.
    signed_bit signed_bit(.load(ld_sg), .clk(clk), .reset(clr_sg), .out(msb), .in1(out_multiplier[7]), .in2(out_multiplicand[7]));

    
    // data storing registers
    register multiplier(.clk(clk), .load(load1), .clr(clr1), .data(data1), .out(out_multiplier));
    register multiplicand(.clk(clk), .load(load2), .clr(clr2), .data(data2), .out(out_multiplicand));
    
    // storing partial product registers
    
    pp_reg1 pp_reg1(.clk(clk), .clr(clrpp), .data_in(out1),  .load(ldpp), .out(out_reg1)); 
    
    pp_reg2 pp_reg2(.clk(clk), .clr(clrpp), .data_in(out2),  .load(ldpp), .out(out_reg2)); 
    
    pp_reg3 pp_reg3(.clk(clk), .clr(clrpp), .data_in(out3),  .load(ldpp), .out(out_reg3));
    
    pp_reg4 pp_reg4(.clk(clk), .clr(clrpp), .data_in(out4),  .load(ldpp), .out(out_reg4)); 
    
    //for generating patial product
    
    state_selector state1(.data_in({out_multiplier[1:0],1'b0}),.A(out_multiplicand), .out(out1));
    
    state_selector state2(.data_in(out_multiplier[3:1]), .A(out_multiplicand), .out(out2));
    
    state_selector state3(.data_in({out_multiplier[5:3]}), .A(out_multiplicand), .out(out3));
    
    state_selector state4(.data_in({out_multiplier[7:5]}), .A(out_multiplicand), .out(out4));
    
    // For final out
    ALU ALU(.in1(out_reg1), .in2(out_reg2), .in3(out_reg3), .in4(out_reg4), .out(final_out), .msb(msb));
    
    // Controller
    
    controller control(.clrpp(clrpp), .ldpp(ldpp), .eqz(eqz), .start(start), 
    .clk(clk),.clr1(clr1),.clr2(clr2),.load1(load1),.load2(load2), .ld_sg(ld_sg),.clr_sg(clr_sg));
endmodule