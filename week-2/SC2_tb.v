module tb_simple_circuit2;
reg A, B, C;
wire D;
simple_circuit2 m1(A,B,C,D);

initial
begin
#0 A=1'b0; B=1'b0; C=1'b0;
#5 A=1'b0; B=1'b0; C=1'b1;
#5 A=1'b0; B=1'b1; C=1'b0;
#5 A=1'b0; B=1'b1; C=1'b1;
#5 A=1'b1; B=1'b0; C=1'b0;
#5 A=1'b1; B=1'b0; C=1'b1;
#5 A=1'b1; B=1'b1; C=1'b0;
#5 A=1'b1; B=1'b1; C=1'b1;
#5;
end

initial
begin
$monitor($time, " A=%b, B=%b, C=%b, D=%b", A, B, C, D);
end
initial
begin
$dumpfile ("tb_simple_circuit2.vcd");
$dumpvars(0,m1);
end
endmodule