module top (
    input [9:0] sw,
    output [13:0] led
);

    half_sub halfSubInstance (
        .A(sw[0]),
        .B(sw[1]),
        .Y(led[0]),
        .Borrow(led[1])
    );
    
    ones_comp_add onesCompAddition (
        .A(sw[5:2]),
        .B(sw[9:6]),
        .ones_comp_add_result(led[5:2])
    );
    
    twos_comp twosComp (
        .A(sw[9:2]),
        .twos_comp_result(led[13:6])
    );

endmodule