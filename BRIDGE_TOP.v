module BRIDGE_TOP(input hclk,hresetn,hwrite,hready_in,input [1:0] htrans,input [31:0] haddr,hwdata,prdata,
output penable, pwrite, hr_readyout,output [2:0] psel, 
output [1:0] hresp, output [31:0] paddr,pwdata,hrdata);

wire [31:0] hwdata_1,hwdata_2,haddr_1,haddr_2;
wire valid;
wire [2:0] temp_selx;
wire hwritereg,hwritereg_1;

AHB_SLAVE_INTERFACE
AHB_sl(hclk,hresetn,hwrite,hready_in,htrans,haddr,hwdata,valid,hwritereg,hwritereg_1,
hresp,temp_selx,haddr_1,haddr_2,hwdata_1,hwdata_2,hrdata,prdata);

APB_CONTROLLER
APB_c(hclk,hresetn,hwritereg,hwrite,valid,haddr,hwdata,hwdata_1,hwdata_2,haddr_1,haddr_2,prdata,
temp_selx,penable,pwrite,hr_readyout,psel,paddr,pwdata);

endmodule
