module minterm (
    input [3:0] sw,
    output led
);

    assign led = (sw[1] && !sw[0]) ||
                    (sw[2] && !sw[0]) ||
                    (!sw[3] && !sw[2] && sw[0]);
                    
    endmodule