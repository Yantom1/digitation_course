// 1-bit ALU template
module alu1bit (
    input logic a,           // Input bit a
    input logic b,           // Input bit b
    input logic cin,         // Carry in
    input logic [1:0] op,    // Operation
    output logic s,          // Output S
    output logic cout        // Carry out
);

logic out_nor, out_nor_not, out_xor, out_s, a_ns;

OR2 #(.Tpdhl(3), .Tpdlh(2)) NOR_or (
    .Z(out_nor_or), .A(a), .B(b));

NOT #(.Tpdhl(7), .Tpdlh(10)) NOR_not (
    .Z(out_nor), .A(out_nor_or));

NOT #(.Tpdhl(7), .Tpdlh(10)) NOT_op0 (
    .Z(a_ns), .A(op[0]));

XOR2 #(.Tpdhl(2), .Tpdlh(1)) xor_inst (
    .Z(out_xor), .A(a), .B(b));

fas fas_alu( 
    .a(a), .b(b), .cin(cin), .a_ns(a_ns), .s(out_s), .cout(cout));

mux4 mux_alu(
    .d0(out_nor), .d1(out_xor), .d2(out_s), .d3(out_s), .sel(op), .z(s)
);

endmodule
