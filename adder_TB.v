`timescale 1ns / 1ps

module adder_tb;
    reg a, b, cin; 
    
    wire sum, carry;
    
   adder uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .carry(carry)
    );
    initial begin
        $dumpfile("adder_TB.vcd");      
        $dumpvars(0, adder_tb);         
    end

    initial begin
    
        #10;
        
        a = 0; b = 1; cin = 0;
        
        #10;   
        
        $display("a=%b b=%b cin=%b => sum=%b carry=%b", a, b, cin, sum, carry);
        $finish;
    end

endmodule

