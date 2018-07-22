module mainn_tb();

reg clk;

initial begin
	clk = 1'b0;
end

always #10 clk <= ~clk;

wire [7:0] LCD_out;
wire  LCD_EN, LCD_RS, LCD_RW; 
wire [15:0] in;
wire LCD_On;

mainn mainnnnn(clk, in, LCD_out, LCD_EN, LCD_RS, LCD_RW, LCD_On);

endmodule 