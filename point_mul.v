module point_mul #(
    parameter DW = 257
)(
    input clk,rst,start,
    input [DW-1:0] k,
    input [DW-1:0] Px,Py,
    output [DW-1:0] Qx,Qy,
    output finish
);

parameter param_b = 257'hE78BCD09746C202378A7E72B12BCE00266B9627ECB0B5A25367AD1AD4CC6242B;

reg [4:0] step;
reg mmul_start,done;
reg [1:0] inv_mode;
reg [8:0] counter;
reg [DW-1:0] temp1,temp2;
reg [DW-1:0] inv_A,inv_B;
reg [DW-1:0] mmul_A,mmul_B;
reg [DW-1:0] msqu1_din,msqu2_din;
wire [DW-1:0] inv_res,mmul_res,msqu1_res,msqu2_res;
wire inv_finish,mmul_finish;
wire ki=k[counter];
wire [8:0] cnt_1=(counter==9'd0)?9'd0:(counter-1'b1);
wire ki_1=k[cnt_1];

assign Qx=temp1;
assign Qy=temp2;
assign finish=done&(~start);

always @(posedge clk,negedge rst)
begin
if(~rst)begin
    step<=5'd0;
    mmul_start<=1'b0;
    done<=1'b0;
    inv_mode<=2'd0;
    inv_A<={DW{1'b0}};
    inv_B<={DW{1'b0}};
    mmul_A<={DW{1'b0}};
    mmul_B<={DW{1'b0}};
    msqu1_din<={DW{1'b0}};
    msqu2_din<={DW{1'b0}};
    temp1<={DW{1'b0}};
    temp2<={DW{1'b0}};
    counter<=9'd0;
end
else begin
    case (step)
    5'd0:begin
        if(start)begin
			done<=1'b0;
            counter<=DW-1;
            step<=5'd1;
        end
    end
    5'd1:begin
        counter<=counter-1'b1;
        if(ki)begin
            msqu1_din<=Px;
            step<=5'd2;
        end
    end
    5'd2:begin
        if(msqu1_res=={DW{1'b0}})begin
            temp1<={DW{1'b0}};
            temp2<={DW{1'b0}};
            done<=1'b1;
            step<=5'd0;
        end
        else begin
            msqu2_din<=msqu1_res;
            step<=5'd3;
        end
    end
    5'd3:begin
        inv_mode<=2'b01;
        inv_A<=Px;
        inv_B<=msqu1_res;
        mmul_start<=1'b1;
        mmul_A<=msqu2_res^param_b;
        mmul_B<={{DW-1{1'b0}},1'b1};
		if(ki)begin
			msqu1_din<=msqu2_res^param_b;
			msqu2_din<=msqu1_res;
		end
        else begin
			msqu1_din<=Px;
			msqu2_din<={{DW-1{1'b0}},1'b1};
		end
        step<=5'd4;
    end
    5'd4:begin
        if(inv_finish&mmul_finish)begin
            inv_mode<=2'b01;
            inv_A<=inv_res;
            inv_B<=mmul_res;
            mmul_start<=1'b1;
            mmul_A<=msqu1_res;
            mmul_B<=msqu2_res;
            msqu1_din<=inv_res^mmul_res;
            msqu2_din<=msqu2_res;
            step<=5'd5;
        end
        else begin
            inv_mode<=2'b00;
            mmul_start<=1'b0; 
        end
    end
    5'd5:begin
        if(inv_finish&mmul_finish)begin
            msqu2_din<=mmul_A;
            inv_mode<=2'b01;
            inv_A<=Px;
            inv_B<=msqu1_res;
            mmul_start<=1'b1;
            mmul_A<=msqu2_res;
            mmul_B<=param_b;
            temp1<=inv_res;
            temp2<=mmul_res;
            step<=5'd6;
        end
        else begin
            inv_mode<=2'b00;
            mmul_start<=1'b0; 
        end
    end
    5'd6:begin
        if(inv_finish&mmul_finish)begin
            if(counter==9'd0)begin
                if(ki)begin
                    inv_mode<=2'b01;
                    inv_A<=Px;
                    inv_B<=msqu1_res;
                    mmul_start<=1'b1;
                    mmul_A<=Px;
                    mmul_B<=temp1^inv_res;
                    temp1<=msqu2_res^mmul_res;
                    step<=5'd7;
                end
                else begin
                    inv_mode<=2'b01;
                    inv_A<=Px;
                    inv_B<=temp2;
                    mmul_start<=1'b1;
                    mmul_A<=Px;
                    mmul_B<=msqu2_res^mmul_res;
                    temp1<=temp1^inv_res;
                    temp2<=msqu1_res;
                    step<=5'd7;
                end
            end
            else begin
                if(ki)begin
                    counter<=counter-1'b1;
                    inv_mode<=2'b01;
                    inv_A<=temp1^inv_res;
                    inv_B<=temp2;
                    mmul_start<=1'b1;
                    mmul_A<=msqu2_res^mmul_res;
                    mmul_B<=msqu1_res;
					if(ki_1)begin
						msqu1_din<=msqu2_res^mmul_res;
						msqu2_din<=temp2;
					end
					else begin
						msqu1_din<=temp1^inv_res;
						msqu2_din<=msqu1_res;
					end
                    step<=5'd4;
                end
                else begin
                    counter<=counter-1'b1;
                    inv_mode<=2'b01;
                    inv_A<=msqu2_res^mmul_res;
                    inv_B<=msqu1_res;
                    mmul_start<=1'b1;
                    mmul_A<=temp1^inv_res;
                    mmul_B<=temp2;
					if(ki_1)begin
						msqu1_din<=temp1^inv_res;
						msqu2_din<=msqu1_res;
					end
					else begin
						msqu1_din<=msqu2_res^mmul_res;
						msqu2_din<=temp2;
					end
                    step<=5'd4;
                end
            end
        end
        else begin
            inv_mode<=2'b00;
            mmul_start<=1'b0; 
        end
    end
    5'd7:begin
        if(inv_finish&mmul_finish)begin
            inv_mode<=2'b01;
            inv_A<=inv_res;
            inv_B<=temp2;
            mmul_start<=1'b1;
            mmul_A<=inv_res;
            mmul_B<=temp1;
            temp1<=inv_B;
            temp2<=mmul_res;
            step<=5'd8;
        end
        else begin
            inv_mode<=2'b00;
            mmul_start<=1'b0; 
        end
    end
    5'd8:begin
        if(inv_finish&mmul_finish)begin
            inv_mode<=2'b11;
            inv_A<=inv_res;
            mmul_start<=1'b1;
            mmul_A<=temp1;
            mmul_B<=inv_B;
            temp1<=mmul_res;
            step<=5'd9;
        end
        else begin
            inv_mode<=2'b00;
            mmul_start<=1'b0; 
        end
    end
    5'd9:begin
        inv_mode<=2'b00;
        if(mmul_finish)begin
            mmul_start<=1'b1;
            mmul_A<=temp2;
            temp2<=mmul_res;
            step<=5'd10;
        end
        else mmul_start<=1'b0; 
    end
    5'd10:begin
        if(inv_finish&mmul_finish)begin
            inv_mode<=2'b01;
            inv_A<=inv_res;
            inv_B<=mmul_res;
            mmul_start<=1'b1;
            mmul_A<=inv_res;
            mmul_B<=temp1;
            step<=5'd11;
        end
        else mmul_start<=1'b0; 
    end
    5'd11:begin
        if(inv_finish&mmul_finish)begin
            inv_mode<=2'b01;
            inv_A<=inv_res^Px;
            inv_B<=mmul_res^Px;
            mmul_start<=1'b1;
            mmul_B<=temp2;
            msqu1_din<=Px;
            temp1<=inv_res;
            step<=5'd12;
        end
        else begin
            inv_mode<=2'b00;
            mmul_start<=1'b0; 
        end
    end
    5'd12:begin
        if(inv_finish&mmul_finish)begin
            inv_mode<=2'b01;
            inv_A<=inv_res^msqu1_res^Py;
            inv_B<=temp1^Px;
            temp2<=mmul_res;
            step<=5'd13;
        end
        else begin
            inv_mode<=2'b00;
            mmul_start<=1'b0; 
        end
    end
    5'd13:begin
        if(inv_finish)begin
            inv_mode<=2'b01;
            inv_A<=inv_res;
            inv_B<=temp2;
            step<=5'd14;
        end
        else inv_mode<=2'b00;
    end
    5'd14:begin
        if(inv_finish)begin
            temp2<=inv_res^Py;
            done<=1'b1;
            step<=5'd0;
        end
        else inv_mode<=2'b00;
    end
    default:begin
        step<=5'd0;
        mmul_start<=1'b0;
        done<=1'b0;
        inv_mode<=2'd0;
        inv_A<={DW{1'b0}};
        inv_B<={DW{1'b0}};
        mmul_A<={DW{1'b0}};
        mmul_B<={DW{1'b0}};
        msqu1_din<={DW{1'b0}};
        msqu2_din<={DW{1'b0}};
        temp1<={DW{1'b0}};
        temp2<={DW{1'b0}};
        counter<=9'd0;
    end
    endcase
end
end

mod_inv #(DW) u_inv(
    .clk(clk),
    .rst(rst),
    .mode(inv_mode),
    .A(inv_A),
    .B(inv_B),
    .res(inv_res),
    .finish(inv_finish)
);

mod_multiplier #(DW) u_mul(
	.clk(clk),
	.rst(rst),
	.start(mmul_start),
	.A(mmul_A),
	.B(mmul_B),
	.res(mmul_res),
	.finish(mmul_finish)
);

mod_square u_msqu1(
    .din(msqu1_din),
    .res(msqu1_res)
);

mod_square u_msqu2(
    .din(msqu2_din),
    .res(msqu2_res)
);

endmodule