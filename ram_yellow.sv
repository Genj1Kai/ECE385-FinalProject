/*
 * ECE385-HelperTools/PNG-To-Txt
 * Author: Rishi Thakkar
 *
 */

module  frameRAM_yellow
(
		input [12:0] read_address,
		input Clk,

		output logic [23:0] data_Out
);

// mem has width of 24 bits and a total of 4096 addresses
logic [23:0] mem [0:1599];

initial
begin
	 $readmemh("ECE385-HelperTools-master/PNG To Hex/On-Chip Memory/sprite_bytes/sred.txt", mem);
end


always_ff @ (posedge Clk) begin
	data_Out<= mem[read_address];
end

endmodule

module  frameRAM_blue
(
		input [12:0] read_address,
		input Clk,

		output logic [23:0] data_Out
);

// mem has width of 24 bits and a total of 4096 addresses
logic [23:0] mem [0:1599];

initial
begin
	 $readmemh("ECE385-HelperTools-master/PNG To Hex/On-Chip Memory/sprite_bytes/lblue.txt", mem);
end


always_ff @ (posedge Clk) begin
	data_Out<= mem[read_address];
end

endmodule


module  frameRAM_green
(
		input [12:0] read_address,
		input Clk,

		output logic [23:0] data_Out
);

// mem has width of 24 bits and a total of 4096 addresses
logic [23:0] mem [0:1599];

initial
begin
	 $readmemh("ECE385-HelperTools-master/PNG To Hex/On-Chip Memory/sprite_bytes/sblue.txt", mem);
end


always_ff @ (posedge Clk) begin
	data_Out<= mem[read_address];
end

endmodule


module  frameRAM_red
(
		input [12:0] read_address,
		input Clk,

		output logic [23:0] data_Out
);

// mem has width of 24 bits and a total of 4096 addresses
logic [23:0] mem [0:1599];

initial
begin
	 $readmemh("ECE385-HelperTools-master/PNG To Hex/On-Chip Memory/sprite_bytes/lred.txt", mem);
end


always_ff @ (posedge Clk) begin
	data_Out<= mem[read_address];
end

endmodule




module  frameRAM_circle
(
		input [12:0] read_address,
		input Clk,

		output logic [23:0] data_Out
);

// mem has width of 24 bits and a total of 4096 addresses
logic [23:0] mem [0:1599];

initial
begin
	 $readmemh("ECE385-HelperTools-master/PNG To Hex/On-Chip Memory/sprite_bytes/circle.txt", mem);
end


always_ff @ (posedge Clk) begin
	data_Out<= mem[read_address];
end

endmodule


module  frameRAM_doom
(
		input [12:0] read_address,
		input Clk,

		output logic [23:0] data_Out
);

// mem has width of 24 bits and a total of 4096 addresses
logic [23:0] mem [0:1759];

initial
begin
	 $readmemh("ECE385-HelperTools-master/PNG To Hex/On-Chip Memory/sprite_bytes/doom.txt", mem);
end


always_ff @ (posedge Clk) begin
	data_Out<= mem[read_address];
end

endmodule


