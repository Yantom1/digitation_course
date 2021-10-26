module OR2 (
    input logic A,
    input logic B,
    output logic Z
);

parameter Tpdlh = 1;
parameter Tpdhl = 1;

or #(Tpdlh, Tpdhl) or1 (Z, A, B);

endmodule
