module simple_circuit2(A,B,C,D);
output D;
input A,B,C;
wire w1;
and G1(w1,B,C);
or G2(D,A,w1);
endmodule