//module  frameRAM_one
//(
//		input [12:0] read_address,
//		input Clk,
//
//		output logic data_Out
//);
//
//// mem has width of 24 bits and a total of 4096 addresses
//logic mem [0:164];
//
//initial
//begin
//	 $readmemh("ECE385-HelperTools-master/PNG To Hex/On-Chip Memory/sprite_converted/1.txt", mem);
//end
//
//
//always_ff @ (posedge Clk) begin
//	data_Out<= mem[read_address];
//end
//
//endmodule
//
//module  frameRAM_two
//(
//		input [12:0] read_address,
//		input Clk,
//
//		output logic data_Out
//);
//
//// mem has width of 24 bits and a total of 4096 addresses
//logic mem [0:164];
//
//initial
//begin
//	 $readmemh("ECE385-HelperTools-master/PNG To Hex/On-Chip Memory/sprite_converted/2.txt", mem);
//end
//
//
//always_ff @ (posedge Clk) begin
//	data_Out<= mem[read_address];
//end
//
//endmodule
//
//module  frameRAM_three
//(
//		input [12:0] read_address,
//		input Clk,
//
//		output logic data_Out
//);
//
//// mem has width of 24 bits and a total of 4096 addresses
//logic mem [0:164];
//
//initial
//begin
//	 $readmemh("ECE385-HelperTools-master/PNG To Hex/On-Chip Memory/sprite_converted/3.txt", mem);
//end
//
//
//always_ff @ (posedge Clk) begin
//	data_Out<= mem[read_address];
//end
//
//endmodule
//
//
//module  frameRAM_four
//(
//		input [12:0] read_address,
//		input Clk,
//
//		output logic data_Out
//);
//
//// mem has width of 24 bits and a total of 4096 addresses
//logic mem [0:164];
//
//initial
//begin
//	 $readmemh("ECE385-HelperTools-master/PNG To Hex/On-Chip Memory/sprite_converted/4.txt", mem);
//end
//
//
//always_ff @ (posedge Clk) begin
//	data_Out<= mem[read_address];
//end
//
//endmodule
//
//module  frameRAM_five
//(
//		input [12:0] read_address,
//		input Clk,
//
//		output logic data_Out
//);
//
//// mem has width of 24 bits and a total of 4096 addresses
//logic mem [0:164];
//
//initial
//begin
//	 $readmemh("ECE385-HelperTools-master/PNG To Hex/On-Chip Memory/sprite_converted/5.txt", mem);
//end
//
//
//always_ff @ (posedge Clk) begin
//	data_Out<= mem[read_address];
//end
//
//endmodule
//
//
//module  frameRAM_six
//(
//		input [12:0] read_address,
//		input Clk,
//		output logic data_Out
//);
//
//// mem has width of 24 bits and a total of 4096 addresses
//logic mem [0:164];
//
//initial
//begin
//	 $readmemh("ECE385-HelperTools-master/PNG To Hex/On-Chip Memory/sprite_converted/6.txt", mem);
//end
//
//
//always_ff @ (posedge Clk) begin
//	data_Out<= mem[read_address];
//end
//
//endmodule
//
//module  frameRAM_seven
//(
//		input [12:0] read_address,
//		input Clk,
//
//		output logic data_Out
//);
//
//// mem has width of 24 bits and a total of 4096 addresses
//logic mem [0:164];
//
//initial
//begin
//	 $readmemh("ECE385-HelperTools-master/PNG To Hex/On-Chip Memory/sprite_converted/7.txt", mem);
//end
//
//
//always_ff @ (posedge Clk) begin
//	data_Out<= mem[read_address];
//end
//
//endmodule
//
//
//module  frameRAM_eight
//(
//		input [12:0] read_address,
//		input Clk,
//
//		output logic data_Out
//);
//
//// mem has width of 24 bits and a total of 4096 addresses
//logic mem [0:164];
//
//initial
//begin
//	 $readmemh("ECE385-HelperTools-master/PNG To Hex/On-Chip Memory/sprite_converted/8.txt", mem);
//end
//
//
//always_ff @ (posedge Clk) begin
//	data_Out<= mem[read_address];
//end
//
//endmodule
//
//module  frameRAM_nine
//(
//		input [12:0] read_address,
//		input Clk,
//
//		output logic data_Out
//);
//
//// mem has width of 24 bits and a total of 4096 addresses
//logic mem [0:164];
//
//initial
//begin
//	 $readmemh("ECE385-HelperTools-master/PNG To Hex/On-Chip Memory/sprite_converted/9.txt", mem);
//end
//
//
//always_ff @ (posedge Clk) begin
//	data_Out<= mem[read_address];
//end
//
//endmodule
//
//
module  frameRAM_p
(
		input [12:0] read_address,
		input Clk,

		output logic [3:0] data_Out
);

// mem has width of 24 bits and a total of 4096 addresses
logic [3:0] mem [0:164];

initial
begin
	 $readmemh("ECE385-HelperTools-master/PNG To Hex/On-Chip Memory/sprite_converted/p.txt", mem);
end


always_ff @ (posedge Clk) begin
	data_Out<= mem[read_address];
end

endmodule


module  frameRAM_num
(
		input [12:0] read_address,
		input Clk,
		input [4:0] bitbit,
		output logic [3:0] data_Out
);

