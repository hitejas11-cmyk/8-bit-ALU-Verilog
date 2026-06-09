`timescale 1ns/1ps

module alu_tb;

reg [7:0] A;
reg [7:0] B;
reg [2:0] sel;

wire [7:0] Y;
wire Carry;
wire Zero;

alu_8bit uut (
    .A(A),
    .B(B),
    .sel(sel),
    .Y(Y),
    .Carry(Carry),
    .Zero(Zero)
);

initial begin

    $display("Starting ALU Test");

    A = 8'd20;
    B = 8'd10;

    sel = 3'b000; #10; // ADD
    sel = 3'b001; #10; // SUB
    sel = 3'b010; #10; // AND
    sel = 3'b011; #10; // OR
    sel = 3'b100; #10; // XOR
    sel = 3'b101; #10; // NOT
    sel = 3'b110; #10; // SHIFT LEFT
    sel = 3'b111; #10; // SHIFT RIGHT

    A = 8'd255;
    B = 8'd1;
    sel = 3'b000; #10; // Overflow Test

    $finish;

end

initial begin
    $monitor("Time=%0t A=%d B=%d sel=%b Y=%d Carry=%b Zero=%b",
              $time,A,B,sel,Y,Carry,Zero);
end

endmodule
