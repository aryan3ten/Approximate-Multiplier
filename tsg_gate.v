module tsg_gate (A,B,C,D,P,Q,R,S);
  
  input A,B,C,D;
  output P,Q,R,S;
  
  assign P = A;
  assign Q = ((~A)&(~C))^(~B);
  assign R = (((~A)&(~C))^(~B))^D;
  assign S = ((((~A)&(~C))^(~B))&D)^((A&B)^C);
  
  
endmodule