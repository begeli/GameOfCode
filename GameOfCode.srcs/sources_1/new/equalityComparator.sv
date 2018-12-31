`timescale 1ns / 1ps

module equalityComparator(
    input [3:0] number1,
    input [3:0] number2,
    output equal
    );
    
    wire n1, n2, n3, n4;
    xnor x1( n1, number1[3], number2[3]);
    xnor x2( n2, number1[2], number2[2]);
    xnor x3( n3, number1[1], number2[1]);
    xnor x4( n4, number1[0], number2[0]);
    and a1( equal, n1, n2, n3, n4);
endmodule
