`timescale 1ns / 1ps

module F4bitadder(
    input cin,
    input [3:0] a,
    input [3:0] b,
    output cout,
    output [3:0] s
    );
    
    wire G0, G1, G2, G3, P0, P1, P2, P3, c1, c2, c3;
    
    assign P0 = a[0] ^ b[0];
    assign P1 = a[1] ^ b[1];
    assign P2 = a[2] ^ b[2];
    assign P3 = a[3] ^ b[3];
    assign G0 = a[0] & b[0];
    assign G1 = a[1] & b[1];
    assign G2 = a[2] & b[2];
    assign G3 = a[3] & b[3];
    assign c1 = G0 | ( P0 & cin );
    assign c2 = G1 | ( P1 & c1 );
    assign c3 = G2 | ( P2 & c2);
    assign cout = G3 | ( P3 & G2 ) | ( P3 & P2 & G1 ) | ( P3 & P2 & P1 & G0 ) | ( P3 & P2 & P1 & P0 & cin );
    assign s[3] = ( P3 ^ c3 );
    assign s[2] = ( P2 ^ c2 );
    assign s[1] = ( P1 ^ c1 );
    assign s[0] = ( P0 ^ cin );
endmodule
