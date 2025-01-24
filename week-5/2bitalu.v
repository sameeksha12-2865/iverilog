module alu_2bit (
    input wire [1:0] A, B,  // 2-bit inputs
    input wire [2:0] ALU_Sel, // 3-bit operation selector
    output reg [1:0] ALU_Out, // 2-bit ALU output
    output reg CarryOut       // Carry/borrow output for addition/subtraction
);

    always @(*) begin
        case (ALU_Sel)
            3'b000: {CarryOut, ALU_Out} = A + B; // Addition
            3'b001: {CarryOut, ALU_Out} = A - B; // Subtraction
            3'b010: ALU_Out = A & B;             // AND
            3'b011: ALU_Out = A | B;             // OR
            3'b100: ALU_Out = A ^ B;             // XOR
            default: ALU_Out = 2'b00;            // Default case
        endcase
    end
endmodule
