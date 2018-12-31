`timescale 1ns / 1ps

module DFF1(
    input D,
    input CLK,    
    input PRESET,
    output reg Q
    );
    
    always_ff @(posedge CLK) begin                             
       if (PRESET)
            Q <= 1;
       else
            Q <= D;
               
    end         
endmodule
