module byte_memory(
    input [7:0] data,
    input store,
    output [7:0] memory
);

    // Herein, implement D-Latch style memory
    // that stores the input data into memory
    // when store is high
    d_latch bitZero (
        .D(data[0]),
        .Q(memory[0]),
        .NotQ(),
        .E(store)
    );
    
    d_latch bitOne (
        .D(data[1]),
        .Q(memory[1]),
        .NotQ(),
        .E(store)
    );
    
    d_latch bitTwo (
        .D(data[2]),
        .Q(memory[2]),
        .NotQ(),
        .E(store)
    );
    
    d_latch bitThree (
        .D(data[3]),
        .Q(memory[3]),
        .NotQ(),
        .E(store)
    );
    
    d_latch bitFour (
        .D(data[4]),
        .Q(memory[4]),
        .NotQ(),
        .E(store)
    );
    
    d_latch bitFive (
        .D(data[5]),
        .Q(memory[5]),
        .NotQ(),
        .E(store)
    );
    
    d_latch bitSix (
        .D(data[6]),
        .Q(memory[6]),
        .NotQ(),
        .E(store)
    );
    
    d_latch bitSeven (
        .D(data[7]),
        .Q(memory[7]),
        .NotQ(),
        .E(store)
    );
        

    // Memory should always output the value
    // stored, and it should only change
    // when store is high

endmodule