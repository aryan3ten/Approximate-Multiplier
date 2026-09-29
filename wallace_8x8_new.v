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


/*module wallace_8X8_new(

    input  [7:0] A,
    input  [7:0] B,
    output [15:0] P
);

                                   //  7    6    5    4    3    2    1    0
    wire [7:0] pp0 = B & {8{A[0]}};//[b7a0|b6a0|b5a0|b4a0|b3a0|b2a0|b1a0|b0a0]
    wire [7:0] pp1 = B & {8{A[1]}};//[b7a1|b6a1|b5a1|b4a1|b3a1|b2a1|b1a1|b0a1]
    wire [7:0] pp2 = B & {8{A[2]}};//[b7a2|b6a2|b5a2|b4a2|b3a2|b2a2|b1a2|b0a2]
    wire [7:0] pp3 = B & {8{A[3]}};//[b7a3|b6a3|b5a3|b4a3|b3a3|b2a3|b1a3|b0a3]
    wire [7:0] pp4 = B & {8{A[4]}};//[b7a4|b6a4|b5a4|b4a4|b3a4|b2a4|b1a4|b0a4]
    wire [7:0] pp5 = B & {8{A[5]}};//[b7a5|b6a5|b5a5|b4a5|b3a5|b2a5|b1a5|b0a5]
    wire [7:0] pp6 = B & {8{A[6]}};//[b7a6|b6a6|b5a6|b4a6|b3a6|b2a6|b1a6|b0a6]
    wire [7:0] pp7 = B & {8{A[7]}};//[b7a7|b6a7|b5a7|b4a7|b3a7|b2a7|b1a7|b0a7]

    //STAGE-1
    wire s1,  c1;
    wire s2,  c2;
    wire s3,  c3;
    wire s4,  c4;
    wire s5,  c5;
    wire s6,  c6;
    wire s7,  c7;
    wire s8,  c8;
    wire s9,  c9;
    wire s10, c10;
    wire s11, c11;
    wire s12, c12;
    wire s13, c13;
    wire s14, c14;
    wire s15, c15;
    wire s16, c16;

    half_adder HA1 (pp0[1], pp1[0], s1,  c1);   // col 1    (a0b1+a1b0)        ok
    full_adder FA2 (pp0[2], pp1[1], pp2[0], s2,  c2);   // col 2    (a0b2+a1b1+a2b0)   ok
    full_adder FA3 (pp0[3], pp1[2], pp2[1],  s3,  c3);   // col 3    (a0b3+a1b2+a2b1)   ok
    full_adder FA4 (pp0[4], pp1[3], pp2[2],  s14,  c4);   // col 4    (a0b4+a1b3+a2b2)   ok
    half_adder HA5 (pp3[1], pp4[0],          s5, c5);  // col4b    (a3b1+a4b0)        ok
    full_adder FA6 (pp0[5], pp1[4], pp2[3],  s6,  c6);   // col 5    (a0b5+a1b4+a2b3)   ok
    full_adder FA7(pp3[2], pp4[1], pp5[0],  s7, c7);  // col5b    (a3b2+a4b1+a5b0)   ok
    full_adder FA8 (pp0[6], pp1[5], pp2[4],  s8,  c8);   // col 6    (a0b6+a1b5+a2b4)   ok
    full_adder FA9(pp3[3], pp4[2], pp5[1],  s9, c9);  // col 6b   (a3b3+a4b2+a5b1)   ok
    full_adder FA10 (pp0[7], pp1[6], pp2[5],  s10,  c10);   // col 7    (a0b7+a1b6+a2b5)   ok
    full_adder FA11(pp3[4], pp4[3], pp5[2],  s11, c11);  // col 7b   (a3b4+a4b3+a5b2)   ok
    half_adder HA12 (pp1[7], pp2[6],          s12,  c12);   // col 8    (a1b7+a2b6)        ok
    full_adder FA13(pp3[5],  pp4[4], pp5[3],  s13, c13);  // col 8b   (a3b5+a4b4+a5b3)   ok
    full_adder FA14 (pp5[4], pp3[6], pp4[5],  s14,  c14);   // col 9    (a5b4+a3b6+a4b5)   ok
    full_adder FA15(pp3[7], pp4[6], pp5[5],  s15,c15); // col 10b  (a3b7+a4b6+a5b5)   ok
    half_adder HA16 (pp4[7], pp5[6],          s16, c16);  // col 11   (a4b7+a5b6)        ok
    
    //STAGE-2
    wire s17, c17;
    wire s18, c18;
    wire s19, c19;
    wire s20, c20;
    wire s21, c21;
    wire s22, c22;
    wire s23, c23;
    wire s24, c24;
    wire s25, c25;
    wire s26, c26;
    wire s27, c27;
    wire s28, c28;
    wire s29, c29;
    wire s30, c30;
    wire s31, c31;
    wire s32, c32;
    
    half_adder HA17 (s2,  c1, s17,  c17);   // col 2                                     ok
    full_adder FA18 (s3,  pp3[0], c2, s18,  c18);   // col 3     (Adding with b0a3)              ok
    full_adder FA19 (s4,  s5,  c3, s19,  c19);   // col 4     (                               ok
    full_adder FA20 (s6,  s7,  c4, s20,  c20);   // col 5                                     ok
    full_adder FA21 (s8,  s9,  c6, s21,  c21);   // col 6                                     ok
    half_adder HA22 (pp6[0], c7, s22, c22);  // col 6    (Adding with b0a6)               ok
    
    full_adder FA23 (s10,s11,c8,           s23, c23);  // col 7            
    full_adder FA24 (pp6[1],pp7[0],c9,  s24,  c24);   // col 8             
    full_adder FA25(s12,s13,c10,   s25, c25);  // col 8b            
    full_adder FA26 (pp6[2],pp7[1],c11,    s26,  c26);   // col 9                        
    full_adder FA27(pp2[7],s14, c12,    s27, c27);  // col 10                       
    full_adder FA28(pp6[3],pp7[2],c13,   s28, c28);  // col 11                       
    full_adder FA29(pp6[4],pp7[3],c14,           s29, c29);  // col 12            
    full_adder FA30(pp6[5],pp7[4],c15,           s30, c30);  // col 13    
    full_adder FA31(pp5[7],pp6[6],pp7[5],   s31, c31);  // col 14 (b7a5+b6a6+b5a7)                            ok
    half_adder HA32(pp6[7],pp7[6],          s32, c32);  //col 13 (b7a6+b6a7)                                  ok
              

    //STAGE-3
    wire s33,  c33;
    wire s34,  c34;
    wire s35,  c35;
    wire s36,  c36;
    wire s37,  c37;
    wire s38,  c38;
    wire s39,  c39;
    wire s40,  c40;
    wire s41,  c41;
    wire s42,  c42;

    half_adder HA33 (s18, c17, s33, c33);
    half_adder HA34 (s19, c18, s34, c34);
    full_adder FA35 (s20, c19, c5, s35, c35);
    full_adder FA36 (s21, s22, c20, s36,  c36);
    full_adder FA37 (s23, s24, c21, s37,  c37);   // c2_6b passes
    full_adder FA38 (s25, c23, s26, s38,  c38);   // c2_7b passes
    full_adder FA39 (s27, s28, c25, s39,  c39);   // c2_8b passes
    full_adder FA40 (s29, c27, s15, s40, c40);
    full_adder HA41 (s16, s30,  s41, c41);
    half_adder HA42 (c16, s31, s42, c42);
 
  

    //STAGE-4
    wire s43,  c43;
    wire s44,  c44;
    wire s45,  c45;
    wire s46,  c46;
    wire s47,  c47;
    wire s48,  c48;
    wire s49,  c49;
    wire s50,  c50;
    wire s51,  c51;
    wire s52,  c52;
    wire s53,  c53;
    

    half_adder HA43 (s34, c33,   s43,  c43);
    half_adder HA44 (s35, c34,   s44,  c44);
    half_adder HA45 (s36,  c35,   s45,  c45);
    full_adder FA46 (s37, c36, c22,          s46, c46);
    full_adder FA47(s38, c37, c24,         s47, c47);
    full_adder FA48(s39, c38, c26,         s48, c48);
    full_adder FA49(s40, c39, c28,         s49, c49);
    full_adder FA50(s41, c40, c29,         s50, c50);
    full_adder FA51(s42, c41, c30,         s51, c51);
    full_adder FA52(s32, c31, c42,         s52, c52);
    half_adder HA53(pp7[7], c32,         s53, c53);
    

    //STAGE-5
wire [11:0] cla_A;
wire [11:0] cla_B;

wire [11:0] cla_P;
wire [11:0] cla_G;
wire [12:0] cla_C;

wire [11:0] cla_S;

assign cla_A = {
    1'b0,
    s53, s52, s51, s50, s49, s48,
    s47, s46, s45, s44, s43
};


assign cla_B = {
    c53, c52, c51, c50, c49, c48,
    c47, c46, c45, c44, c43,
    1'b0
};



assign cla_P = cla_A ^ cla_B;
assign cla_G = cla_A & cla_B;

assign cla_C[0] = 1'b0;



assign cla_C[1] =
        cla_G[0] |
        (cla_P[0] & cla_C[0]);

assign cla_C[2] =
        cla_G[1] |
        (cla_P[1] & cla_G[0]) |
        (cla_P[1] & cla_P[0] & cla_C[0]);

assign cla_C[3] =
        cla_G[2] |
        (cla_P[2] & cla_G[1]) |
        (cla_P[2] & cla_P[1] & cla_G[0]) |
        (cla_P[2] & cla_P[1] & cla_P[0] & cla_C[0]);

assign cla_C[4] =
        cla_G[3] |
        (cla_P[3] & cla_G[2]) |
        (cla_P[3] & cla_P[2] & cla_G[1]) |
        (cla_P[3] & cla_P[2] & cla_P[1] & cla_G[0]) |
        (cla_P[3] & cla_P[2] & cla_P[1] & cla_P[0] & cla_C[0]);

assign cla_C[5] =
        cla_G[4] |
        (cla_P[4] & cla_G[3]) |
        (cla_P[4] & cla_P[3] & cla_G[2]) |
        (cla_P[4] & cla_P[3] & cla_P[2] & cla_G[1]) |
        (cla_P[4] & cla_P[3] & cla_P[2] & cla_P[1] & cla_G[0]) |
        (cla_P[4] & cla_P[3] & cla_P[2] & cla_P[1] &
         cla_P[0] & cla_C[0]);

assign cla_C[6] =
        cla_G[5] |
        (cla_P[5] & cla_G[4]) |
        (cla_P[5] & cla_P[4] & cla_G[3]) |
        (cla_P[5] & cla_P[4] & cla_P[3] & cla_G[2]) |
        (cla_P[5] & cla_P[4] & cla_P[3] & cla_P[2] & cla_G[1]) |
        (cla_P[5] & cla_P[4] & cla_P[3] & cla_P[2] &
         cla_P[1] & cla_G[0]) |
        (cla_P[5] & cla_P[4] & cla_P[3] & cla_P[2] &
         cla_P[1] & cla_P[0] & cla_C[0]);

assign cla_C[7] =
        cla_G[6] |
        (cla_P[6] & cla_G[5]) |
        (cla_P[6] & cla_P[5] & cla_G[4]) |
        (cla_P[6] & cla_P[5] & cla_P[4] & cla_G[3]) |
        (cla_P[6] & cla_P[5] & cla_P[4] & cla_P[3] & cla_G[2]) |
        (cla_P[6] & cla_P[5] & cla_P[4] & cla_P[3] &
         cla_P[2] & cla_G[1]) |
        (cla_P[6] & cla_P[5] & cla_P[4] & cla_P[3] &
         cla_P[2] & cla_P[1] & cla_G[0]) |
        (cla_P[6] & cla_P[5] & cla_P[4] & cla_P[3] &
         cla_P[2] & cla_P[1] & cla_P[0] & cla_C[0]);




wire [3:0] g0, g1, g2;
wire [3:0] p0, p1, p2;
wire [3:0] c0, c1, c2;




assign cla_C[8] =
        cla_G[7] |
        (cla_P[7] & cla_G[6]) |
        (cla_P[7] & cla_P[6] & cla_G[5]) |
        (cla_P[7] & cla_P[6] & cla_P[5] & cla_G[4]) |
        (cla_P[7] & cla_P[6] & cla_P[5] & cla_P[4] & cla_C[4]);

assign cla_C[9] =
        cla_G[8] |
        (cla_P[8] & cla_G[7]) |
        (cla_P[8] & cla_P[7] & cla_G[6]) |
        (cla_P[8] & cla_P[7] & cla_P[6] & cla_G[5]) |
        (cla_P[8] & cla_P[7] & cla_P[6] & cla_P[5] & cla_G[4]) |
        (cla_P[8] & cla_P[7] & cla_P[6] & cla_P[5] &
         cla_P[4] & cla_C[4]);

assign cla_C[10] =
        cla_G[9] |
        (cla_P[9] & cla_G[8]) |
        (cla_P[9] & cla_P[8] & cla_G[7]) |
        (cla_P[9] & cla_P[8] & cla_P[7] & cla_G[6]) |
        (cla_P[9] & cla_P[8] & cla_P[7] & cla_P[6] & cla_G[5]) |
        (cla_P[9] & cla_P[8] & cla_P[7] & cla_P[6] &
         cla_P[5] & cla_G[4]) |
        (cla_P[9] & cla_P[8] & cla_P[7] & cla_P[6] &
         cla_P[5] & cla_P[4] & cla_C[4]);

assign cla_C[11] =
        cla_G[10] |
        (cla_P[10] & cla_G[9]) |
        (cla_P[10] & cla_P[9] & cla_G[8]) |
        (cla_P[10] & cla_P[9] & cla_P[8] & cla_G[7]) |
        (cla_P[10] & cla_P[9] & cla_P[8] & cla_P[7] & cla_G[6]) |
        (cla_P[10] & cla_P[9] & cla_P[8] & cla_P[7] &
         cla_P[6] & cla_G[5]) |
        (cla_P[10] & cla_P[9] & cla_P[8] & cla_P[7] &
         cla_P[6] & cla_P[5] & cla_G[4]) |
        (cla_P[10] & cla_P[9] & cla_P[8] & cla_P[7] &
         cla_P[6] & cla_P[5] & cla_P[4] & cla_C[4]);

assign cla_C[12] =
        cla_G[11] |
        (cla_P[11] & cla_G[10]) |
        (cla_P[11] & cla_P[10] & cla_G[9]) |
        (cla_P[11] & cla_P[10] & cla_P[9] & cla_G[8]) |
        (cla_P[11] & cla_P[10] & cla_P[9] & cla_P[8] & cla_G[7]) |
        (cla_P[11] & cla_P[10] & cla_P[9] & cla_P[8] &
         cla_P[7] & cla_G[6]) |
        (cla_P[11] & cla_P[10] & cla_P[9] & cla_P[8] &
         cla_P[7] & cla_P[6] & cla_G[5]) |
        (cla_P[11] & cla_P[10] & cla_P[9] & cla_P[8] &
         cla_P[7] & cla_P[6] & cla_P[5] & cla_G[4]) |
        (cla_P[11] & cla_P[10] & cla_P[9] & cla_P[8] &
         cla_P[7] & cla_P[6] & cla_P[5] & cla_P[4] & cla_C[4]);



assign cla_S = cla_P ^ cla_C[11:0];


    assign P[0] = pp0[0];
    assign P[1] = s1;
    assign P[2] = s17;
    assign P[3] = s33;
    assign P[15:4] = cla_S;
    

endmodule */
module wallace_tree_8x8(
    input  [7:0]  A,
    input  [7:0]  B,
    output [15:0] P
);

    wire a0b0 = A[0] & B[0]; wire a1b0 = A[1] & B[0]; wire a2b0 = A[2] & B[0]; wire a3b0 = A[3] & B[0]; wire a4b0 = A[4] & B[0]; wire a5b0 = A[5] & B[0]; wire a6b0 = A[6] & B[0]; wire a7b0 = A[7] & B[0];
    wire a0b1 = A[0] & B[1]; wire a1b1 = A[1] & B[1]; wire a2b1 = A[2] & B[1]; wire a3b1 = A[3] & B[1]; wire a4b1 = A[4] & B[1]; wire a5b1 = A[5] & B[1]; wire a6b1 = A[6] & B[1]; wire a7b1 = A[7] & B[1];
    wire a0b2 = A[0] & B[2]; wire a1b2 = A[1] & B[2]; wire a2b2 = A[2] & B[2]; wire a3b2 = A[3] & B[2]; wire a4b2 = A[4] & B[2]; wire a5b2 = A[5] & B[2]; wire a6b2 = A[6] & B[2]; wire a7b2 = A[7] & B[2];
    wire a0b3 = A[0] & B[3]; wire a1b3 = A[1] & B[3]; wire a2b3 = A[2] & B[3]; wire a3b3 = A[3] & B[3]; wire a4b3 = A[4] & B[3]; wire a5b3 = A[5] & B[3]; wire a6b3 = A[6] & B[3]; wire a7b3 = A[7] & B[3];
    wire a0b4 = A[0] & B[4]; wire a1b4 = A[1] & B[4]; wire a2b4 = A[2] & B[4]; wire a3b4 = A[3] & B[4]; wire a4b4 = A[4] & B[4]; wire a5b4 = A[5] & B[4]; wire a6b4 = A[6] & B[4]; wire a7b4 = A[7] & B[4];
    wire a0b5 = A[0] & B[5]; wire a1b5 = A[1] & B[5]; wire a2b5 = A[2] & B[5]; wire a3b5 = A[3] & B[5]; wire a4b5 = A[4] & B[5]; wire a5b5 = A[5] & B[5]; wire a6b5 = A[6] & B[5]; wire a7b5 = A[7] & B[5];
    wire a0b6 = A[0] & B[6]; wire a1b6 = A[1] & B[6]; wire a2b6 = A[2] & B[6]; wire a3b6 = A[3] & B[6]; wire a4b6 = A[4] & B[6]; wire a5b6 = A[5] & B[6]; wire a6b6 = A[6] & B[6]; wire a7b6 = A[7] & B[6];
    wire a0b7 = A[0] & B[7]; wire a1b7 = A[1] & B[7]; wire a2b7 = A[2] & B[7]; wire a3b7 = A[3] & B[7]; wire a4b7 = A[4] & B[7]; wire a5b7 = A[5] & B[7]; wire a6b7 = A[6] & B[7]; wire a7b7 = A[7] & B[7];


    wire s1, c1, s2, c2, s3, c3, s4, c4, s5, c5, s6, c6;
    wire s7, c7, s8, c8, s9, c9, s10, c10, s11, c11, s12, c12;
    wire s13, c13, s14, c14, s15, c15, s16, c16, s17, c17, s18, c18;
    wire s19, c19, s20, c20, s21, c21, s22, c22, s23, c23, s24, c24;
    wire s25, c25, s26, c26, s27, c27, s28, c28, s29, c29, s30, c30;
    wire s31, c31, s32, c32, s33, c33, s34, c34, s35, c35, s36, c36;
    wire s37, c37, s38, c38, s39, c39, s40, c40, s41, c41, s42, c42;
    wire s43, c43, s44, c44, s45, c45, s46, c46, s47, c47, s48, c48;
    wire s49, c49, s50, c50, s51, c51, s52, c52, s53, c53, s54, c54;
    wire s55, c55, s56, c56, s57, c57, s58, c58, s59, c59, s60, c60;
    wire s61, c61, s62, c62, s63, c63, s64, c64;



    // ================= Stage 0 =================
    half_adder HA1(a1b0, a0b1, s1, c1);   
    full_adder FA2(a0b2, a1b1, a2b0, s2, c2);   
    full_adder FA3(a0b3, a1b2, a2b1, s3, c3);   
    full_adder FA4(a0b4, a1b3, a2b2, s4, c4);   
    half_adder HA5(a3b1, a4b0, s5, c5);   
    full_adder FA6(a0b5, a1b4, a2b3, s6, c6);   
    full_adder FA7(a3b2, a4b1, a5b0, s7, c7);   
    full_adder FA8(a0b6, a1b5, a2b4, s8, c8);   
    full_adder FA9(a3b3, a4b2, a5b1, s9, c9);   
    full_adder FA10(a0b7, a1b6, a2b5, s10, c10);  
    full_adder FA11(a3b4, a4b3, a5b2, s11, c11);   
    half_adder HA12(a1b7, a2b6, s12, c12);   
    full_adder FA13(a3b5, a4b4, a5b3, s13, c13);   
    full_adder FA14(a3b6, a4b5, a5b4, s14, c14);   
    full_adder FA15(a3b7, a4b6, a5b5, s15, c15);   
    half_adder HA16(a4b7, a5b6, s16, c16);   



    // ================= Stage 1 =================
    half_adder HA17(s2, c1, s17, c17);   
    full_adder FA18(a3b0, s3, c2, s18, c18);   
    full_adder FA19(s4, s5, c3, s19, c19);   
    full_adder FA20(s6, s7, c4, s20, c20);   
    full_adder FA21( s8, s9,c6, s21, c21);   
    half_adder HA22(a6b0, c7, s22, c22);   
    full_adder FA23(s11, c8, s10, s23, c23);   
    full_adder FA24(a7b0, a6b1, c9, s24, c24);   
    full_adder FA25(s12, c10, s13, s25, c25);   
    full_adder FA26(c11, a6b2, a7b1, s26, c26);   
    full_adder FA27(s14, c12, a2b7, s27, c27);   
    full_adder FA28(c13, a6b3, a7b2, s28, c28);   
    full_adder FA29(a6b4, a7b3, c14, s29, c29);   
    full_adder FA30(a6b5, a7b4, c15, s30, c30);   
    full_adder FA31(a7b5, a6b6, a5b7, s31, c31);   
    half_adder HA32(a7b6, a6b7, s32, c32);   

    // ================= Stage 2 =================
    half_adder HA33(s18, c17, s33, c33);   
    half_adder HA34(s19, c18, s34, c34);   
    full_adder FA35(c5, s20, c19, s35, c35);   
    full_adder FA36(s21, s22, c20, s36, c36);   
    full_adder FA37(s23, s24, c21, s37, c37);   
    full_adder FA38(s25, s26, c23, s38, c38);   
    full_adder FA39(s27, s28, c25, s39, c39);   
    full_adder FA40(s15, s29, c27, s40, c40);   
    half_adder HA41(s16, s30, s41, c41);   
    half_adder HA42(c16, s31, s42, c42);   

    // ================= Stage 3 =================
    half_adder HA43(s34, c33, s43, c43);   
    half_adder HA44(s35, c34, s44, c44);   
    half_adder HA45(s36, c35, s45, c45);   
    full_adder FA46(c22, s37, c36, s46, c46);   
    full_adder FA47(c24, s38, c37, s47, c47);   
    full_adder FA48(c26, s39, c38, s48, c48);   
    full_adder FA49(c28, s40, c39, s49, c49);   
    full_adder FA50(c29, s41, c40, s50, c50);   
    full_adder FA51(c30, s42, c41, s51, c51);  
    full_adder FA52(s32, c31, c42, s52, c52);   
    half_adder HA53(a7b7, c32, s53, c53);   

