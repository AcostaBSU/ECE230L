module top(
    input sw, // w
    output [9:0] led, // see IO table
    input btnC, // clk
    input btnU // reset
);

    one_hot onehot (
        .w(sw),
        .clk(btnC),
        .rs(btnU),
        .z(led[0]),
        .state(led[6:2])
    );
    
    binary bin (
        .w(sw),
        .clk(btnC),
        .rs(btnU),
        .z(led[1]),
        .state(led[9:7])
    );

endmodule