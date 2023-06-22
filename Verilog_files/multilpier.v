module mult #(parameter WIDTH=6) (
	input [WIDTH-1:0] base,feedback_mult,
	input [WIDTH-1:0] counter,
	input start,
	//input clk,
	output reg valid,
	output reg [WIDTH*2-1:0] mult_Result
);
always@(*) begin
	if(start==1) begin
		valid<=0;
		mult_Result <= base;
	end

	else begin
		if(counter-1 !=0)
			mult_Result <= base*feedback_mult;
		else begin   // counter==0;
			valid<=1;
			mult_Result <=mult_Result;
		end
	end


end


endmodule