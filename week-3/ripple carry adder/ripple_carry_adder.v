module fulladd(input wire a, b, cin, output wire sum, cout);
    wire [4:0] t;

    xor x0(t[0], a, b);
    xor x1(sum, t[0], cin);

    and a0(t[1], a, b);
    and a1(t[2], a, cin);
    and a2(t[3], b, cin);

    or o0(t[4], t[1], t[2]);
    or o1(cout, t[3], t[4]);
endmodule

module rca_4bit(input wire [3:0] a, b, input wire cin, output wire [3:0] sum, output wire cout);
    wire c1, c2, c3;

    fulladd fa0 (.a(a[0]), .b(b[0]), .cin(cin),  .sum(sum[0]), .cout(c1));
    fulladd fa1 (.a(a[1]), .b(b[1]), .cin(c1), .sum(sum[1]), .cout(c2));
    fulladd fa2 (.a(a[2]), .b(b[2]), .cin(c2), .sum(sum[2]), .cout(c3));
    fulladd fa3 (.a(a[3]), .b(b[3]), .cin(c3), .sum(sum[3]), .cout(cout));
endmodule
