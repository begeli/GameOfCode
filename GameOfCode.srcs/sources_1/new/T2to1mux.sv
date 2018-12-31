`timescale 1ns / 1ps

module T2to1mux(
    input select,
    input [3:0] a,
    input [3:0] b,
    output [3:0] Y
    );
    
    assign Y = select ? a : b;
endmodule
