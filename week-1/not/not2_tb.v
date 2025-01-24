module not2_test;
reg a;wire y;
not2 not2_test(y,a);
initial 
begin
#0 a=0;
#5 a=1;
end 
initial 
begin

$monitor($time,"a=%b,y=%b",a,y);end
initial 
begin 
$dumpfile("not2_test.vcd");
$dumpvars(0,not2_test);
end
endmodule