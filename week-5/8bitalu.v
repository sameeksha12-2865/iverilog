module alu_8bit (
    input wire [7:0] A, B,   // 8-bit inputs
    input wire [2:0] ALU_Sel, // ALU operation selector
    output wire [7:0] ALU_Out, // 8-bit ALU output
    output wire CarryOut      // Carry output for addition/subtraction
);
    wire [1:0] alu_out[3:0]; // Array to hold outputs of 2-bit ALUs
    wire carry[3:0];          // Carry outputs from each 2-bit ALU

    // Instantiate four 2-bit ALUs
    alu_2bit alu0 (.A(A[1:0]), .B(B[1:0]), .ALU_Sel(ALU_Sel), .ALU_Out(alu_out[0]), .CarryOut(carry[0]));
    alu_2bit alu1 (.A(A[3:2]), .B(B[3:2]), .ALU_Sel(ALU_Sel), .ALU_Out(alu_out[1]), .CarryOut(carry[1]));
    alu_2bit alu2 (.A(A[5:4]), .B(B[5:4]), .ALU_Sel(ALU_Sel), .ALU_Out(alu_out[2]), .CarryOut(carry[2]));
    alu_2bit alu3 (.A(A[7:6]), .B(B[7:6]), .ALU_Sel(ALU_Sel), .ALU_Out(alu_out[3]), .CarryOut(carry[3]));

    // Combine results from the 2-bit ALUs
    assign ALU_Out = {alu_out[3], alu_out[2], alu_out[1], alu_out[0]};
    assign CarryOut = carry[3]; // Take the carry from the last ALU
endmodule
