module myProc
#(
	parameter NBADD = 10,
	parameter NBITS = 16
)
(
	input  		       clk,
	input  [NBITS-1:0] in,
	output [NBITS-1:0] out
);

//Memória de Instruções (Software) -----------------------------------------------------------------------------------------------------------------------------

wire [NBADD  -1:0] rom_addr;
wire [NBADD+4:0] rom_out;

rom #(NBADD)rom(rom_addr,rom_out);

//Memória de Dados ---------------------------------------------------------------------------------------------------------------------------------------------

wire              ram_wt;
wire [NBADD-1:0]  ram_addr;
wire [NBITS-1:0]  ram_in, ram_out;

ram #(NBADD,NBITS)ram(clk, ram_wt, ram_addr, ram_in, ram_out);

//Núcleo do Processador ----------------------------------------------------------------------------------------------------------------------------------------
wire [NBITS-1:0] print;
wire [NBADD-1:0] ram_ldOffset;

core #(NBADD,NBITS)core(clk, rom_out[NBADD+4:NBADD], rom_out[NBADD-1:0], rom_addr, ram_out, in, ram_wt, ram_in, print, ram_ldOffset);

assign out = print;
assign ram_addr = rom_out[NBADD-1:0] + ram_ldOffset;

endmodule 