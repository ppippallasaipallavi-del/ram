`timescale 1ns/1ps

module tb_ram_8x4;

    reg        CLK;
    reg        WE;
    reg  [2:0] ADDRESS;
    reg  [3:0] DATA_IN;
    wire [3:0] DATA_OUT;

    // Instantiate RAM
    ram_8x4 DUT (
        .CLK(CLK),
        .WE(WE),
        .ADDRESS(ADDRESS),
        .DATA_IN(DATA_IN),
        .DATA_OUT(DATA_OUT)
    );

    // Clock generation
    initial begin
        CLK = 0;
        forever #5 CLK = ~CLK;
    end

    // Generate waveform
    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0, tb_ram_8x4);
    end

    initial begin

        $display("Time | WE | Address | Data_In | Data_Out");
        $display("------------------------------------------");

        // Write 1010 to address 000
        WE = 1;
        ADDRESS = 3'b000;
        DATA_IN = 4'b1010;
        #10;

        // Write 0101 to address 001
        WE = 1;
        ADDRESS = 3'b001;
        DATA_IN = 4'b0101;
        #10;

        // Write 1100 to address 010
        WE = 1;
        ADDRESS = 3'b010;
        DATA_IN = 4'b1100;
        #10;

        // Write 0011 to address 011
        WE = 1;
        ADDRESS = 3'b011;
        DATA_IN = 4'b0011;
        #10;

        // Disable writing and read address 000
        WE = 0;
        ADDRESS = 3'b000;
        #10;
        $display("%4t |  %b |   %b    |  %b   |   %b",
                 $time, WE, ADDRESS, DATA_IN, DATA_OUT);

        // Read address 001
        ADDRESS = 3'b001;
        #10;
        $display("%4t |  %b |   %b    |  %b   |   %b",
                 $time, WE, ADDRESS, DATA_IN, DATA_OUT);

        // Read address 010
        ADDRESS = 3'b010;
        #10;
        $display("%4t |  %b |   %b    |  %b   |   %b",
                 $time, WE, ADDRESS, DATA_IN, DATA_OUT);

        // Read address 011
        ADDRESS = 3'b011;
        #10;
        $display("%4t |  %b |   %b    |  %b   |   %b",
                 $time, WE, ADDRESS, DATA_IN, DATA_OUT);

        $finish;

    end

endmodule