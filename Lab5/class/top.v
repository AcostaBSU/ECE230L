// Implement top level module
module top (
    input [7:0] sw,
    output [5:0] led
);

    light stairs(
        .downstairs(sw[0]),
        .upstairs(sw[1]),
        .stair_light(led[0])
    );
    
    adder oneBitAdder(
        .A(sw[2]),
        .B(sw[3]),
        .Y(led[1]),
        .carry(led[2])
    );
    
    full_adder twoBitAdder(
        .A(sw[5:4]),
        .B(sw[7:6]),
        .sum(led[4:3]),
        .carry(led[5])
    );
    
    endmodule