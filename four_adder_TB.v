`timescale 1ns / 1ps

module four_adder_tb;

    reg [3:0] a;
    reg [3:0] b;
    reg cin;
    wire [3:0] sum;
    wire carry;

    four_adder uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .carry(carry)
    );

   initial begin
    $display("Simulación iniciada");

    a = 4'b0010; 
    b = 4'b0010;
    
    cin = 1;
    #10;
    $display("Caso 1: a = %b, b = %b, cin = %b --> sum = %b, carry = %b", a, b, cin, sum, carry);

    a = 4'b0101;
    b = 4'b0010;
    cin = 0;
    #10;
    $display("Caso 2: a = %b, b = %b, cin = %b --> sum = %b, carry = %b", a, b, cin, sum, carry);
    a = 4'b0001;
    b = 4'b0001;
    cin = 1;
    #10;
    $display("Caso 3: a = %b, b = %b, cin = %b --> sum = %b, carry = %b", a, b, cin, sum, carry);
    a = 4'b0001;
    b = 4'b0001;
    cin = 0;
    #10;
     $display("Caso 4: a = %b, b = %b, cin = %b --> sum = %b, carry = %b", a, b, cin, sum, carry);
    $display("Simulación terminada");
    $finish;
end     
initial begin
    $dumpfile("forbits_adder_tb.vcd");
    $dumpvars(0, four_adder_tb);
end
endmodule


