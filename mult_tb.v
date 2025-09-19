`timescale 1ns/1ps


module mult_tb;

reg [2:0] a, b;
reg clk, init;
wire [5:0] result;
wire done;

mult uut (
    .a(a),
    .b(b),
    .clk(clk),
    .init(init),
    .result(result),
    .done(done)
);

initial begin
    $dumpfile("mult.vcd");
    $dumpvars(0, mult_tb);
end

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    a = 3'b011;
    b = 3'b101;
    init = 1;
    #10;
    init = 0;
    #200;
    a = 3'b111;
    b = 3'b111;
    #200;
    init = 1;
    #10;
    init = 0;
    #200;
    $finish;
end

endmodule


