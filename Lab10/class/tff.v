module tff(
    input T, E,
    output reg Q,
    output NotQ
);

    initial begin
        Q <= 0;
    end
    
    always @(posedge E) begin
        if (T)
            Q <= ~Q;
    end
    
    assign NotQ = ~Q;

endmodule