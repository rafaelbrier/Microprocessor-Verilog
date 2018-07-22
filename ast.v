module ast

#(parameter C=26'd2500)

(input clk,
output reg cd);

reg q;
initial q=1'b0;
reg [25:0] ct=26'd0;

always @ (posedge clk) begin
case(q)
3'd0:q<=(ct<C)?3'd0:3'd1;
3'd1:q<=(ct<C)?3'd1:3'd0;
endcase
end


reg qa;
initial begin ct=26'd0; qa=1'b0; end
always @ (posedge clk) begin
if(qa!=q) begin
ct<=26'd0;
qa<=q;
end
else ct<=ct+1'd1;
end

always @ (posedge clk) begin
case(q)
3'd0:cd<=1;
3'd1:cd<=0;
endcase
end

endmodule

 