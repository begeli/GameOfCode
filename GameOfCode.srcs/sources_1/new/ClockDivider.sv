`timescale 1ns / 1ps

module ClockDivider(
    input CLK,
    output Start
  );
    logic [29:0] count = {30{1'b0}};
    logic clk_NoBuf;
    always@ (posedge CLK) begin
        count <= count + 1;
    end//always
    assign clk_NoBuf = count[29];
    BUFG BUFG_inst (
    .I(clk_NoBuf), // 1-bit input: Clock input
    .O(Start) // 1-bit output: Clock output
    );
endmodule
