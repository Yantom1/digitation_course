// 32X32 Multiplier test template
module mult32x32_fast_test;

    logic clk;            // Clock
    logic reset;          // Reset
    logic start;          // Start signal
    logic [31:0] a;       // Input a
    logic [31:0] b;       // Input b
    logic busy;           // Multiplier busy indication
    logic [63:0] product; // Miltiplication product


mult32x32_fast uut(
    .clk(clk),      
    .reset(reset),         
    .start(start),         
    .a(a),      
    .b(b),      
    .busy(busy),          
    .product(product)
);

always begin
    #5
    clk = ~clk;
end

initial begin
    start = 1'b0;
    reset = 1'b1;
    clk = 1'b1;
    repeat(4) begin
		@(posedge clk);
	end
    reset = 1'b0;
    a = 313552739;
    b = 207231267;

    @(posedge clk);
    start = 1'b1;

    @(posedge clk);
    start = 1'b0;
 
    @(negedge busy);
    @(posedge clk);
    a = 32'b00000000000000000110111101100011;
    b = 32'b00000000000000000001100100100011;

    @(posedge clk);
    
    start = 1'b1;

    @(posedge clk);
    start = 1'b0;
 
    @(negedge busy);
/*
    @(posedge clk);
    // a 1 b 0
    a = 32'b00000000000000000110111101100011;
    b = 32'b01111111111111110001100100100011;

    @(posedge clk);
    start = 1'b1;

    @(posedge clk);
    start = 1'b0;
 
    @(negedge busy);

    @(posedge clk);
    // a 0 b 1
    a = 32'b11111111111111110110111101100011;
    b = 32'b00000000000000000001100100100011;

    @(posedge clk);
    start = 1'b1;

    @(posedge clk);
    start = 1'b0;
 
    @(negedge busy);
    // a 1 b 0
    @(posedge clk);
    a = 32'b00000000111111111110111101100011;
    b = 32'b00001000011111100001100100100011;

    @(posedge clk);
    start = 1'b1;

    @(posedge clk);
    start = 1'b0;
 
    @(negedge busy);*/

end

endmodule
