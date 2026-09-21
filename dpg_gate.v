module dpg_gate(A,B,C,D,P,Q,R,S);
  
  input A,B,C,D;
  output P,Q,R,S;
  
  assign P = A;
  assign Q = A^B;
  assign R = A^B^D;
  assign S = ((A^B)&D)^(A&B)^C;


endmodule