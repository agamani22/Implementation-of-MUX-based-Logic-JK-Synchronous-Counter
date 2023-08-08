module jkff_test;
reg J,K, clk;
wire Q, QBAR;
//2. Instantiate the module we want to test. We have instantiated the jkff_behavior
jkff_structural dut(.q(Q), .qbar(QBAR), .j(J), .k(K), .clk(clk)); // instantiation by port name.

//4. apply test vectors
initial begin
  clk=0;
     forever #10 clk = ~clk;  
end 
initial begin 
 J= 1; K= 0;
 #100; J= 0; K= 1; 
 #100; J= 0; K= 0; 
 #100; J= 1; K=1; 
end 
endmodule
