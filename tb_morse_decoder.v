`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:24:15 01/03/2016
// Design Name:   morse_decoder
// Module Name:   C:/Users/HP/JavaCodes/Xilinx/FINAL/tb_morse_decoder.v
// Project Name:  FINAL
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: morse_decoder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_morse_decoder;

	// Inputs
	reg clk;
   reg [1:0] in;
	// Outputs
	
	wire [5:0] state;
	wire [7:0] letter;
	wire [11:0] counter;
   
	// Instantiate the Unit Under Test (UUT)
	morse_decoder uut (
		.clk(clk),	
		.in(in), 
		.state(state), 
		.letter(letter), 
		.counter(counter)
	);

	initial begin
		// Initialize Inputs
		$display("time\t clk \t   letter\t  counter in");  
		//$monitor("%g\t %b\t %b\t  %b\t %b",$time,clk,letter,counter,in);
	   

		// Wait 100 ns for global reset to finish
	    #1
	   clk=0;
	  
		 #2 in=2'b01;
		 #2 in=2'b01;
		 #2 in=2'b11;
		
		 
		 #2 in=2'b00;
		 
		 
		 #2 in=2'b11;
		 #2 in=2'b11;
		 
		 #2 in=2'b00;
		 
		 #2 in=2'b01;
		 #2 in=2'b01;
		 #2 in=2'b11;
		
		 
		 #2 in=2'b00;
		 
		 #2 in=2'b11;
		
		 
		 #2 in=2'b00;
		 
		 #2 in=2'b10;
		 
		 #2 in=2'b11;
		 #2 in=2'b11;
		 #2 in=2'b11;
		
		 
		 #2 in=2'b00;
		 
		 
		 #2 in=2'b11;
		 #2 in=2'b11;
		 #2 in=2'b01;
		 #2 in=2'b01;
		
		 
		 #2 in=2'b00;
		 
		 
		
		 #2 in=2'b11;
		
		 
		 #2 in=2'b00;
		 
		 
		 #2 in=2'b01;
		 #2 in=2'b01;
		 #2 in=2'b11;
		
		 
		 #2 in=2'b00;
		 
		 
		 #2 in=2'b01;
		 #2 in=2'b11;
		 #2 in=2'b01;
		
		 
		 #2 in=2'b00;
		 
		 
		 #2 in=2'b11;
		 #2 in=2'b01;
		 #2 in=2'b11;
		
		 
		 #2 in=2'b00;
		 
		 #2 in=2'b10;
		  
		 #2 in=2'b11;
		 #2 in=2'b11;
		 #2 in=2'b01;
		 #2 in=2'b00;
		 
		 #2 in=2'b01;
		 #2 in=2'b01;
		 #2 in=2'b00;
		 
		 #2  in=2'b11;
		 #2 in=2'b00;
		
		 
		 
		 #1 $finish;
		// Add stimulus here

	end
	always begin
   #1 clk=~clk;
   end   
endmodule

