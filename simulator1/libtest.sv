/************************************************************************
 * Example testbench: instantiates 4 basic logic gates and applies      *
 * stimulus to the gate inputs.                                         *
 ************************************************************************/
module libtest;
    // Signal declarations
    // Gate output wires
    logic z1;
    logic z2;
    logic z3;

    // Gate inputs
    logic a;
    logic b;

    // The testbench: try different input combinations at different points
    // of time - change values every 10 time units.
    initial begin
        a = 1'b0;
        b = 1'b0;

        #10;
        a = 1'b1;

        #10;
        b = 1'b1;

        #10
        $stop;
    end

    // Gate instantiations
    // For this gate we override the default delays with: Tpdlh=5 and Tpdhl=7
    NOT #(
        .Tpdlh(5),
        .Tpdhl(7)
    ) not_inst (
        .Z(z1),
        .A(a),
    );

    // All the other gates stay with default (unit) delays, coded inside their
    // respective module definitions.
    OR2 or2_inst (
        .Z(z2),
        .A(a),
        .B(b)
    );
    XOR2 xor2_inst (
        .Z(z3),
        .A(a),
        .B(b)
    );

endmodule
