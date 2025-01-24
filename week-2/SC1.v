module simple_circuit (A,B,C,D,E);
output D, E;
input A, B, C;
wire W1;
and G1(W1, A, B);
not G2(E, C);
or G3(D, W1, E);
endmodule