wire [11:0] cla_A;
wire [11:0] cla_B;

wire [11:0] cla_P;
wire [11:0] cla_G;
wire [12:0] cla_C;

wire [11:0] cla_S;

assign cla_A = {
    1'b0,
    s53, s52, s51, s50, s49, s48,
    s47, s46, s45, s44, s43
};


assign cla_B = {
    c53, c52, c51, c50, c49, c48,
    c47, c46, c45, c44, c43,
    1'b0
};



assign cla_P = cla_A ^ cla_B;
assign cla_G = cla_A & cla_B;

assign cla_C[0] = 1'b0;



assign cla_C[1] =
        cla_G[0] |
        (cla_P[0] & cla_C[0]);

assign cla_C[2] =
        cla_G[1] |
        (cla_P[1] & cla_G[0]) |
        (cla_P[1] & cla_P[0] & cla_C[0]);

assign cla_C[3] =
        cla_G[2] |
        (cla_P[2] & cla_G[1]) |
        (cla_P[2] & cla_P[1] & cla_G[0]) |
        (cla_P[2] & cla_P[1] & cla_P[0] & cla_C[0]);

assign cla_C[4] =
        cla_G[3] |
        (cla_P[3] & cla_G[2]) |
        (cla_P[3] & cla_P[2] & cla_G[1]) |
        (cla_P[3] & cla_P[2] & cla_P[1] & cla_G[0]) |
        (cla_P[3] & cla_P[2] & cla_P[1] & cla_P[0] & cla_C[0]);

