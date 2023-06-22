`timescale 1ns / 1ps
module top(
	input clk_n, clk_p,
	input rst,start,
	input [5:0] data,key,
	output valid,
	output [5:0] result
    );
parameter BUS_WIDTH=6; //6 bits width
wire [BUS_WIDTH-1:0] N,mult_result;
wire clk,genclk_out;
wire [BUS_WIDTH*2-1:0] counter_out;

 gen_clock gen_inst
   (// Clock in ports
    .CLK_IN1_P(clk_n),    // IN
    .CLK_IN1_N(clk_p),    // IN
    // Clock out ports
    .CLK_OUT1(genclk_out),     // OUT
    // Status and control signals
    .RESET(rst));       // IN
// INST_TAG_END ------ End INSTANTIATION Template ---------



// Instantiate the module
clk_modifier clk_mod_inst (
    .clk(genclk_out), 
    .rst(rst), 
    .clk_out(clk)
    );




// Instantiate the module
counter #(BUS_WIDTH) counter_inst (
    .key(key), 
    .start(start), 
    .clk(clk), 
    .count(counter_out)
    );

// Instantiate the module
mult #(BUS_WIDTH) multiplier (
	.base(data),
	.counter(counter_out),
	.feedback_mult(result),
	.start(start),
	//.clk(clk),
	.valid(valid),
	.mult_Result(mult_out)
);

// Instantiate the module
modulo #(BUS_WIDTH) moduloo (
	.Mult_result(mult_out),
	//.N(N),
	.valid(valid),
	.clk(clk),
	.Result(result)

 );






endmodule
