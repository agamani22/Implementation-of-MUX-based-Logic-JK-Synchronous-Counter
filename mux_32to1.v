module mux_32to1(out,inp,sel); //Defines module for 32*1 mux with 3 ports 
input [31:0] inp;//Defines 32 bit input bus 
input [4:0] sel; //5 bit input bus for the select lines 
output out; // main output 
wire [15:0] y; //Declares a 16-bit wire bus named "y" represents first stage outputs
wire [7:0] x; //declares an 8-bit wire bus named "x" represents second stage outputs
wire [3:0] m; //declares a 4-bit wire bus named "m" represents third stage outputs
wire l0,l1; //declares two single-bit wires named "l0" and "l1" represents fourth stage outputs
genvar i; // generate a variable
//generates 16 instances of a 2-to-1 multiplexer named "inst0"
generate for(i=0;i<16;i=i+1) 
   begin
   mux_2to1 inst0(y[i],inp[2*(i)+1],inp[2*i],sel[0]);
   end 
   endgenerate
//generates 8 instances of a 2-to-1 multiplexer named "inst1"
generate for(i=0;i<8;i=i+1)
   begin
   mux_2to1 inst1(x[i],y[2*(i)+1],y[2*i],sel[1]);
   end 
   endgenerate
//generates 4 instances of a 2-to-1 multiplexer named "inst2"
generate for(i=0;i<4;i=i+1)
   begin
   mux_2to1 inst2(m[i],x[2*(i)+1],x[2*i],sel[2]);
   end 
   endgenerate
//instantiates a 2-to-1 multiplexer named m1,m2,m3
mux_2to1 m1(l0,m[1],m[0],sel[3]);
mux_2to1 m2(l1,m[3],m[2],sel[3]);
mux_2to1 m3(out,l1,l0,sel[4]);
endmodule



// instantiated module
module mux_2to1(OUT,I1,I0,Sel);
input I0,I1,Sel;
output OUT;
wire Sel_n;
wire y0,y1;
not(Sel_n,Sel);
nand(y0,I0,Sel_n);
nand(y1,I1,Sel);
nand(OUT,y0,y1);
endmodule

