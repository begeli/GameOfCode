`timescale 1ns / 1ps

module numberGenerator(
    input CLK,
    input RESET,
    output [1:0] direction,
    output [1:0] rotationDuration
    );
    
    wire n1, n2, n3, n4, n5, n6, n7, n8 , n9, n10, n11, n12, n13, n14, n15, n16, x1, x2, x3;
    DFF1 dff1( x3, CLK, RESET, n1);
    DFF0 dff2( n1, CLK, RESET, n2);
    DFF1 dff3( n2, CLK, RESET, n3);
    DFF1 dff4( n3, CLK, RESET, n4);
    DFF0 dff5( n4, CLK, RESET, n5);
    DFF1 dff6( n5, CLK, RESET, n6);
    DFF0 dff7( n6, CLK, RESET, n7);
    DFF0 dff8( n7, CLK, RESET, n8);
    DFF1 dff9( n8, CLK, RESET, n9);
    DFF1 dff10( n9, CLK, RESET, n10);
    DFF0 dff11( n10, CLK, RESET, n11);
    DFF1 dff12( n11, CLK, RESET, n12);
    DFF0 dff13( n12, CLK, RESET, n13);
    DFF1 dff14( n13, CLK, RESET, n14);
    DFF1 dff15( n14, CLK, RESET, n15);
    DFF1 dff16( n15, CLK, RESET, n16);
    xor xor1( x1, n15, n16);
    xor xor2( x2, x1, n13);
    xor xor3( x3, x2, n4);
    
    assign direction = { n14, n16};
    assign rotationDuration = { n13, n15};
endmodule
