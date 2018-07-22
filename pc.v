module pc
#(
	parameter NBADD = 10
)
(
	input 				     clk, load,
	input 	  [NBADD-1:0] data,
	output reg [NBADD-1:0] out
);

initial begin 
	out = 0;
end

always @ (posedge clk) begin
	if (load)
		out <= data;
	else
		out <= out + 1'd1;
end

endmodule
