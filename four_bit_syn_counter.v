//The inputs are clk, reset, and four JK flip-flop inputs (j and k), and the output is a 4-bit count register.
module up_counter(
    input clk, reset,
    output reg [3:0] count
);
  //Declare four wires (q0, q1, q2, q3) to store the outputs of the four JK flip-flops
    integer i =1;
    wire q0, q1, q2, q3;
    wire qbar0, qbar1, qbar2, qbar3;
    wire x,y;
    and a1(x,q0,q1);
    and a2(y,q0,q1,q2);
    //These four lines declare four instances of the JK flip-flop and connect their inputs and outputs to the wires and signals declared earlier.
    jk_ff_beh u0 (.j(i),.k(i), .clk(clk), .reset(reset), .q(q0), .qbar(qbar0));
    jk_ff_beh u1 (.j(q0), .k(q0), .clk(clk), .reset(reset), .q(q1), .qbar(qbar1));
    jk_ff_beh u2 (.j(x), .k(x), .clk(clk), .reset(reset), .q(q2), .qbar(qbar2));
    jk_ff_beh u3 (.j(y), .k(y), .clk(clk), .reset(reset), .q(q3), .qbar(qbar3));
//This always block is triggered on the rising edge of the clock or when the reset signal goes high
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            count <= 0;
        end else begin
            count <= {q3, q2, q1, q0};
        end
    end

endmodule

//instantiated module
module jk_ff_beh(
    input j,k, clk, reset,
    output reg q,
    output reg qbar
);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            q <= 0;
            qbar <= ~q;
        end else begin
            if (j && k) begin
                q <= qbar;
                qbar <= q;
            end else if (j) begin
                q <= 1;
                qbar <= 0;
            end else if (k) begin
                q <= 0;
                qbar <= 1;
            end
        end
    end

endmodule
