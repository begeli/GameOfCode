`timescale 1ns / 1ps

module numberGeneratorTB();
    logic RESET, CLK;    
    logic [1:0] direction;
    logic [1:0] rotationDuration;
    numberGenerator dut( CLK, RESET, direction, rotationDuration);
    initial begin
        RESET = 0; CLK = 0; #10;
        RESET = 1; #20;
        RESET = 0; #10;
    end    
    always begin
        CLK = ~CLK; #10;
    end    
    initial $monitor( "%t, RESET = %d, CLK = %d, direction[1] = %d, direction[0] = %d, rotationDuration[1] = %d, rotationDuration[0] = %d", $time, RESET, CLK, direction[1], direction[0], rotationDuration[1], rotationDuration[0]);
endmodule
