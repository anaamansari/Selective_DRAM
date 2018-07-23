`timescale 1ns / 1ps

module DRAM_L1 (
	clk,
	rce,
	ra,
	rq,
	wce,
	wa,
	wd
);


//Layer 1
// 11 x 11 x 3 x 96
	parameter D_WIDTH =  4;
	parameter A_WIDTH =  22;
	parameter A_DEPTH = (1 << A_WIDTH);

	input  clk;

	input                      rce;
	input      [A_WIDTH - 1:0] ra;
	output reg [D_WIDTH - 1:0] rq;
	
//	output reg sel;
	

	input                      wce;
	input      [A_WIDTH - 1:0] wa;
	input      [D_WIDTH - 1:0] wd;

	reg        [D_WIDTH - 1:0] memory[0:A_DEPTH - 1];
//	reg        [D_WIDTH - 1:0] memory1[0:A_DEPTH - 1];
//	reg        [D_WIDTH - 1:0] memory2[0:A_DEPTH - 1];
//	reg        [D_WIDTH - 1:0] check1;
//	reg        [D_WIDTH - 1:0] check2;

	initial begin
	     rq=0;
//	     sel=0;
//	     check1=0;
//	     check2=0;
		$readmemh("Z:/Sel_DRAM/Sel_DRAM/Sel_DRAM.srcs/sources_1/imports/Sel_DRAM/L1.txt", memory);
//		$readmemh("Z:/Sel_DRAM/Sel_DRAM/Sel_DRAM.srcs/sources_1/imports/Sel_DRAM/FL1.txt", memory1);
//		$readmemh("Z:/Sel_DRAM/Sel_DRAM/Sel_DRAM.srcs/sources_1/imports/Sel_DRAM/FL1.txt", memory2);
	end

	always @(posedge clk) begin
		if (rce) begin
//		check1<=check2;
//		check2<=memory[ra];
//		sel=0;
//		      if (check2!=check1) begin
		          rq<=memory[ra];
//		  	      rq <= check2;
//		  	      sel=1;
//		  	      end
		  end

		if (wce)begin
			memory[wa] <= wd;
			end
	end



endmodule