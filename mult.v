module mult(
input[2:0] a,
input [2:0] b,
input clk,
input init,
output reg [5:0] result,
output reg done
);
parameter star = 3'b000;
parameter check = 3'b001;
parameter add = 3'b010;
parameter shift = 3'b011;
parameter finish = 3'b100;

reg [5:0]pp;
reg [2:0] state, next_state;

reg[5:0] a_copy,b_copy;



always @ (posedge clk )
begin
		if (init)
		
			state <= star;
		else
			
				state <= next_state;
	end

always @(*)
begin
  case(state)
     star:begin
     pp = 0;
     a_copy = a;
     b_copy =b;
     next_state = check;
     done = 0;

    
     end
     
    check:begin
      if(b_copy[0] == 0)begin 
      next_state = shift;  
      end
      else begin 
      next_state = add;
      end
      end

      add:begin 
      pp = pp +a_copy;
      next_state = shift;
      end
      shift: begin 

      a_copy = a_copy <<1;
      b_copy = b_copy >> 1;
      if(b_copy == 0)begin
      next_state = finish;
       
      
      end else begin 
      next_state = check;
      end
      end
      finish: begin 
      done <= 1;
      result <= pp;
      
      
      end

      


  
    default: begin
      next_state = star;
    end
  endcase
end

	endmodule
