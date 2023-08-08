module jkff_structural(q,qbar,clk,j,k);
input j,k,clk;
output q,qbar;
wire nand1_out; // output from nand1
wire nand2_out; // output from nand2
//temporary wires
wire x,xbar,y,ybar;
wire a,b,c,d;
assign a =1'b0;// assumed previous state of q as '0'
assign b=1'b1;// assumed previous state of qbar as '1'
nand(x,clk,b);
not(xbar,x);
nand(nand1_out,j,xbar);//nand1
nand(y,clk,a);
not(ybar,y);
nand(nand2_out,k,ybar);//nand2
nand(c,b,nand1_out);//nand3
nand(d,a,nand2_out);//nand4
assign q = c; 
assign qbar =~q; 
endmodule