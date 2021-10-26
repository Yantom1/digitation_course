// 32X32 Multiplier arithmetic unit template
module mult32x32_fast_arith (
    input logic clk,             // Clock
    input logic reset,           // Reset
    input logic [31:0] a,        // Input a
    input logic [31:0] b,        // Input b
    input logic [1:0] a_sel,     // Select one byte from A
    input logic b_sel,           // Select one 2-byte word from B
    input logic [2:0] shift_sel, // Select output from shifters
    input logic upd_prod,        // Update the product register
    input logic clr_prod,        // Clear the product register
    output logic a_msb_is_0,     // Indicates MSB of operand A is 0
    output logic b_msw_is_0,     // Indicates MSW of operand B is 0
    output logic [63:0] product  // Miltiplication product
);

logic [7:0] a_out;
logic [15:0] b_out;
logic [23:0] mult_to_shifter;
logic [63:0] shifter_to_adder;
logic [63:0] adder;

always_comb begin
    a_msb_is_0 = 1'b0;
    b_msw_is_0 = 1'b0;
    if(a[31:24] == 0) begin
        a_msb_is_0 = 1'b1;
    end 
    if (b[31:16] == 0) begin
        b_msw_is_0 = 1'b1;
    end 
end

// mux A
always_comb begin
    case (a_sel)
        2'b00: begin
            a_out = a[7:0];
        end 
        2'b01: begin
            a_out = a[15:8];
        end 
        2'b10: begin
            a_out = a[23:16];
        end 
        2'b11: begin
            a_out = a[31:24];
        end 
    endcase
end

// mux B
always_comb begin
    case (b_sel)
        1'b0: begin
            b_out = b[15:0];
        end 
        1'b1: begin
            b_out = b[31:16];
        end 
    endcase
end

// multi and shift
always_comb begin
    mult_to_shifter = a_out*b_out;
    case (shift_sel)
        3'b001: begin
            shifter_to_adder = mult_to_shifter << 8;
        end 
        3'b010: begin
            shifter_to_adder = mult_to_shifter << 16;
        end 
        3'b011: begin
            shifter_to_adder = mult_to_shifter << 24;
        end 
        3'b100: begin
            shifter_to_adder = mult_to_shifter << 32;
        end 
        3'b101: begin
            shifter_to_adder = mult_to_shifter << 40;
        end
        default: begin
            shifter_to_adder = mult_to_shifter;
        end 
    endcase
    adder = product + shifter_to_adder;
end

// add 
always_ff @(posedge clk, posedge reset) begin
    if (reset == 1'b1) begin
       product <= 64'b0;
    end
    else begin
        if(clr_prod == 1'b1) begin
            product <= 64'b0;
        end 
        else if(upd_prod == 1'b1) begin
            product <= adder;  
        end
    end
end

endmodule
