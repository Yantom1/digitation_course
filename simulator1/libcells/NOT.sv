module NOT (
    input logic A,
    output logic Z
);

parameter Tpdlh = 1;
parameter Tpdhl = 1;

not #(Tpdlh, Tpdhl) not1 (Z, A);

endmodule
