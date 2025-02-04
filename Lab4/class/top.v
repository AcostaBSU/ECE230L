module top (
    input [3:0] sw,
    output [2:0] led
);

    naive naive_instance(
        .sw(sw),
        .led(led[0])
    );
    
    minterm minterm_instance(
        .sw(sw),
        .led(led[1])
    );
    
    maxterm maxterm_instance(
        .sw(sw),
        .led(led[2])
    );
    
    endmodule
