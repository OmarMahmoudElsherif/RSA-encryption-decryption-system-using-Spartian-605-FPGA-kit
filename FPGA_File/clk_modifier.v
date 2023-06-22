`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:14:42 06/20/2023 
// Design Name: 
// Module Name:    clk_modifier 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module clk_modifier(
	input clk, rst,
	output reg clk_out
    );
	 reg [23:0] internal;
	 always @(posedge clk) begin
	 if(rst) begin
			internal<=0;
			clk_out<=0;
	 end
	 else 
			internal <=internal+1;
	// since we have 10MHz clk and we want to make it 1 Hz = 1 sec
	// our original clk = 0.1usec
	// so we need to flip our clk_out every 5000000*0.1usec = 0.5sec
	if(internal ==5000000) begin    
		clk_out<=~clk_out;
		internal <=0;
	end
end

endmodule
