`timescale 1ns / 1ps

module DFF0(
    input D,
    input CLK,    
    input RESET,
    output reg Q
    );
    
    always_ff @(posedge CLK) begin                             
       if (RESET)
            Q <= 0;
       else
            Q <= D;
               
    end         
endmodule
