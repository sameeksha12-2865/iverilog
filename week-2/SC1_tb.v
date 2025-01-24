module tb_simple_circuit;
reg A, B, C;
wire D, E;
simple_circuit m1(A,B,C,D,E);

initial
begin
#0 A=0;B=0;C=0;
#5 A=0;B=0;C=1;
#5 A=0;B=1;C=0;
#5 A=0;B=1;C=1;
#5 A=1;B=0;C=0;
#5 A=1;B=0;C=1;
#5 A=1;B=1;C=0;
#5 A=1;B=1;C=1;
#5;
end

initial
begin
$monitor($time, " A=%b, B=%b, C=%b, D=%b, E=%b", A, B, C, D, E);
end
initial
begin
$dumpfile ("tb_simple_circuit.vcd");
$dumpvars (0, m1);
end
endmodule