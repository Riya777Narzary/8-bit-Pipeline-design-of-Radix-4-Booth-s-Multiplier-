`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.03.2024 15:15:58
// Design Name: 
// Module Name: CLA
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


module CLA_Adder_4bit(
input [3:0]A, B,
input Cin,
output [3:0]S,
output Cout
    );
    wire [3:0]G;
    wire [2:0]C;
    wire [10:1]W;
    wire [3:0]P;
    and G0 (G[0],A[0],B[0]);
    and G1 (G[1],A[1],B[1]);
    and G2 (G[2],A[2],B[2]);
    and G3 (G[3],A[3],B[3]);
    xor P0 (P[0],A[0],B[0]);
    xor P1 (P[1],A[1],B[1]);
    xor P2 (P[2],A[2],B[2]);
    xor P3 (P[3],A[3],B[3]);
    and(W[5],P[0],Cin);
    or C0 (C[0],G[0],W[5]);
    and(W[6],P[1],G[0]);
    and(W[7],P[1],P[0],Cin);
    or C1 (C[1],G[1],W[6],W[7]);
    and(W[8],P[2],G[1]);
    and (W[9],P[2],P[1],G[0]);
    and (W[10],P[2],P[1],P[0],Cin);
    or C2 (C[2],G[2],W[8],W[9],W[10]);
    and(W[1],P[3],G[2]);
    and(W[2],P[3],P[2],G[1]);
    and(W[3],P[3],P[2],P[1],G[0]);
    and(W[4],P[3],P[2],P[1],P[0],Cin);
    or C3(Cout,W[1],W[2],W[3],W[4],G[3]);
    xor S0 (S[0],P[0],Cin);
    xor S1 (S[1],P[1],C[0]);
    xor S2 (S[2],P[2],C[1]);
    xor S3 (S[3],P[3],C[2]);
endmodule

//module for 16 bit cla adder.
module CLA_Adder_16bit(
input [15:0]A,B,
output [15:0]S,
input Cin,
output Cout
);
wire [2:0]c;
CLA_Adder_4bit Add1 (.A(A[3:0]),.B(B[3:0]),.Cin(Cin),.Cout(c[0]),.S(S[3:0]));
CLA_Adder_4bit Add2 (.A(A[7:4]),.B(B[7:4]),.Cin(c[0]),.Cout(c[1]),.S(S[7:4]));
CLA_Adder_4bit Add3 (.A(A[11:8]),.B(B[11:8]),.Cin(c[1]),.Cout(c[2]),.S(S[11:8]));
CLA_Adder_4bit Add4 (.A(A[15:12]),.B(B[15:12]),.Cin(c[2]),.Cout(Cout),.S(S[15:12]));
endmodule

