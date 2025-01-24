module complex_circuit(A2,B2,C2,Z);
output Z;
input A2,B2,C2;
wire w1,w2,w3;
and G1(w1,B2,C2);
and G2(w2,A2,B2);
or G3(w3,A2,w1);
or G4(Z,w3,w2);
endmodule