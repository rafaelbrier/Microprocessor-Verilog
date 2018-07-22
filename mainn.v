module mainn
#(
	parameter NBADD = 10,
	parameter NBITS = 16
)
(
	input                   clk,
	input       [NBITS-1:0] in,
	output 		[      7:0] LCD_Data,
	output                  LCD_EN, LCD_RS, LCD_RW,
	output LCD_on
);

wire clkdir;
assign LCD_on = 1'b1;
wire [15:0] out;

ast ProcClk(clk, clkdir);
myProc #(NBADD,NBITS)Proc(clkdir, in, out);

assign LCD_Data = out[7:0];
assign LCD_EN   = out[8];
assign LCD_RS   = out[9];
assign LCD_RW = 1'b0;


endmodule 