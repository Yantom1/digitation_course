module XOR2 (
    input logic A,
    input logic B,
    output logic Z
);

parameter Tpdlh = 1;
parameter Tpdhl = 1;

xor #(Tpdlh, Tpdhl) xor1 (Z, A, B);

endmodule
