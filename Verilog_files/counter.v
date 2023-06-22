module counter #(parameter WIDTH=6)(
	input [WIDTH-1:0]key,
	input start,
	input clk,
	output reg [WIDTH-1:0] count
);

	
always@(posedge clk) begin
	if (start==1'b1)
		count<=key;
	else begin 
		//if(start==1'b1)
		//	count <= key;
		//else begin
		if(count!=0)
			count<=count-1;
		else
			count<=count;
		//end
	end

end


endmodule
