//////////////////////////////////////////////////////////////////////////////////
// Design: D Flip Flop
// Engineer: kiran
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps


module d_ff(d, clk, rst, q);

    input  wire d;
    input  wire clk;
    input  wire rst;
    output reg q = 1'bz;
   
   always @(posedge(clk))
    begin
        if(rst == 1'b1) 
            q = 1'b0;
        else
            q = d;
    end
    
endmodule
