module demux (
    input [3:0] Data,
    input [1:0] SEL,
    input Enable,
    output [3:0] lib, [3:0] fd, [3:0] sch, [3:0] rib
);

    assign lib = ((SEL == 'b00) ? Data : 4'b0000);
    assign fd  = ((SEL == 'b01) ? Data : 4'b0000);
    assign sch = ((SEL == 'b10) ? Data : 4'b0000);
    assign rib = ((SEL == 'b11) ? Data : 4'b0000);

endmodule