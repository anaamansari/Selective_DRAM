`timescale 1ns / 1ps

module DRAM_L1 (
	clk,
	rce,
	ra,
	rq,
	wce,
	wa,
	wd,
	
	sel
);


//Layer 1
// 11 x 11 x 3 x 96
	parameter D_WIDTH =  4;
	parameter A_WIDTH =  15;
	parameter A_DEPTH = (1 << A_WIDTH);

	input  clk;

	input                      rce;
	input      [A_WIDTH - 1:0] ra;
	output reg [D_WIDTH - 1:0] rq;
	
	output reg sel;
	

	input                      wce;
	input      [A_WIDTH - 1:0] wa;
	input      [D_WIDTH - 1:0] wd;

	reg        [D_WIDTH - 1:0] memory[0:A_DEPTH - 1];
	reg        [D_WIDTH - 1:0] check;

	initial begin
	     rq=0;
	     sel=0;
	     check=0;
		$readmemh("Z:/Sel_DRAM/DRAM/DRAM.srcs/sources_1/imports/Sel_DRAM/L1.txt", memory);
	end

	always @(posedge clk) begin
		if (rce) begin
//		check<=memory[ra];
//		sel=0;
//		      if (rq!=check) begin
		  	      rq <= memory[ra];
//		  	      sel=1;
//		  	      end?
		  end

		if (wce)begin
			memory[wa] <= wd;
			end
	end



endmodule