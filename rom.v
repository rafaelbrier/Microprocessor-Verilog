 module rom
#(
	parameter NBADD = 10
)
(
	input      [NBADD  -1:0]  addr,
	output reg [NBADD+4:0]  out
);

reg [NBADD+4:0] mem [2**NBADD-1:0];       
           
initial begin   // Programa   
$readmemb("rom.mif",mem);										

end

always @ (*) out = mem[addr];

endmodule	