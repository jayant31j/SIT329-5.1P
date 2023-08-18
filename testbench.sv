`timescale 1ns/1ns

module threebitcounter_test_bench;

    reg clk, rst, up_down;
    wire [2:0] count;

    // Instantiate the counter module
    threebit_counter counter_inst (
        .clk(clk),
        .rst(rst),
        .up_down(up_down),
        .count(count)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        up_down = 1;
        rst = 0;
        #10;
        $display("up_down - %d, count - %d, rst - %d, clk - %d", up_down, count, rst, clk);

        // Test case: Count up
        up_down = 1;
        rst = 0;
        #10; 
        $display("up_down - %d, count - %d, rst - %d, clk - %d", up_down, count, rst, clk);

        // Test case: Count down
        up_down = 0;
        rst = 0;
        #10;
        $display("up_down - %d, count - %d, rst - %d, clk - %d", up_down, count, rst, clk);

        // Test case: Reset
        up_down = 1;
        rst = 1;
        #10; 
        $display("up_down - %d, count - %d, rst - %d, clk - %d", up_down, count, rst, clk);
    end

endmodule
