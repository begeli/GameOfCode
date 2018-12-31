`timescale 1ns / 1ps

module mapping(
    input [3:0] KeyValue,
    input [1:0] rotationDuration,
    input [1:0] direction,
    output logic true
    );
    
    logic [3:0] movement;
    assign movement = { rotationDuration[1], rotationDuration[0], direction[1], direction[0]};
    
    always_comb
        case ( movement )
        'b0000: if ( KeyValue == 4'b0010) true = 1'b1; else true = 1'b0;
        'b0001: if ( KeyValue == 4'b1111) true = 1'b1; else true = 1'b0;
        'b0010: if ( KeyValue == 4'b1011) true = 1'b1; else true = 1'b0;
        'b0011: if ( KeyValue == 4'b1010) true = 1'b1; else true = 1'b0;
        'b0100: if ( KeyValue == 4'b1110) true = 1'b1; else true = 1'b0;
        'b0101: if ( KeyValue == 4'b1101) true = 1'b1; else true = 1'b0;
        'b0110: if ( KeyValue == 4'b1001) true = 1'b1; else true = 1'b0;
        'b0111: if ( KeyValue == 4'b0111) true = 1'b1; else true = 1'b0;
        'b1000: if ( KeyValue == 4'b0110) true = 1'b1; else true = 1'b0;
        'b1001: if ( KeyValue == 4'b0101) true = 1'b1; else true = 1'b0;
        'b1010: if ( KeyValue == 4'b0100) true = 1'b1; else true = 1'b0; 
        'b1011: if ( KeyValue == 4'b0000) true = 1'b1; else true = 1'b0;
        'b1100: if ( KeyValue == 4'b1100) true = 1'b1; else true = 1'b0;
        'b1101: if ( KeyValue == 4'b1000) true = 1'b1; else true = 1'b0;
        'b1110: if ( KeyValue == 4'b0001) true = 1'b1; else true = 1'b0;
        'b1111: if ( KeyValue == 4'b0011) true = 1'b1; else true = 1'b0;        
        endcase
endmodule
