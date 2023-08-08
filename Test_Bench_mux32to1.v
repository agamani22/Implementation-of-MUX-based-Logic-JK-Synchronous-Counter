module mux_32to1_tb;
    // Inputs
    reg [31:0] inp;  // 32 input signals
    reg [4:0] sel;  // Selection signal (5 bits for 32 inputs)
    // Outputs
    wire out;
    // Instantiate the 32-to-1 MUX module
    mux_32to1 uut(
        .out(out),
        .inp(inp),
        .sel(sel)
    );
integer i,j;
    initial 
    begin
      // Test case 1: Select input 0, all inputs are 0
        inp = 32'h0000_0000;
        sel = 0;
        #10;
        // Test case 2: Select input 31, all inputs are 1
        inp = 32'hFFFF_FFFF;
        sel = 31;
        #10;
        // Test cases: random Select, random 15 inputs
        for(j=0; j<15;j=j+1)
        begin
        for (i = 0; i < 32; i=i+1) 
        begin
            inp[i] = $random;
            sel = $random %32;
        end
        #10;
        end
        $finish;
    end

endmodule
