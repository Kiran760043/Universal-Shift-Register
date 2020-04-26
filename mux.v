//////////////////////////////////////////////////////////////////////////////////
// Design: 4x1 Mux
// Engineer: kiran
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps

module mux(sel, x0, x1, x2, x3, z);
    input  wire [1:0] sel;
    input  wire x0,x1,x2,x3;
    output reg z;

    always @ *
        begin
            case (sel)
                2'b00 : z <= x0;
                2'b01 : z <= x1;
                2'b10 : z <= x2;
                2'b11 : z <= x3;

                default: z <= 1'b0;
            endcase
        end

endmodule
