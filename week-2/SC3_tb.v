module tb_complex_circuit;
reg A2, B2, C2;
wire Z;
complex_circuit m1(A2,B2,C2,Z);

initial
begin
#0 A2=1'b0; B2=1'b0; C2=1'b0;
#5 A2=1'b0; B2=1'b0; C2=1'b1;
#5 A2=1'b0; B2=1'b1; C2=1'b0;
#5 A2=1'b0; B2=1'b1; C2=1'b1;
#5 A2=1'b1; B2=1'b0; C2=1'b0;
#5 A2=1'b1; B2=1'b0; C2=1'b1;
#5 A2=1'b1; B2=1'b1; C2=1'b0;
#5 A2=1'b1; B2=1'b1; C2=1'b1;
#5;
end

initial
begin
$monitor($time, " A2=%b, B2=%b, C2=%b, Z=%b", A2, B2, C2, Z);
end
initial
begin
$dumpfile ("tb_complex_circuit.vcd");
$dumpvars (0, m1);
end
endmodule