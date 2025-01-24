module tb;
    reg [3:0] i0, i1;
    reg cin;
    wire [3:0] o;
    wire cout;
    reg [8:0] test_vecs [0:9]; 
    integer i;

    rca_4bit u0 (.a(i0), .b(i1), .cin(cin), .sum(o), .cout(cout));

    initial begin
        $dumpfile("rca_test.vcd");
        $dumpvars(0, tb);
    end

    initial begin
        test_vecs[0] = 9'b000000000;
        test_vecs[1] = 9'b000000001;
        test_vecs[2] = 9'b000100010;
        test_vecs[3] = 9'b000100011;
        test_vecs[4] = 9'b001000100;
        test_vecs[5] = 9'b001000101;
        test_vecs[6] = 9'b101010110;
        test_vecs[7] = 9'b101010111;
        test_vecs[8] = 9'b111011110;
        test_vecs[9] = 9'b111011111;
    end

    initial begin
        {i0, i1, cin} = 0;
        for (i = 0; i < 10; i = i + 1) begin
            #10 {i0, i1, cin} = test_vecs[i];
        end
        #100 $finish;
    end

    always @(i0 or i1 or cin) begin
        $monitor("At time = %t, i0=%b, i1=%b, cin=%b, Sum = %b, Carry = %b", 
                  $time, i0, i1, cin, o, cout);
    end
endmodule
