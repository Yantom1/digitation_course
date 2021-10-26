// Full Adder/Subtractor test bench template
module fas_test;
    
    //Gate outputs
    logic  fas_s;
    logic fas_cout;
    
    // Gate inputs
    logic fas_a;
    logic fas_b;
    logic fas_cin;
    logic fas_a_ns;

fas uut (.a(fas_a), .b(fas_b), .cin(fas_cin), .a_ns(fas_a_ns), .s(fas_s), .cout(fas_cout));


initial begin
    fas_a = 1'b0;
    fas_b = 1'b0;
    fas_cin = 1'b0;
    fas_a_ns = 1'b0;
    //testing
    #70
    fas_a = 1'b1; 
    #70
    fas_a = 1'b0; 
    //more tests
    #500
    fas_b = 1'b1; 
    #500
    fas_cin = 1'b1; 
    #500
    fas_a = 1'b1; 
    #500
    fas_cin = 1'b0; 
    #500
    fas_a_ns = 1'b1; 
    #500
    fas_b = 1'b1;
    #500
    fas_cin = 1'b1;
    #500
    fas_b = 1'b0;
    #500
    fas_a = 1'b0; 
    #500
    fas_cin = 1'b0;
end

endmodule
