module FSM (clk, reset, Left, Right, y, all);

   input logic  clk;
   input logic  reset;
   input logic 	Left;
   input logic 	right;
   input logic 	All;
   
   output logic y;

   typedef enum 	logic [1:0] {S0, S1, S2, S3, R1, R2 ,R3, A1} statetype;
   statetype state, nextstate;
   
   // state register
   always_ff @(posedge clk, posedge reset)
     if (reset) state <= S0;
     else       state <= nextstate;
   
   // next state logic
   always_comb
     case (state)
       S0: begin
	  y <= 6'b000000;	  
	  if (left) nextstate <= S1;
    if (Right) nextstate <= R1;
	  else   nextstate <= S0;
       end
  S1: begin
	  y <= 6'b001000;	  	  
	  if (left) nextstate <= S2;
	  else   nextstate <= S1;
       end
  S2: begin
	  y <= 6'b011000;	  	  
	  if (left) nextstate <= S3;
	  else   nextstate <= S0;
       end
   S3: begin
	  y <= 6'b111000;	  	  
	  if (left) nextstate <= S0;
	  else   nextstate <= S0;
       end
R1: begin
	  y <= 6'b000001;	  	  
	  if (right) nextstate <= R1;
	  else   nextstate <= S0;
       end
R2: begin
	  y <= 6'b000011;	  	  
	  if (right) nextstate <= R2;
	  else   nextstate <= S0;
       end
R3: begin
	  y <= 6'b000111;	  	  
	  if (right) nextstate <= R3;
	  else   nextstate <= S0;
       end
ALL: begin
	  y <= 6'b111111;	  	  
	  if (a) nextstate <= ALL;
	  else   nextstate <= S0;
       end       
       default: begin
	  y <= 6'b000000;	  	  
	  nextstate <= S0;
       end
     endcase
   
endmodule
