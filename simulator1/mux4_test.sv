// 4->1 multiplexer test bench template
module mux4_test;
    logic mux4_d0;
    logic mux4_d1;
    logic mux4_d2;
    logic mux4_d3;
    logic [1:0] mux4_sel;
    logic mux4_z;

    mux4 uut (
        .d0(mux4_d0), .d1(mux4_d1), .d2(mux4_d2), .d3(mux4_d3), .sel(mux4_sel), .z(mux4_z)
    );

    initial begin
        mux4_d0 = 1'b0;
        mux4_d1 = 1'b1;
        mux4_d2 = 1'b1;
        mux4_d3 = 1'b1;
        mux4_sel = 2'b00;
        //mux4_sel[1] = 1'b0;
        #70
        mux4_d0 = 1'b1; //out 1
        #70
        mux4_d0 = 1'b0; //out 0
        //more tests
        #500
        mux4_d1 = 1'b0; //out 0
        #500
        mux4_sel = 2'b01; //out 0
        #500
        mux4_d1 = 1'b1; //out 1
        #500
        mux4_d3 = 1'b0; //out 1
        #500
        mux4_sel = 2'b11; //out 0
        #500
        mux4_sel = 2'b10; //out 1
         #500
        mux4_d2 = 1'b0; //out o

    end

        
endmodule
