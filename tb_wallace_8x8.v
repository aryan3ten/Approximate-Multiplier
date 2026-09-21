`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.09.2026 21:37:57
// Design Name: 
// Module Name: tb_wallace_8x8
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_wallace_8x8;

    reg  [7:0]  A, B;
    wire [15:0] P;

    wallace_8X8_new DUT (.A(A), .B(B), .P(P));

    initial begin
        $display("      A          B             P              dec");
        $monitor("%b  %b  %b  %0d x %0d = %0d", A, B, P, A, B, P);

        // 255 x 255 = 65025
        A = 8'b1111_1111;  B = 8'b1111_1111;  #10;

        // 170 x 99 = 16830
        A = 8'b1010_1010;  B = 8'b0110_0011;  #10;

        // 13 x 43 = 559
        A = 8'b0000_1101;  B = 8'b0010_1011;  #10;

        $finish;
    end

endmodule