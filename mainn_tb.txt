module myProc_tb();

reg clk;

initial begin
	clk = 1'b0;
end

always #10 clk <= ~clk;

wire [15:0] out; 

myProc myProc(clk, out);

endmodule 