// mem has width of 24 bits and a total of 4096 addresses
logic [3:0] mem0[0:164];
logic [3:0] mem1[0:164];
logic [3:0] mem2[0:164];
logic [3:0] mem3[0:164];
logic [3:0] mem4[0:164];
logic [3:0] mem5[0:164];
logic [3:0] mem6[0:164];
logic [3:0] mem7[0:164];
logic [3:0] mem8[0:164];
logic [3:0] mem9[0:164];


initial
begin
	 $readmemh("ECE385-HelperTools-master/PNG To Hex/On-Chip Memory/sprite_converted/0.txt", mem0);
	 $readmemh("ECE385-HelperTools-master/PNG To Hex/On-Chip Memory/sprite_converted/1.txt", mem1);
	 $readmemh("ECE385-HelperTools-master/PNG To Hex/On-Chip Memory/sprite_converted/2.txt", mem2);
	 $readmemh("ECE385-HelperTools-master/PNG To Hex/On-Chip Memory/sprite_converted/3.txt", mem3);
	 $readmemh("ECE385-HelperTools-master/PNG To Hex/On-Chip Memory/sprite_converted/4.txt", mem4);
	 $readmemh("ECE385-HelperTools-master/PNG To Hex/On-Chip Memory/sprite_converted/5.txt", mem5);
	 $readmemh("ECE385-HelperTools-master/PNG To Hex/On-Chip Memory/sprite_converted/6.txt", mem6);
	 $readmemh("ECE385-HelperTools-master/PNG To Hex/On-Chip Memory/sprite_converted/7.txt", mem7);
	 $readmemh("ECE385-HelperTools-master/PNG To Hex/On-Chip Memory/sprite_converted/8.txt", mem8);
	 $readmemh("ECE385-HelperTools-master/PNG To Hex/On-Chip Memory/sprite_converted/9.txt", mem9);
end


always_ff @ (posedge Clk) begin
		if (bitbit == 4'd0)
			data_Out<= mem0[read_address];
		else if (bitbit == 4'd01)
			data_Out<= mem1[read_address];
		else if (bitbit == 4'd02)
			data_Out<= mem2[read_address];
		else if (bitbit == 4'd03)
			data_Out<= mem3[read_address];
		else if (bitbit == 4'd04)
			data_Out<= mem4[read_address];
		else if (bitbit == 4'd05)
			data_Out<= mem5[read_address];			
		else if (bitbit == 4'd06)
			data_Out<= mem6[read_address];
		else if (bitbit == 4'd07)
			data_Out<= mem7[read_address];
		else if (bitbit == 4'd08)
			data_Out<= mem8[read_address];
		else if (bitbit == 4'd09)
			data_Out<= mem9[read_address];
end

endmodule




module  frameRAM_bg
(
		input [17:0] read_address,
		input Clk,

		output logic [23:0] data_Out
);

// mem has width of 24 bits and a total of 4096 addresses
logic [23:0] mem [0:76799];

initial
begin
	 $readmemh("ECE385-HelperTools-master/PNG To Hex/On-Chip Memory/sprite_bytes/320x240.txt", mem);
end


always_ff @ (posedge Clk) begin
	data_Out<= mem[read_address];
end

endmodule


module  frameRAM_start
(
		input [17:0] read_address,
		input Clk,

		output logic [23:0] data_Out
);

// mem has width of 24 bits and a total of 4096 addresses
logic [23:0] mem [0:76799];

initial
begin
	 $readmemh("ECE385-HelperTools-master/PNG To Hex/On-Chip Memory/sprite_bytes/start320.txt", mem);
end


always_ff @ (posedge Clk) begin
	data_Out<= mem[read_address];
end

endmodule


module  frameRAM_sh
(
		input [12:0] read_address,
		input Clk,

		output logic [7:0] data_Out
);

// mem has width of 24 bits and a total of 4096 addresses
logic [7:0] mem [0:468];

initial
begin
	 $readmemh("ECE385-HelperTools-master/sh.txt", mem);
end


always_ff @ (posedge Clk) begin
	data_Out<= mem[read_address];
end

endmodule

