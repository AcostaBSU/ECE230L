module memory_system(
    input [7:0] data,
    input store,
    input [1:0] addr,
    output [7:0] memory
);

    // This should instantiate 4 instances of
    // byte_memory, and then demultiplex
    // data and store into the one selected by
    // addr
    
    wire [7:0] vecInp [3:0];
    wire [7:0] vecMem [3:0];
    wire arr[3:0];
    
    demultiplexer demuxInp (
        .data(data),
        .sel(addr),
        .A(vecInp[0]),
        .B(vecInp[1]),
        .C(vecInp[2]),
        .D(vecInp[3])
    );
    
    demultiplexer demuxStore (
        .data(store),
        .sel(addr),
        .A(arr[0]),
        .B(arr[1]),
        .C(arr[2]),
        .D(arr[3])
    );
    
    genvar i;
    generate
        for(i = 0; i < 4; i = i + 1) begin
            byte_memory byte (
                .data(vecInp[i]),
                .store(arr[i]),
                .memory(vecMem[i])
            );
        end
    endgenerate

    // It should then multiplex the output of the
    // memory specified by addr into the memory
    // output for display on the LEDs
    
    multiplexer mux (
        .A(vecMem[0]),
        .B(vecMem[1]),
        .C(vecMem[2]),
        .D(vecMem[3]),
        .data(memory),
        .sel(addr)
    );

    // you will need 2 demultiplexers:
    // 1. Demultiplex data -> selected byte
    // 2. Demultiplex store -> selected byte

    // and one multiplexer:
    // 1. Multiplex selected byte -> memory

endmodule