module ula
#(
	parameter NBITS = 16
)
(	
	input 	  [      3:0] op,
	input 	  [NBITS-1:0] opnd1,opnd2,	
	output reg [NBITS-1:0] out
);


always @ (*) begin
	case (op)
		4'd0    : out = opnd1;
		4'd1    : out = opnd2;
		4'd2    : out = opnd1 +  opnd2;
		4'd3    : out = opnd1 -  opnd2;
		4'd4    : out = opnd1 *  opnd2;
		4'd5    : out = opnd1 /  opnd2;
		4'd6    : out = opnd1 == opnd2;
		4'd7    : out = opnd1 >  opnd2;
		4'd8    : out = opnd1 <  opnd2;
		4'd9    : out = opnd1 >> opnd2;
		4'd10   : out = opnd1 & opnd2;
		4'd11   : out = opnd1 | opnd2;
		default : out = {NBITS{1'bx}};
	endcase
end

endmodule