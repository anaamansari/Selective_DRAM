`timescale 1ns / 1ps


module DRAM_L1_tb;
	parameter D_WIDTH =  4;
	parameter A_WIDTH =  15;
	parameter A_DEPTH = (1 << A_WIDTH);

	// Inputs
	reg clk;
	reg read_en1, read_en2;
	reg write_en;
	reg [A_WIDTH - 1:0] read_add1, read_add2; 
	reg [A_WIDTH - 1:0] write_add1, write_add2;
	reg [D_WIDTH -1 :0] write_in1, write_in2;
    
	// Outputs
     wire [ D_WIDTH - 1:0] read_out1, read_out2;
       
     wire sel_data_write;

	// Instantiate the Unit Under Test (UUT)
	DRAM_L1 pitch (
		.clk(clk), 
		.rce(read_en1),
		.ra(read_add1),
		.rq(read_out1),
		.wce(write_en),
		.wa(write_add1),
		.wd(write_in1),
		.sel(sel_data_write)
	);
	
	
		DRAM_catch catch (
        .clk(clk), 
        .rce(read_en2),
        .ra(read_add2),
        .rq(read_out2),
        .wce(sel_data_write),
        .wa(write_add2),
        .wd(read_out1)
    );

	initial begin
		// Initialize Inputs
		clk = 1;
		read_en1=0;
		read_en2 = 0;
		write_en= 0;
	    write_in1=0;
	    write_in2=0;
	    
	    
	    
	    #10 read_en1=1;
	 end

		// Wait 100 ns for global reset to finish
        
		// Add stimulus here
    initial begin
	   forever #10 clk=~clk;
	end
	
	integer i;
	initial begin
	
	for(i=0;i<A_DEPTH ;i=i+1) begin
	read_add1=i;
	write_add2=i;
	#20;
	end
	end
      
endmodule