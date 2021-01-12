/*
 * ECE385-HelperTools/PNG-To-Txt
 * Author: Rishi Thakkar
 *
 */

module  frameRAM_orange
(
		input [12:0] read_address,
		input Clk,

		output logic [23:0] data_Out
);

// mem has width of 24 bits and a total of 4096 addresses
logic [23:0] mem [0:1599];

initial
begin
	 $readmemh("ECE385-HelperTools-master/PNG To Hex/On-Chip Memory/sprite_bytes/orange_new.txt", mem);
end


always_ff @ (posedge Clk) begin
	data_Out<= mem[read_address];
end

endmodule
