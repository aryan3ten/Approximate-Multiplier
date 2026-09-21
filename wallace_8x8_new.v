`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.09.2026 20:19:23
// Design Name: 
// Module Name: wallace_8X8_new
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


module wallace_8X8_new(

    input  [7:0] A,
    input  [7:0] B,
    output [15:0] P
);


    wire [7:0] pp0 = A & {8{B[0]}};//[a7b0,a6b0,a5b0,a4b0,a3b0,a2b0,a1b0,a0b0]
    wire [7:0] pp1 = A & {8{B[1]}};//[a7b1,a6b1,a5b1,a4b1,a3b1,a2b1,a1b1,a0b1]
    wire [7:0] pp2 = A & {8{B[2]}};//[a7b2,a6b2,a5b2,a4b2,a3b2,a2b2,a1b2,a0b2]
    wire [7:0] pp3 = A & {8{B[3]}};//[a7b3,a6b3,a5b3,a4b3,a3b3,a2b3,a1b3,a0b3]
    wire [7:0] pp4 = A & {8{B[4]}};//[a7b4,a6b4,a5b4,a4b4,a3b4,a2b4,a1b4,a0b4]
    wire [7:0] pp5 = A & {8{B[5]}};//[a7b5,a6b5,a5b5,a4b5,a3b5,a2b5,a1b5,a0b5]
    wire [7:0] pp6 = A & {8{B[6]}};//[a7b6,a6b6,a5b6,a4b6,a3b6,a2b6,a1b6,a0b6]
    wire [7:0] pp7 = A & {8{B[7]}};//[a7b7,a6b7,a5b7,a4b7,a3b7,a2b7,a1b7,a0b7]


    wire s1_1,  c1_1;
    wire s1_2,  c1_2;
    wire s1_3,  c1_3;
    wire s1_4,  c1_4,  s1_4b, c1_4b;
    wire s1_5,  c1_5,  s1_5b, c1_5b;
    wire s1_6,  c1_6,  s1_6b, c1_6b;
    wire s1_7,  c1_7,  s1_7b, c1_7b, s1_7c, c1_7c;
    wire s1_8,  c1_8,  s1_8b, c1_8b;
    wire s1_9,  c1_9,  s1_9b, c1_9b;
    wire s1_10, c1_10, s1_10b, c1_10b;
    wire s1_11, c1_11;
    wire s1_12, c1_12;
    wire s1_13, c1_13;

    half_adder HA1_1 (pp0[1], pp1[0],          s1_1,  c1_1);   // col 1
    full_adder FA1_2 (pp0[2], pp1[1], pp2[0],  s1_2,  c1_2);   // col 2
    full_adder FA1_3 (pp0[3], pp1[2], pp2[1],  s1_3,  c1_3);   // col 3
    full_adder FA1_4 (pp0[4], pp1[3], pp2[2],  s1_4,  c1_4);   // col 4
    half_adder HA1_4 (pp3[1], pp4[0],          s1_4b, c1_4b);
    full_adder FA1_5 (pp0[5], pp1[4], pp2[3],  s1_5,  c1_5);   // col 5
    full_adder FA1_5b(pp3[2], pp4[1], pp5[0],  s1_5b, c1_5b);
    full_adder FA1_6 (pp0[6], pp1[5], pp2[4],  s1_6,  c1_6);   // col 6
    full_adder FA1_6b(pp3[3], pp4[2], pp5[1],  s1_6b, c1_6b);
    mkg_gate FA1_7 (.A(pp0[7]), .B(pp1[6]), .C(pp2[5]),  .D(1), .R(s1_7),  .C(c1_7));   // col 7 //
    mkg_gate FA1_7b(.A(pp3[4]), .B(pp4[3]), .C(pp5[2]),  .D(1), .R(s1_7b), .C(c1_7b));
    half_adder HA1_7 (pp6[1], pp7[0],          s1_7c, c1_7c);
    full_adder FA1_8 (pp1[7], pp2[6], pp3[5],  s1_8,  c1_8);   // col 8
    full_adder FA1_8b(pp4[4], pp5[3], pp6[2],  s1_8b, c1_8b);
    full_adder FA1_9 (pp2[7], pp3[6], pp4[5],  s1_9,  c1_9);   // col 9
    full_adder FA1_9b(pp5[4], pp6[3], pp7[2],  s1_9b, c1_9b);
    full_adder FA1_10(pp3[7], pp4[6], pp5[5],  s1_10, c1_10);  // col 10
    half_adder HA1_10(pp6[4], pp7[3],          s1_10b,c1_10b);
    full_adder FA1_11(pp4[7], pp5[6], pp6[5],  s1_11, c1_11);  // col 11
    full_adder FA1_12(pp5[7], pp6[6], pp7[5],  s1_12, c1_12);  // col 12
    half_adder HA1_13(pp6[7], pp7[6],          s1_13, c1_13);  // col 13
 


    wire s2_2,  c2_2;
    wire s2_3,  c2_3;
    wire s2_4,  c2_4;
    wire s2_5,  c2_5;
    wire s2_6,  c2_6,  s2_6b, c2_6b;
    wire s2_7,  c2_7,  s2_7b, c2_7b;
    wire s2_8,  c2_8,  s2_8b, c2_8b;
    wire s2_9,  c2_9;
    wire s2_10, c2_10;
    wire s2_11, c2_11;
    wire s2_12, c2_12;
    wire s2_13, c2_13;
    wire s2_14, c2_14;

    half_adder HA2_2 (s1_2,  c1_1,            s2_2,  c2_2);
    full_adder FA2_3 (s1_3,  pp3[0], c1_2,    s2_3,  c2_3);
    full_adder FA2_4 (s1_4,  s1_4b,  c1_3,    s2_4,  c2_4);
    full_adder FA2_5 (s1_5,  s1_5b,  c1_4,    s2_5,  c2_5);   // c1_4b passes
    full_adder FA2_6 (s1_6,  s1_6b,  pp6[0],  s2_6,  c2_6);
    half_adder HA2_6 (c1_5,  c1_5b,           s2_6b, c2_6b);
    half_adder HA2_7 (c1_6,  c1_6b,           s2_7b, c2_7b);
    full_adder FA2_8 (s1_8,  s1_8b,  pp7[1],  s2_8,  c2_8);
    full_adder FA2_8b(c1_7,  c1_7b,  c1_7c,   s2_8b, c2_8b);
    full_adder FA2_9 (s1_9,  s1_9b,  c1_8,    s2_9,  c2_9);   // c1_8b passes
    full_adder FA2_10(s1_10, s1_10b, c1_9,    s2_10, c2_10);  // c1_9b passes
    full_adder FA2_11(s1_11, pp7[4], c1_10,   s2_11, c2_11);  // c1_10b passes
    half_adder HA2_12(s1_12, c1_11,           s2_12, c2_12);
    half_adder HA2_13(s1_13, c1_12,           s2_13, c2_13);
    half_adder HA2_14(pp7[7],c1_13,           s2_14, c2_14);

   
    wire s3_3,  c3_3;
    wire s3_4,  c3_4;
    wire s3_5,  c3_5;
    wire s3_6,  c3_6;
    wire s3_7,  c3_7;
    wire s3_8,  c3_8;
    wire s3_9,  c3_9;
    wire s3_10, c3_10;
    wire s3_11, c3_11;
    wire s3_12, c3_12;
    wire s3_13, c3_13;
    wire s3_14, c3_14;

    half_adder HA3_3 (s2_3,  c2_2,          s3_3,  c3_3);
    half_adder HA3_4 (s2_4,  c2_3,          s3_4,  c3_4);
    full_adder FA3_5 (s2_5,  c1_4b, c2_4,   s3_5,  c3_5);
    full_adder FA3_6 (s2_6,  s2_6b, c2_5,   s3_6,  c3_6);
    full_adder FA3_7 (s2_7,  s2_7b, c2_6,   s3_7,  c3_7);   // c2_6b passes
    full_adder FA3_8 (s2_8,  s2_8b, c2_7,   s3_8,  c3_8);   // c2_7b passes
    full_adder FA3_9 (s2_9,  c1_8b, c2_8,   s3_9,  c3_9);   // c2_8b passes
    full_adder FA3_10(s2_10, c1_9b, c2_9,   s3_10, c3_10);
    full_adder FA3_11(s2_11, c1_10b,c2_10,  s3_11, c3_11);
    half_adder HA3_12(s2_12, c2_11,         s3_12, c3_12);
    half_adder HA3_13(s2_13, c2_12,         s3_13, c3_13);
    half_adder HA3_14(s2_14, c2_13,         s3_14, c3_14);
  

  
    wire s4_7,  c4_7;
    wire s4_8,  c4_8;
    wire s4_9,  c4_9;
    wire s4_10, c4_10;
    wire s4_11, c4_11;
    wire s4_12, c4_12;
    wire s4_13, c4_13;
    wire s4_14, c4_14;
    wire s4_15, c4_15;   // c4_15 is always 0 (product fits in 16 bits)

    full_adder FA4_7 (s3_7,  c2_6b, c3_6,   s4_7,  c4_7);
    full_adder FA4_8 (s3_8,  c2_7b, c3_7,   s4_8,  c4_8);
    full_adder FA4_9 (s3_9,  c2_8b, c3_8,   s4_9,  c4_9);
    half_adder HA4_10(s3_10, c3_9,          s4_10, c4_10);
    half_adder HA4_11(s3_11, c3_10,         s4_11, c4_11);
    half_adder HA4_12(s3_12, c3_11,         s4_12, c4_12);
    half_adder HA4_13(s3_13, c3_12,         s4_13, c4_13);
    half_adder HA4_14(s3_14, c3_13,         s4_14, c4_14);
    half_adder HA4_15(c2_14, c3_14,         s4_15, c4_15);


    wire cy4, cy5, cy6, cy7, cy8, cy9, cy10, cy11, cy12, cy13, cy14, cy15;

    half_adder HA5_4 (s3_4,  c3_3,          P[4],  cy4);
    full_adder FA5_5 (s3_5,  c3_4,  cy4,    P[5],  cy5);
    full_adder FA5_6 (s3_6,  c3_5,  cy5,    P[6],  cy6);
    half_adder HA5_7 (s4_7,  cy6,           P[7],  cy7);
    full_adder FA5_8 (s4_8,  c4_7,  cy7,    P[8],  cy8);
    full_adder FA5_9 (s4_9,  c4_8,  cy8,    P[9],  cy9);
    full_adder FA5_10(s4_10, c4_9,  cy9,    P[10], cy10);
    full_adder FA5_11(s4_11, c4_10, cy10,   P[11], cy11);
    full_adder FA5_12(s4_12, c4_11, cy11,   P[12], cy12);
    full_adder FA5_13(s4_13, c4_12, cy12,   P[13], cy13);
    full_adder FA5_14(s4_14, c4_13, cy13,   P[14], cy14);
    full_adder FA5_15(s4_15, c4_14, cy14,   P[15], cy15);


    assign P[0] = pp0[0];
    assign P[1] = s1_1;
    assign P[2] = s2_2;
    assign P[3] = s3_3;

endmodule
