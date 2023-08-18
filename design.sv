`timescale 1ns/1ns

module threebit_counter(
    input  clk,          // Clock signal
    input  rst,          // Reset signal
    input  up_down,      // Up/Down control signal
    output reg [2:0] count // 3-bit counter output
);
    reg [2:0] value = 0;
  
    always @(posedge clk) begin
        if (rst) begin
            value <= 0;
        end
        else if (up_down) begin
            if (value < 7) value <= value + 1;
        end
        else begin
            if (value > 0) value <= value - 1;
        end
        count <= value;
    end

endmodule