assign cla_C[5] =
        cla_G[4] |
        (cla_P[4] & cla_G[3]) |
        (cla_P[4] & cla_P[3] & cla_G[2]) |
        (cla_P[4] & cla_P[3] & cla_P[2] & cla_G[1]) |
        (cla_P[4] & cla_P[3] & cla_P[2] & cla_P[1] & cla_G[0]) |
        (cla_P[4] & cla_P[3] & cla_P[2] & cla_P[1] &
         cla_P[0] & cla_C[0]);

assign cla_C[6] =
        cla_G[5] |
        (cla_P[5] & cla_G[4]) |
        (cla_P[5] & cla_P[4] & cla_G[3]) |
        (cla_P[5] & cla_P[4] & cla_P[3] & cla_G[2]) |
        (cla_P[5] & cla_P[4] & cla_P[3] & cla_P[2] & cla_G[1]) |
        (cla_P[5] & cla_P[4] & cla_P[3] & cla_P[2] &
         cla_P[1] & cla_G[0]) |
        (cla_P[5] & cla_P[4] & cla_P[3] & cla_P[2] &
         cla_P[1] & cla_P[0] & cla_C[0]);

assign cla_C[7] =
        cla_G[6] |
        (cla_P[6] & cla_G[5]) |
        (cla_P[6] & cla_P[5] & cla_G[4]) |
        (cla_P[6] & cla_P[5] & cla_P[4] & cla_G[3]) |
        (cla_P[6] & cla_P[5] & cla_P[4] & cla_P[3] & cla_G[2]) |
        (cla_P[6] & cla_P[5] & cla_P[4] & cla_P[3] &
         cla_P[2] & cla_G[1]) |
        (cla_P[6] & cla_P[5] & cla_P[4] & cla_P[3] &
         cla_P[2] & cla_P[1] & cla_G[0]) |
        (cla_P[6] & cla_P[5] & cla_P[4] & cla_P[3] &
         cla_P[2] & cla_P[1] & cla_P[0] & cla_C[0]);




