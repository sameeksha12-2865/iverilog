module tb_alu_8bit;

    // Testbench signals
    reg [7:0] A, B;          // 8-bit inputs A and B
    reg [2:0] ALU_Sel;       // 3-bit ALU operation selector
    wire [7:0] ALU_Out;      // ALU output
    wire CarryOut;           // Carry/borrow output

    // Instantiate the 8-bit ALU module
    alu_8bit uut (
        .A(A),
        .B(B),
        .ALU_Sel(ALU_Sel),
        .ALU_Out(ALU_Out),
        .CarryOut(CarryOut)
    );

    // VCD file generation
    initial begin
        $dumpfile("alu_8bit_test.vcd");  // Specifies the VCD file name
        $dumpvars(0, tb_alu_8bit);       // Dumps all variables
    end

    // Test sequence
    initial begin
        // Initialize values
        A = 8'b00000000; B = 8'b00000000; ALU_Sel = 3'b000;

        // Test 1: Addition
        #10 A = 8'b00001111; B = 8'b00000001; ALU_Sel = 3'b000; // A + B = 16
        #10 $display("Addition: A = %b, B = %b, ALU_Out = %b, CarryOut = %b", A, B, ALU_Out, CarryOut);
        
        // Test 2: Subtraction
        #10 A = 8'b00001111; B = 8'b00000001; ALU_Sel = 3'b001; // A - B = 14
        #10 $display("Subtraction: A = %b, B = %b, ALU_Out = %b, CarryOut = %b", A, B, ALU_Out, CarryOut);
        
        // Test 3: AND
        #10 A = 8'b10101010; B = 8'b01010101; ALU_Sel = 3'b010; // A & B = 0
        #10 $display("AND: A = %b, B = %b, ALU_Out = %b", A, B, ALU_Out);

        // Test 4: OR
        #10 A = 8'b10101010; B = 8'b01010101; ALU_Sel = 3'b011; // A | B = 11111111
        #10 $display("OR: A = %b, B = %b, ALU_Out = %b", A, B, ALU_Out);
        
        // Test 5: XOR
        #10 A = 8'b10101010; B = 8'b01010101; ALU_Sel = 3'b100; // A ^ B = 11111111
        #10 $display("XOR: A = %b, B = %b, ALU_Out = %b", A, B, ALU_Out);

        // End of test
        #10 $finish;
    end
endmodule
