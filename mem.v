module mem
#(
	parameter DATA_WIDTH=8,
	parameter ADDR_WIDTH=8
)
(
input clk,
input cs,
input we,
input re,
input [DATA_WIDTH-1:0]data_in,
input [ADDR_WIDTH-1:0]addr,
output reg [DATA_WIDTH-1:0]data_out);

reg [7:0]mem [0:2**(ADDR_WIDTH-1)];
//wire [7:0]mem_connect [0:2^^(ADDR_WIDTH-1)];
//assign mem_connect=mem;
always @(posedge clk) begin	
	if(cs&we) begin
		mem[addr] <= data_in;
		end
	else if(cs&re) begin
		//data_out <= mem_connect[addr];
		data_out <= mem[addr];
		end
	end
endmodule