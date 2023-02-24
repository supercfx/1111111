module tb;
reg clk,rst,start;
reg [256:0] k,Px,Py;
wire [256:0] Qx,Qy;
wire res_vld;

initial begin
clk=0;rst=0;start=0;
k=0;Px=0;Py=0;

#10 rst=1;
#10 k =257'h36CD79FC8E24B7357A8A7B4A46D454C397703D6498158C605399B341ADA186D6;
	Px=257'hCDB9CA7F1E6B0441F658343F4B10297C0EF9B6491082400A62E7A7485735FADD;
	Py=257'h13DE74DA65951C4D76DC89220D5F7777A611B1C38BAE260B175951DC8060C2B3E;
#10 start=1;
#10 start=0;

end

always #5 clk=~clk;

point_mul u_pmul(
    .clk(clk),
	.rst(rst),
	.start(start),
    .k(k),
    .Px(Px),
	.Py(Py),
    .Qx(Qx),
	.Qy(Qy),
    .finish(res_vld)
);

endmodule