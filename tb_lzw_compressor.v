`timescale 1ns / 1ps

module tb_lzw_compressor;

  // Input signals
  reg clk;
  reg rst;
  reg [7:0] data_in;
  reg valid;

  // Output signals
  wire [7:0] compressed_data;
  wire done;

  // Instantiate the LZW compressor (Device Under Test)
  lzw_compressor uut (
    .clk(clk),
    .rst(rst),
    .data_in(data_in),
    .valid(valid),
    .compressed_data(compressed_data),
    .done(done)
  );

  // Clock generation: toggle clk every 5ns = 10ns clock period
  always #5 clk = ~clk;

  initial begin
    // Initial setup
    clk = 0;
    rst = 1;
    valid = 0;
    data_in = 8'h00;

    // Wait 10ns, then de-assert reset
    #10 rst = 0;

    // Send 'A'
    #10 valid = 1; data_in = 8'h41;
    // Send 'B'
    #10 data_in = 8'h42;
    // Send 'C'
    #10 data_in = 8'h43;
    // No more data
    #10 valid = 0;

    // Let the simulation run a bit more
    #100;

    // End simulation
    $finish;
  end

endmodule

