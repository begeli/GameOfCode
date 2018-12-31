`timescale 1ns / 1ps

module movementMemory(
    input Start,
    input [1:0] nrotationDuration,
    input [1:0] ndirection,
    output[1:0] rotationDuration,
    output[1:0] direction
    );
    
    logic [3:0] nmovement;
    logic [3:0] movement;
    assign nmovement = { nrotationDuration[1], nrotationDuration[0], ndirection[1], ndirection[0]};
    DFF numberHolder( nmovement, Start, 1'b0, movement);
    //assign movement = Start ? nmovement : movement;
    assign rotationDuration = { movement[3], movement[2]};
    assign direction =  { movement[1], movement[0]};
endmodule