wire [3:0] g0, g1, g2;
wire [3:0] p0, p1, p2;
wire [3:0] c0, c1, c2;




assign cla_C[8] =
        cla_G[7] |
        (cla_P[7] & cla_G[6]) |
        (cla_P[7] & cla_P[6] & cla_G[5]) |
        (cla_P[7] & cla_P[6] & cla_P[5] & cla_G[4]) |
        (cla_P[7] & cla_P[6] & cla_P[5] & cla_P[4] & cla_C[4]);

assign cla_C[9] =
        cla_G[8] |
        (cla_P[8] & cla_G[7]) |
        (cla_P[8] & cla_P[7] & cla_G[6]) |
        (cla_P[8] & cla_P[7] & cla_P[6] & cla_G[5]) |
        (cla_P[8] & cla_P[7] & cla_P[6] & cla_P[5] & cla_G[4]) |
        (cla_P[8] & cla_P[7] & cla_P[6] & cla_P[5] &
         cla_P[4] & cla_C[4]);

assign cla_C[10] =
        cla_G[9] |
        (cla_P[9] & cla_G[8]) |
        (cla_P[9] & cla_P[8] & cla_G[7]) |
        (cla_P[9] & cla_P[8] & cla_P[7] & cla_G[6]) |
        (cla_P[9] & cla_P[8] & cla_P[7] & cla_P[6] & cla_G[5]) |
        (cla_P[9] & cla_P[8] & cla_P[7] & cla_P[6] &
         cla_P[5] & cla_G[4]) |
        (cla_P[9] & cla_P[8] & cla_P[7] & cla_P[6] &
         cla_P[5] & cla_P[4] & cla_C[4]);

