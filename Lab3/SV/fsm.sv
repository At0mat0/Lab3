module FSM (clk, reset, Left, Right, y);

   input logic  clk;
   input logic  reset;
   input logic 	Left;
   input logic 	Right;
   
   output logic [5:0]y;

   typedef enum 	logic [9:0] {S0, S1, S2, S3, R1, R2 ,R3, H1,H2,H3} statetype;
   statetype state, nextstate;
   
   // state register
   always_ff @(posedge clk, posedge reset)
     if (reset) state <= S0;
     else       state <= nextstate;
   
   // next state logic
   always_comb
     case (state)
       S0: begin
	        y <= 6'b00000;	  
	        if (Left&Right)begin 
            nextstate <= H1;
            end
    else if (Right) begin nextstate <= R1;
    end
     else if (Left) begin nextstate <= S1;
    end
	  else begin nextstate <= S0;
       end
       end
  S1: begin
	  y <= 6'b001000;	  	  
	  nextstate <= S2;
       end
  S2: begin
	  y <= 6'b011000;	  	  
	  nextstate <= S3;
       end
   S3: begin
	  y <= 6'b111000;	  	  
	  nextstate <= S0;
       end
R1: begin
	  y <= 6'b000100;	  	  
	  nextstate <= R2;
       end
R2: begin
	  y <= 6'b000110;	  	  
	 nextstate <= R3;
       end
R3: begin
	  y <= 6'b000111;	  	  
	     nextstate <= S0;
       end
H1: begin
	  y <= 6'b001100;	  	  
	  nextstate <= H2;
       end       
H2: begin
	  y <= 6'b011110;	  	  
	  nextstate <= H3;
    end
H3: begin
	  y <= 6'b111111;	  	  
	   nextstate <= S0;
       end
        
       default: begin 
	  y <= 6'b000000;	  	  
	  nextstate <= S0;
       end
     endcase
   
endmodule
