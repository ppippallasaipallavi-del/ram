// 8 x 4 RAM
// 8 memory locations
// 4-bit data at each location

module ram_8x4 (
    input        CLK,
    input        WE,
    input  [2:0] ADDRESS,
    input  [3:0] DATA_IN,
    output [3:0] DATA_OUT
);

    reg [3:0] memory [0:7];

    // Write operation
    always @(posedge CLK) begin
        if (WE)
            memory[ADDRESS] <= DATA_IN;
    end

    // Read operation
    assign DATA_OUT = memory[ADDRESS];

endmodule