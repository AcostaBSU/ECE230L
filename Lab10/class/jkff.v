module jkff (
    input J, K, E,
    output Q,
    output NotQ
);

    reg D;

    always @(J, K, E) begin
        if (J && K)
            case(Q)
                0: D <= 1;
                1: D <= 0;
            endcase
        else if (J)
            D <= 1;
        else if (K)
            D <= 0;
        else
            D <= Q;
     end
     
     
     dff DFF (
        .D(D),
        .E(E),
        .Q(Q),
        .NotQ(NotQ)
     );

endmodule