assign cla_C[11] =
        cla_G[10] |
        (cla_P[10] & cla_G[9]) |
        (cla_P[10] & cla_P[9] & cla_G[8]) |
        (cla_P[10] & cla_P[9] & cla_P[8] & cla_G[7]) |
        (cla_P[10] & cla_P[9] & cla_P[8] & cla_P[7] & cla_G[6]) |
        (cla_P[10] & cla_P[9] & cla_P[8] & cla_P[7] &
         cla_P[6] & cla_G[5]) |
        (cla_P[10] & cla_P[9] & cla_P[8] & cla_P[7] &
         cla_P[6] & cla_P[5] & cla_G[4]) |
        (cla_P[10] & cla_P[9] & cla_P[8] & cla_P[7] &
         cla_P[6] & cla_P[5] & cla_P[4] & cla_C[4]);

assign cla_C[12] =
        cla_G[11] |
        (cla_P[11] & cla_G[10]) |
        (cla_P[11] & cla_P[10] & cla_G[9]) |
        (cla_P[11] & cla_P[10] & cla_P[9] & cla_G[8]) |
        (cla_P[11] & cla_P[10] & cla_P[9] & cla_P[8] & cla_G[7]) |
        (cla_P[11] & cla_P[10] & cla_P[9] & cla_P[8] &
         cla_P[7] & cla_G[6]) |
        (cla_P[11] & cla_P[10] & cla_P[9] & cla_P[8] &
         cla_P[7] & cla_P[6] & cla_G[5]) |
        (cla_P[11] & cla_P[10] & cla_P[9] & cla_P[8] &
         cla_P[7] & cla_P[6] & cla_P[5] & cla_G[4]) |
        (cla_P[11] & cla_P[10] & cla_P[9] & cla_P[8] &
         cla_P[7] & cla_P[6] & cla_P[5] & cla_P[4] & cla_C[4]);



assign cla_S = cla_P ^ cla_C[11:0];





assign P[0] = a0b0;
assign P[1] = s1;
assign P[2] = s17;
assign P[3] = s33;


assign P[15:4] = cla_S;
endmodule
