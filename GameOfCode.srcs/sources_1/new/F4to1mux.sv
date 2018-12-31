`timescale 1ns / 1ps

module F4to1mux(
    input equal,
    input valid,
    input [3:0] in0,
    input [3:0] in1,//n2
    input [3:0] in2,
    input [3:0] in3,//n4
    output [3:0] Y
    );
    
    logic [3:0] n1, n2;
    T2to1mux m1( equal, in2, in0, n1);
    T2to1mux m2( equal, in3, in1, n2);
    T2to1mux m3( valid, n2, n1, Y); 
endmodule
