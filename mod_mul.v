module mod_multiplier #(
    parameter DW = 257
)(
    input clk,rst,start,
    input [DW-1:0] A,B,
//    input [DW-1:0] f,
    output [DW-1:0] res,
    output finish
);
reg [DW-1:0] A_r,B_r,C_r;
reg res_vld;
//wire [DW-1:0] B0={B_r[DW-2:0]^({DW-1{B_r[DW-1]}}&f[DW-1:1]),B_r[DW-1]&f[0]};
wire [DW-1:0] B0={B_r[DW-2:12],B_r[11]^B_r[DW-1],B_r[10:0],B_r[DW-1]};
wire [DW-1:0] C0=A_r[0]?(B_r^C_r):C_r;
wire [DW-1:0] B1={B0[DW-2:12],B0[11]^B0[DW-1],B0[10:0],B0[DW-1]};
wire [DW-1:0] C1=A_r[1]?(B0^C0):C0;
wire [DW-1:0] B2={B1[DW-2:12],B1[11]^B1[DW-1],B1[10:0],B1[DW-1]};
wire [DW-1:0] C2=A_r[2]?(B1^C1):C1;
wire [DW-1:0] B3={B2[DW-2:12],B2[11]^B2[DW-1],B2[10:0],B2[DW-1]};
wire [DW-1:0] C3=A_r[3]?(B2^C2):C2;
wire [DW-1:0] B4={B3[DW-2:12],B3[11]^B3[DW-1],B3[10:0],B3[DW-1]};
wire [DW-1:0] C4=A_r[4]?(B3^C3):C3;
wire [DW-1:0] B5={B4[DW-2:12],B4[11]^B4[DW-1],B4[10:0],B4[DW-1]};
wire [DW-1:0] C5=A_r[5]?(B4^C4):C4;
wire [DW-1:0] B6={B5[DW-2:12],B5[11]^B5[DW-1],B5[10:0],B5[DW-1]};
wire [DW-1:0] C6=A_r[6]?(B5^C5):C5;

assign res=C_r;
assign finish=res_vld&(~start);

always @(posedge clk,negedge rst) begin
if(~rst)A_r<={DW{1'b0}};
else begin
    if(start)A_r<=A;
    else A_r<={7'd0,A_r[DW-1:7]};
end
end

always @(posedge clk,negedge rst) begin
if(~rst)B_r<={DW{1'b0}};
else begin
    if(start)B_r<=B;
    else B_r<=B6;
end
end

always @(posedge clk,negedge rst) begin
if(~rst)C_r<={DW{1'b0}};
else begin
    if(start)C_r<={DW{1'b0}};
    else C_r<=C6;
end
end

always @(posedge clk,negedge rst) begin
if(~rst)res_vld<=1'b0;
else begin
    if(start)res_vld<=1'b0;
    else if(A_r=={DW{1'b0}})res_vld<=1'b1;
	 else res_vld<=res_vld;
end
end

endmodule