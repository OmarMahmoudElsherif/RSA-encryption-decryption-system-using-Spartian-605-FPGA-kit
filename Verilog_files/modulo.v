module modulo #(parameter WIDTH=6)(
	input [2*WIDTH-1:0] Mult_result,
	//input [WIDTH-1:0] N,
	input valid,
	input clk,
	output reg [WIDTH-1:0] Result
);

reg [WIDTH-1:0] memory [0:2**(2*WIDTH)-1];


reg [2**WIDTH:0] i;
wire [2*WIDTH-1:0] N;
assign N = 2**WIDTH-1;

initial begin

	for(i=0;i<2**(WIDTH*2)-1;i=i+1) begin
		memory[i] <= i%63;	
	end
end

always@(posedge clk) begin

	if(valid != 1) begin
		
		Result<=memory[Mult_result];
	end

	else begin
		Result<=Result;
	end

end

endmodule
