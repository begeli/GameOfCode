`timescale 1ns / 1ps

module gameOfCode(
    input resetScore,
    input resetNumberGenerator,
    input CLK,
    input [3:0] keyb_column,
    output a,
    output b,
    output c,
    output d,
    output e,
    output f,
    output g,
    output dp,
    output [3:0] an,
    output [3:0] keyb_row,
    output [3:0] phases
    );
    
    logic KeyValid, START;
    logic [1:0] nrotationDuration, ndirection, rotationDuration, direction;
    logic [3:0] KeyInput, in0, in1, in2, in3; 
    assign in2 = { 2'b00, rotationDuration};
    assign in3 = { 2'b00, direction}; 
    ClockDivider cd( CLK, START);
    movementMemory mm( START, nrotationDuration, ndirection, rotationDuration, direction);
    keypad4X4 kp( CLK, keyb_row, keyb_column, KeyInput, KeyValid);
    decisionComparison dc( KeyValid, CLK, resetScore, direction, rotationDuration, KeyInput, in0);
    SevSeg_4digit ssg( CLK, in0, 4'b0000, 4'b0000, 4'b0000, a, b, c, d, e, f, g, dp, an);
    steppermotor_wrapper sm( CLK, direction, rotationDuration, phases, START);
    numberGenerator ng( CLK, resetNumberGenerator, ndirection, nrotationDuration);
endmodule
