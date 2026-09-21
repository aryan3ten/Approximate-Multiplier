module hng_gate (
    input  A,
    input   B,
    input   C,
    input   D,

    output  P,
    output  Q,
    output  R,
    output  S
);

    assign P = A;

    assign Q = B;

    assign R = A ^ B ^ C;

    assign S = ((A ^ B) & C) ^ (A & B) ^ D;

endmodule