module mem_tb;
wire clk_connect;
wire cs_connect;
wire we_connect;
wire re_connect;
wire [7:0]data_in_connect;
wire [7:0]addr_connect;
wire [7:0]data_out_connect;
reg  [7:0]data_out;
reg clk;
reg cs;
reg we;
reg re;
reg [7:0]data_in;
reg [7:0]addr;
//assign data_out_connect = data_out;
assign data_in_connect = data_in;
assign clk_connect = clk;
assign cs_connect = cs;
assign we_connect = we;
assign re_connect = re;
assign addr_connect = addr;
always #5 clk = ~clk;

initial 
	begin
	clk<=0;
	addr<=8'b0000000;
	cs<=0;
	data_in<=8'h0;
	we<=0;
	repeat(1) @(posedge clk);//1
	cs<=1;
	we<=1;
	addr<=0;
	data_in <= 8'hff;
	repeat(1) @(posedge clk);
	we<=0;
	cs<=0;
	repeat(1) @(posedge clk);//2
	cs<=1;
	we<=1;
	addr<=1;
	data_in <= 8'haa;
	repeat(1) @(posedge clk);
	we<=0;
	cs<=0;
	repeat(1) @(posedge clk);//3
	cs<=1;
	we<=1;
	addr<=2;
	data_in<=8'hbb;
	repeat(1) @(posedge clk);
	we<=0;
	cs<=0;
//-----------------------------------------------------------------------
	repeat(1) @(posedge clk);//1
	cs<=1;
	re<=1;
	addr<=0;
	repeat(1) @(posedge clk);
	re<=0;
	cs<=0;
	$display("addr:0x%x,data_out:0x%x",addr,data_out);
	repeat(1) @(posedge clk);//2
	cs<=1;
	re<=1;
	addr<=1;
	repeat(1) @(posedge clk);
	re<=0;
	cs<=0;
	$display("addr:0x%x,data_out:0x%x",addr,data_out);
	repeat(1) @(posedge clk);//3
	cs<=1;
	re<=1;
	addr<=2;
	data_in<=8'hbb;
	repeat(1) @(posedge clk);
	re<=0;
	cs<=0;
	$display("addr:0x%x,data_out:0x%x",addr,data_out);
	repeat(1) @(posedge clk);
	$finish;
	end
mem test (.clk(clk_connect),.cs(cs_connect),.we(we_connect),.re(re_connect),.data_in(data_in_connect),.addr(addr_connect),.data_out(data_out_connect));

endmodule