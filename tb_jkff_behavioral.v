module jk_ff_tb;
    // Declare the signals for the testbench
    reg j_sig, k_sig, clk_sig, reset;
    wire q_sig, qbar_sig;
    // Instantiate the DUT
    jk_ff_behavioral jk_ff_inst (
        .j(j_sig),
        .k(k_sig),
        .clk(clk_sig),
        .reset(reset),
        .q(q_sig),
        .qbar(qbar_sig)
    );
    // Generate the clock signal
    initial
    begin
     clk_sig = 1'b0; 
     reset=0; 
    end
    always #5 clk_sig = ~clk_sig;

    // Stimulate the DUT with test vectors
    initial begin

        // Test case 1: J = 0, K = 0
        j_sig = 0;
        k_sig = 0;
        #10;
        // Test case 2: J = 0, K = 1
        j_sig = 0;
        k_sig = 1;
        #10;
        // Test case 3: J = 1, K = 0
        j_sig = 1;
        k_sig = 0;
        #10;
        reset =1;
        // Test case 4: J = 1, K = 1
        j_sig = 1;
        k_sig = 1;
        #10;
        reset =0;
        // Test case 5: J = 1, K = 1
        j_sig = 1;
        k_sig = 1;
        #10;
        $finish;
    end

endmodule
