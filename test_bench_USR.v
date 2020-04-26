//////////////////////////////////////////////////////////////////////////////////
// Design: Test Bench for Universal Shift Register/Bidirectional Shift Register with Parallel Load
// Engineer: kiran
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps

module test_bench_USR();
  //inputs for DUT
  reg sl_r = 1'b1;
  reg sl_l = 1'b0;
  reg clk, rst;
  reg [3:0] pi  = 4'b1010;       //change the value of parallel load input
  reg [1:0] sel = 2'bz;
  //outputs for DUT
  wire [3:0] z;

  USR DUT(.sl_r(sl_r), .sl_l(sl_l), .pi(pi), .clk(clk), .rst(rst), .sel(sel), .z(z));

  initial
        begin
            $display($time, " << Simulation Results >>");
            $monitor($time, "sl_r=%b, sl_l=%b, pi=%b, clk=%b, rst=%b, sel=%b, z=%b", sl_r, sl_l, pi, clk, rst, sel, z);
        end

  always #10 clk = ~clk;

  initial begin
    clk = 1;
    rst = 1;

	#20 rst = 0;
	#20 sel = 2'b00;
	#40 sel = 2'b01;
	#80 sel = 2'b10;
	#80 sel = 2'b11;
	#60 $finish;
  end


endmodule

