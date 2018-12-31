`timescale 1ns / 1ps

module decisionComparison(
    input KeyValid,
    input CLK,
    input RESET,
    input [1:0] direction,
    input [1:0] rotationDuration,
    input [3:0] KeyInput,
    output [3:0] in0
    );
    
    logic equal, coutA, coutS, is10, is8;
    logic [3:0] oldValue, adderOut,incrementedValue, subtractorOut, decrementedValue;
    mapping map( KeyInput, rotationDuration, direction, equal);
    DFF d1( in0, CLK, RESET, oldValue); 
    F4to1mux m41( equal, KeyValid, oldValue, decrementedValue, oldValue, incrementedValue, in0);
    F4bitadder adder( 1'b0, oldValue, 4'b0001, coutA, adderOut);
    equalityComparator ec2( adderOut, 4'b1010, is10);
    T2to1mux mux21( is10, 4'b1001, adderOut, incrementedValue);
    F4bitadder subtractor( 1'b0, oldValue, 4'b1111, coutS, subtractorOut);
    equalityComparator ec3( subtractorOut, 4'b1000, is8);
    F4to1mux m42( is8, subtractorOut[3], subtractorOut, 4'b0000, 4'b1000, 4'b1000, decrementedValue);

endmodule
