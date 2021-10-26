// 64-bit ALU test bench template
module alu64bit_test;

    //Gate inputs
    logic [63:0] alu_a;    
    logic [63:0] alu_b;   
    logic alu_cin;     
    logic [1:0] alu_op;

    //Gate outputs    
    logic [63:0] alu_s;   
    logic alu_cout;   

alu64bit uut (.a(alu_a), .b(alu_b), .cin(alu_cin), .op(alu_op), .s(alu_s), .cout(alu_cout));

genvar i; 

initial begin
    alu_op = 2'b10;
    alu_cin = 1'b0;
    alu_a = 64'b1111111111111111111111111111111111111111111111111111111111111111;
    alu_b = 64'b0000000000000000000000000000000000000000000000000000000000000000; 
    #1700
    alu_b[0] = 1'b1;
    //more tests
    #3000
    alu_a = 64'b0111110111111011111111111011111101111111111111111011111101111101;
    alu_b = 64'b0100001100000011110011111110111100100000011000011111000111000011; 
    #3000 //answer: 1100 0000 1111 1111 1100 1111 1010 1110 1010 0000 0110 0001 1011 0001 0100 0000
    alu_op = 2'b11;
    #1700 //answer: 0011 1010 1111 1000 0010 1111 1101 0000 0101 1111 1001 1101 1100 1101 1011 1010
    alu_op = 2'b00;
    #1700 //answer: 1000 0000 0000 0100 0000 0000 0000 0000 1000 0000 0000 0000 0000 0000 0000 0000
    alu_op = 2'b01;
        //answer: 0011 1110 1111 1000 0011 0000 0101 0000 0101 1111 1001 1110 0100 1110 1011 1110
                  
end

endmodule