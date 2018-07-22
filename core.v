module core
#(
	parameter NBADD = 10,        // Endereçamento de memória 2^NBADD
	parameter NBITS = 16      // Número de bits da ULA	
)
( 
	input              clk,
	input  [      4:0] opcode,
	input  [NBADD-1:0] rom_data,
	output [NBADD-1:0] rom_addr,
	input  [NBITS-1:0] ram_data,
	input  [NBITS-1:0] in,
	output 				 ram_wt, 
	output [NBITS-1:0] ram_out,
	output reg [NBITS-1:0] out,
	output reg [NBADD-1:0] ram_ldOffset
);

// Program Counter ---------------------------------------------------------------------------------------------------------------------------------------------------

wire pc_load;

pc #(NBADD)pc(clk, pc_load, rom_data, rom_addr);

// Decodificador de Instrucoes ----------------------------------------------------------------------------------------------------------------------------------------------

wire 		  di_flag, dec_in, out_en;
wire [3:0] ula_op;

dec_instr dec(opcode, di_flag, ula_op, ram_wt, pc_load,dec_in, out_en, ldi_en);

// Acumulador ---------------------------------------------------------------------------------------------------------------------------------------------------------------

reg  [NBITS-1:0] acc;
initial acc = 0;
wire [NBITS-1:0] ula_out;

always @ (posedge clk) acc <= ula_out;

assign di_flag = acc[0]; 

//Acumulador Offset -----------------------------------------------------------------------------

always @ (posedge clk) begin
if (ldi_en) ram_ldOffset = acc[NBADD-1:0]; else ram_ldOffset = {NBADD{1'b0}};
end

// ULA ----------------------------------------------------------------------------------------------------------------------------------------------------------------------

reg [NBITS-1:0] ula_in;

//always @ (*) ula_in = (dec_in) ? in : ram_data; 
always @ (*) if (dec_in) 
					ula_in = in; 
				 else 
					ula_in = ram_data;

ula #(NBITS)ula(ula_op, acc, ula_in, ula_out); 

// Saída ---------------------------------------------------------------------------------------------------------------------------------------------------------------------
assign ram_out = acc;
always @ (posedge clk) begin	
	if(out_en == 1'b1) out <= acc;		
end

endmodule