module top (
    input [3:0] sw,
    input btnC,
    output [5:0] led
);

    dff D (
        .D(sw[0]),
        .E(btnC),
        .Q(led[0]),
        .NotQ(led[1])
    );
    
    jkff JK (
        .J(sw[1]),
        .K(sw[2]),
        .E(btnC),
        .Q(led[2]),
        .NotQ(led[3])
    );
    
    tff T (
        .T(sw[3]),
        .E(btnC),
        .Q(led[4]),
        .NotQ(led[5])
    );

endmodule