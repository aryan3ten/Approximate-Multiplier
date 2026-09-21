module mtsg_gate (
    input  A,B,C,D,
    output P,Q,R,S
);

    assign P = A;
    assign Q = A ^ B;
    assign R = A ^ B ^ C;
    assign S = ((A ^ B) & C) ^ (A & B) ^ D;

endmodule