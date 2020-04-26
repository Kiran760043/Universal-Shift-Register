//////////////////////////////////////////////////////////////////////////////////
// Design: Universal Shift Register/Bidirectional Shift Register with Parallel Load
// Engineer: kiran
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps


module USR(sl_r, sl_l, pi, clk, rst, sel, z);

    input  wire sl_r;            //serial input for right shift
    input  wire sl_l;            //serial input for left  shift
    input  wire clk;
    input  wire rst;
    input  wire [1:0] sel;       //select lines for the mux
    input  wire [3:0] pi;        //input for parallel load
    
    output wire [3:0] z;
    
    wire [3:0] d;
    wire [3:0] m;
    
    mux  m0 (.sel(sel), .x0(d[0]), .x1(sl_r), .x2(d[1]), .x3(pi[0]), .z(m[0]));
    d_ff d0 (.d(m[0]) , .clk(clk), .rst(rst), .q(d[0]));
    
    mux  m1 (.sel(sel), .x0(d[1]), .x1(d[0]), .x2(d[2]), .x3(pi[1]), .z(m[1]));
    d_ff d1 (.d(m[1]) , .clk(clk), .rst(rst), .q(d[1]));
    
    mux  m2 (.sel(sel), .x0(d[2]), .x1(d[1]), .x2(d[3]), .x3(pi[2]), .z(m[2]));
    d_ff d2 (.d(m[2]) , .clk(clk), .rst(rst), .q(d[2]));
    
    mux  m3 (.sel(sel), .x0(d[3]), .x1(d[2]), .x2(sl_l), .x3(pi[3]), .z(m[3]));
    d_ff d3 (.d(m[3]) , .clk(clk), .rst(rst), .q(d[3]));
    
    assign z = d;
endmodule
