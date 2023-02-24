module mod_inv #(
    parameter DW = 257
)(
    input clk,rst,
    input [1:0] mode,       //00:idle 01:mul 10:squ 11:inv
    input [DW-1:0] A,B,
    output reg [DW-1:0] res,
    output finish
);
reg [4:0] step;
reg mmul_start,done;
reg [7:0] counter;
reg [DW-1:0] mmul_din1,mmul_din2,msqu_din;
wire [DW-1:0] mmul_dout,msqu_dout;
wire mmul_dout_vld;

assign finish=done&(mode==2'b00);

always @(posedge clk,negedge rst) begin
if(~rst)begin
    done<=1'b0;
    step<=5'd0;
    counter<=8'd0;
    mmul_start<=1'b0;
    res<={DW{1'b0}};
    mmul_din1<={DW{1'b0}};
    mmul_din2<={DW{1'b0}};
    msqu_din<={DW{1'b0}};
end
else begin
case (step)
    5'd0:begin
        if(mode!=2'b00)done<=1'b0;
        if(mode==2'b01)begin
            mmul_din1<=A;
            mmul_din2<=B;
            mmul_start<=1'b1;
            step<=5'd1;
        end
        if(mode==2'b10)begin
            msqu_din<=A;
            step<=5'd2;
        end
        if(mode==2'b11)begin
            msqu_din<=A;
            step<=5'd3;
        end
    end
    5'd1:begin
        mmul_start<=1'b0;
        if(mmul_dout_vld)begin
            res<=mmul_dout;
            done<=1'b1;
            step<=5'd0;
        end
    end 
    5'd2:begin
        res<=msqu_dout;
        done<=1'b1;
        step<=5'd0;
    end
    5'd3:begin
        mmul_din1<=msqu_dout;
        mmul_din2<=A;
        mmul_start<=1'b1;
        step<=5'd4;
    end
    5'd4:begin
        mmul_start<=1'b0;
        if(mmul_dout_vld)begin
            msqu_din<=mmul_dout;
            mmul_din2<=mmul_dout;
            step<=5'd5;
        end
    end
    5'd5:begin
        msqu_din<=msqu_dout;
        if(counter==8'd1)begin
            counter<=8'd0;
            mmul_din1<=msqu_dout;
            mmul_start<=1'b1;
            step<=5'd6;
        end
        else counter<=counter+1'b1;
    end
    5'd6:begin
        mmul_start<=1'b0;
        if(mmul_dout_vld)begin
            msqu_din<=mmul_dout;
            mmul_din2<=mmul_dout;
            step<=5'd7;
        end
    end
    5'd7:begin
       msqu_din<=msqu_dout;
        if(counter==8'd3)begin
            counter<=8'd0;
            mmul_din1<=msqu_dout;
            mmul_start<=1'b1;
            step<=5'd8;
        end
        else counter<=counter+1'b1; 
    end
    5'd8:begin
        mmul_start<=1'b0;
        if(mmul_dout_vld)begin
            msqu_din<=mmul_dout;
            mmul_din2<=mmul_dout;
            step<=5'd9;
        end
    end
    5'd9:begin
        msqu_din<=msqu_dout;
        if(counter==8'd7)begin
            counter<=8'd0;
            mmul_din1<=msqu_dout;
            mmul_start<=1'b1;
            step<=5'd10;
        end
        else counter<=counter+1'b1;
    end
    5'd10:begin
        mmul_start<=1'b0;
        if(mmul_dout_vld)begin
            msqu_din<=mmul_dout;
            mmul_din2<=mmul_dout;
            step<=5'd11;
        end
    end
    5'd11:begin
        msqu_din<=msqu_dout;
        if(counter==8'd15)begin
            counter<=8'd0;
            mmul_din1<=msqu_dout;
            mmul_start<=1'b1;
            step<=5'd12;
        end
        else counter<=counter+1'b1;
    end
    5'd12:begin
        mmul_start<=1'b0;
        if(mmul_dout_vld)begin
            msqu_din<=mmul_dout;
            mmul_din2<=mmul_dout;
            step<=5'd13;
        end
    end
    5'd13:begin
        msqu_din<=msqu_dout;
        if(counter==8'd31)begin
            counter<=8'd0;
            mmul_din1<=msqu_dout;
            mmul_start<=1'b1;
            step<=5'd14;
        end
        else counter<=counter+1'b1;
    end
    5'd14:begin
        mmul_start<=1'b0;
        if(mmul_dout_vld)begin
            msqu_din<=mmul_dout;
            mmul_din2<=mmul_dout;
            step<=5'd15;
        end
    end
    5'd15:begin
        msqu_din<=msqu_dout;
        if(counter==8'd63)begin
            counter<=8'd0;
            mmul_din1<=msqu_dout;
            mmul_start<=1'b1;
            step<=5'd16;
        end
        else counter<=counter+1'b1;
    end
    5'd16:begin
        mmul_start<=1'b0;
        if(mmul_dout_vld)begin
            msqu_din<=mmul_dout;
            mmul_din2<=mmul_dout;
            step<=5'd17;
        end
    end
    5'd17:begin
        msqu_din<=msqu_dout;
        if(counter==8'd127)begin
            counter<=8'd0;
			mmul_din1<=msqu_dout;
			mmul_start<=1'b1;
            step<=5'd18;
        end
        else counter<=counter+1'b1;
    end
	5'd18:begin
        mmul_start<=1'b0;
        if(mmul_dout_vld)begin
            msqu_din<=mmul_dout;
            step<=5'd19;
        end
    end
	5'd19:begin
		res=msqu_dout;
		done<=1'b1;
		step<=5'd0;
	end
    default:begin
        done<=1'b0;
        step<=5'd0;
        counter<=8'd0;
        mmul_start<=1'b0;
        res<={DW{1'b0}};
        mmul_din1<={DW{1'b0}};
        mmul_din2<={DW{1'b0}};
        msqu_din<={DW{1'b0}};
    end
endcase
end
end

mod_multiplier u_mmul(
    .clk(clk),
    .rst(rst),
    .start(mmul_start),
    .A(mmul_din1),
    .B(mmul_din2),
    .res(mmul_dout),
    .finish(mmul_dout_vld)
);

mod_square u_mmsqu(
    .din(msqu_din),
    .res(msqu_dout)
);

endmodule