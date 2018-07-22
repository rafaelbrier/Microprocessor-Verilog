module dec_instr
(
	input  	  [4:0] opcode,
	input            flag,
	output reg [3:0] ula_op,
	output reg		  ram_wt,
	output reg		  pc_load,
	output reg       dec_in,
	output reg       out_en,
	output reg       ldi_en
);

always @ (*) begin
	case (opcode)
			5'd0 :   begin                         //NOP
							ula_op  = 4'd0;
							ram_wt  = 1'd0;
							pc_load = 1'd0;
							dec_in  = 1'dx;
							out_en  = 1'd0;
							ldi_en  = 1'd0;
					   end
			5'd1 :   begin									//LD
							ula_op  = 4'd1;
							ram_wt  = 1'd0;
							pc_load = 1'd0;
							dec_in  = 1'd0;
							out_en  = 1'd0;
							ldi_en  = 1'd0;
						end
			5'd2 :   begin									//SET
							ula_op  = 4'd0;
							ram_wt  = 1'd1;
							pc_load = 1'd0;
						   dec_in  = 1'dx;
							out_en  = 1'd0;
							ldi_en  = 1'd0;
						end
			5'd3 :   begin									//ADD
							ula_op  = 4'd2;
							ram_wt  = 1'd0;
							pc_load = 1'd0;
							dec_in  = 1'd0;
							out_en  = 1'd0;
							ldi_en  = 1'd0;
						end
			5'd4 :   begin									//SUB
							ula_op  = 4'd3;
							ram_wt  = 1'd0;
							pc_load = 1'd0;
							dec_in  = 1'd0;
							out_en  = 1'd0;
							ldi_en  = 1'd0;
						end
			5'd5 :   begin									//MLT
							ula_op  = 4'd4;
							ram_wt  = 1'd0;
							pc_load = 1'd0;
							dec_in  = 1'd0;
							out_en  = 1'd0;
							ldi_en  = 1'd0;
						end
			5'd6 :   begin									//DIV
							ula_op  = 4'd5;
							ram_wt  = 1'd0;
							pc_load = 1'd0;
							dec_in  = 1'd0;
							out_en  = 1'd0;
							ldi_en  = 1'd0;
						end
			5'd7 :   begin									//EQU
							ula_op  = 4'd6;
							ram_wt  = 1'd0;
							pc_load = 1'd0;
							dec_in  = 1'd0;
							out_en  = 1'd0;
							ldi_en  = 1'd0;
						end
			5'd8 :   begin									//GRT
							ula_op  = 4'd7;
							ram_wt  = 1'd0;
							pc_load = 1'd0;
							dec_in  = 1'd0;
							out_en  = 1'd0;
							ldi_en  = 1'd0;
						end
			5'd9 :   begin									//SMT
							ula_op  = 4'd8;
							ram_wt  = 1'd0;
							pc_load = 1'd0;
							dec_in  = 1'd0;
							out_en  = 1'd0;
							ldi_en  = 1'd0;
						end
			5'd10:   begin									//JMP
							ula_op  = 4'd0;
							ram_wt  = 1'd0;
							pc_load = 1'd1;
							dec_in  = 1'dx;
							out_en  = 1'd0;
							ldi_en  = 1'd0;
						end
			5'd11:   begin									//JZ
							ula_op  = 4'd0;
							ram_wt  = 1'd0;
							pc_load = ~flag;
							dec_in  = 1'dx;
							out_en  = 1'd0;
							ldi_en  = 1'd0;
						end
			5'd12:   begin									//JNZ
							ula_op  = 4'd0;
							ram_wt  = 1'd0;
							pc_load = flag;
							dec_in  = 1'dx;
							out_en  = 1'd0;
						end
			5'd13:   begin							   	//IN
							ula_op  = 4'd1;
							ram_wt  = 1'd0;
							pc_load = 1'd0;
							dec_in  = 1'd1;
							out_en  = 1'd0;
							ldi_en  = 1'd0;
						end
		   5'd14:   begin							   	//SR
							ula_op  = 4'd9;
							ram_wt  = 1'd0;
							pc_load = 1'd0;
							dec_in  = 1'd0;
							out_en  = 1'd0;
							ldi_en  = 1'd0;
						end
			5'd15:   begin							   	//AND
							ula_op  = 4'd10;
							ram_wt  = 1'd0;
							pc_load = 1'd0;
							dec_in  = 1'd0;
							out_en  = 1'd0;
							ldi_en  = 1'd0;
						end
			5'd16:   begin							   	//OR
							ula_op  = 4'd11;
							ram_wt  = 1'd0;
							pc_load = 1'd0;
							dec_in  = 1'd0;
							out_en  = 1'd0;
							ldi_en  = 1'd0;
						end
			5'd17:   begin									//OUT
							ula_op  = 4'd0;
							ram_wt  = 1'd0;
							pc_load = 1'd0;
							dec_in  = 1'd0;
							out_en  = 1'd1;
							ldi_en  = 1'd0;
						end
			5'd18:   begin									//LDI
							ula_op  = 4'd1;
							ram_wt  = 1'd0;
							pc_load = 1'd0;
							dec_in  = 1'd0;
							out_en  = 1'd0;
							ldi_en  = 1'd1;
						end
			default: begin
							ula_op  = 4'dx;
							ram_wt  = 1'dx;
							pc_load = 1'dx;
							dec_in  = 1'dx;
							out_en  = 1'dx;
							ldi_en  = 1'dx;
						end
	endcase
end

endmodule