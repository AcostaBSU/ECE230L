module dff(
    input D, E,
    output reg Q,
    output NotQ
);

    initial begin
        Q <= 0;
    end
    
    always @(posedge E) begin
        Q <= D;
    end
    
    assign NotQ = ~Q;

endmodule