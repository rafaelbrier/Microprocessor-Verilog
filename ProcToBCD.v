module mainn
#(
	parameter NBADD = 8,
	parameter NBITS = 16
)
(
	input                   clk,
	input       [NBITS-1:0] in,
	output 		[NBITS-1:0]  out,
	output                  signal
);

wire [NBITS-1:0] proc_out;
wire clkdir;

astavel ProcClk(clk, clkdir);
myProc #(NBADD,NBITS)myProc(clkdir, in, proc_out);


endmodule 