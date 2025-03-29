module multiplexer(
    input [7:0] A,
    input [7:0] B,
    input [7:0] C,
    input [7:0] D,
    input [1:0] sel,
    output reg [7:0] data
);

    always @(*) begin 
        case(sel)
            2'b00: data <= A; 
            2'b01: data <= B;
            2'b10: data <= C;
            2'b11: data <= D;
        endcase
    end

endmodule