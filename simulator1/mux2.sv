// 2->1 multiplexer template
module mux2 (
    input logic d0,          // Data input 0
    input logic d1,          // Data input 1
    input logic sel,         // Select input
    output logic z           // Output
);

logic out1, out2, out3, out4, out5, out6, out7;

NOT #(.Tpdhl(7), .Tpdlh(10)) g1 (
    .Z(out1), .A(d0));

NOT #(.Tpdhl(7), .Tpdlh(10)) g2 (
    .Z(out2), .A(d1));

NOT #(.Tpdhl(7), .Tpdlh(10)) g3 (
    .Z(out3), .A(sel));

OR2 #(.Tpdhl(3), .Tpdlh(2)) g4 (
    .Z(out4), .A(out1), .B(sel));

OR2 #(.Tpdhl(3), .Tpdlh(2)) g5 (
    .Z(out5), .A(out2), .B(out3));

NOT #(.Tpdhl(7), .Tpdlh(10)) g6 (
    .Z(out6), .A(out4));

NOT #(.Tpdhl(7), .Tpdlh(10)) g7 (
    .Z(out7), .A(out5));

OR2 #(.Tpdhl(3), .Tpdlh(2)) g8 (
    .Z(z), .A(out6), .B(out7));

endmodule
