module dkg_gate(A,B,C,D,P,Q,R,S);

  input A,B,C,D;
  output P,Q,R,S;
  
  assign P = B;
  assign Q = (~A&C)|(A&~D);
  assign R = (A^B)&(C^D)^(C&D);
  assign S = B^C^D;

endmodule