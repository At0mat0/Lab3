`timescale 1ns / 1ps
module stimulus ();

   logic  clk;
   logic  reset;
   logic left;
   logic right;
   
   logic  [5:0]y;
   
   integer handle3;
   integer desc3;
   
   // Instantiate DUT
   FSM dut (clk, reset, left, right, y);   

   // Setup the clock to toggle every 1 time units 
   initial 
     begin	
	clk = 1'b1;
	forever #5 clk = ~clk;
     end

   initial
     begin
	// Gives output file name
	handle3 = $fopen("fsm.out");
	// Tells when to finish simulation
	#500 $finish;		
     end

   always 
     begin
	desc3 = handle3;
	#5 $fdisplay(desc3, "%b %b || %b", 
		     reset, left,right, y);
     end   
   
   initial 
     begin      	
	#0   left = 1'b0;
     #0   right = 1'b0;
     #20  left = 1'b0;
     #20  right = 1'b1;
     #40 reset =1'b1;
     #40 reset =1'b0;
     #60  left = 1'b1;
     #60   right = 1'b0;
     #80  left = 1'b1;
     #80  right = 1'b1;
     #100 reset =1'b1;


     end

endmodule // FSM_tb

