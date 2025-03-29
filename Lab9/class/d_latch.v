module sr_latch (
    input Set,
    input Reset,
    output reg Q,
    output NotQ
);

    always @(Set) begin
        if (Set)
            Q <= 1;
        else if (Reset)
            Q <= 0;
    end
    
    assign NotQ = ~Q;
    
 endmodule

module d_latch(
    input D, E,
    output Q, NotQ
);

    reg qInt;

    always @(E) begin 
        if (D)
            qInt <= 1;
        else if (E)
            qInt <= 0;
    end
    
    sr_latch sr (
        .Set(qInt),
        .Reset(~qInt),
        .Q(Q),
        .NotQ(NotQ)
    );

endmodule