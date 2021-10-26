// Full Adder/Subtractor template
module fas (
    input logic a,           // Input bit a
    input logic b,           // Input bit b
    input logic cin,         // Carry in
    input logic a_ns,        // A_nS (add/not subtract) control
    output logic s,          // Output S
    output logic cout        // Carry out
);

logic out1, out2, out3, out4, out5, out6, out8, out9, out10, out11;

XOR2 #(.Tpdhl(2), .Tpdlh(1)) g1 (
    .Z(out1), .A(a), .B(a_ns));

XOR2 #(.Tpdhl(2), .Tpdlh(1)) g6 (
    .Z(out6), .A(b), .B(cin));

XOR2 #(.Tpdhl(2), .Tpdlh(1)) g7 (
    .Z(s), .A(out6), .B(a));

NOT #(.Tpdhl(7), .Tpdlh(10)) g3 (
    .Z(out3), .A(b));

NOT #(.Tpdhl(7), .Tpdlh(10)) g4 (
    .Z(out4), .A(cin));

NOT #(.Tpdhl(7), .Tpdlh(10)) g5 (
    .Z(out5), .A(out2));
    
NOT #(.Tpdhl(7), .Tpdlh(10)) g10 (
    .Z(out10), .A(out8));
    
NOT #(.Tpdhl(7), .Tpdlh(10)) g11 (
    .Z(out11), .A(out9));

OR2 #(.Tpdhl(3), .Tpdlh(2)) g2 (
    .Z(out2), .A(b), .B(cin));

OR2 #(.Tpdhl(3), .Tpdlh(2)) g8 (
    .Z(out8), .A(out1), .B(out5));

OR2 #(.Tpdhl(3), .Tpdlh(2)) g9 (
    .Z(out9), .A(out3), .B(out4));

OR2 #(.Tpdhl(3), .Tpdlh(2)) g12 (
    .Z(cout), .A(out10), .B(out11));
    
endmodule
