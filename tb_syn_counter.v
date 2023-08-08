module testbench();
 //declare two variables clk and reset as registers, and one variable count as a 4-bit wire.

    reg clk, reset;
    wire [3:0] count;
   //connects its input and output ports to the variables declared earlier
    up_counter dut(.clk(clk), .reset(reset), .count(count));
//This block of code is executed only once at the beginning of the simulation. It initializes clk to 0 and then, after a delay of 10 time units, sets reset to 1.
    initial begin
        clk = 0;
       #10 reset = 1;
    end
// toggles clk every 5 time units.
    always #5 clk = ~clk;
// it waits for another 200 time units before terminating the simulation with $finish.

    initial begin
        #20 reset = 0;
        #180 reset =1;
        #200 $finish;
    end

endmodule
