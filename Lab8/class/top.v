module top (
    input [15:0] sw,
    input btnC, btnU, btnR, btnD, btnL,
    output [15:0] led
);
    wire [1:0] muxSEL;
    assign muxSEL = {btnU, btnL};
    
    wire [1:0] demuxSEL;
    assign demuxSEL = {btnR, btnD};
    
    wire [3:0] bus;
    
    mux sourceIP (
        .CEO(sw[3:0]),
        .self(sw[7:4]),
        .Fred(sw[11:8]),
        .Jill(sw[15:12]),
        .SEL(muxSEL),
        .Enable(btnC),
        .Data(bus)
    );
    
    demux destIP (
        .Data(bus),
        .SEL(demuxSEL),
        .Enable(btnC),
        .lib(led[3:0]),
        .fd(led[7:4]),
        .sch(led[11:8]),
        .rib(led[15:12])
    );
    
endmodule